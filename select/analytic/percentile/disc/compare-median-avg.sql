select
   percentile_disc(0.5) within group (order by val_one) median_val_one,
   avg            (                            val_one) mean_val_one  ,
   percentile_disc(0.5) within group (order by val_two) median_val_two,
   avg            (                            val_two) mean_val_two
from
   tq84_p;

