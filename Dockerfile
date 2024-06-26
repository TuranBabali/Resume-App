FROM python:3.10-slim


RUN apt update

RUN apt install python3-dev build-essential -y

# set enviroment variables

ENV PYTHONDONTWRITEBYTECODE 1
ENV VIRTUAL_ENV=/opt/venv


# pip requirements

RUN pip install --upgrade pip

RUN pip install virtualenv && python -m virtualenv $/opt/venv

ENV PATH="$/ opt/venv/bin:$PATH"

ADD requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt

COPY . /srv/app
WORKDIR /srv/app




