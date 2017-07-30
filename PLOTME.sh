#!/bin/csh
# plot figures in sac for BHR BHT and BHZ by J.C.Aragon
# call with > csh [scriptname].sh
# input time windows filters filenames and station name
#A plot single station
#B plot filter 1
#C plot filter 2
#D Cleanup

set station="*CABN*"
set station_filename=1CABN.pdf
set filter1=".002 .01" #100 to 500 seconds
set filter1_filename="100s_500s"
set filter2=".01 .0166"
set filter2_filename="60s_100s"

# A station 
cat > m_plot_figures.m <<ENDOFPLOTTING
R ${station}
XLIM 500 10000
PLOT1
SAVEIMG ${station_filename}

#set time window 1
SSS
TW 2000 4500
QS

#plot 100 to 500 seconds
READ *BHN*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}BHN.pdf

READ *BHE*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}BHE.pdf

READ *BHZ*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}BHZ.pdf


#set time window 2
SSS
TW 2700 3900
QS

#plot 100 to 500 seconds
READ *BHN*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}zoomBHN.pdf

READ *BHE*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}zoomBHE.pdf

READ *BHZ*
BP CORNER ${filter1} NPOLES 4
SSS
PRS
QS
saveimg ${filter1_filename}zoomBHZ.pdf



# plot 60 to 100 sec
READ *BHN*
BP CORNER ${filter2} NPOLES 4
SSS
PRS
QS
saveimg ${filter2_filename}BHN.pdf

READ *BHE*
BP CORNER ${filter2} NPOLES 4
SSS
PRS
QS
saveimg ${filter2_filename}BHE.pdf

READ *BHZ*
BP CORNER ${filter2} NPOLES 4
SSS
PRS
QS
saveimg ${filter2_filename}BHZ.pdf

ED XWINDOWS
EXIT
ENDOFPLOTTING

sac m_plot_figures.m












