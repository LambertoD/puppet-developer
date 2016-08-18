#!/bin/bash

yum update -y
yum install -y http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install puppet-agent -y
service puppet start


# echo "get vim puppet module"
# puppet module install theurbanpenguin/puppet_vim

# echo "activate vim module"
# puppet apply -e "include puppet_vim"
