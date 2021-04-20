FROM python:3.9
WORKDIR /usr/app
COPY app /usr/app/
COPY dpnet /usr/app/

RUN pip install Cython
RUN pip install -r requirements.txt

ENTRYPOINT /usr/app/entrypoint.sh