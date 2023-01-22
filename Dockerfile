FROM ubuntu:latest
ENV TZ=Europe/Copenhagen
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install vsftpd -y && apt-get install awscli -y
RUN mkdir /var/log/vsftpd && mkdir -p /var/run/vsftpd/empty
RUN mkdir /app
WORKDIR /app

COPY cfg/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY app/run-vsftp.sh /app/
COPY app/upload.sh /app/
COPY cfg/upload.crontab /etc/cron.d/upload.crontab
RUN crontab /etc/cron.d/upload.crontab

# Run vsftp
CMD ["/app/run-vsftp.sh"]