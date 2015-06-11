# this is horrible but we have to break the query into
# parts because it is so long it broke the MariaDB join limit
# In the future, when updating this file, make sure each part
# joins to no more than 30 tables.  Also, we should look into
# using the better report runner that Marcel wrote.

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
        vewiki,
        abwiki,
        avwiki,
        azwiki,
        crhwiki,
        gagwiki,
        hywiki,
        kaawiki,
        kbdwiki,
        krcwiki,
        ladwiki,
        mtwiki,
        mwlwiki,
        oswiki,
        rmywiki,
        roa_rupwiki,
        sqwiki,
        trwiki,
        warwiki,
        cebwiki,
        tlwiki,
        cbk-zamwiki,
        pamwiki,
        pagwiki,
        ilowiki,
        be-x-oldwiki,
        bewiki,
        bclwiki,
        kawiki,
        ruewiki,
        csbwiki,
        ltgwiki,
        lvwiki,
        liwiki,
        bhwiki,
        plwiki,
        hiwiki,
        swwiki,
        sowiki,
        snwiki,
        yowiki,
        amwiki,
        kabwiki,
        wowiki,
        igwiki,
        nsowiki,
        quwiki,
        nahwiki,
        aywiki,
        gnwiki,
        extwiki,
        papwiki,
        ltwiki,
        bat-smgwiki,
        bswiki,
        etwiki,
        fiwiki,
        fiu-vrowiki,
        fywiki,
        hrwiki,
        huwiki,
        nds-nlwiki,
        nlwiki,
        rowiki,
        sewiki,
        skwiki,
        srwiki,
        szlwiki,
        vepwiki,
        aswiki,
        bnwiki,
        bpywiki
        mywiki,
        dzwiki,
        kmwiki,
        lowiki,
        mlwiki,
        mrwiki,
        newiki,
        newwiki,
        orwiki,
        piwiki,
        sawiki,
        siwiki,
        tewiki,
        thwiki,
        kwwiki,
        gawiki,
        rwwiki,
        gvwiki,
        nvwiki,
        pdcwiki,
        scowiki,
        gdwiki,
        srnwiki,
        tpiwiki,
        urwiki,
        cywiki,
        vlswiki,
        yiwiki,
        zeawiki,
        biwiki,
        brwiki,
        chrwiki,
        chywiki,
        frpwiki,
        htwiki,
        lnwiki,
        maiwiki,
        nrmwiki,
        pcdwiki,
        pihwiki,
        pmswiki,
        smwiki,
        tawiki,
        wawiki

   from (select *
           from ( select count(*) as cawiki from cawiki.user_properties where up_property = 'cx' and up_value = 1 ) ca
                left join
                ( select count(*) as dawiki from dawiki.user_properties where up_property = 'cx' and up_value = 1 ) da on 1=1
                left join
                ( select count(*) as eowiki from eowiki.user_properties where up_property = 'cx' and up_value = 1 ) eo on 1=1
                left join
                ( select count(*) as eswiki from eswiki.user_properties where up_property = 'cx' and up_value = 1 ) es on 1=1
                left join
                ( select count(*) as idwiki from idwiki.user_properties where up_property = 'cx' and up_value = 1 ) id on 1=1
                left join
                ( select count(*) as mswiki from mswiki.user_properties where up_property = 'cx' and up_value = 1 ) ms on 1=1
                left join
                ( select count(*) as nnwiki from nnwiki.user_properties where up_property = 'cx' and up_value = 1 ) nn on 1=1
                left join
                ( select count(*) as nowiki from nowiki.user_properties where up_property = 'cx' and up_value = 1 ) no on 1=1
                left join
                ( select count(*) as ptwiki from ptwiki.user_properties where up_property = 'cx' and up_value = 1 ) pt on 1=1
                left join
                ( select count(*) as svwiki from svwiki.user_properties where up_property = 'cx' and up_value = 1 ) sv on 1=1
                left join
                ( select count(*) as minwiki from minwiki.user_properties where up_property = 'cx' and up_value = 1 ) min on 1=1
                left join
                ( select count(*) as uzwiki from uzwiki.user_properties where up_property = 'cx' and up_value = 1 ) uz on 1=1
                left join
                ( select count(*) as kywiki from kywiki.user_properties where up_property = 'cx' and up_value = 1 ) ky on 1=1
                left join
                ( select count(*) as pawiki from pawiki.user_properties where up_property = 'cx' and up_value = 1 ) pa on 1=1
                left join
                ( select count(*) as knwiki from knwiki.user_properties where up_property = 'cx' and up_value = 1 ) kn on 1=1
                left join
                ( select count(*) as ukwiki from ukwiki.user_properties where up_property = 'cx' and up_value = 1 ) uk on 1=1
                left join
                ( select count(*) as bgwiki from bgwiki.user_properties where up_property = 'cx' and up_value = 1 ) bg on 1=1
                left join
                ( select count(*) as frwiki from frwiki.user_properties where up_property = 'cx' and up_value = 1 ) fr on 1=1
                left join
                ( select count(*) as mkwiki from mkwiki.user_properties where up_property = 'cx' and up_value = 1 ) mk on 1=1
                left join
                ( select count(*) as shwiki from shwiki.user_properties where up_property = 'cx' and up_value = 1 ) sh on 1=1
                left join
                ( select count(*) as slwiki from slwiki.user_properties where up_property = 'cx' and up_value = 1 ) sl on 1=1
                left join
                ( select count(*) as guwiki from guwiki.user_properties where up_property = 'cx' and up_value = 1 ) gu on 1=1
                left join
                ( select count(*) as viwiki from viwiki.user_properties where up_property = 'cx' and up_value = 1 ) vi on 1=1
                left join
                ( select count(*) as afwiki from afwiki.user_properties where up_property = 'cx' and up_value = 1 ) af on 1=1
                left join
                ( select count(*) as anwiki from anwiki.user_properties where up_property = 'cx' and up_value = 1 ) an on 1=1
                left join
                ( select count(*) as astwiki from astwiki.user_properties where up_property = 'cx' and up_value = 1 ) ast on 1=1
                left join
                ( select count(*) as bawiki from bawiki.user_properties where up_property = 'cx' and up_value = 1 ) ba on 1=1
                left join
                ( select count(*) as cvwiki from cvwiki.user_properties where up_property = 'cx' and up_value = 1 ) cv on 1=1
                left join
                ( select count(*) as euwiki from euwiki.user_properties where up_property = 'cx' and up_value = 1 ) eu on 1=1
                left join
                ( select count(*) as glwiki from glwiki.user_properties where up_property = 'cx' and up_value = 1 ) gl on 1=1
                left join
                ( select count(*) as koiwiki from koiwiki.user_properties where up_property = 'cx' and up_value = 1 ) koi on 1=1
        ) first30

            cross join

        (select *
           from ( select count(*) as kvwiki from kvwiki.user_properties where up_property = 'cx' and up_value = 1 ) kv
                left join
                ( select count(*) as lezwiki from lezwiki.user_properties where up_property = 'cx' and up_value = 1 ) lez on 1=1
                left join
                ( select count(*) as ocwiki from ocwiki.user_properties where up_property = 'cx' and up_value = 1 ) oc on 1=1
                left join
                ( select count(*) as sahwiki from sahwiki.user_properties where up_property = 'cx' and up_value = 1 ) sah on 1=1
                left join
                ( select count(*) as simplewiki from simplewiki.user_properties where up_property = 'cx' and up_value = 1 ) simple on 1=1
                left join
                ( select count(*) as ttwiki from ttwiki.user_properties where up_property = 'cx' and up_value = 1 ) tt on 1=1
                left join
                ( select count(*) as tyvwiki from tyvwiki.user_properties where up_property = 'cx' and up_value = 1 ) tyv on 1=1
                left join
                ( select count(*) as udmwiki from udmwiki.user_properties where up_property = 'cx' and up_value = 1 ) udm on 1=1
                left join
                ( select count(*) as xhwiki from xhwiki.user_properties where up_property = 'cx' and up_value = 1 ) xh on 1=1
                left join
                ( select count(*) as cswiki from cswiki.user_properties where up_property = 'cx' and up_value = 1 ) cs on 1=1
                left join
                ( select count(*) as elwiki from elwiki.user_properties where up_property = 'cx' and up_value = 1 ) el on 1=1
                left join
                ( select count(*) as kkwiki from kkwiki.user_properties where up_property = 'cx' and up_value = 1 ) kk on 1=1
                left join
                ( select count(*) as zuwiki from zuwiki.user_properties where up_property = 'cx' and up_value = 1 ) zu on 1=1
                left join
                ( select count(*) as akwiki from akwiki.user_properties where up_property = 'cx' and up_value = 1 ) ak on 1=1
                left join
                ( select count(*) as bmwiki from bmwiki.user_properties where up_property = 'cx' and up_value = 1 ) bm on 1=1
                left join
                ( select count(*) as eewiki from eewiki.user_properties where up_property = 'cx' and up_value = 1 ) ee on 1=1
                left join
                ( select count(*) as ffwiki from ffwiki.user_properties where up_property = 'cx' and up_value = 1 ) ff on 1=1
                left join
                ( select count(*) as kgwiki from kgwiki.user_properties where up_property = 'cx' and up_value = 1 ) kg on 1=1
                left join
                ( select count(*) as kiwiki from kiwiki.user_properties where up_property = 'cx' and up_value = 1 ) ki on 1=1
                left join
                ( select count(*) as lgwiki from lgwiki.user_properties where up_property = 'cx' and up_value = 1 ) lg on 1=1
                left join
                ( select count(*) as nywiki from nywiki.user_properties where up_property = 'cx' and up_value = 1 ) ny on 1=1
                left join
                ( select count(*) as omwiki from omwiki.user_properties where up_property = 'cx' and up_value = 1 ) om on 1=1
                left join
                ( select count(*) as rnwiki from rnwiki.user_properties where up_property = 'cx' and up_value = 1 ) rn on 1=1
                left join
                ( select count(*) as sgwiki from sgwiki.user_properties where up_property = 'cx' and up_value = 1 ) sg on 1=1
                left join
                ( select count(*) as sswiki from sswiki.user_properties where up_property = 'cx' and up_value = 1 ) ss on 1=1
                left join
                ( select count(*) as stwiki from stwiki.user_properties where up_property = 'cx' and up_value = 1 ) st on 1=1
                left join
                ( select count(*) as tiwiki from tiwiki.user_properties where up_property = 'cx' and up_value = 1 ) ti on 1=1
                left join
                ( select count(*) as tnwiki from tnwiki.user_properties where up_property = 'cx' and up_value = 1 ) tn on 1=1
                left join
                ( select count(*) as tswiki from tswiki.user_properties where up_property = 'cx' and up_value = 1 ) ts on 1=1
                left join
                ( select count(*) as tumwiki from tumwiki.user_properties where up_property = 'cx' and up_value = 1 ) tum on 1=1
                left join
                ( select count(*) as twwiki from twwiki.user_properties where up_property = 'cx' and up_value = 1 ) tw on 1=1
        ) second30

            cross join

        (select *
           from ( select count(*) as vewiki from vewiki.user_properties where up_property = 'cx' and up_value = 1 ) ve
                left join
                ( select count(*) as abwiki from abwiki.user_properties where up_property = 'cx' and up_value = 1 ) ab on 1=1
                left join
                ( select count(*) as avwiki from avwiki.user_properties where up_property = 'cx' and up_value = 1 ) av on 1=1
                left join
                ( select count(*) as azwiki from azwiki.user_properties where up_property = 'cx' and up_value = 1 ) az on 1=1
                left join
                ( select count(*) as crhwiki from crhwiki.user_properties where up_property = 'cx' and up_value = 1 ) crh on 1=1
                left join
                ( select count(*) as gagwiki from gagwiki.user_properties where up_property = 'cx' and up_value = 1 ) gag on 1=1
                left join
                ( select count(*) as hywiki from hywiki.user_properties where up_property = 'cx' and up_value = 1 ) hy on 1=1
                left join
                ( select count(*) as kaawiki from kaawiki.user_properties where up_property = 'cx' and up_value = 1 ) kaa on 1=1
                left join
                ( select count(*) as kbdwiki from kbdwiki.user_properties where up_property = 'cx' and up_value = 1 ) kbd on 1=1
                left join
                ( select count(*) as krcwiki from krcwiki.user_properties where up_property = 'cx' and up_value = 1 ) krc on 1=1
                left join
                ( select count(*) as ladwiki from ladwiki.user_properties where up_property = 'cx' and up_value = 1 ) lad on 1=1
                left join
                ( select count(*) as mtwiki from mtwiki.user_properties where up_property = 'cx' and up_value = 1 ) mt on 1=1
                left join
                ( select count(*) as mwlwiki from mwlwiki.user_properties where up_property = 'cx' and up_value = 1 ) mwl on 1=1
                left join
                ( select count(*) as oswiki from oswiki.user_properties where up_property = 'cx' and up_value = 1 ) os on 1=1
                left join
                ( select count(*) as rmywiki from rmywiki.user_properties where up_property = 'cx' and up_value = 1 ) rmy on 1=1
                left join
                ( select count(*) as roa_rupwiki from roa_rupwiki.user_properties where up_property = 'cx' and up_value = 1 ) roa_rup on 1=1
                left join
                ( select count(*) as sqwiki from sqwiki.user_properties where up_property = 'cx' and up_value = 1 ) sq on 1=1
                left join
                ( select count(*) as trwiki from trwiki.user_properties where up_property = 'cx' and up_value = 1 ) tr on 1=1
                left join
                ( select count(*) as warwiki from warwiki.user_properties where up_property = 'cx' and up_value = 1 ) war on 1=1
                left join
                ( select count(*) as cebiki from cebwiki.user_properties where up_property = 'cx' and up_value = 1 ) ceb on 1=1
                left join
                ( select count(*) as tlwiki from tlwiki.user_properties where up_property = 'cx' and up_value = 1 ) tl on 1=1
                left join
                ( select count(*) as cbk-zamwiki from cbk-zamwiki.user_properties where up_property = 'cx' and up_value = 1 ) cbk-zam on 1=1
                left join
                ( select count(*) as pamwiki from pamwiki.user_properties where up_property = 'cx' and up_value = 1 ) pam on 1=1
                left join
                ( select count(*) as pagwiki from pagwiki.user_properties where up_property = 'cx' and up_value = 1 ) pag on 1=1
                left join
                ( select count(*) as ilowiki from ilowiki.user_properties where up_property = 'cx' and up_value = 1 ) ilo on 1=1
                left join
                ( select count(*) as be-x-oldwiki from be-x-oldwiki.user_properties where up_property = 'cx' and up_value = 1 ) be-x-old on 1=1
                left join
                ( select count(*) as bewiki from bewiki.user_properties where up_property = 'cx' and up_value = 1 ) be on 1=1
                left join
                ( select count(*) as bclwiki from bclwiki.user_properties where up_property = 'cx' and up_value = 1 ) bcl on 1=1
                left join
                ( select count(*) as kawiki from kawiki.user_properties where up_property = 'cx' and up_value = 1 ) ka on 1=1
                left join
                ( select count(*) as ruewiki from ruewiki.user_properties where up_property = 'cx' and up_value = 1 ) rue on 1=1
        ) third30

            cross join

        (select *
           from ( select count(*) as csbwiki from csbwiki.user_properties where up_property = 'cx' and up_value = 1 ) csb
                left join
                ( select count(*) as ltgwiki from ltgwiki.user_properties where up_property = 'cx' and up_value = 1 ) ltg on 1=1
                left join
                ( select count(*) as lvwiki from lvwiki.user_properties where up_property = 'cx' and up_value = 1 ) lv on 1=1
                left join
                ( select count(*) as liwiki from liwiki.user_properties where up_property = 'cx' and up_value = 1 ) li on 1=1
                left join
                ( select count(*) as bhwiki from bhwiki.user_properties where up_property = 'cx' and up_value = 1 ) bh on 1=1
                left join
                ( select count(*) as plwiki from plwiki.user_properties where up_property = 'cx' and up_value = 1 ) pl on 1=1
                left join
                ( select count(*) as hiwiki from hiwiki.user_properties where up_property = 'cx' and up_value = 1 ) hi on 1=1
                left join
                ( select count(*) as swwiki from swwiki.user_properties where up_property = 'cx' and up_value = 1 ) sw on 1=1
                left join
                ( select count(*) as sowiki from sowiki.user_properties where up_property = 'cx' and up_value = 1 ) so on 1=1
                left join
                ( select count(*) as snwiki from snwiki.user_properties where up_property = 'cx' and up_value = 1 ) sn on 1=1
                left join
                ( select count(*) as yowiki from yowiki.user_properties where up_property = 'cx' and up_value = 1 ) yo on 1=1
                left join
                ( select count(*) as amwiki from amwiki.user_properties where up_property = 'cx' and up_value = 1 ) am on 1=1
                left join
                ( select count(*) as kabwiki from kabwiki.user_properties where up_property = 'cx' and up_value = 1 ) kab on 1=1
                left join
                ( select count(*) as wowiki from wowiki.user_properties where up_property = 'cx' and up_value = 1 ) wo on 1=1
                left join
                ( select count(*) as igwiki from igwiki.user_properties where up_property = 'cx' and up_value = 1 ) ig on 1=1
                left join
                ( select count(*) as nsowiki from nsowiki.user_properties where up_property = 'cx' and up_value = 1 ) nso on 1=1
                left join
                ( select count(*) as quwiki from quwiki.user_properties where up_property = 'cx' and up_value = 1 ) qu on 1=1
                left join
                ( select count(*) as nahwiki from nahwiki.user_properties where up_property = 'cx' and up_value = 1 ) nah on 1=1
                left join
                ( select count(*) as aywiki from aywiki.user_properties where up_property = 'cx' and up_value = 1 ) ay on 1=1
                left join
                ( select count(*) as gnwiki from gnwiki.user_properties where up_property = 'cx' and up_value = 1 ) gn on 1=1
                left join
                ( select count(*) as extwiki from extwiki.user_properties where up_property = 'cx' and up_value = 1 ) ext on 1=1
                left join
                ( select count(*) as papwiki from papwiki.user_properties where up_property = 'cx' and up_value = 1 ) pap on 1=1
                left join
                ( select count(*) as ltwiki from ltwiki.user_properties where up_property = 'cx' and up_value = 1 ) lt on 1=1
                left join
                ( select count(*) as bat-smgwiki from bat-smgwiki.user_properties where up_property = 'cx' and up_value = 1 ) bat-smg on 1=1
                left join
                ( select count(*) as bswiki from bswiki.user_properties where up_property = 'cx' and up_value = 1 ) bs on 1=1
                left join
                ( select count(*) as etwiki from etwiki.user_properties where up_property = 'cx' and up_value = 1 ) et on 1=1
                left join
                ( select count(*) as fiwiki from fiwiki.user_properties where up_property = 'cx' and up_value = 1 ) fi on 1=1
                left join
                ( select count(*) as fiu-vrowiki from fiu-vrowiki.user_properties where up_property = 'cx' and up_value = 1 ) fiu-vro on 1=1
                left join
                ( select count(*) as fywiki from fywiki.user_properties where up_property = 'cx' and up_value = 1 ) fy on 1=1
                left join
                ( select count(*) as hrwiki from hrwiki.user_properties where up_property = 'cx' and up_value = 1 ) hr on 1=1
                left join
                ( select count(*) as huwiki from huwiki.user_properties where up_property = 'cx' and up_value = 1 ) hu on 1=1
        ) forth30

            cross join

        (select *
           from ( select count(*) as nds-nlwiki from nds-nlwiki.user_properties where up_property = 'cx' and up_value = 1 ) nds-nl
                left join
                ( select count(*) as nlwiki from nlwiki.user_properties where up_property = 'cx' and up_value = 1 ) nl on 1=1
                left join
                ( select count(*) as rowiki from rowiki.user_properties where up_property = 'cx' and up_value = 1 ) ro on 1=1
                left join
                ( select count(*) as sewiki from sewiki.user_properties where up_property = 'cx' and up_value = 1 ) se on 1=1
                left join
                ( select count(*) as skwiki from skwiki.user_properties where up_property = 'cx' and up_value = 1 ) sk on 1=1
                left join
                ( select count(*) as srwiki from srwiki.user_properties where up_property = 'cx' and up_value = 1 ) sr on 1=1
                left join
                ( select count(*) as szlwiki from szlwiki.user_properties where up_property = 'cx' and up_value = 1 ) szl on 1=1
                left join
                ( select count(*) as vepwiki from vepwiki.user_properties where up_property = 'cx' and up_value = 1 ) vep on 1=1
                left join
                ( select count(*) as aswiki from aswiki.user_properties where up_property = 'cx' and up_value = 1 ) as on 1=1
                left join
                ( select count(*) as bnwiki from bnwiki.user_properties where up_property = 'cx' and up_value = 1 ) bn on 1=1
                left join
                ( select count(*) as bpywiki from bpywiki.user_properties where up_property = 'cx' and up_value = 1 ) bpy on 1=1
                left join
                ( select count(*) as mywiki from mywiki.user_properties where up_property = 'cx' and up_value = 1 ) my on 1=1
                left join
                ( select count(*) as dzwiki from dzwiki.user_properties where up_property = 'cx' and up_value = 1 ) dz on 1=1
                left join
                ( select count(*) as kmwiki from kmwiki.user_properties where up_property = 'cx' and up_value = 1 ) km on 1=1
                left join
                ( select count(*) as lowiki from lowiki.user_properties where up_property = 'cx' and up_value = 1 ) lo on 1=1
                left join
                ( select count(*) as mlwiki from mlwiki.user_properties where up_property = 'cx' and up_value = 1 ) ml on 1=1
                left join
                ( select count(*) as mrwiki from mrwiki.user_properties where up_property = 'cx' and up_value = 1 ) mr on 1=1
                left join
                ( select count(*) as newiki from newiki.user_properties where up_property = 'cx' and up_value = 1 ) ne on 1=1
                left join
                ( select count(*) as newwiki from newwiki.user_properties where up_property = 'cx' and up_value = 1 ) new on 1=1
                left join
                ( select count(*) as orwiki from orwiki.user_properties where up_property = 'cx' and up_value = 1 ) or on 1=1
                left join
                ( select count(*) as piwiki from piwiki.user_properties where up_property = 'cx' and up_value = 1 ) pi on 1=1
                left join
                ( select count(*) as sawiki from sawiki.user_properties where up_property = 'cx' and up_value = 1 ) sa on 1=1
                left join
                ( select count(*) as siwiki from siwiki.user_properties where up_property = 'cx' and up_value = 1 ) si on 1=1
                left join
                ( select count(*) as tewiki from tewiki.user_properties where up_property = 'cx' and up_value = 1 ) te on 1=1
                left join
                ( select count(*) as thwiki from thwiki.user_properties where up_property = 'cx' and up_value = 1 ) th on 1=1
                left join
                ( select count(*) as kwwiki from kwwiki.user_properties where up_property = 'cx' and up_value = 1 ) kw on 1=1
                left join
                ( select count(*) as gawiki from gawiki.user_properties where up_property = 'cx' and up_value = 1 ) ga on 1=1
                left join
                ( select count(*) as rwwiki from rwwiki.user_properties where up_property = 'cx' and up_value = 1 ) rw on 1=1
                left join
                ( select count(*) as gvwiki from gvwiki.user_properties where up_property = 'cx' and up_value = 1 ) gv on 1=1
                left join
                ( select count(*) as nvwiki from nvwiki.user_properties where up_property = 'cx' and up_value = 1 ) nv on 1=1
        ) fifth30

            cross join

        (select *
           from ( select count(*) as pdcwiki from pdcwiki.user_properties where up_property = 'cx' and up_value = 1 ) pdc
                left join
                ( select count(*) as scowiki from scowiki.user_properties where up_property = 'cx' and up_value = 1 ) sco on 1=1
                left join
                ( select count(*) as gdwiki from gdwiki.user_properties where up_property = 'cx' and up_value = 1 ) gd on 1=1
                left join
                ( select count(*) as srnwiki from srnwiki.user_properties where up_property = 'cx' and up_value = 1 ) srn on 1=1
                left join
                ( select count(*) as tpiwiki from tpiwiki.user_properties where up_property = 'cx' and up_value = 1 ) tpi on 1=1
                left join
                ( select count(*) as urwiki from urwiki.user_properties where up_property = 'cx' and up_value = 1 ) ur on 1=1
                left join
                ( select count(*) as cywiki from cywiki.user_properties where up_property = 'cx' and up_value = 1 ) cy on 1=1
                left join
                ( select count(*) as vlswiki from vlswiki.user_properties where up_property = 'cx' and up_value = 1 ) vls on 1=1
                left join
                ( select count(*) as yiwiki from yiwiki.user_properties where up_property = 'cx' and up_value = 1 ) yi on 1=1
                left join
                ( select count(*) as zeawiki from zeawiki.user_properties where up_property = 'cx' and up_value = 1 ) zea on 1=1
                left join
                ( select count(*) as biwiki from biwiki.user_properties where up_property = 'cx' and up_value = 1 ) bi on 1=1
                left join
                ( select count(*) as brwiki from brwiki.user_properties where up_property = 'cx' and up_value = 1 ) br on 1=1
                left join
                ( select count(*) as chrwiki from chrwiki.user_properties where up_property = 'cx' and up_value = 1 ) chr on 1=1
                left join
                ( select count(*) as chywiki from chywiki.user_properties where up_property = 'cx' and up_value = 1 ) chy on 1=1
                left join
                ( select count(*) as frpwiki from frpwiki.user_properties where up_property = 'cx' and up_value = 1 ) frp on 1=1
                left join
                ( select count(*) as htwiki from htwiki.user_properties where up_property = 'cx' and up_value = 1 ) ht on 1=1
                left join
                ( select count(*) as lnwiki from lnwiki.user_properties where up_property = 'cx' and up_value = 1 ) ln on 1=1
                left join
                ( select count(*) as maiwiki from maiwiki.user_properties where up_property = 'cx' and up_value = 1 ) mai on 1=1
                left join
                ( select count(*) as nrmwiki from nrmwiki.user_properties where up_property = 'cx' and up_value = 1 ) nrm on 1=1
                left join
                ( select count(*) as pcdwiki from pcdwiki.user_properties where up_property = 'cx' and up_value = 1 ) pcd on 1=1
                left join
                ( select count(*) as pihwiki from pihwiki.user_properties where up_property = 'cx' and up_value = 1 ) pih on 1=1
                left join
                ( select count(*) as pmswiki from pmswiki.user_properties where up_property = 'cx' and up_value = 1 ) pms on 1=1
                left join
                ( select count(*) as smwiki from smwiki.user_properties where up_property = 'cx' and up_value = 1 ) sm on 1=1
                left join
                ( select count(*) as tawiki from tawiki.user_properties where up_property = 'cx' and up_value = 1 ) ta on 1=1
                left join
                ( select count(*) as wawiki from wawiki.user_properties where up_property = 'cx' and up_value = 1 ) wa on 1=1
        ) sixth30

;
