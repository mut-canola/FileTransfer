#!/bin/bash

HELP="Help for File Transfer Script\n
      -u Specify Username for Source and Destination Machine Login\n
      -s Specify Source Machine\n
      -m Specify Destination Machine\n
      -r Specify ROOT_DIR on Source Machine\n
      -f Specify File List path on Source Machine\n
      -d Specify ROOT_DIR on Destination Machine\n
      -h Help Info\n
      Sample Command:\n
      flist_transfer.sh -u tlan -s 10.1.20.72 -m 10.1.20.119 -r /project/users/tlan/ec_ow -f fip/sec/rtl/bld/flist.txt -d /project/users/tlan/sec\n
      Explain: Transfer files specified in tlan@10.1.20.72:/proejct/users/tlan/ec_ow/fip/sec/rtl/bld/flist.txt to tlan@10.1.20.119:/project/users/tlan/sec/\n
      Note: All files are transferred to the same subdirectories. If failed, check if you created the subdirectories on the VM\n"

while getopts u:s:m:r:f:d:h option
do
  case "${option}"
    in
    u) USER=${OPTARG};;
    s) SRC_MACHINE=${OPTARG};;
    m) DST_MACHINE=${OPTARG};;
    r) SRC_ROOT_=${OPTARG};;
    f) FLIST_=${OPTARG};;
    d) DST_ROOT_=${OPTARG};;
    h) echo -e $HELP; exit 1;;
  esac
done

SRC_ROOT="$USER@$SRC_MACHINE:$SRC_ROOT_"
DST_ROOT="$USER@$DST_MACHINE:$DST_ROOT_"
FLIST="$USER@$SRC_MACHINE:$SRC_ROOT_/$FLIST_"
echo "user is $USER"
echo "source machine is $SRC_MACHINE"
echo "destination machine is $DST_MACHINE"
echo "source root dir is $SRC_ROOT"
echo "destination root dir is $DST_ROOT"
echo "file list is $FLIST"

scp $FLIST .
rm -rf script
cat flist.txt | sed 's|'$SRC_ROOT_'\(.*\/\)\(.*\)|scp '$SRC_ROOT'\1\2 . ; scp \2 '$DST_ROOT'\/\1\2 ; rm -rf \2|' > script
chmod +x script
./script
