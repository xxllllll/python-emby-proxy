FROM python:3.11-slim

WORKDIR /app

# 安装依赖
RUN pip install python-emby-proxy

# 设置环境变量
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=utf-8

# 暴露端口
EXPOSE 8097

# 设置入口点
ENTRYPOINT ["emby-proxy"]
# 默认参数
CMD ["http://localhost:8096"] 