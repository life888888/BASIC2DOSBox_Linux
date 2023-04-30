#!/bin/bash

# basic2dos on Linux

# Path to BASIC Destination Folder - hard coded to `~/dosbox/BASIC2DOSBoxLinux`
# Install checked BASIC Version
## QBASIC 1.1
## QuickBASIC 4.5
## QuickBASIC Extened 7.1

# Options
## Copy QBASIC Example files - always COPY
## Shut down DOSBox when exiting - always shutdown DOSBOX after exit qbasic
## Run DOSBox in Fullscreen Mode - Not default

export APP_DIR=`pwd`
export APP_TMP_DIR=$(mktemp -d -t BASIC2DOSBoxLinux-XXXXXXXXXX --tmpdir=/tmp)
# HARD CODEED DESTINATION_DIR
export DESTINATION_DIR=~/dosbox/BASIC2DOSBoxLinux
export QBASIC_SRC_URL="https://www.qbasic.net/dl.php?id=SG1QEdEFIArUo&file=qb11_en"
export QUICKBASIC45_SRC_URL="https://www.qbasic.net/dl.php?id=SG1QEdEFIArUo&file=qb45_en"
export QUICKBASIC71_SRC_URL="https://www.qbasic.net/dl.php?id=SG1QEdEFIArUo&file=pds71"
export EXAMPLES_SRC_URL="https://www.qbasic.net/dl.php?id=SG1QEdEFIArUo&file=qb_sample"
export QBASIC_ZIP_FILENAME=qb11.zip
export QUICKBASIC45_ZIP_FILENAME=qb45.zip
export QUICKBASIC71_ZIP_FILENAME=pds71.zip
export EXAMPLES_ZIP_FILENAME=qb-collection.zip
export COPY_EXAMPLES=1

# OPTIONS
export INSTALL_QBASIC=1
export INSTALL_QUICKBASIC45=1
export INSTALL_QUICKBASIC71=1

# CREATE DESTINATION FOLDER
echo ${DESTINATION_DIR}
mkdir -p "${DESTINATION_DIR}"

# CREATE CONFIG FOLDER
mkdir -p "${DESTINATION_DIR}/_config"

# CREATE SHORTCUT_FOLDER
mkdir -p "${DESTINATION_DIR}/_shortcut"

# CREATE FLOPPY_FOLDER
mkdir -p "${DESTINATION_DIR}/_floppy"

# CREATE HDD_FOLDER
mkdir -p "${DESTINATION_DIR}/_hdd"

cd ${APP_TMP_DIR}

if [ $COPY_EXAMPLES -eq 1 ]
then
  echo "COPY EXAMPLES"
  # CREATE EXAMPLES_FOLDER
  mkdir -p "${DESTINATION_DIR}/_source/EXAMPLES"
  
  # DOWNLOAD EXAMPLES  
  wget -O ${EXAMPLES_ZIP_FILENAME} ${EXAMPLES_SRC_URL}
  
  # UNZIP EXAMPLES
  unzip ${EXAMPLES_ZIP_FILENAME}
  
  # MOVE UNZIP TO EXAMPLES_FOLDER
  cp ${APP_TMP_DIR}/qb-collection/*.BAS ${DESTINATION_DIR}/_source/EXAMPLES/
fi 
echo ""

if [ $INSTALL_QBASIC -eq 1 ]
then
  echo "INSTALL QBASIC"
  # DOWNLOAD QBASIC
  wget -O ${QBASIC_ZIP_FILENAME} ${QBASIC_SRC_URL}
  
  # UNZIP QBASIC
  unzip ${QBASIC_ZIP_FILENAME}
  # MOVE QBASIC TO DESTINATION_DIR
  mkdir -p ${DESTINATION_DIR}/qb11
  mv ${APP_TMP_DIR}/QBASIC.EXE ${DESTINATION_DIR}/qb11/
  mv ${APP_TMP_DIR}/QBASIC.HLP ${DESTINATION_DIR}/qb11/
  
  # COPY CONFIG
  cp ${APP_DIR}/_config/qbasic.conf ${DESTINATION_DIR}/_config/
  
  # COPY SHORTCUT
  cp ${APP_DIR}/_shortcut/run-qbasic.sh ${DESTINATION_DIR}/_shortcut/
fi 
echo ""


if [ $INSTALL_QUICKBASIC45 -eq 1 ]
then
  echo "INSTALL QuickBASIC 4.5"
  # DOWNLOAD QuickBASIC 4.5
  wget -O ${QUICKBASIC45_ZIP_FILENAME} ${QUICKBASIC45_SRC_URL}
  
  # UNZIP QuickBASIC 4.5
  unzip ${QUICKBASIC45_ZIP_FILENAME}
  # MOVE QuickBASIC 4.5 TO DESTINATION_DIR
  mkdir -p ${DESTINATION_DIR}/qb45
  mv ${APP_TMP_DIR}/QB45/* ${DESTINATION_DIR}/qb45/
  
  # COPY CONFIG
  cp ${APP_DIR}/_config/qb45.conf ${DESTINATION_DIR}/_config/
  
  # COPY SHORTCUT
  cp ${APP_DIR}/_shortcut/run-qb45.sh ${DESTINATION_DIR}/_shortcut/
fi 
echo ""


if [ $INSTALL_QUICKBASIC71 -eq 1 ]
then
  echo "INSTALL Quick BASIC Extened 7.1"
  # DOWNLOAD Quick BASIC Extened 7.1
  wget -O ${QUICKBASIC71_ZIP_FILENAME} ${QUICKBASIC71_SRC_URL}
  
  # UNZIP Quick BASIC Extened 7.1
  unzip ${QUICKBASIC71_ZIP_FILENAME}
  # MOVE Quick BASIC Extened 7.1 TO DESTINATION_DIR
  mv ${APP_TMP_DIR}/qbx ${DESTINATION_DIR}/
  
  # COPY CONFIG
  cp ${APP_DIR}/_config/qbx.conf ${DESTINATION_DIR}/_config/
  
  # COPY SHORTCUT
  cp ${APP_DIR}/_shortcut/run-qbx.sh ${DESTINATION_DIR}/_shortcut/
fi 
echo ""


