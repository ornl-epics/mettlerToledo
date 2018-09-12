#!../../bin/linux-x86_64/example

## You may have to change example to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

#Define protocol path
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(METTLERTOLEDO)/protocol/")

## Register all support components
dbLoadDatabase "dbd/example.dbd"
example_registerRecordDeviceDriver pdbbase

##########################################################
# Connect to the scale

drvAsynIPPortConfigure("MT1","192.168.200.177:4001",0,0,0)

asynSetTraceIOMask("MT1",0,0xFF)
asynSetTraceMask("MT1",0,0xFF)

##########################################################

## Load record instances
dbLoadRecords "db/example.db"

##########################################################
# autosave

epicsEnvSet("IOCNAME","mettlerToledoExample")
epicsEnvSet("SAVE_DIR","/home/controls/var/$(IOCNAME)")

save_restoreSet_Debug(0)

### status-PV prefix, so save_restore can find its status PV's.
save_restoreSet_status_prefix("mkp:CS:Scale")

set_requestfile_path("$(SAVE_DIR)")
set_savefile_path("$(SAVE_DIR)")

save_restoreSet_NumSeqFiles(3)
save_restoreSet_SeqPeriodInSeconds(600)
set_pass0_restoreFile("$(IOCNAME).sav")
set_pass0_restoreFile("$(IOCNAME)_pass0.sav")
set_pass1_restoreFile("$(IOCNAME).sav")

##########################################################

cd "${TOP}/iocBoot/${IOC}"
iocInit

# Create request file and start periodic 'save'
epicsThreadSleep(5)
makeAutosaveFileFromDbInfo("$(SAVE_DIR)/$(IOCNAME).req", "autosaveFields")
makeAutosaveFileFromDbInfo("$(SAVE_DIR)/$(IOCNAME)_pass0.req", "autosaveFields_pass0")
create_monitor_set("$(IOCNAME).req", 5)
create_monitor_set("$(IOCNAME)_pass0.req", 30)

