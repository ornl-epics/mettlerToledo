TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Build the IOC application
PROD_IOC = example

# example.dbd will be created and installed
DBD += example.dbd

# example.dbd will include these files:
example_DBD += base.dbd

# example_registerRecordDeviceDriver.cpp derives from example.dbd
example_SRCS += example_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
example_SRCS_DEFAULT += exampleMain.cpp
example_SRCS_vxWorks += -nil-

# Link in the code from our support library
#example_LIBS += exampleSupport

# Finally link IOC to the EPICS Base libraries
example_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

