select
   item,
   val_two,
   percentile_disc(0.5) within group (order by val_two) over (partition by item) median_val_two
from
   tq84_p;
