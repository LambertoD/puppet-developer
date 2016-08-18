#!/bin/bash

yum update -y
yum install -y http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install puppetserver -y
rm -rf /etc/puppetlabs/code
ln -s /puppet_code /etc/puppetlabs/code
rm -rf /etc/puppetlabs/puppetserver
ln -s /puppet_puppetserver /etc/puppetlabs/puppetserver
sed -i 's/2g/512m/g' /etc/sysconfig/puppetserver
echo "*.example.conf" | tee /etc/puppetlabs/puppet/autosign.conf
service puppetserver start


echo "get vim puppet module"
puppet module install theurbanpenguin/puppet_vim

echo "activate vim module"
puppet apply -e "include puppet_vim"
