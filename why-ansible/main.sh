#!/bin/bash

for server in $(cat servers.txt)
do
   echo "Processing $server"

   scp mongo.repo mongodb.sh ec2-user@$server:/tmp/

   ssh ec2-user@$server "cd /tmp && sudo sh mongodb.sh"

done
