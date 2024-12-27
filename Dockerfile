# syntax=docker/dockerfile:1.4
FROM python:3.12-slim

WORKDIR /app

# 复制依赖文件
COPY requirements.txt .

# 安装编译工具和依赖
RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    python3-setuptools \
    python3-pip \
    python3-wheel \
    build-essential \
    && pip install --upgrade pip \
    && pip install -r requirements.txt \
    && apt-get remove -y \
    gcc \
    python3-dev \
    build-essential \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置环境变量
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=utf-8

# 暴露端口
EXPOSE 8097

# 设置入口点
ENTRYPOINT ["emby-proxy"]
# 默认参数
CMD ["http://localhost:8096"] 
