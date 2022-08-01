FROM ubuntu:22.10

RUN mkdir -p /input
RUN mkdir -p /output
RUN apt-get -q update && apt-get -q -y install rsync

WORKDIR /app

COPY . .

CMD ["/bin/bash", "./src/run.sh"]
