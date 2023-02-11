#! /bin/sh
cd /home/$FTP_USER
aws s3 sync . s3://$AWS_BUCKET | grep -Eo "upload: (.*) " | cut -d" " -f2 | while read -r file ; do 
    rm "$file"
    echo "Uploaded $file"
done