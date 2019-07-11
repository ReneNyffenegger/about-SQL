select t.*, 1 o from tq84_tab_1 t union all
select t.*, 2 o from tq84_tab_2 t
order by
  o, id
