drop table if exists x_coord;
drop table if exists y_coord;

create table x_coord ( val integer );
create table y_coord ( val integer );


insert into x_coord values (  1 );
insert into x_coord values (  4 );
insert into x_coord values (  8 );
insert into x_coord values (  5 );

insert into y_coord values ( 10 );
insert into y_coord values ( 13 );
insert into y_coord values ( 19 );
insert into y_coord values ( 12 );
insert into y_coord values ( 16 );


drop table if exists grid_coord;
select
   x.val x_from,
   y.val y_from,
   lead(x.val) over (partition by y.val order by x.val) x_to,
   lead(y.val) over (partition by x.val order by y.val) y_to
into
   grid_coord
from
   x_coord x cross join
   y_coord y;

delete from
  grid_coord
where
   x_to is null or
   y_to is null;

select *
from
   grid_coord
order by
   x_from,
   y_from;
--
-- x_from      y_from      x_to        y_to
-- ----------- ----------- ----------- -----------
-- 1           10          4           12
-- 1           12          4           13
-- 1           13          4           16
-- 1           16          4           19
-- 4           10          5           12
-- 4           12          5           13
-- 4           13          5           16
-- 4           16          5           19
-- 5           10          8           12
-- 5           12          8           13
-- 5           13          8           16
-- 5           16          8           19
