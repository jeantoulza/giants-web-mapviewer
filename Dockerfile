FROM python:3.9
WORKDIR /usr/app
COPY * /usr/app/

RUN pip install Cython
RUN pip install -r requirements.txt

ENTRYPOINT entrypoint.sh