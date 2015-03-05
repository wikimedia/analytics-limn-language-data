select current_date() as date,
	cawiki,
	dawiki,
	eowiki,
	eswiki,
	idwiki,
	kywiki,
	mswiki,
	nnwiki,
	nowiki,
	pawiki,
	ptwiki,
	svwiki,
	minwiki,
	uzwiki
	from
( select count(*) as cawiki from cawiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from cawiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ca
left join
( select count(*) as dawiki from dawiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from dawiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) da on 1=1
left join
( select count(*) as eowiki from eowiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from eowiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) eo on 1=1
left join
( select count(*) as eswiki from eswiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from eswiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) es on 1=1
left join
( select count(*) as idwiki from idwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from idwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) id on 1=1
left join
( select count(*) as kywiki from kywiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from kywiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ky on 1=1
left join
( select count(*) as mswiki from mswiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from mswiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ms on 1=1
left join
( select count(*) as nnwiki from nnwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from nnwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) nn on 1=1
left join
( select count(*) as nowiki from nowiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from nowiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) no on 1=1
left join
( select count(*) as pawiki from pawiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from pawiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) pa on 1=1
left join
( select count(*) as ptwiki from ptwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from ptwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) pt on 1=1
left join
( select count(*) as svwiki from svwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from svwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) sv on 1=1
left join
( select count(*) as minwiki from minwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from minwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) min on 1=1
left join
( select count(*) as uzwiki from uzwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from uzwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) uz on 1=1
;
