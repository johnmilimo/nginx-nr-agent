FROM nginx:1.13

RUN apt-get update && \
    apt-get install -y nginx-nr-agent ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY devops/nginx-nr-agent.conf /etc/nginx-nr-agent/nginx-nr-agent.ini
COPY devops/nginx-nr-agent.py /usr/bin/nginx-nr-agent.py
RUN chmod +x /usr/bin/nginx-nr-agent.py
CMD nginx-nr-agent.py -f start
