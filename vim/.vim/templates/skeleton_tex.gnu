#!/usr/bin/gnuplot
#
# <+DESCRIPTION+>
#
# AUTHOR: Hagen Wierstorf

reset

set terminal epslatex standalone color colortext lw 1.7
set output '<+NAME+>.tex'

# reasonable size for epslatex two figures: 0.55
# for one figure: ?
set size <+xsize+>,<+ysize+>
set pointsize 1.4

# color definitions
set style line 1 lc rgb '#0060ad' lt 1  # --- blue
set style line 2 lc rgb '#dd181f' lt 1  # --- red
set style line 3 lc rgb '#949599' lt 1  # --- grey
set style line 4 lc rgb '#d6d7d9' lt 1  # --- lightgrey

unset key

set xrange[<+x_min:x_max+>]
set yrange[<+y_min:y_max+>]

set xlabel '<+xlabel+>'
set ylabel '<+ylabel+>'
