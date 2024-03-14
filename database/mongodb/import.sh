
#! /bin/bash


mongoimport -u root -p onur_dev_112 --authenticationDatabase admin --host mongo --port 27017 --db caretta_dev --collection config --mode upsert --type json --file /home/config.json --jsonArray
