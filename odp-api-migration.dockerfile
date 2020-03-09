FROM python:3.6

RUN mkdir -p /srv
RUN cd /srv && git clone https://github.com/SAEONData/ODP-API.git
RUN cd /srv && git clone https://github.com/SAEONData/ODP-API-CKANAdapter.git
RUN cd /srv && git clone https://github.com/SAEONData/ODP-AccountsLib.git

COPY requirements.txt /srv/
RUN pip install -r /srv/requirements.txt

RUN cd /srv/ODP-API && pip install .
RUN cd /srv/ODP-API-CKANAdapter && pip install .
RUN cd /srv/ODP-AccountsLib && pip install .

CMD ["python", "/srv/ODP-API/odpapi/main.py"]
