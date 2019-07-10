" Vim syntax file
" Language:	Gnuplot v4
" Maintainer:	Hagen Wierstorf hagen.wierstorf@uni-oldenburg.de
" Last Change:	Tue May 20 16:25:31 CEST 2008
" Filenames:	*.gnu  *.gp *.gpi  *.gih   scripts: #!*gnuplot
" URL:		tba
"

" This version is based on the Gnuplot syntax file from "John Hoelzel":
" http://johnh51.get.to/vim/syntax/gnuplot.vim
" He uses *.gpi and *.gih as file format names. I prefer *.gnu.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" some shortened names to make demo files look clean... jeh. 11/2000
" demos -> 3.8i ... jeh. 5/2003 - a work in progress...


" --- Statement ---
syn keyword gnuplotStatement	cd call clear exit set unset plot splot help
syn keyword gnuplotStatement	load pause quit fit rep[lot] if
syn keyword gnuplotStatement	FIT_LIMIT FIT_MAXITER FIT_START_LAMBDA
syn keyword gnuplotStatement	FIT_LAMBDA_FACTOR FIT_LOG FIT_SCRIPT
syn keyword gnuplotStatement	print pwd reread reset save show test ! 
syn keyword gnuplotStatement	functions var
syn keyword gnuplotConditional	if
" if is cond + stmt - ok?


" --- Numbers ---
"	integer number, or floating point number without a dot and with "f".
syn case    ignore
syn match   gnuplotNumber	"\<[0-9]\+\(u\=l\=\|lu\|f\)\>"
"	floating point number, with dot, optional exponent
syn match   gnuplotFloat	"\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=[fl]\=\>"
"	floating point number, starting with a dot, optional exponent
syn match   gnuplotFloat	"\.[0-9]\+\(e[-+]\=[0-9]\+\)\=[fl]\=\>"
"	floating point number, without dot, with exponent
syn match   gnuplotFloat	"\<[0-9]\+e[-+]\=[0-9]\+[fl]\=\>"
"	hex number
syn match   gnuplotNumber	"\<0x[0-9a-f]\+\(u\=l\=\|lu\)\>"
syn case    match
"	flag an octal number with wrong digits by not hilighting
syn match   gnuplotOctalError	"\<0[0-7]*[89]"


" --- Plot args ---
syn keyword gnuplotArgs		u[sing] tit[le] notit[le] wi[th] steps fs[teps]
syn keyword gnuplotArgs		title notitle t
syn keyword gnuplotArgs		with w
syn keyword gnuplotArgs		li[nes] l
syn keyword gnuplotArgs		linespoints via 


" --- Functions ---
syn keyword gnuplotFunc		abs acos acosh arg asin asinh atan atanh atan2
syn keyword gnuplotFunc		besj0 besj1 besy0 besy1
syn keyword gnuplotFunc		ceil column cos cosh erf erfc exp floor gamma
syn keyword gnuplotFunc		ibeta inverf igamma imag invnorm int lgamma
syn keyword gnuplotFunc		log log10 norm rand real sgn sin sinh sqrt tan
syn keyword gnuplotFunc		lambertw
syn keyword gnuplotFunc		tanh valid
syn keyword gnuplotFunc		tm_hour tm_mday tm_min tm_mon tm_sec
syn keyword gnuplotFunc		tm_wday tm_yday tm_year


