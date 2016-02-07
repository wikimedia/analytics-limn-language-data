timestamp=`date --date=yesterday +%Y%m%d`

~/cxscriptsg/scheduled_deletion.sh > deletion_${timestamp}.txt
~/cxscriptsg/events_scheduled.sh > events_${timestamp}.txt

