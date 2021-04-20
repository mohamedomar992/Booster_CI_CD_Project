FROM ubuntu

WORKDIR /app
COPY  . manage.py /app/
COPY  ./simpleApp/ * /app/simpleApp/

RUN apt-get update \
    && apt-get install -y software-properties-common curl \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get remove -y software-properties-common \
    && apt autoremove -y \
    && apt-get update \
    && apt-get install -y python3.6 \
    && curl -o /tmp/get-pip.py "https://bootstrap.pypa.io/get-pip.py" \
    && python3.6 /tmp/get-pip.py \
    && apt-get remove -y curl \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

EXPOSE 8000

RUN python3.6 manage.py makemigrations &&\
	python3.6 manage.py migrate
CMD ["./runserver.sh"]