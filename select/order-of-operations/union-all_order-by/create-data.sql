create table tq84_tab_1 (id integer, txt varchar(10));
create table tq84_tab_2 (id integer, txt varchar(10));

insert into tq84_tab_1 values (4, 'four' );
insert into tq84_tab_1 values (1, 'one'  );
insert into tq84_tab_1 values (5, 'five' );

insert into tq84_tab_2 values (6, 'six'  );
insert into tq84_tab_2 values (7, 'seven');
insert into tq84_tab_2 values (3, 'three');

select * from tq84_tab_1 union all
select * from tq84_tab_2
order by
  id;

(select * from tq84_tab_1 order by id) union all
(select * from tq84_tab_2 order by id)
