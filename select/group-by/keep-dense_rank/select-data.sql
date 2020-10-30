select
   id,
   min(val) keep (dense_rank first order by val desc) max_val_for_id       ,
   min(txt) keep (dense_rank first order by val desc) txt_for_max_val_in_id,
   min(num) keep (dense_rank first order by val desc) num_for_max_val_in_id
from
   some_data
group by
   id
order by
   id
;
