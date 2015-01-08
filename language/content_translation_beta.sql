 select *
   from (select count(*) as enwiki from enwiki.user_properties where up_property = 'cx') en
            left join
        (select count(*) as cawiki from cawiki.user_properties where up_property = 'cx') ca on 1=1
            left join
        (select count(*) as eswiki from eswiki.user_properties where up_property = 'cx') es on 1=1
            left join
        (select count(*) as ptwiki from ptwiki.user_properties where up_property = 'cx') pt on 1=1
            left join
        (select count(*) as dawiki from dawiki.user_properties where up_property = 'cx') da on 1=1
            left join
        (select count(*) as eowiki from eowiki.user_properties where up_property = 'cx') eo on 1=1
            left join
        (select count(*) as idwiki from idwiki.user_properties where up_property = 'cx') id on 1=1
            left join
        (select count(*) as mswiki from mswiki.user_properties where up_property = 'cx') ms on 1=1
            left join
        (select count(*) as sawiki from sawiki.user_properties where up_property = 'cx') sa on 1=1
;
