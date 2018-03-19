
FROM ubuntu:17.10 as builder

RUN apt update && apt install -y git maven && apt install apt-utils
#RUN apt update && apt install -y wget unzip
WORKDIR /
#RUN mkdir /gama && cd /gama && wget https://github.com/gama-platform/gama/archive/master.zip
#RUN cd /gama && unzip master.zip
RUN git clone https://github.com/gama-platform/gama.git

FROM ubuntu:17.10

RUN apt update && apt install -y openjdk-8-jdk

#FROM java:openjdk-8-alpine

#RUN wget 
RUN cd gama && bash -x build.sh

COPY --from=builder /gama/ummisco.gama.product/target/products/ummisco.gama.application.product/linux/gtk/x86_64 /gama

WORKDIR /gama
CMD ./Gama


