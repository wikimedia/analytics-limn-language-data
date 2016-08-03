#!/usr/bin/python

import os
import subprocess

dblist_name = os.path.dirname(os.path.abspath(__file__)) + '/all.dblist'
dblist = open(dblist_name, 'r')

for db in dblist:
	db = db.rstrip(os.linesep)

	# Must use the shell command because there's no other
	# easy way to get the DB host name
	command = '/usr/local/bin/sql ' + db + ' -NB -e "select count(*) from user_properties where up_property = \'compact-language-links\' and (up_value = \'\' or up_value = 0);"'
	output = subprocess.check_output(command, shell = True).rstrip(os.linesep)

	print output

dblist.close()

