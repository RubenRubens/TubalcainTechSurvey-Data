podman run -ti \
    --name basexhttp-exp \
    --publish 1984:1984 \
    --publish 8984:8984 \
    --volume $(pwd)/basex:/srv:Z \
    -d basex/basexhttp:latest

