FROM python:3.6

RUN apt-get update && apt-get install -y git

RUN mkdir -p /srv
RUN cd /srv && git clone https://github.com/SAEONData/ODP-API.git
RUN cd /srv && git clone https://github.com/SAEONData/ODP-API-CKANAdapter.git
RUN cd /srv && git clone https://github.com/SAEONData/Hydra-Admin-Client.git

COPY requirements.txt /srv/
RUN pip3 install -r /srv/requirements.txt

RUN cd /srv/ODP-API && pip3 install .
RUN cd /srv/ODP-API-CKANAdapter && pip3 install .
RUN cd /srv/Hydra-Admin-Client && pip3 install .

CMD ["python3", "/srv/ODP-API/odp/main.py"]
