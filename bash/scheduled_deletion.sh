#!/bin/bash
cd cxscriptsg

date=$1
if [ -z $date ]; then
	date=`date --date=yesterday +%Y%m%d`
fi

echo "Deletions on $date"

query="SELECT count(ar_id) as deleted FROM change_tag, archive, user WHERE ar_timestamp like '$date%' AND ar_namespace = 0 AND ct_tag = 'contenttranslation' AND ar_rev_id = ct_rev_id AND ar_user = user_id ORDER BY NULL;"

total_deletions=0
language_list=`cat language_list.txt`
#language_list="am ba"

#echo "language list: $language_list"

for language in $language_list
do
	db="${language}wiki"

	# Execute mysql
	result=`/usr/local/bin/sql $db -e "$query" | grep -Eo "[0-9]*"`
	if [ $result -ne 0 ]
	then
		printf "%-20s %d\n" $db $result
		((total_deletions = total_deletions + result))
	fi
done

echo "Total deletions for $date: $total_deletions"
