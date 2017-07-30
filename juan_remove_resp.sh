#!/bin/csh
# This shell script will create macros to rotate to 0 and/or great circle path. 
# call with > csh [scriptname].sh
# requires SAC in path
# requires polezero files from iris
# notes: sac must be called with lowercase sac in tcsh script. don't ask why
# DO NOT RUN THIS SCRIPT MORE THAN ONCE OR FILES WILL BE DAMAGED. 

# A remove insturment responses, requires polezero or resp file

echo "READ *BH*" > m_response.m
echo "RMEAN" >> m_response.m
#echo "RTREND" >> m_response.m
echo "TAPER" >> m_response.m
echo "Transfer from polezero subtype pole_zero_magic.txt TO NONE freqlimits 0.001 0.002 40 50" >> m_response.m
echo "WRITE OVER" >> m_response.m
echo "EXIT" >> m_response.m

sac m_response.m