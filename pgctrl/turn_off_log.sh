#!/bin/bash

cat postgresql.offlog.conf |docker exec -i pgsql sh -c 'cat > /var/lib/postgresql/data/postgresql.conf'
