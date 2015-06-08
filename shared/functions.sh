system_functions=/etc/rc.d/init.d/functions
if [ -f $system_functions ]
then
  source $system_functions
fi

PACKER_VERSION=0.7.5
cd $(dirname $0)/../shared &>/dev/null
PACKER_DIR=$(pwd)/packer_bin
cd - &>/dev/null
PACKER=$PACKER_DIR/packer

if [ "$(uname -s)" = Linux ]
then
  PACKER_DL=https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip
else
  PACKER_DL=https://dl.bintray.com/mitchellh/packer/packer_0.7.5_darwin_amd64.zip
fi

# the SETCOLOR vars will just have no effect should the import above fail
errmsg(){
  $SETCOLOR_FAILURE
  echo -e "[$(date)] ERROR: ${1}"
  $SETCOLOR_NORMAL
}

inf(){
  $SETCOLOR_WARNING
  echo -e "[$(date)] ${1}"
  $SETCOLOR_NORMAL
}

err(){
  errmsg "$1"
  exit 1
}

httpget() {
  [ "$1" = "" ] && err "Need a source url"
  [ "$2" = "" ] && err "Need a target file path"
  [ ! -d $(dirname $2) ] && err "target directory $(dirname $2) does not exist"
  inf "Download $1"
  curl -L -o $2 $1 --silent
  inf "$(stat --printf  "%s %n\n"  $2)"
}

webdav_push() {
  [ "$1" = "" ] && err "Need a source file"
  [ "$2" = "" ] && err "Need a target target URL"
  inf "WebDAV Push $1 to $2"
  curl -T $1 $2
  curl --head $2 2>&1
}

getpacker(){
  if [ ! -x $PACKER ]
  then
    zip=$PACKER_DIR/packer.zip
    mkdir -p $PACKER_DIR
    httpget $PACKER_DL $zip
    cd $PACKER_DIR && unzip $(basename $zip) && rm -vf $zip
    cd -
  else
    inf "Found $($PACKER version)"
  fi
}
