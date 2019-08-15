create table tq84_tab (
   val    numeric(5,2),
   txt    varchar(10)
);

insert into tq84_tab values (  4.88, 'one'  );
insert into tq84_tab values (  8.24, 'two'  );
insert into tq84_tab values ( 11.22, 'three');
insert into tq84_tab values ( 14.34, 'four' );
insert into tq84_tab values ( 17.31, 'five' );
insert into tq84_tab values ( 19.56, 'six'  );
insert into tq84_tab values ( 21.79, 'seven');
insert into tq84_tab values ( 22.92, 'eight');
insert into tq84_tab values ( 25.05, 'nine' );
insert into tq84_tab values ( 25.32, 'ten'  );

with s as (
  select
    val,
    txt,
    ntile          (5  )         over (order by val)        quintile_n,
    percentile_disc(0.0) within group (order by val) over() quintile_0,
    percentile_disc(0.2) within group (order by val) over() quintile_1,
    percentile_disc(0.4) within group (order by val) over() quintile_2,
    percentile_disc(0.6) within group (order by val) over() quintile_3,
    percentile_disc(0.8) within group (order by val) over() quintile_4,
    percentile_disc(1.0) within group (order by val) over() quintile_5
  from
    tq84_tab
)
select
  val,
  txt,
  quintile_n,
  quintile_1,
  quintile_2,
  quintile_3,
  quintile_4,
  quintile_5
from
  s;
--
-- val     txt      quintile_n  quintile_1  quintile_2  quintile_3  quintile_4  quintile_5
-- ------  -------  ----------  ----------  ----------  ----------  ----------  ----------
--  4.88   one      1           8.24        14.34       19.56       22.92       25.32
--  8.24   two      1           8.24        14.34       19.56       22.92       25.32
-- 11.22   three    2           8.24        14.34       19.56       22.92       25.32
-- 14.34   four     2           8.24        14.34       19.56       22.92       25.32
-- 17.31   five     3           8.24        14.34       19.56       22.92       25.32
-- 19.56   six      3           8.24        14.34       19.56       22.92       25.32
-- 21.79   seven    4           8.24        14.34       19.56       22.92       25.32
-- 22.92   eight    4           8.24        14.34       19.56       22.92       25.32
-- 25.05   nine     5           8.24        14.34       19.56       22.92       25.32
-- 25.32   ten      5           8.24        14.34       19.56       22.92       25.32

drop table tq84_tab;
