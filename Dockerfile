FROM ubuntu:14.04

MAINTAINER Juan Medina <jamedina@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install python-pip python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose python-sklearn python-nltk

copy cfg /etc/cfg

RUN pip install -r /etc/cfg/python-deps.txt
RUN python -m textblob.download_corpora

ENV FLASK_PORT 8080

EXPOSE $FLASK_PORT

copy python-app /var/python-app

CMD ["/usr/bin/python","/var/python-app/flask-web.py"]
