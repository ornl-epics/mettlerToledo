# mettlerToledo
EPICS support for Mettler Toledo scales using the MT-SICS command set.

This support module uses streamDevice. It supports several of the level 0 and level 1 commands from the MT-SICS command set. This means it should work across a range of scales from Mettler Toledo. 

The supported commands are:

S - read weight (if stable)  
T - set tare weight (if stable)  
Z - perform a zero (if stable)  

SI - read weight immediately  
TI - set tare weight immediately  
ZI - perform zero immediately  

TA - query the tare weight  
TAC - clear the tare weight  

@ - reset  
T2, T3, T4, T5 - read various scale information

This software was tested on a Mettler Toledo New Classic MF ML4002E. 


