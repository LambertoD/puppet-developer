#!/bin/bash
echo "Get puppet labs package"
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
dpkg -i puppetlabs-release-pc1-trusty.deb

apt-get -y update

echo "install puppet-agent"
apt-get install  puppet-agent -y
sudo /opt/puppetlabs/bin/puppetlabs agent --enable

echo "show version"
puppet agent --version

echo "show puppet service initial state"
puppet resource service puppet

service puppet start

# echo "get vim puppet module"
# puppet module install theurbanpenguin/puppet_vim

# echo "activate vim module"
# puppet apply -e "include puppet_vim"

# puppet module install puppetlabs/stdlib
