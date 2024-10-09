#!/bin/bash

# The MIT License (MIT)
# 
# Copyright (c) 2016 Gavin Stewart
#
#  Permission is hereby granted, free of charge, to any person obtaining a 
#  copy of this software and associated documentation files (the "Software"), 
#  to deal in the Software without restriction, including without limitation 
#  the rights to use, copy, modify, merge, publish, distribute, sublicense, 
#  and/or sell copies of the Software, and to permit persons to whom the 
#  Software is furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in 
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
#  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
#  DEALINGS IN THE SOFTWARE.

PROFILE=""
MATE_PROFILES_PATH="/org/mate/terminal/profiles"

# Load zenburn colours.
RELDIR=`dirname "$0"`
cd "$RELDIR"
if [[ ! -r ./zenburn_colours ]]; then
    echo "!! Can't find zenburn_colours"
    exit 1
fi

#
# script usage.
#
usage () {
    echo ""
    echo "Usage: ${ARGV0} [-h|--help] <profile>"
    echo "  -h          : This help."
    echo "  profile     : Existing profile as found in dconf-editor"
    echo "                org/mate/terminal/profiles"
    echo "                e.g. default, profile0, profile1, etc."
    echo ""
}

#
# Parse command line arguments.
#
while [ $# -ge 1 ]; do
    case "$1" in
    -h|--help)
        usage
        exit
        ;;
    *)
        PROFILE=$1
        ;;
    esac
    shift
done
if [ "X${PROFILE}" == "X" ]; then
    usage
    exit 2
fi

#
# Main
#

echo ""
echo " + Applying zenburn theme to mate-terminal profile: \"$PROFILE\""
echo ""
echo " * WARNING: Use dconf-editor to ensure that \"$PROFILE\" actually exists"
echo " *          under /org/mate/terminal/profiles"
echo " *          If not, create a new target profile in mate-terminal first."
echo ""
echo " + Press <Enter> to continue or <Ctrl-C> to break."
read book

dconf load "${MATE_PROFILES_PATH}/${PROFILE}/" < zenburn_colours

echo " + Log out or close all mate-terminal sessions to see changes."
