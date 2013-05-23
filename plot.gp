set xdata time
set timefmt '%Y-%B'
set format x "%b %y"
set terminal png size 1024,768

f(x) = a*x + b
fit f(x) 'monthly-data' using 1:3 via a,b
set output "total.png"
plot 'monthly-data' using 1:3 with lines smooth cspline, f(x)

g(x) = c*x + d
fit g(x) 'monthly-data' using 1:2 via c,d
set output "updates.png"
plot 'monthly-data' using 1:2, g(x)

set output "ratio.png"
plot 'monthly-data' using 1:($2/$3)
