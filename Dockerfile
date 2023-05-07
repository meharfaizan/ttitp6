FROM python:3.9.2-slim-buster
RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
RUN git clone https://github.com/XniceCraft/ffmpeg-colab --depth 1
RUN chmod +x ./ffmpeg-colab/install
RUN ./ffmpeg-colab/install
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev mediainfo
RUN apt-get install neofetch wget -y -f
COPY . .
RUN pip3 install -r requirements.txt
CMD ["bash","run.sh"]
