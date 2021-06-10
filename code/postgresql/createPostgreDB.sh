#! /bin/bash
echo "creating db named ... "$USER"_DB"
createdb -h localhost -p $PGPORT $USER"_DB"
pg_ctl status

echo "Copying csv files ... "
sleep 1
cp ../code/data/*.csv /tmp/$USER/myDB/data/.

echo "Initializing tables .. "
sleep 1
psql -h localhost -p $PGPORT $USER"_DB" < ../code/sql/create.sql
