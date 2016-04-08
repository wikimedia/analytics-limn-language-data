#!/bin/bash

function run_query() {
	sql enwiki -h db1029 -D wikishared -e "$1"
}

function run_vvv_query() {
	sql enwiki -h db1029 -D wikishared -vvv -e "$1"
}

full_month=$1
if [ -z "$full_month" ]; then
	full_month=`date --date='-1 month' +%Y%m`
fi

year=${full_month:0:4}
month=${full_month:4:2}

if [ "$month" == "01" ]; then
	previous_month=$[year-1]12
else
	previous_month=$[full_month-1]
fi

articles_during_the_month=`run_query "select count(*) as article_count from cx_translations where (translation_status = 'published' or translation_target_url is not null) AND translation_last_updated_timestamp like '$full_month%' order by article_count;" | grep "[0-9]"`
echo "Articles created (during the month): $articles_during_the_month"

articles_till_end_of_month=`run_query "select count(*) as article_count from cx_translations where (translation_status = 'published' or translation_target_url is not null) AND translation_last_updated_timestamp < '${full_month}99999999' order by article_count;" | grep "[0-9]"`
echo "Articles created till end of month: $articles_till_end_of_month"

till_previous_month_new_translators=`run_vvv_query "select translation_started_by, count(*) as article_count from cx_translations where (translation_status = 'published' or translation_target_url is not null) and translation_start_timestamp < '${previous_month}99999999' group by translation_started_by order by article_count;" | tail --lines=3 | head --lines=1 | grep -o "^[0-9]\+"`

till_this_month_new_translators=`run_vvv_query "select translation_started_by, count(*) as article_count from cx_translations where (translation_status = 'published' or translation_target_url is not null) and translation_start_timestamp < '${full_month}99999999' group by translation_started_by order by article_count;" | tail --lines=3 | head --lines=1 | grep -o "^[0-9]\+"`
echo "Number of new translators (during the month): $[$till_this_month_new_translators-$till_previous_month_new_translators]"

# Exclude hak
top_user_count=`run_query "select count(translation_target_title) from cx_translations where (translation_status = 'published' or translation_target_url is not null) and translation_started_by <> 35758721 and translation_last_updated_timestamp < '${full_month}99999999' group by translation_started_by order by count(translation_target_title) desc limit 1;" | grep "[0-9]"`
top_user_id=`run_query "select translation_started_by from cx_translations where (translation_status = 'published' or translation_target_url is not null) and translation_started_by <> 35758721 and translation_last_updated_timestamp < '${full_month}99999999' group by translation_started_by order by count(translation_target_title) desc limit 1;" | grep "[0-9]"`
top_user_name=`sql centralauth -e "SELECT gu_name FROM globaluser WHERE gu_id = $top_user_id;" | tail -n 1`
echo "Highest number of articles created by one user (cumulative number till end of the month): $top_user_count ($top_user_name)"

top_translators_per_language=`run_query "select translation_target_language, count(distinct(translation_started_by)) as translator_count from cx_translations where ( translation_status = 'published' or translation_target_url is not null ) and translation_last_updated_timestamp < '${full_month}99999999' group by translation_target_language order by translator_count desc limit 1;" | grep "[0-9]"`
echo "Highest number of translators for a Wikipedia (cumulative number till end of the month): $top_translators_per_language"

for article_count in $(seq 1 4);
do
	translators_with_x_translations=`run_vvv_query "select translation_started_by, count(translation_id) as article_count from cx_translations where (translation_status = 'published' or translation_target_url is not null) and translation_last_updated_timestamp < '${full_month}99999999' group by translation_started_by having article_count = $article_count;" | tail --lines=3 | head --lines=1 | grep -o "^[0-9]\+"`
	echo "Total number of translators with only $article_count published article (cumulative number till end of the month): $translators_with_x_translations"
done

translators_with_medium_translations=`run_vvv_query "select translation_started_by, count(translation_id) as article_count from cx_translations where (translation_status = 'published' or translation_target_url is not null) and translation_last_updated_timestamp < '${full_month}99999999' group by translation_started_by having article_count between 5 and 20;" | tail --lines=3 | head --lines=1 | grep -o "^[0-9]\+"`
echo "Total number of translators with >= 5 and <= 20 published articles (cumulative number till end of the month): $translators_with_medium_translations"

translators_with_many_translations=`run_vvv_query "select translation_started_by, count(translation_id) as article_count from cx_translations where (translation_status = 'published' or translation_target_url is not null) and translation_last_updated_timestamp < '${full_month}99999999' group by translation_started_by having article_count > 20;" | tail --lines=3 | head --lines=1 | grep -o "^[0-9]\+"`
echo "Total number of translators with >20 published articles (cumulative number till end of the month): $translators_with_many_translations"

echo "Now go fetch the number of deletions! :)"
