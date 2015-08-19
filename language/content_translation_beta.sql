select date('{from_timestamp}') as date,
       count(*) as count
  from {wiki_db}.user_properties
 where up_property = 'cx'
   and up_value = 1;
