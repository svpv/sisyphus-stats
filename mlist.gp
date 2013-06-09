set xdata time
set timefmt '%Y-%B'
set format x "%b %y"
set terminal png size 1024,768
set output "mlist.png"
plot 'mlist-devel-data' using 1:2 lc rgb "dark-red" notitle, \
     'mlist-devel-data' using 1:2 smooth bezier lc rgb "dark-red" title "devel bezier", \
     'mlist-sisyphus-data' using 1:2 lc rgb "dark-green" notitle, \
     'mlist-sisyphus-data' using 1:2 smooth bezier lc rgb "dark-green" title "sisyphus bezier", \
     'mlist-community-data' using 1:2 lc rgb "blue" notitle, \
     'mlist-community-data' using 1:2 smooth bezier lc rgb "blue" title "community bezier"

