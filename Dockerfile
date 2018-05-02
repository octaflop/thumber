FROM pypy:3-6
#FROM python:3.6.2-slim

MAINTAINER Faris Chebib "faris@theluckybead.com"

# Correction for an issue with the image: https://github.com/docker-library/pypy/issues/21
RUN if command -v pypy3; then ln -s $(command -v pypy3) /usr/local/bin/python; fi
ADD . /app
WORKDIR /app

RUN pip install -r requirements.txt

WORKDIR /app/thumber
ENTRYPOINT ["python"]
CMD ["app.py"]

