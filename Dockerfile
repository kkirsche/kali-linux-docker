FROM kalilinux/kali
MAINTAINER kev.kirsche@gmail.com

RUN echo "deb http://http.kali.org/kali kali main contrib non-free" > /etc/apt/sources.list && \
echo "deb-src http://http.kali.org/kali kali main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.kali.org/kali-security kali/updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.kali.org/kali-security kali/updates main contrib non-free" >> /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean
RUN apt-get -y install kali-linux-full
RUN apt-get -y install kali-linux-voip
RUN apt-get -y install slowhttptest
RUN apt-get -y install erlang
RUN apt-get -y install mz
RUN git clone https://github.com/cheetz/icmpshock.git /opt/icmpshock
RUN wget https://raw.githubusercontent.com/kkirsche/install-BoNeSi/master/install.sh
RUN chmod -x ./install.sh
RUN sh ./install.sh
RUN rm ./install.sh

CMD ["/bin/bash"]
