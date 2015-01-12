 select *
   from (select count(*) as cawiki from cawiki.user_properties where up_property = 'cx') ca
            left join
        (select count(*) as dawiki from dawiki.user_properties where up_property = 'cx') da on 1=1
            left join
        (select count(*) as eowiki from eowiki.user_properties where up_property = 'cx') eo on 1=1
            left join
        (select count(*) as eswiki from eswiki.user_properties where up_property = 'cx') es on 1=1
            left join
        (select count(*) as idwiki from idwiki.user_properties where up_property = 'cx') id on 1=1
            left join
        (select count(*) as mswiki from mswiki.user_properties where up_property = 'cx') ms on 1=1
            left join
        (select count(*) as nbwiki from nbwiki.user_properties where up_property = 'cx') nb on 1=1
            left join
        (select count(*) as nnwiki from nnwiki.user_properties where up_property = 'cx') nn on 1=1
            left join
        (select count(*) as ptwiki from ptwiki.user_properties where up_property = 'cx') pt on 1=1
            left join
        (select count(*) as svwiki from svwiki.user_properties where up_property = 'cx') sv on 1=1
;
