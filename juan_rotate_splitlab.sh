#!/bin/csh
# This shell script will create macros to rotate to 0 and/or great circle path. 
# call with > csh [scriptname].sh
# requires SAC in path
# requires polezero files from iris
# notes: sac must be called with lowercase sac in tcsh script. don't ask why
# DO NOT RUN THIS SCRIPT MORE THAN ONCE OR FILES WILL BE DAMAGED. 

# A remove insturment responses, requires polezero or resp file
# B rotate misoriented files BH1 BH2
# C rotate to great circle path
# D cleanup

# A Create remove instrument response macro and run
#echo "READ *BH*" > m_response.m
#echo "RMEAN" >> m_response.m
#echo "RTREND" >> m_response.m
#echo "TAPER" >> m_response.m
#echo "Transfer from polezero subtype pole_zero_magic.txt TO NONE freqlimits 0.001 0.002 40 50" >> #m_response.m
#echo "WRITE OVER" >> m_response.m
#echo "EXIT" >> m_response.m

#sac m_response.m

# B rotate to 0 if there are misoriented files
ls *BH1* | awk '{print substr($1,1,29)}' > list_misoriented.txt
echo " " > orientFix.m
foreach i (`cat list_misoriented.txt`)
echo "R " ${i}"1" ${i}"2" >> orientFix.m
echo "ROTATE TO 0" >> m_orientFix.m
echo "W " ${i}"N" ${i}"E" >> orientFix.m
echo "    " >> orientFix.m
end

echo "EXIT" >> orientFix.m
#sac orientFix.m

# C rotate files to great circle path GCP
#ls *BHN* | awk '{print substr($1,1,22)}' > list_gcarc.txt
#echo " " > m_gcarc.m
#foreach i (`cat list_gcarc.txt`)
#echo "R " $i"N.SAC" $i"E.SAC" >> m_gcarc.m
#echo "ROTATE TO GCP" >> m_gcarc.m
#echo "W " $i"R.SAC" $i"T.SAC" >> m_gcarc.m
#echo "    " >> m_gcarc.m
#end

#echo "EXIT" >> m_gcarc.m
#sac m_gcarc.m

# D cleanup
#mkdir 01_figures
mkdir 02_macros
mkdir 03_cleanup
mv *BH1* *BH2* 03_cleanup
#mv *BHN* *BHE* 03_cleanup
#mv *.pdf* 01_figures
mv *.m* *.txt* 02_macros









