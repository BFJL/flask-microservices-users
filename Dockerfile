FROM python:3.6.4
ARG PYPI_SOURCE=https://pypi.tuna.tsinghua.edu.cn/simple
ARG PYPI_SOURCE_HOST=pypi.tuna.tsinghua.edu.cn
# 设置工作目录
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# 添加依赖（利用Docker 的缓存）
ADD ./requirements.txt /usr/src/app/requirements.txt

# 安装依赖
RUN pip install -U -i ${PYPI_SOURCE} --trusted-host ${PYPI_SOURCE_HOST} -r requirements.txt

# 添加应用
ADD . /usr/src/app

# 运行服务
CMD python manage.py runserver -h 0.0.0.0