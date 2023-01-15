FROM ubuntu:latest

RUN apt-get update && apt-get install vsftpd -y
RUN mkdir /var/log/vsftpd && mkdir -p /var/run/vsftpd/empty
COPY cfg/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN mkdir /app
WORKDIR /app
COPY app/run-vsftp.sh /app/
CMD ["/app/run-vsftp.sh"]