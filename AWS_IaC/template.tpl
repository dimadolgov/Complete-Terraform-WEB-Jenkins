#!/bin/bash
sudo yum update -y
sudo yum install httpd -y

# Start Apache service
sudo systemctl start httpd

sudo systemctl enable httpd
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
sudo chmod 777 /var/www/html
sudo chmod 006 /var/www/html/index.html


# Create HTML file
cat <<EOF > /var/www/html/index.html
<div>
<h2 style="text-align: center;">Hello NICE World</h2>
<h2 style="text-align: center;">This is an initial index.html without Jenkins CI\CD</h2>
<h2 style="text-align: center;">Enter Jenkins on http://51.17.209.180:8080/ to update&nbsp; index.html</h2>
<h2 style="text-align: center;">Build by <span style="color: #ff0000;">Dima Dolgov</span> Using <span style="color: #993366;">Terraform</span>&nbsp;</h2>
</div>
<div style="text-align: center;">&nbsp;</div>
EOF