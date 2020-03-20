FROM python:3.6

ARG CHECKOUT_BRANCH

WORKDIR /srv

RUN git clone -b ${CHECKOUT_BRANCH} https://github.com/SAEONData/ODP-API.git
RUN git clone -b ${CHECKOUT_BRANCH} https://github.com/SAEONData/ODP-API-CKANAdapter.git
RUN git clone -b ${CHECKOUT_BRANCH} https://github.com/SAEONData/ODP-API-ElasticAdapter.git
RUN git clone https://github.com/SAEONData/ODP-AccountsLib.git

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN cd ODP-API && pip install .
RUN cd ODP-API-CKANAdapter && pip install .
RUN cd ODP-API-ElasticAdapter && pip install .
RUN cd ODP-AccountsLib && pip install .

CMD ["python", "ODP-API/odpapi/main.py"]
