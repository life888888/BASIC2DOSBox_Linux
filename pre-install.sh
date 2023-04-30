#!/bin/bash

# CHECK if wget and dosbox is existing ?
# if not existing , install it.

# PREPARE
# CHECK INSTALL COMMAND IS YUM OR APT
export USE_YUM=0
export USE_APT=0
export HAVE_WGET=0
export HAVE_DOSBOX=0



if [ -n "$(command -v yum)" ]
then
   export USE_YUM=1
fi 
echo ""
echo "USE_YUM= ${USE_YUM}"


if [ -n "$(command -v apt)" ]
then
   export USE_APT=1
fi 
echo ""
echo "USE_APT= ${USE_APT}"


if [ -n "$(command -v wget)" ]
then
   export HAVE_WGET=1
fi 
echo ""
echo "HAVE_WGET= ${HAVE_WGET}"

if [ -n "$(command -v dosbox)" ]
then
   export HAVE_DOSBOX=1
fi 
echo ""
echo "HAVE_DOSBOX= ${HAVE_DOSBOX}"

if [ $HAVE_WGET -eq 0 ]
then
   # INSTALL WGET
   echo "INSTALL WGET"
   if [ $USE_YUM -eq 1 ]
   then

       sudo yum update -y
       sudo yum install -y wget
   fi
   echo ""
   if [ $USE_APT -eq 1 ]
   then
       sudo apt update -y
       sudo apt install -y wget
   fi
   echo ""
fi
echo ""


if [ $HAVE_DOSBOX -eq 0 ]
then
   # INSTALL DOSBOX
   echo "INSTALL DOSBOX"   
   if [ $USE_YUM -eq 1 ]
   then
       sudo yum update -y
       sudo yum install -y dosbox
   fi
   echo ""
   if [ $USE_APT -eq 1 ]
   then
       sudo apt update -y
       sudo apt install -y dosbox
   fi
   echo ""
fi
echo ""


