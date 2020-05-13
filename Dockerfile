FROM python:3.8-slim

COPY requirements.txt /tmp/requirements.txt
RUN set -xe \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone \
    && pip install --no-cache-dir -r /tmp/requirements.txt \
    && rm -f /tmp/requirements.txt

COPY app.py /code/app.py
WORKDIR /code
CMD gunicorn app:app -b :8080 -k gevent --log-level info
