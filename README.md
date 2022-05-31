# 📦 docker webapp

A Simple web running env.

[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/nekoimi/webapp/latest)](https://hub.docker.com/r/nekoimi/webapp)
[![Docker Pulls](https://img.shields.io/docker/pulls/nekoimi/webapp)](https://hub.docker.com/r/nekoimi/webapp)

### contents

- 📥 [Download](#-download)

- 🛠️ [Usage](#-usage)

- 📄 [License](#-license)

# 📥 Download

### Docker Image

- [DockerHub](https://hub.docker.com/r/nekoimi/webapp)

```bash
docker pull nekoimi/webapp:latest
```

<br>

# 🛠️ Usage

### Example setup

Example [repo](https://github.com/kkdocks/docker-webapp.git)

```bash
git clone https://github.com/kkdocks/docker-webapp.git
```

```base
docker-compose up -d
```

The browser opens the default access link to [http://127.0.0.1](http://127.0.0.1) view the application of environment variables.

<br>

### Using Docker Image

### docker-compose

```bash
version: "3"
services:
  webapp:
    image: nekoimi/webapp:latest
    ports:
      - 80:80
    environment:
      ENV_DEF: {yuor env1} {your env2} {your env3}
      {env1 name}: {env1 value}
      {env2 name}: {env2 value}
      {env3 name}: {env3 value}
    volumes:
      - path/www:/workspace
```

### Rebuild

``` bash
# Dockerfile
FROM nekoimi/webapp:latest

COPY /path/www    /workspace
```


<br>

# 📄 License

[MIT License](#LICENSE)