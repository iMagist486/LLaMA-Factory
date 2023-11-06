FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-devel
MAINTAINER wenzehua <zehua.w@linkingcloud.cn>

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
RUN pip config set global.index-url https://mirror.sjtu.edu.cn/pypi/web/simple

RUN apt-get update && apt-get install -y vim

COPY ./requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

COPY . /data/app
WORKDIR /data/app

EXPOSE 8000

CMD cd /data/app/admin && sh start.sh

# docker build -f Dockerfile -t imagist486.cn:48602/lk/trainer:v1.0 .
# docker run --gpus "device=0" -p 48650:8000 -v /data/data/:/data/data/ -v /data/model_file/:/data/model_file/ --name trainer -itd imagist486.cn:48602/lk/trainer:v1.0
