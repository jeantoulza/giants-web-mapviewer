FROM python:3-slim
WORKDIR /usr/app
RUN pip install Cython

RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    apt-get update && apt-get install -y libtiff5-dev libjpeg62-turbo-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev gcc

COPY dpnet /usr/app/dpnet

COPY app /usr/app/app
COPY requirements.txt /usr/app/
RUN pip install -r requirements.txt

COPY entrypoint.sh /usr/app/

RUN mkdir maps

ENTRYPOINT /usr/app/entrypoint.sh