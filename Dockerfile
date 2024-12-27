FROM python:3.12-slim

WORKDIR /app

# 安装编译工具和依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    && pip install python-emby-proxy \
    && apt-get remove -y gcc python3-dev \
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
