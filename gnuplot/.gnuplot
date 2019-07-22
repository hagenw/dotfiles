# Gnuplot configuration file


# ===== General settings =================================================
# Load color palettes (https://github.com/Gnuplotting/gnuplot-palettes)
set loadpath '~/git/gnuplot-palettes'


# ===== Functions ========================================================
# Bessel functions of first kind (after Bronstein 2001, eq. 9.54a)
besj2(x) = 2*1/x * besj1(x) - besj0(x)
besj3(x) = 2*2/x * besj2(x) - besj1(x)
besj4(x) = 2*3/x * besj3(x) - besj2(x)
besj5(x) = 2*4/x * besj4(x) - besj3(x)
besj6(x) = 2*5/x * besj5(x) - besj4(x)
besj7(x) = 2*6/x * besj6(x) - besj5(x)
besj8(x) = 2*7/x * besj7(x) - besj6(x)
besj9(x) = 2*8/x * besj8(x) - besj7(x)


# ===== Macros ===========================================================
# Terminals
POSTSCRIPT = 'set terminal postscript eps enhanced color font "Helvetica,16"'
LATEX = 'set terminal epslatex color colortext'
WXT = "set terminal wxt size 350,262 enhanced font 'Verdana,10' \
    persist"
PNG = "set terminal pngcairo size 350,262 enhanced font 'Verdana,10'"
SVG = "set terminal svg size 350,262 \
    fname 'Verdana, Helvetica, Arial, sans-serif' fsize '10'"
# Line colours
set style line 1 lc rgb '#0060ad' lt 1 pt 5   # blue
set style line 2 lc rgb '#dd181f' lt 1 pt 7   # red
BLUE = "1"
RED = "2"
