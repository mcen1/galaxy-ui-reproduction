FROM redhat/ubi8
COPY default.conf /opt/app-root/etc/nginx.d/default.conf
RUN yum module enable -y nginx:1.20 && \
    yum install -y nginx && \
    touch /run/nginx.pid && \
    chown nginx:nginx /run/nginx.pid && \
    mkdir -p /opt/app-root/etc/nginx.d
COPY nginx.conf /etc/nginx/nginx.conf
USER nginx
CMD ["nginx","-g","daemon off;"]
