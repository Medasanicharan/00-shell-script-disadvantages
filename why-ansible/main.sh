for server in $(cat servers.txt)
do
   echo "Processing $server"

   scp catalogue.service catalogue.sh ec2-user@$server:/tmp/

   ssh ec2-user@$server "cd /tmp && sudo sh catalogue.sh"

done