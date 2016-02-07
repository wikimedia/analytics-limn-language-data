#!/bin/bash

pw=`cat rprod.txt`

function get_query() {
	context=$1
	timestamp=$2
	group=$3

	if [ $group = "unique" ];
	then
		columns="userAgent, wiki, event_sourceLanguage, event_sourceTitle, event_targetLanguage, event_targetTitle, event_token, event_trace, event_version"
		group_by="GROUP BY event_session"
	else
		columns="count(*)"
		group_by=""
	fi

	echo "SELECT $columns FROM log.ContentTranslationError_11767097 WHERE event_context = '$context' and timestamp like '$timestamp%' $group_by ORDER BY timestamp;"
}

function run_query() {
	mysql -p$pw -u research_prod -h db1047.eqiad.wmnet -vvv -e "$1"
}

function format_and_run() {
	context=$1
	timestamp=$2
	group=$3

	echo "Statistics of $context on $timestamp ($group)"
	run_query "$(get_query $context $timestamp $group)"
	echo
}

timestamp=$1
if [ -z "$timestamp" ]; then
	timestamp=`date --date=yesterday +%Y%m%d`
fi

format_and_run save-failure $timestamp unique
format_and_run save-failure $timestamp total
format_and_run restore-failure $timestamp unique
format_and_run publish-failure $timestamp unique

#echo Suggestions
#run_query "select event_targetLanguage, count(event_targetLanguage) from log.ContentTranslationCTA_11616099 cta WHERE cta.event_cta = 'suggestions' AND cta.event_action = 'accept' GROUP BY event_targetLanguage;"

