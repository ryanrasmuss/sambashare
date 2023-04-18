FROM ubuntu:22.10

# Build via
# docker build -t sambashare
#
# docker run -p 139:139 -p 445:445 -p 137:137/udp -p 138:138/udp -v $(``pwd``)/sambashare:/home/user/sambashare -d sambashare

RUN apt-get update && apt-get install -y \
    vim \
    unzip \
    net-tools \
    sudo \
    tcpdump \
    samba

WORKDIR /home/user
ENV HOME /home/user

RUN mkdir /home/user/sambashare/

COPY samba.config /etc/samba/smb.conf
COPY run.sh /home/user/run.sh

#RUN service smbd enable

EXPOSE 137 138 139 445

CMD ["bash", "run.sh"]
