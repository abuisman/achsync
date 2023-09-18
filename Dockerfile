FROM postgres:15.4-bullseye

COPY sync.sh /bin/sync.sh
COPY full_sync.sh /bin/full_sync.sh

CMD /bin/sync.sh
