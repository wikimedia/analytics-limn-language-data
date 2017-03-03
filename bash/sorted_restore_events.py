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
        event_context = 'restore-failure' and
        timestamp like '""" + timestamp + """%'
    GROUP BY
        event_session
    ORDER BY
        timestamp
""")

log_db.close()

event_trace_col = 7
error_counts = {}
known_error_codes = [
    'couldnt-restore',
    'draft-does-not-exist',
    'you-must-log-in',
    'text-status-error',
    'text-status-timeout',
    'wikimedia-error',
]
cryptic_counts = {}
known_traces = {
    '{"xhr":{"readyState":0,"responseText":"","status":0,"statusText":"error"},"textStatus":"error","exception":"","errorCode":"http"}': 'text-status-error',  # noqa: E501
    '{"xhr":{"readyState":0,"status":0,"statusText":"timeout"},"textStatus":"timeout","exception":"timeout","errorCode":"http"}': 'text-status-timeout',  # noqa: E501
}

for error_code in known_error_codes:
    error_counts[error_code] = []

# print all the first cell of all the rows
rows = cursor.fetchall()
for row in rows:
    error_code = None
    trace = row[event_trace_col]
    trace = re.sub('"d":\d+,"s":\d+,', '', trace)

    if trace in known_traces:
        error_code = known_traces[trace]
    elif re.search('Couldn\'t restore against the old source revision', trace):
        error_code = 'couldnt-restore'
    elif re.search('Draft does not exist', trace):
        error_code = 'draft-does-not-exist'
    elif re.search('Wikimedia Error', trace):
        error_code = 'wikimedia-error'
    elif re.search('To view your translations, you must log in', trace):
        error_code = 'you-must-log-in'

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

exit()
