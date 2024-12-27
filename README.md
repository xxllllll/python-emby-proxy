# Emby 反向代理 Docker 版

这是 [python-emby-proxy](https://pypi.org/project/python-emby-proxy/) 的 Docker 镜像。

![Docker Build Status](https://github.com/xxllllll/python-emby-proxy/actions/workflows/docker-build.yml/badge.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/xxllllll/python-emby-proxy)
![Docker Image Version](https://img.shields.io/docker/v/xxllllll/python-emby-proxy/latest)

## 使用方法

### 基本用法

    docker run -d \
      --name emby-proxy \
      -p 8097:8097 \
      xxllllll/python-emby-proxy:latest \
      http://your-emby-server:8096

### Docker Compose 方式

创建 `docker-compose.yml`:

    version: '3'
    services:
      emby-proxy:
        image: xxllllll/python-emby-proxy:latest
        container_name: emby-proxy
        ports:
          - "8097:8097"
        command: http://your-emby-server:8096
        restart: unless-stopped

## 参数说明

- `http://your-emby-server:8096`: Emby 服务器地址，必填
- `-p 8097:8097`: 端口映射，8097为默认端口

## 环境变量

| 环境变量 | 说明 | 默认值 |
|---------|------|--------|
| `PYTHONUNBUFFERED` | Python 输出不缓存 | 1 |
| `PYTHONIOENCODING` | Python 编码 | utf-8 |

## 构建镜像

如果你想自己构建镜像：

    git clone https://github.com/xxllllll/python-emby-proxy.git
    cd python-emby-proxy
    docker build -t python-emby-proxy .

## 注意事项

1. 确保你的 Emby 服务器地址可以被容器访问
2. 代理服务默认运行在 8097 端口
3. 建议使用 Docker Compose 进行部署管理

## 许可证

MIT License

## 相关项目

- [python-emby-proxy](https://github.com/xxllllll/python-emby-proxy) - Python 实现的 Emby 反向代理
