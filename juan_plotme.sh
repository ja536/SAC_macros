#!/bin/csh
# plot record sections in sac by J.C.Aragon
# call with > csh [scriptname].sh
# INPUT and set time windows, filters, filenames to print, and single station name
#A plot a single station
#B plot filter 1
#C plot filter 2
#D launch sac

set station="*CABN*"
set station_filename=CABN.pdf
set stationTimeWindow="500 10000" #seconds
set recordSectionTimeWindow="2000 4500" #surface waves
set recordSectionTimeWindow2="2700 3900" #zoom
set filter1=".002 .01" #100 to 500 sec
set filter1_filename="100s_500s"
set filter2=".01 .0166" #60 to 80 sec
set filter2_filename="60s_100s"

set radial="BHN" #name BHE, BHN, or BHR
set transverse="BHE" #name BHE, BHN or BHR

# A station
cat > m_plot_figures.m <<ENDOFPLOTTING
R ${station}
XLIM ${stationTimeWindow}
PLOT1
SAVEIMG ${station_filename}

#set time window 1
SSS
TW ${recordSectionTimeWindow}
QS

# B plot filter1 100 to 500 seconds
READ *${radial}*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}${radial}.pdf

READ *${transverse}*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}${transverse}.pdf

READ *BHZ*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}BHZ.pdf

# B.1 plot filter1 zoom
# set time window 2
SSS
TW ${recordSectionTimeWindow2}
QS

#plot 100 to 500 seconds
READ *${radial}*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}zoom${radial}.pdf

READ *${transverse}*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}zoom${transverse}.pdf

READ *BHZ*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}zoomBHZ.pdf

# C plot filter2 plot 60 to 100 sec
READ *${radial}*
BP CORNER ${filter2} NPOLES 4
SSS
PRS
QS
saveimg ${filter2_filename}${radial}.pdf

READ *${transverse}*
BP CORNER ${filter2} NPOLES 4
SSS
PRS
QS
saveimg ${filter2_filename}${transverse}.pdf

READ *BHZ*
BP CORNER ${filter2} NPOLES 4
SSS
PRS
QS
saveimg ${filter2_filename}BHZ.pdf

ED XWINDOWS
EXIT
ENDOFPLOTTING

# D launch sac
 m_plot_figures.m
