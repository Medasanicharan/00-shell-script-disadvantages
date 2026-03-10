#!/bin/bash

while read app server
do
   echo "Deploying $app on $server"

   scp $app.service $app.sh ec2-user@$server:/tmp/

   ssh ec2-user@$server "cd /tmp && sudo sh $app.sh"

done < servers.txt