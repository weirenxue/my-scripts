#!/bin/bash
if [ $# -ne 2 ]
then
    echo "Please input db name and schema name!"
    exit 0
fi

pg_dump $1 -s --schema="$2" > "$(echo $(date +"%F %T") Schema.sql)"  
pg_dump $1 -a --disable-triggers --column-inserts --schema="$2" > "$(echo $(date +"%F %T") Data.sql)"  
