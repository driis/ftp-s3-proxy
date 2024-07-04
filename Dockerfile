FROM ubuntu:latest
ENV TZ=Europe/Copenhagen
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Dependencies
RUN apt-get update && apt-get install curl unzip -y 

# VSFTPD
RUN apt-get install vsftpd -y 
RUN mkdir /var/log/vsftpd && mkdir -p /var/run/vsftpd/empty
COPY cfg/vsftpd.conf /etc/vsftpd/vsftpd.conf

# AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

# Setup / config 
RUN mkdir /app
WORKDIR /app
COPY app/run-vsftp.sh /app/
COPY app/upload.sh /app/
COPY cfg/upload.crontab /etc/cron.d/upload.crontab
RUN crontab /etc/cron.d/upload.crontab

# Run vsftp
CMD ["/app/run-vsftp.sh"]