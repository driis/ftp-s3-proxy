# ftp-s3-proxy
A docker image that will run an FTP and upload all files to AWS S3 (Work-in-progress)
It's general purpose for getting files from upload to FTP onto S3. However, my use case was getting files from my Reolink smart camera onto S3 for storage.

The default FTP_USER is `reolink`. Provide your own password; see below for settings
## Prerequisites for running:
Place a `.env` file in the root providing the following secttings:

```
FTP_PASSWORD=<desired FTP Password>
AWS_SECRET_ACCESS_KEY=<key id for upload to s3>
AWS_ACCESS_KEY_ID=<AWS key secret>
AWS_BUCKET=<name of the AWS bucket to use>
```

## Other concerns
You might want to tweak the FTP settings in `cfg/vsftpd.conf`. 

The FTP server is by default configured to use PASV mode; where the client connects to one of the advertised ports for data.
For this to work, the client need to get the IP address of the FTP server to connect back to - this can differ from the internal IP address because of your network configuration, NAT, and so on. Configure the PASV IP address to match your network in the line:
```
pasv_address=127.0.0.1
``` 