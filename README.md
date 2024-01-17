
## Hirarchy
    00-Provider.tf
    01-Network.tf
    03-EC2.tf
    04-Security_Group.tf
    06-SSH_Key.tf
    07-Outputs.tf
    08-variables.tf
    template.tpl


## Start Deployment
git clone https://github.com/dimadolgov/NICE.git
cd AWS_IaC
Add your administrative credentials to "00-Provider" or to "aws configure"
run terraform apply
After the deployment finished you will see output "Web_Server_Public_IP" That will be our web server external IP

go to Download ssh key from S3 nice-exam-s3-bucket
download id
open file and copy private key

server ip external address add to junkins


