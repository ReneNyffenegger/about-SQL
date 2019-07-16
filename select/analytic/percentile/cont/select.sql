select
   grp,
   val,
   percentile_cont(0.5) within group (order by val) over (                ) median,
   percentile_cont(0.5) within group (order by val) over (partition by grp) median_grp
from
   tq84_perc_cont
;
