#!/usr/bin/python

import re
import sys
import MySQLdb

timestamp = sys.argv[1]

rprod_pwd_file = open('rprod.txt', 'r')
rprod_pwd = rprod_pwd_file.read().rstrip()
rprod_pwd_file.close()

log_db = MySQLdb.connect(
	host = "db1047.eqiad.wmnet",
	user = "research_prod",
	passwd = rprod_pwd,
	db = "log"
)

cursor = log_db.cursor()

cursor.execute("SELECT userAgent, wiki, event_sourceLanguage, event_sourceTitle, event_targetLanguage, event_targetTitle, event_token, event_trace, event_version FROM ContentTranslationError_11767097 WHERE event_context = 'publish-failure' and timestamp like '" + timestamp + "%' GROUP BY event_session ORDER BY timestamp")

log_db.close()

event_trace_col = 7
error_counts = {}
known_error_codes = [
	'abusefilter',
	'assertuserfailed',
	'badtoken',
	'blocked',
	'docserver',
	'globalblocking-ipblocked-range',
	'hookaborted',
	'internal_api_error_DBConnectionError',
	'internal_api_error_DBQueryError',
	'internal_api_error_FileBackendError',
	'internal_api_error_JobQueueError',
	'invalidhtml',
	'invalidtargetlanguage',
	'invalidtitle',
	'parsoidserver',
	'parsererror',
	'protectednamespace-interface',
	'protectedpage',
	'ratelimited',
	'readonly',
	'spamblacklist',
	'text-status-error',
	'text-status-timeout',
	'titleblacklist-forbidden-edit',
	'titleblacklist-forbidden',
	'translation-not-found',
	'unexpected-error-while-publishing',
	'unknownerror',
	'wikimedia-globalblocking-ipblocked',
]
cryptic_counts = {}
known_traces = {
	'{"xhr":{"readyState":0,"responseText":"","status":0,"statusText":"error"},"textStatus":"error","exception":""}': 'text-status-error',
	'{"xhr":{"readyState":0,"status":0,"statusText":"timeout"},"textStatus":"timeout","exception":"timeout"}': 'text-status-timeout',
	'"[CX] Unexpected error while publishing: [object Object]"': 'unexpected-error-while-publishing',
}

for error_code in known_error_codes:
	error_counts[error_code] = []

rows = cursor.fetchall()
for row in rows:
	error_code = None
	trace = row[event_trace_col]
	trace = re.sub('"d":\d+,"s":\d+,', '', trace)

	find_error = re.search('"error":\{"code":"([^"]+?)"', trace)
	if find_error:
		error_code = find_error.group(1)
	elif trace in known_traces:
		error_code = known_traces[trace]
	elif re.search('"info":"Hit AbuseFilter', trace):
		error_code = 'abusefilter'
	elif re.search('"edit":\{"spamblacklist"', trace):
		error_code = 'spamblacklist'
	elif re.search('"textStatus":"parsererror"', trace):
		error_code = 'parsererror'
	elif re.search('"info":"Translation not found"', trace):
		error_code = 'translation-not-found'

	if error_code:
		if not error_code in error_counts:
			error_counts[error_code] = []
			print "New kind of error! ----------> " + error_code

		error_counts[error_code].append(row)
	else:
		if not trace in cryptic_counts:
			cryptic_counts[trace] = []

		cryptic_counts[trace].append(row)

found_counts = [ str(len(rows)) ]
for error in known_error_codes:
	found_counts.append(str(len(error_counts[error])))

print("\t".join(found_counts))

print "cryptic traces:"
for trace in sorted(cryptic_counts):
	print str(len(cryptic_counts[trace])) + "\t" + trace
