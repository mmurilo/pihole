FROM pihole/pihole:latest

COPY *.txt lists.sh /etc/pihole/

RUN apt update && export DEBIAN_FRONTEND=noninteractive &&\
    apt upgrade -y && \
    apt clean && \
    rm -fr /var/cache/apt/* /var/lib/apt/lists/*.lz4 && \
    chmod +x /etc/pihole/lists.sh && \
    bash /etc/pihole/lists.sh
