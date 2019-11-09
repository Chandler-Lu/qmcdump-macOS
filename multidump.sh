#!/bin/bash

# IFS（the Internal Field Separator）
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# Change Directory to the Path of the Script
cd $(cd "$(dirname "$0")";pwd)

# Work Path
echo Please input folder path:
read 'WORK_PATH'

# Decode Core
Exec_QMC_FILE='./qmcdump'

function RecursionDecode()
{
  for file in `ls $1`
  do
    if [ -d $1/$file ]; then
      RecursionDecode $1/$file
    elif [ "${file##*.}" = "qmc0" ]; then
      $Exec_QMC_FILE $1/$file
    elif [ "${file##*.}" = "qmc3" ]; then
      $Exec_QMC_FILE $1/$file
    elif [ "${file##*.}" = "qmcflac" ]; then
      $Exec_QMC_FILE $1/$file
    fi
  done
}

RecursionDecode $WORK_PATH