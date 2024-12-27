# 构建阶段
FROM python:3.12-slim as builder

WORKDIR /build

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    && pip install --no-cache-dir \
    wheel \
    setuptools \
    && pip wheel --no-cache-dir --wheel-dir=/build/wheels python-emby-proxy

# 运行阶段
FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /build/wheels /wheels

RUN pip install --no-cache-dir --no-index --find-links=/wheels python-emby-proxy \
    && rm -rf /wheels

# 设置环境变量
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=utf-8

# 暴露端口
EXPOSE 8097

# 设置入口点
ENTRYPOINT ["emby-proxy"]
# 默认参数
CMD ["http://localhost:8096"] 
