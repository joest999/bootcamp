#!/bin/bash 
 
#Prints the amount of free memory and saves it to specified directory 
free -h > ~/backups/freemem/free_mem.txt 
 
#Prints disk usage and saves it 
du > ~/backups/diskuse/disk_usage.txt 
 
#Lists all open files and save it 
lsof > ~/backups/openlist/openlist.txt 
 
#Prints file system disk space statistics in human readable format and saves it 
df -h > ~/backups/freedisk/freedisk.txt 
 
#Commmand used to create multiple directories at once 
mkdir ~/backups/{diskuse,freedisk,freemem,openlist} 