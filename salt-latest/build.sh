#!/bin/bash

source ../shared/functions.sh
getpacker
export PROJECT=${1:-$(basename $(pwd))}

inf "Removing existing VMs"
vboxmanage controlvm ${PROJECT} poweroff 2>/dev/null || :
vboxmanage unregistervm ${PROJECT} --delete 2>/dev/null || :

[ -d output-virtualbox-iso ] && rm -rf output-virtualbox-iso

inf "Start $PROJECT build"
$PACKER build $(basename $(pwd)).json

