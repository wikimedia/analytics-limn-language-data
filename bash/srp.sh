#!/bin/bash

yesterday=`date --date=yesterday +%Y%m%d`
week_ago=`date --date="a week ago" +%Y%m%d`

echo 'Save:'
./sorted_save_events.py $yesterday

echo 'Restore:'
./sorted_restore_events.py $yesterday

echo 'Publish:'
./sorted_publish_events.py $yesterday

echo 'What was published despite errors yesterday:'
./what_was_published.py $yesterday

echo 'What was published despite errors a week ago:'
./what_was_published.py $week_ago

