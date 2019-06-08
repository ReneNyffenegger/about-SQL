select
   item,
   percentile_disc(0.5) within group (order by val_one) median_val_one
from
   tq84_p
group by
   item;
