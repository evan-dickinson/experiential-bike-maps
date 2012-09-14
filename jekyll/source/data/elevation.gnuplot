#set terminal png transparent medium size 314, 100
set terminal svg size 314, 100

#set yrange [0:30]
set yrange [0:110]
set xrange [0:7000]

#unset label
#unset tics
#unset grid
#unset border

set style line 1 linecolor rgb "black"

set datafile separator ","

set output "../img/elevation-via-pacific.svg"    
plot "elevation-via-pacific.csv/elevation-via-pacific.csv" \
     every 4 \
     using 2:5 \
     smooth bezier \
     notitle \
     with line linestyle 1

set output "../img/elevation-via-first.svg"    
plot "elevation-via-first.csv/elevation-via-first.csv" \
     every 4 \
     using 2:5 \
     smooth bezier \
     notitle \
     with line linestyle 1

set output "../img/elevation-via-expo.svg"    
plot "elevation-via-expo.csv/elevation-via-expo.csv" \
     every 4 \
     using 2:4 \
     smooth bezier \
     notitle \
     with line linestyle 1

set yrange [0:110]
set xrange [0:5700]
#set yrange [*:*]
#set xrange [*:*]

set output "../img/elevation-via-dumfries.svg"    
plot "elevation-via-dumfries.csv/elevation-via-dumfries.csv" \
     every 4 \
     using 2:6 \
     smooth bezier \
     notitle \
     with line linestyle 1

set output "../img/elevation-via-inverness.svg"    
plot "elevation-via-inverness.csv/elevation-via-inverness.csv" \
     every 4 \
     using 2:6 \
     smooth bezier \
     notitle \
     with line linestyle 1

