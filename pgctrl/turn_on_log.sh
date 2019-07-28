#!/bin/bash

cat postgresql.onlog.conf |docker exec -i pgsql sh -c 'cat > /var/lib/postgresql/data/postgresql.conf'
