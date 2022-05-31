# 📦 docker webapp

A web project deployment and running env.

Modify the server API configuration by replacing the environment variable.

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

### docker compose

```bash
version: "3"
services:
  webapp:
    image: nekoimi/webapp:latest
    ports:
      - 80:80
    environment:
      # Configure ENV_DEF environment variable defines the list of environment variables to be replaced. 
      # If there are multiple environment variables to be replaced, please separate them with spaces.
      ENV_DEF: {env1 name} {env2 name} {env3 name} ... {more}
      {env1 name}: {env1 value}
      {env2 name}: {env2 value}
      {env3 name}: {env3 value}
      ...
      {more}
    volumes:
      - path/www:/workspace
```

### rebuild image

``` bash
# Dockerfile
FROM nekoimi/webapp:latest

COPY /path/www    /workspace
```


<br>

# 📄 License

[MIT License](#LICENSE)