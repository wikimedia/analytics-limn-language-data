select
  date('{from_timestamp}') as date,
  cxc_origin as engine,
  count(distinct(cxc_translation_id)) as translations
from
  cx_corpora
where
  cxc_timestamp between '{from_timestamp}' and '{to_timestamp}' and
  cxc_origin not in ('disable-mt', 'no-mt', 'user', 'source', 'source-mt')
group by
  cxc_origin;
