FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-devel
MAINTAINER wenzehua <zehua.w@linkingcloud.cn>

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
RUN pip config set global.index-url https://mirror.sjtu.edu.cn/pypi/web/simple

RUN apt-get update && apt-get install -y vim

COPY ./requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt
RUN pip install flash-attn --no-build-isolation

COPY . /data/app
WORKDIR /data/app

EXPOSE 8000

CMD cd /data/app/admin && sh start.sh
