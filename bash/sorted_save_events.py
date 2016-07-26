#!/usr/bin/python

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

cursor.execute("SELECT userAgent, wiki, event_sourceLanguage, event_sourceTitle, event_targetLanguage, event_targetTitle, event_token, event_trace, event_version FROM ContentTranslationError_11767097 WHERE event_context = 'save-failure' and timestamp like '" +
               timestamp + "%' GROUP BY event_session ORDER BY timestamp")

log_db.close()

event_trace_col = 7
error_counts = {}
known_error_codes = [
    'assertuserfailed',
    'bad Gateway',
    'badtoken',
    'blocked',
    'editconflict',
    'internal_api_error_DBQueryError',
    'invalidtargetlanguage',
    'json-error-unexpected-eod',
    'json-error-unexpected-eof',
    'noaccess',
    'nosourcerevision',
    'readonly',
    'text-status-error',
    'text-status-timeout',
    'unexpected end of input',
    'wikimedia Error'
]
cryptic_counts = {}
known_traces = {
    '{"xhr":{"readyState":0,"responseText":"","status":0,"statusText":"error"},"textStatus":"error","exception":"","errorCode":"http"}': 'text-status-error',
    '{"xhr":{"readyState":0,"status":0,"statusText":"timeout"},"textStatus":"timeout","exception":"timeout","errorCode":"http"}': 'text-status-timeout'
}

for error_code in known_error_codes:
    error_counts[error_code] = []

rows = cursor.fetchall()
for row in rows:
    error_code = None
    trace = row[event_trace_col]
    trace = re.sub('"d":\d+,"s":\d+,', '', trace)

    find_error = re.search('"error":\{"code":"(.+?)"', trace)
    if find_error:
        error_code = find_error.group(1)
    elif trace in known_traces:
        error_code = known_traces[trace]
    elif re.search('<title>Wikimedia Error</title>', trace):
        error_code = 'wikimedia Error'
    elif re.search('<h1>502 Bad Gateway</h1>', trace):
        error_code = 'bad Gateway'
    elif re.search('"exception":"SyntaxError: JSON.parse: unexpected end of data', trace):
        error_code = 'json-error-unexpected-eod'
    elif re.search('"exception":"SyntaxError: JSON Parse error: Unexpected EOF"', trace):
        error_code = 'json-error-unexpected-eof'
    elif re.search('"exception":"SyntaxError: Unexpected end of input"', trace):
        error_code = 'unexpected end of input'

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
    found_counts.append(str(len(error_counts[error])))

print("\t".join(found_counts))

print "cryptic traces:"
for trace in sorted(cryptic_counts):
    print str(len(cryptic_counts[trace])) + "\t" + trace
