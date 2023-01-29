#! /bin/sh
echo "$(date) I was here" 
cd /home/$FTP_USER
mv *.* process
for file in process/*.*; do
    aws s3 mv $file s3://driis-surveillance/
done