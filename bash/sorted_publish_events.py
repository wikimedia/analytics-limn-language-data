#!/usr/bin/python

import operator
import re
import sys
import MySQLdb

timestamp = sys.argv[1]

rprod_pwd_file = open('rprod.txt', 'r')
rprod_pwd = rprod_pwd_file.read().rstrip()
rprod_pwd_file.close()

log_db = MySQLdb.connect(
    host="db1047.eqiad.wmnet",
    user="research_prod",
    passwd=rprod_pwd,
    db="log"
)

cursor = log_db.cursor()

cursor.execute("""
    SELECT
        userAgent,
        wiki,
        event_sourceLanguage,
        event_sourceTitle,
        event_targetLanguage,
        event_targetTitle,
        event_token,
        event_trace,
        event_version
    FROM
        ContentTranslationError_11767097
    WHERE
        event_context = 'publish-failure' and
        timestamp like '""" + timestamp + """%'
    GROUP BY
        event_session
    ORDER BY
        timestamp
""")

log_db.close()

source_lang_trace_col = 2
target_lang_trace_col = 4
event_trace_col = 7
error_counts = {}
known_error_codes = [
    'abusefilter',
    'assertuserfailed',
    'autoblocked',
    'badtoken',
    'blocked',
    'docserver',
    'edit-already-exists',
    'globalblocking-ipblocked-range',
    'hookaborted',
    'internal_api_error_ConfigException',
    'internal_api_error_DBConnectionError',
    'internal_api_error_DBQueryError',
    'internal_api_error_FileBackendError',
    'internal_api_error_InvalidArgumentException',
    'internal_api_error_JobQueueError',
    'invalidhtml',
    'invalidtargetlanguage',
    'invalidtitle',
    'noaccess',
    'parsoidserver',
    'parsererror',
    'protectednamespace-interface',
    'protectedpage',
    'protectedtitle',
    'ratelimited',
    'readonly',
    'spamblacklist',
    'text-status-error',
    'text-status-timeout',
    'titleblacklist-forbidden-edit',
    'titleblacklist-forbidden',
    'translation-not-found',
    'translationnotfound',
    'unexpected-error-while-publishing',
    'unknown_action',
    'unknownerror',
    'wikimedia-error',
    'wikimedia-globalblocking-ipblocked',
    'wikimedia-torblock-blocked',
]
cryptic_counts = {}
known_traces = {
    '{"xhr":{"readyState":0,"responseText":"","status":0,"statusText":"error"},"textStatus":"error","exception":""}': 'text-status-error',  # noqa: E501
    '{"xhr":{"readyState":0,"status":0,"statusText":"timeout"},"textStatus":"timeout","exception":"timeout"}': 'text-status-timeout',  # noqa: E501
    '"[CX] Unexpected error while publishing: [object Object]"': 'unexpected-error-while-publishing',  # noqa: E501
}

abuse_traces = {}

for error_code in known_error_codes:
    error_counts[error_code] = []

# print all the first cell of all the rows
rows = cursor.fetchall()
for row in rows:
    error_code = None
    trace = row[event_trace_col]
    trace = re.sub('"d":\d+,"s":\d+,', '', trace)
    lang = row[target_lang_trace_col]

    find_error = re.search('"error":\{"code":"([^"]+?)"', trace)
    if find_error:
        error_code = find_error.group(1)
    elif trace in known_traces:
        error_code = known_traces[trace]
    elif re.search('"code":"abusefilter-disallowed"', trace):
        error_code = 'abusefilter'
    elif re.search('"code":"abusefilter-warning"', trace):
        error_code = 'abusefilter'
    elif re.search('"info":"Hit AbuseFilter', trace):
        error_code = 'abusefilter'
    elif re.search('"edit":\{"spamblacklist"', trace):
        error_code = 'spamblacklist'
    elif re.search('"textStatus":"parsererror"', trace):
        error_code = 'parsererror'
    elif re.search('Wikimedia Error', trace):
        error_code = 'wikimedia-error'
    elif re.search('"info":"Translation not found"', trace):
        error_code = 'translation-not-found'

    if error_code == 'abusefilter':
        abuse_parse = re.search(
            '"code":"(.+?)","message":\{"key":"(.+?)"',
            trace
        )
        abuse_status = abuse_parse.group(1)
        abuse_message = abuse_parse.group(2)
        abuse_trace = lang + ' | ' + abuse_status + ' | ' + abuse_message
        if abuse_trace not in abuse_traces:
            abuse_traces[abuse_trace] = 1
        abuse_traces[abuse_trace] += 1

    if error_code:
        if error_code not in error_counts:
            error_counts[error_code] = []
            print "New kind of error! ----------> " + error_code

        error_counts[error_code].append(row)
    else:
        if trace not in cryptic_counts:
            cryptic_counts[trace] = []

        cryptic_counts[trace].append(row)

found_counts = [str(len(rows))]
for error in known_error_codes:
    error_count = len(error_counts[error])
    if error_count:
        error_string = str(error_count)
    else:
        error_string = ''
    found_counts.append(error_string)

print("\t".join(found_counts))

for trace in sorted(cryptic_counts):
    print 'cryptic trace: ' + str(len(cryptic_counts[trace])) + "\t" + trace

print "abuse traces:"
for abuse_trace in sorted(abuse_traces.items(), key=operator.itemgetter(1)):
    print str(abuse_trace[1]) + ': ' + abuse_trace[0]

exit()
