FROM python:3-slim
WORKDIR /usr/app
RUN pip install Cython

COPY dpnet /usr/app/dpnet
RUN pip install -r dpnet/requirements.txt

COPY app /usr/app/app
COPY requirements.txt /usr/app/
RUN pip install -r requirements.txt

COPY entrypoint.sh /usr/app/

RUN mkdir maps

ENTRYPOINT /usr/app/entrypoint.sh