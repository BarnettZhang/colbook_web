FROM python:3.8-slim-buster

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt
RUN apt update && apt install -y cmake g++ wget unzip
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/4.x.zip
RUN unzip opencv.zip
RUN mkdir -p build

WORKDIR /app/build
RUN cmake ../opencv-4.x
RUN cmake --build .
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libopencv-dev

WORKDIR /app/app/algorithms/ETFCLD/
RUN ls
RUN ./build.sh -j 10

WORKDIR /app
CMD flask run -p $PORT --host\=0.0.0.0