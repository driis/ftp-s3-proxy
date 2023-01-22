#! /bin/sh
echo "$FTP_PASSWORD
$FTP_PASSWORD" | adduser --gecos '' --no-create-home  $FTP_USER
chown $FTP_USER:$FTP_USER /home/$FTP_USER
service cron start
echo "AWS Identity is"
aws sts get-caller-identity
echo "Starting FTP Server"
vsftpd /etc/vsftpd/vsftpd.conf