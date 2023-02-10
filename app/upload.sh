#! /bin/sh
cd /home/$FTP_USER
aws s3 sync . s3://driis-surveillance
# After sync, delete local so we don't fill up local storage
rm -r *.*