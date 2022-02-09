docker run -d \
    --name basexhttp \
    --publish 1984:1984 \
    --publish 8984:8984 \
    --volume $(pwd)/basex:/srv/basex \
    basex/basexhttp:latest
