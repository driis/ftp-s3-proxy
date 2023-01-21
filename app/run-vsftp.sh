#! /bin/sh
echo "$FTP_PASSWORD
$FTP_PASSWORD" | adduser --gecos '' --no-create-home  $FTP_USER
chown $FTP_USER:$FTP_USER /home/$FTP_USER
service cron start
echo "Starting FTP Server"
vsftpd /etc/vsftpd/vsftpd.conf