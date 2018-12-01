ARG base_image=yuri1987/alpine.base:latest
FROM ${base_image}

ARG base_image
ARG medusa_ver=v0.2.13
RUN echo "base image version:"$base_image >> /app/versions && echo "medusa version:"${medusa_ver} >> /app/versions

RUN apk add --no-cache python \
                        py2-pip \
                        git \
                        mediainfo \
                        unrar \
                        py-gdbm && \
                        git clone -b ${medusa_ver} --depth 1 https://github.com/pymedusa/Medusa /app/medusa && \
                        rm -rf /var/cache/apk/* ~/.pip/cache/* /root/.cache

COPY entrypoint.sh /entrypoint.sh

EXPOSE 8081

VOLUME [ "/config" ]

ENTRYPOINT ["/entrypoint.sh"]

CMD /usr/bin/python /app/medusa/start.py --nolaunch --datadir /config