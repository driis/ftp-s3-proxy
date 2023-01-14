FROM ubuntu:latest

RUN apt-get update && apt-get install vsftpd -y
RUN mkdir /var/log/vsftpd && mkdir -p /var/run/vsftpd/empty

#RUN touch /var/log/vsftpd/xferlog.log
#RUN touch /var/log/vsftpd/vsftpd.log
COPY cfg/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN mkdir /app
WORKDIR /app
COPY app/run-vsftp.sh /app/
CMD ["/app/run-vsftp.sh"]