" --- Options ---
syn keyword gnuplotOption	xdata timefmt grid noytics ytics fs
syn keyword gnuplotOption	logscale time notime mxtics nomxtics 
syn keyword gnuplotOption	style mcbtics
syn keyword gnuplotOption	nologscale
syn keyword gnuplotOption	axes x1y2 unique acs[plines]
syn keyword gnuplotOption	size origin multiplot xtics xr[ange] yr[ange] 
syn keyword gnuplotOption	square nosquare ratio noratio
syn keyword gnuplotOption	binary matrix index every thru sm[ooth]
syn keyword gnuplotOption	all angles degrees radians
syn keyword gnuplotOption	arrow noarrow autoscale noautoscale arrowstyle
" autoscale args = x y xy z t ymin ... - too much?
" needs code to: using title vs autoscale t
syn keyword gnuplotOption	x y z zcb
syn keyword gnuplotOption	linear  cubicspline  bspline order level[s]
syn keyword gnuplotOption	auto disc[rete] incr[emental] 
syn keyword gnuplotOption	from to head nohead
syn keyword gnuplotOption	graph base both nosurface table out[put] data
syn keyword gnuplotOption	bar border noborder boxwidth
syn keyword gnuplotOption	clabel noclabel clip noclip cntrp[aram]
syn keyword gnuplotOption	contour nocontour
syn keyword gnuplotOption	dgrid3d nodgrid3d dummy encoding format
" set encoding args not included - yet.
syn keyword gnuplotOption	function grid nogrid hidden[3d] nohidden[3d] 
syn keyword gnuplotOption	isosample[s] key nokey
syn keyword gnuplotOption	historysize nohistorysize
syn keyword gnuplotOption	defaults offset nooffset trianglepattern 
syn keyword gnuplotOption	undefined noundefined altdiagonal bentover 
syn keyword gnuplotOption	noaltdiagonal nobentover
syn keyword gnuplotOption	left right top bottom outside below samplen 
syn keyword gnuplotOption	spacing width height box nobox 
syn keyword gnuplotOption	linestyle ls linetype lt linewidth lw
syn keyword gnuplotOption	linecolor lc
syn keyword gnuplotOption	Left Right autotitles noautotitles enhanced 
syn keyword gnuplotOption	noenhanced
syn keyword gnuplotOption	isosamples
syn keyword gnuplotOption	label nolabel logscale nolog[scale] missing 
syn keyword gnuplotOption	center font locale
syn keyword gnuplotOption	mapping margin bmargin lmargin rmargin tmargin 
syn keyword gnuplotOption	spherical cylindrical cartesian
syn keyword gnuplotOption	linestyle nolinestyle linetype lt linewidth lw 
syn keyword gnuplotOption	pointtype pt pointsize ps
syn keyword gnuplotOption	mouse nomouse
syn keyword gnuplotOption	nooffsets data candlesticks financebars 
syn keyword gnuplotOption	linespoints lp vector nosurface
syn keyword gnuplotOption	term[inal] linux aed767 aed512 gpic
syn keyword gnuplotOption	regis tek410x tek40 vttek kc-tek40xx
syn keyword gnuplotOption	km-tek40xx selanar bitgraph xlib x11 X11
" x11 args
syn keyword gnuplotOption	aifm cgm dumb fig gif small large size 
syn keyword gnuplotOption	nofontlist winword6 corel dxf emf
syn keyword gnuplotOption	hpgl
" syn keyword gnuplotOption	transparent hp2623a hp2648 hp500c pcl5				      
" why jeh
syn keyword gnuplotOption	hp2623a hp2648 hp500c pcl5
syn match gnuplotOption		"\<transparent\>"
syn keyword gnuplotOption	hpljii hpdj hppj imagen mif pbm png svg
syn keyword gnuplotOption	postscript enhanced_postscript qms table eps
" postscript editing values?
syn keyword gnuplotOption	tgif tkcanvas epson-180dpi epson-60dpi
syn keyword gnuplotOption	epson-lx800 nec-cp6 okidata starc
syn keyword gnuplotOption	tandy-60dpi latex emtex pslatex pstex epslatex
syn keyword gnuplotOption	eepic tpic pstricks texdraw mf metafont mpost mp
syn keyword gnuplotOption	timestamp notimestamp
syn keyword gnuplotOption	variables version
syn keyword gnuplotOption	x2data y2data ydata zdata
syn keyword gnuplotOption	reverse writeback noreverse nowriteback
syn keyword gnuplotOption	axis mirror autofreq nomirror rotate 
syn keyword gnuplotOption	autofreq norotate
syn keyword gnuplotOption	update
syn keyword gnuplotOption	multiplot nomultiplot mytics
syn keyword gnuplotOption	nomytics mztics nomztics mx2tics nomx2tics
syn keyword gnuplotOption	my2tics nomy2tics offsets origin output
syn keyword gnuplotOption	para[metric] nopara[metric] pointsize 
syn keyword gnuplotOption	polar nopolar
syn keyword gnuplotOption	zrange x2range y2range rrange cbrange
syn keyword gnuplotOption	trange urange vrange sample[s] size
syn keyword gnuplotOption	bezier boxerrorbars boxes bargraph bar[s]
syn keyword gnuplotOption	boxxy[errorbars] csplines dots fsteps histeps 
syn keyword gnuplotOption	impulses
syn keyword gnuplotOption	line[s] linesp[oints] points poiinttype 
syn keyword gnuplotOption	sbezier splines steps
" w lt lw ls	      = optional
syn keyword gnuplotOption	vectors xerr[orbars] xyerr[orbars] yerr[orbars]
syn keyword gnuplotOption	financebars candlesticks vector
syn keyword gnuplotOption	errorb[ars] surface
syn keyword gnuplotOption	filledcurve[s] pm3d   x1 x2 y1 y2 xy closed
syn keyword gnuplotOption	at pi front
syn keyword gnuplotOption	errorlines xerrorlines yerrorlines xyerrorlines
syn keyword gnuplotOption	tics ticslevel ticscale time timefmt view
syn keyword gnuplotOption	xdata xdtics noxdtics ydtics noydtics
syn keyword gnuplotOption	zdtics nozdtics x2dtics nox2dtics 
syn keyword gnuplotOption	y2dtics noy2dtics
syn keyword gnuplotOption	xlab[el] ylab[el] zlab[el] cblab[el] 
syn keyword gnuplotOption	x2label y2label xmtics
syn keyword gnuplotOption	xmtics noxmtics ymtics noymtics zmtics nozmtics
syn keyword gnuplotOption	x2mtics nox2mtics y2mtics noy2mtics
syn keyword gnuplotOption	cbdtics nocbdtics cbmtics nocbmtics 
syn keyword gnuplotOption	cbtics nocbtics
syn keyword gnuplotOption	xtics noxtics ytics noytics
syn keyword gnuplotOption	ztics noztics x2tics nox2tics
syn keyword gnuplotOption	y2tics noy2tics zero nozero zeroaxis nozeroaxis
syn keyword gnuplotOption	xzeroaxis noxzeroaxis yzeroaxis noyzeroaxis
syn keyword gnuplotOption	x2zeroaxis nox2zeroaxis y2zeroaxis noy2zeroaxis
syn keyword gnuplotOption	angles one two fill empty solid pattern
syn keyword gnuplotOption	default
syn keyword gnuplotOption	scansautomatic flush b[egin] noftriangles 
syn keyword gnuplotOption	implicit
" b too much? - used in demo
syn keyword gnuplotOption	palette positive negative ps_allcF nops_allcF 
syn keyword gnuplotOption	maxcolors
syn keyword gnuplotOption	push fontfile pop
syn keyword gnuplotOption	rgbformulae defined file color model 
syn keyword gnuplotOption	gradient colornames
syn keyword gnuplotOption	RGB HSV CMY YIQ XYZ
syn keyword gnuplotOption	colorbox vertical horizontal user bdefault
syn keyword gnuplotOption	loadpath fontpath decimalsign in out


