#!/bin/bash
source_lang=$1

if [ -z $source_lang ]; then
	echo "You must supply the source language code."
	exit
fi

echo "Translations from $source_lang"

query="select translation_source_title, translation_target_title, translation_target_language from cx_translations where translation_source_language = '$source_lang' and ( translation_status = 'published' or translation_target_url is not null );"

echo $query
# exit

# MySQL user credentials
MU=wikiadmin
MP=`echo 'echo \$wgDBadminpassword;' | /usr/local/bin/mwscript eval.php --wiki="enwiki"`

# Execute mysql
mysql -u $MU -p$MP -h db1029 -D wikishared -e "$query"

