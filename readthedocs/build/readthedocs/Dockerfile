# A build container doesn't work here because the rtd container needs git
FROM registry.hub.docker.com/library/ubuntu:18.04
#COPY --from=build /build/readthedocs.org/ /app/readthedocs/
RUN apt-get -y update && apt-get --no-install-recommends -y install \
  build-essential \
  python-dev \
  python-pip \
  python \
  python-setuptools \
  libxml2-dev \
  libxslt1-dev \
  zlib1g-dev \
  virtualenv \
  git \
&& apt-get clean && rm -rf /var/lib/apt/lists/*
RUN git clone --progress https://github.com/rtfd/readthedocs.org.git /app/readthedocs
WORKDIR /app/readthedocs
COPY entrypoint.sh /app/readthedocs/entrypoint.sh
RUN virtualenv venv && . "venv/bin/activate" && pip install -r requirements.txt
# createsuperuser doesn't set a password
# https://stackoverflow.com/questions/6358030/how-to-reset-django-admin-password

# How do I clean up the apt-cache afterwards?
# Settings at readthedocs.settings.dev
EXPOSE 8000/tcp
# https://code.djangoproject.com/ticket/24433

ENTRYPOINT ["./entrypoint.sh"]
# script should generate if there does not exist a database/etc to do work from
