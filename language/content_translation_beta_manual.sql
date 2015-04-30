select current_date() as date,
	cawiki,
	dawiki,
	eowiki,
	eswiki,
	idwiki,
	mswiki,
	nnwiki,
	nowiki,
	ptwiki,
	svwiki,
	minwiki,
	uzwiki,
	kywiki,
	pawiki,
	knwiki,
	ukwiki,
	bgwiki,
	frwiki,
	mkwiki,
	shwiki,
	slwiki,
	guwiki,
	viwiki,
	afwiki,
	anwiki,
	astwiki,
	bawiki,
	cvwiki,
	euwiki,
	glwiki,
	koiwiki,
	kvwiki,
	lezwiki,
	ocwiki,
	sahwiki,
	simplewiki,
	ttwiki,
	tyvwiki,
	udmwiki,
	xhwiki,
	cswiki,
	elwiki,
	kkwiki,
	zuwiki,
	akwiki,
	bmwiki,
	eewiki,
	ffwiki,
	kgwiki,
	kiwiki,
	lgwiki,
	nywiki,
	omwiki,
	rnwiki,
	sgwiki,
	sswiki,
	stwiki,
	tiwiki,
	tnwiki,
	tswiki,
	tumwiki,
	twwiki,
	vewiki
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
( select count(*) as mswiki from mswiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from mswiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ms on 1=1
left join
( select count(*) as nnwiki from nnwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from nnwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) nn on 1=1
left join
( select count(*) as nowiki from nowiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from nowiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) no on 1=1
left join
( select count(*) as ptwiki from ptwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from ptwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) pt on 1=1
left join
( select count(*) as svwiki from svwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from svwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) sv on 1=1
left join
( select count(*) as minwiki from minwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from minwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) min on 1=1
left join
( select count(*) as uzwiki from uzwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from uzwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) uz on 1=1
left join
( select count(*) as kywiki from kywiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from kywiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ky on 1=1
left join
( select count(*) as pawiki from pawiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from pawiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) pa on 1=1
left join
( select count(*) as knwiki from knwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from knwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) kn on 1=1
left join
( select count(*) as ukwiki from ukwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from ukwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) uk on 1=1
left join
( select count(*) as bgwiki from bgwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from bgwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) bg on 1=1
left join
( select count(*) as frwiki from frwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from frwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) fr on 1=1
left join
( select count(*) as mkwiki from mkwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from mkwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) mk on 1=1
left join
( select count(*) as shwiki from shwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from shwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) sh on 1=1
left join
( select count(*) as slwiki from slwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from slwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) sl on 1=1
left join
( select count(*) as guwiki from guwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from guwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) gu on 1=1
left join
( select count(*) as viwiki from viwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from viwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) vi on 1=1
left join
( select count(*) as afwiki from afwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from afwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) af on 1=1
left join
( select count(*) as anwiki from anwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from anwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) an on 1=1
left join
( select count(*) as astwiki from astwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from astwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ast on 1=1
left join
( select count(*) as bawiki from bawiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from bawiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ba on 1=1
left join
( select count(*) as cvwiki from cvwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from cvwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) cv on 1=1
left join
( select count(*) as euwiki from euwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from euwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) eu on 1=1
left join
( select count(*) as glwiki from glwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from glwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) gl on 1=1
left join
( select count(*) as koiwiki from koiwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from koiwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) koi on 1=1
left join
( select count(*) as kvwiki from kvwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from kvwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) kv on 1=1
left join
( select count(*) as lezwiki from lezwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from lezwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) lez on 1=1
left join
( select count(*) as ocwiki from ocwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from ocwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) oc on 1=1
left join
( select count(*) as sahwiki from sahwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from sahwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) sah on 1=1
left join
( select count(*) as simplewiki from simplewiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from simplewiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) simple on 1=1
left join
( select count(*) as ttwiki from ttwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from ttwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) tt on 1=1
left join
( select count(*) as tyvwiki from tyvwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from tyvwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) tyv on 1=1
left join
( select count(*) as udmwiki from udmwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from udmwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) udm on 1=1
left join
( select count(*) as xhwiki from xhwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from xhwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) xh on 1=1
left join
( select count(*) as cswiki from cswiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from cswiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) cs on 1=1
left join
( select count(*) as elwiki from elwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from elwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) el on 1=1
left join
( select count(*) as kkwiki from kkwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from kkwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) kk on 1=1
left join
( select count(*) as zuwiki from zuwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from zuwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) zu on 1=1
left join
( select count(*) as akwiki from akwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from akwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ak on 1=1
left join
( select count(*) as bmwiki from bmwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from bmwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) bm on 1=1
left join
( select count(*) as eewiki from eewiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from eewiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ee on 1=1
left join
( select count(*) as ffwiki from ffwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from ffwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ff on 1=1
left join
( select count(*) as kgwiki from kgwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from kgwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) kg on 1=1
left join
( select count(*) as kiwiki from kiwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from kiwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ki on 1=1
left join
( select count(*) as lgwiki from lgwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from lgwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) lg on 1=1
left join
( select count(*) as nywiki from nywiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from nywiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ny on 1=1
left join
( select count(*) as omwiki from omwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from omwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) om on 1=1
left join
( select count(*) as rnwiki from rnwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from rnwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) rn on 1=1
left join
( select count(*) as sgwiki from sgwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from sgwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) sg on 1=1
left join
( select count(*) as sswiki from sswiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from sswiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ss on 1=1
left join
( select count(*) as stwiki from stwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from stwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) st on 1=1
left join
( select count(*) as tiwiki from tiwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from tiwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ti on 1=1
left join
( select count(*) as tnwiki from tnwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from tnwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) tn on 1=1
left join
( select count(*) as tswiki from tswiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from tswiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ts on 1=1
left join
( select count(*) as tumwiki from tumwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from tumwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) tum on 1=1
left join
( select count(*) as twwiki from twwiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from twwiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) tw on 1=1
left join
( select count(*) as vewiki from vewiki.user_properties where up_property = 'cx' and up_value = 1 and up_user not in ( select up_user from vewiki.user_properties where up_property = 'betafeatures-auto-enroll' and up_value = 1 ) ) ve on 1=1
;
