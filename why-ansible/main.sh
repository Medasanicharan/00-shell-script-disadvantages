#!/bin/bash

# for server in $(cat servers.txt)
# do
#    echo "Processing $server"

#    scp mongo.repo mongodb.sh ec2-user@$server:/tmp/

#    ssh ec2-user@$server "cd /tmp && sudo sh mongodb.sh"

# done


while read app server
do
   echo "Processing $app on $server"

   if [ "$app" = "mongodb" ]; then
      scp mongo.repo mongodb.sh ec2-user@$server:/tmp/
      ssh ec2-user@$server "cd /tmp && sudo sh mongodb.sh"

   elif [ "$app" = "frontend" ]; then
      scp frontend.sh ec2-user@$server:/tmp/
      ssh ec2-user@$server "cd /tmp && sudo sh frontend.sh"
   fi

done < servers.txt