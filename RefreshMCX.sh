#!/bin/bash

# Script to flush and refresh MCX on a Casper Mac
# Based on work found at jamfnation.jamfsoftware.com/discussion.html?id=5171

# Implemented : contact@richard-purves.com
# Version 1.0 : Initial Version
# Version 1.1 : Now kills the cfprefsd process to make sure there's no preference caching going on
# 				https://developer.apple.com/library/mac/#releasenotes/CoreFoundation/CoreFoundation.html
# Version 1.2 : Now removes MCX info from the local database to make sure.

killall cfprefsd
rm -Rfd /Library/Managed\ Preferences
dscl . -mcxdelete /Computers/localhost
dscl . -mcxdelete /Users/$3

jamf manage
jamf mcx

exit 0
