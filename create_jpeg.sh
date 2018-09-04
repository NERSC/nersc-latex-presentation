#!/bin/bash

#
#   This script converts images to JPEG, resulting in smaller LaTeX PDFs
#

set -e

echo "${BASH_SOURCE[0]}"
if [ -z "$(which convert)" ]; then
    echo "${BASH_SOURCE[0]} requires convert program"
    echo "convert program is a member of the ImageMagick suite of tools"
    exit 1
fi

# default settings (env will override)
: ${SOURCE_DIR:=images}
: ${TARGET_DIR:=images}
: ${FORMATS:="png tif tiff"}
: ${OPTIONS:="-fill white -flatten -trim"}

# command line options (will override env or defaults)
if [ -n "${1}" ]; then SOURCE_DIR=${1}; fi
if [ -n "${2}" ]; then TARGET_DIR=${2}; fi
if [ -n "${3}" ]; then FORMATS=${3}; fi
if [ -n "${4}" ]; then OPTIONS=${4}; fi

# create target directory if not exist
if [ ! -d ${TARGET_DIR} ]; then
    mkdir -p ${TARGET_DIR}
fi

for j in ${FORMATS}
do
    for i in $(find ${SOURCE_DIR} -type f | egrep "\.${j}$")
    do
        NAME=$(basename ${i})
        INPUT=${i}
        OUTPUT=${TARGET_DIR}/$(echo ${NAME} | sed "s/\.${j}/.jpg/g")
        echo "--> Converting \"${INPUT}\" to \"${OUTPUT}\"..."
        convert ${OPTIONS} ${INPUT} ${OUTPUT}
        #rm ${i}
    done
done

