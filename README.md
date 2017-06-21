# FileTransfer
File Transfer Script

$ ./flist_transfer.sh -h
Help for File Transfer Script
 -u Specify Username for Source and Destination Machine Login
 -s Specify Source Machine
 -m Specify Destination Machine
 -r Specify ROOT_DIR on Source Machine
 -f Specify File List path on Source Machine
 -d Specify ROOT_DIR on Destination Machine
 -h Help Info
 Sample Command:
 flist_transfer.sh -u tlan -s 10.1.20.01 -m 10.1.20.02 -r /project/src -f bld/flist.txt -d /project/dst
 Explain: Transfer files specified in tlan@10.1.20.01:/proejct/src/bld/flist.txt to tlan@10.1.20.02:/project/dst/
 Note: All files are transferred to the same subdirectories. If failed, check if you created the subdirectories on the Destination Machine
