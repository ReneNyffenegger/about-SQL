select
   percentile_disc(0.2) within group (order by val_one),
   percentile_disc(0.4) within group (order by val_one),
   percentile_disc(0.7) within group (order by val_one)
from
   tq84_p;
