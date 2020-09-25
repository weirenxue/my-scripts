#!/bin/bash
dbName=scor_assi
nowTime=$(date +"%F_%H-%M-%S")  #Schema_of_$dbName.sql

schema_backup_filename=$(echo ${nowTime}_SchemaOf_${dbName}.sql)
data_backup_filename=$(echo ${nowTime}_DataOf_${dbName}.sql)
mix_backup_filename=$(echo ${nowTime}_AllOf_${dbName}.sql)

mkdir -p ~/Documents/mysqlBackup/
cd ~/Documents/mysqlBackup/

schemaBackup="mysqldump -u wrxue -p --databases ${dbName} --default-character-set=utf8mb4 --no-data --result-file=${schema_backup_filename}"
dataBackup="mysqldump -u wrxue -p --databases ${dbName} --default-character-set=utf8mb4 --no-create-info --no-create-db --result-file=${data_backup_filename}"
mixBackup="mysqldump -u wrxue -p --databases ${dbName} --default-character-set=utf8mb4 --result-file=${mix_backup_filename}"

eval "${schemaBackup}"
eval "${dataBackup}"
eval "${mixBackup}"                                                                                                           4,0-1         All
