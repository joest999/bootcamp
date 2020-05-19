#!/bin/bash 
 
mv /var/backups/home.tar.gz /var/backups/home.last.tar.gz 
tar czvf /var/backups/home.tar.gz /home/sysadmin 
ls -lh /var/backups > /var/backups/file_report.txt 
free -h > /var/backups/memory_report.txt