FROM kalilinux/kali
MAINTAINER kev.kirsche@gmail.com

RUN echo "deb http://http.kali.org/kali kali main contrib non-free" > /etc/apt/sources.list && \
echo "deb-src http://http.kali.org/kali kali main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.kali.org/kali-security kali/updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.kali.org/kali-security kali/updates main contrib non-free" >> /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean
RUN apt-get -y install kali-linux-full
RUN apt-get -y install slowhttptest
RUN apt-get -y install erlang

CMD ["/bin/bash"]
