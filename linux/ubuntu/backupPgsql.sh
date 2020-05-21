#!/bin/bash

pg_dump wrxue -s --schema="asset_management" > "$(echo $(date +"%F %T") Schema.sql)"  
pg_dump wrxue -a --disable-triggers --column-inserts --schema="asset_management" > "$(echo $(date +"%F %T") Data.sql)"  
