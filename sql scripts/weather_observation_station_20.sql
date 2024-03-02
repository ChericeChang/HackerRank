/*
A median is defined as a number separating the higher half of a data set from the lower half.
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
*/

with base as (
    select lat_n
    , row_number() over (order by lat_n) ranker
    from station
)
select round(avg(lat_n),4)
from base b
where b.ranker = (select floor((max(ranker)+1)/2) from base) or b.ranker = (select ceiling((max(ranker)+1)/2) from base)
;