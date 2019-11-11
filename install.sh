wget https://apt.puppetlabs.com/puppet6-release-bionic.deb
sudo dpkg -i puppet6-release-bionic.deb
sudo apt-get update
sudo apt-get install puppet-agent

sudo /opt/puppetlabs/bin/puppet module install puppetlabs/apt
sudo /opt/puppetlabs/bin/puppet module install puppetlabs/docker

for var in "$@"
do
    for i in {1..5}
    do
      sudo /opt/puppetlabs/bin/puppet apply puppet/linux/$var --detailed-exitcodes
      if [[ $? -eq 0 ]] || [[ $? -eq 2 ]]
      then
        break
      fi
    done

    if [[ $? -ne 0 ]] && [[ $? -ne 2 ]]
    then
      exit 100
    fi
done

exit 0