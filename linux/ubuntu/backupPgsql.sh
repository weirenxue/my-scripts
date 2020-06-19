#!/bin/bash

while [ -n "$1" ]; do 
    case "$1" in
    --db);&
    --db-name)  dbName="$2"
                shift
                ;;
    --schema);&
    --schema-name)  schemaName="$2"
                    shift
                ;;
    *) echo "Option $1 not recognized" ;;

    esac
    shift
done

if [ -z "$dbName" ]; then
    echo "No assign database name."
    exit
fi
echo "DB name is $dbName"
if [ -z "$schemaName" ]; then
    echo "No assign schema name."
    exit
fi
echo "Schema name is $schemaName"

schemaBackup="pg_dump $dbName -s --schema=\"$schemaName\" > \"\$(echo \$(date +\"%F %H-%M-%S\") Schema_of_$dbName.$schemaName.sql)\""
dataBackup="pg_dump $dbName -a --disable-triggers --column-inserts --schema=\"$schemaName\" > \"\$(echo \$(date +\"%F %H-%M-%S\") Data_of_$dbName.$schemaName.sql)\""

eval "$schemaBackup"
eval "$dataBackup"

#echo "exec $schemaBackup"
#echo "exec $dataBackup"
