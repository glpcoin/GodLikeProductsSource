FROM debian:stretch
LABEL maintainer="GodLikeProducts Developers <dev@godlikeproducts.org>"
LABEL description="Dockerised GodLikeProductsCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
