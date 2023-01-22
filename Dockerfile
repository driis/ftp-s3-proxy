FROM ubuntu:latest
RUN echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
RUN apt-get update && apt-get install vsftpd -y
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