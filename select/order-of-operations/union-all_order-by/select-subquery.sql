select * from (select * from tq84_tab_1 order by id) t union all
select * from (select * from tq84_tab_2 order by id) t;
