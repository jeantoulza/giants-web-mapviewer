FROM python:3.9
WORKDIR /usr/app
COPY app /usr/app/app

RUN pip install Cython

COPY requirements.txt /usr/app/
RUN pip install -r requirements.txt

COPY dpnet /usr/app/dpnet
RUN pip install -r dpnet/requirements.txt

COPY entrypoint.sh /usr/app/

RUN mkdir maps

ENTRYPOINT /usr/app/entrypoint.sh