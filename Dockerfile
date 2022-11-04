FROM postgres:14.5-bullseye

COPY sync.sh /bin/sync.sh

CMD /bin/sync.sh
