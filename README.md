
## Hirarchy
    00-Provider.tf
    01-Network.tf
    03-EC2.tf
    04-Security_Group.tf
    06-SSH_Key.tf
    07-Outputs.tf
    08-variables.tf
    template.tpl


# Terraform Deployment

This repository contains Terraform scripts for deploying infrastructure on AWS.

## Getting Started

1. **Clone the project:**

    ```bash
    git clone https://github.com/dimadolgov/NICE.git
    cd AWS_IaC
    ```

2. **Add your administrative credentials:**

    Update either the "00-Provider" file or use the `aws configure` command to add your AWS credentials.

3. **Run Terraform:**

    Execute the following command to apply the Terraform configuration:

    ```bash
    terraform apply
    ```

    Follow the prompts to confirm the deployment.

4. **Access the Web Server:**

    After the deployment is complete, note the output variable "Web_Server_Public_IP." This is the external IP address of your web server.

5. **Download SSH Key:**

    Access the S3 bucket named "nice-exam-s3-bucket" and download the SSH key with the name equals to our ec2 instance_id

6. **Copy Private Key:**

    Open the downloaded file and copy its contents. Starts with -----BEGIN RSA PRIVATE KEY----- ends with -----END RSA PRIVATE KEY-----

7. **Go to Jenkins Website:**
    ```bash
    http://51.17.209.180:8080
    ```
8. **One Time Configuration in Jenkins**
   
   Go to Manage Jenkins>System Configuration>System
   
   Scroll down and Under Publish over SSH paste Private Key in Key field

   Under SSH Server > Hostname enter the Web_Server_Public_IP you received after Terraform Deployment

   Test Configuration > Should get Success

   Save and close Jenkins, Nothing to do there anymore | browse the job index.html if you wish
   
9. 
   

    
