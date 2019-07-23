FROM python:3.6

RUN apt-get update && apt-get install -y git

RUN mkdir -p /srv
RUN cd /srv && git clone https://github.com/SAEONData/ODP-API.git
RUN cd /srv && git clone https://github.com/SAEONData/ODP-API-CKANAdapter.git
RUN cd /srv/ODP-API && pip3 install -e . && pip3 install -r requirements.txt
RUN cd /srv/ODP-API-CKANAdapter && pip3 install -e . && pip3 install -r requirements.txt

COPY config.yml /srv/ODP-API

CMD ["python3", "/srv/ODP-API/odpapi/main.py"]
