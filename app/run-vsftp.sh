#! /bin/sh
echo "$FTP_PASSWORD
$FTP_PASSWORD" | adduser --gecos '' --no-create-home  $FTP_USER
mkdir -p /home/$FTP_USER/process
chown $FTP_USER:$FTP_USER /home/$FTP_USER

chmod +x /app/upload.sh
printenv >> /etc/environment
service cron start

echo "AWS Identity is"
aws sts get-caller-identity
echo "Starting FTP Server"
vsftpd /etc/vsftpd/vsftpd.conf