" --- Comments ---
syn region gnuplotComment	start="#" end="$"


" --- Strings ---
syn region gnuplotString	start=+"+ skip=+\\"+ end=+"+
syn region gnuplotString	start=+'+	     end=+'+


" --- Colors ---
syn keyword gnuplotColor        aqua black blue fuchsia gray green lime maroon navy olive purple red silver teal yellow white
"syn match gnuplotColor          "\'#[0-9A-Fa-f]\{3\}\>\'"
"syn match gnuplotColor          "\'#[0-9A-Fa-f]\{6\}\>\'"
"syn match gnuplotColor          "\"#[0-9A-Fa-f]\{3\}\>\""
"syn match gnuplotColor          "\"#[0-9A-Fa-f]\{6\}\>\""



" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gnuplot_syntax_inits")
  if version < 508
    let did_gnuplot_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink gnuplotStatement	Statement
  HiLink gnuplotConditional	Conditional
  HiLink gnuplotNumber		Number
  HiLink gnuplotFloat		Float
  HiLink gnuplotOctalError	Error
  HiLink gnuplotFunc		Type
  HiLink gnuplotOption		Type
  HiLink gnuplotComment		Comment
  HiLink gnuplotString		String

  delcommand HiLink
endif

let b:current_syntax = "gnuplot"

" vim: ts=8
