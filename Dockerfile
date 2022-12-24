FROM nginx:1.22.0-alpine

LABEL maintainer="nekoimi <nekoimime@gmail.com>"

ENV NGX_WORKER_PROCESSES 1

WORKDIR /workspace

COPY nginx.conf     /etc/nginx/nginx.conf.tpl
COPY default.conf   /etc/nginx/conf.d/default.conf
COPY 99-deploy.sh   /docker-entrypoint.d/99-deploy.sh

RUN set -x; \
    /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime ; \
    chmod +x /docker-entrypoint.d/99-deploy.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
