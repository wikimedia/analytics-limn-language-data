timestamp=`date --date=yesterday +%Y%m%d`

~/cxscriptsg/scheduled_deletion.sh > deletion_${timestamp}.txt 2>&1
~/cxscriptsg/events_scheduled.sh > events_${timestamp}.txt 2>&1
python ~/cxscriptsg/cll_pref_all.py > cll_pref_${timestamp}.txt 2>&1

