README
======

This is: http://language-reportcard.wmflabs.org

New language addition
=====================

1. Update language/*.sql files.
2. Update reportgenerator/config/config.json
3. Do not sort language alphabetically. Only add them in the end.

Once new language has been added in config and sql are updated,

(On stats server)
1. cd /a/limn-public-data/language/datafiles
2. Edit: daily*.tsv files.
3. Change the header the way that you changed the select statement. (Same order,
   make sure not to expand tabs into spaces!).
4. Save.
