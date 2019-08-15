create table tq84_lead_lag (
   year   integer      primary key,
   val    decimal(5,1) not null
);

insert into tq84_lead_lag values (2010, 25.3);
insert into tq84_lead_lag values (2011, 23.2);
insert into tq84_lead_lag values (2012, 23.4);
insert into tq84_lead_lag values (2013, 25.8);
insert into tq84_lead_lag values (2014, 25.5);
insert into tq84_lead_lag values (2015, 26.4);
insert into tq84_lead_lag values (2016, 26.7);
insert into tq84_lead_lag values (2017, 26.3);

select
   year,
   val,
   lag (val   ) over (order by year) val_previous_year ,
   lag (val, 2) over (order by year) val_2nd_last_year ,
   lead(val   ) over (order by year) val_following_year,
   lead(val, 2) over (order by year) val_2nd_next_year
from
   tq84_lead_lag;
--
-- year   val    val_previous_year   val_2nd_last_year   val_following_year   val_2nd_next_year
-- --------------------------------------------------------------------------------------------
-- 2010   25.3   NULL                NULL                23.2                 23.4
-- 2011   23.2   25.3                NULL                23.4                 25.8
-- 2012   23.4   23.2                25.3                25.8                 25.5
-- 2013   25.8   23.4                23.2                25.5                 26.4
-- 2014   25.5   25.8                23.4                26.4                 26.7
-- 2015   26.4   25.5                25.8                26.7                 26.3
-- 2016   26.7   26.4                25.5                26.3                 NULL
-- 2017   26.3   26.7                26.4                NULL                 NULL

drop table tq84_lead_lag;
