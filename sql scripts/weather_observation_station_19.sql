/*
Consider P(a,b) and P(c,d) to be two points on a 2D plane.
 a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Euclidean Distance between points  and  and round it to a scale of  decimal places.
*/

select
round(sqrt(power(max(lat_n) - min(lat_n),2) + power(max(long_w) - min(long_w),2)),4)
from station