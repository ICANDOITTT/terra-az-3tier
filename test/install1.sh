#!/bin/bash
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
yum install -y httpd
echo "JISOO-WEB-TEST" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd