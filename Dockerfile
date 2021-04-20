FROM python:3.9
WORKDIR /usr/app
COPY app /usr/app/app
COPY dpnet /usr/app/dpnet
COPY requirements.txt /usr/app/
COPY entrypoint.sh /usr/app/

RUN pip install Cython
RUN pip install -r requirements.txt
RUN pip install -r dpnet/requirements.txt

RUN mkdir maps

ENTRYPOINT /usr/app/entrypoint.sh