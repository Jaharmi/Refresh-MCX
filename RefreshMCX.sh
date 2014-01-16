#!/bin/bash

# Script to flush and refresh MCX on a Casper Mac
# Based on work found at jamfnation.jamfsoftware.com/discussion.html?id=5171

# Implemented : r.purves@arts.ac.uk
# Version 1.0 : Initial Version

rm -R /Library/Managed\ Preferences/*
dscl . -delete /Computers
dscl . -list Computers | grep -v "^localhost$" | while read computer_name ; do sudo dscl . -delete Computers/"$computer_name" ; done
jamf manage
jamf mcx

exit 0
