for server in $(cat servers.txt)
do
   echo "Processing $server"

   scp -i aws.pem shell-roboshop/mongo.repo shell-roboshop/mongodb.sh ec2-user@$server:/tmp/

   ssh -i aws.pem ec2-user@$server "cd /tmp && sudo sh mongodb.sh"

done