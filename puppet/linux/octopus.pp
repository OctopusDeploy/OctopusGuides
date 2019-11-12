docker_network { 'octopus':
  ensure   => present,
  driver   => 'bridge',
  subnet   => '192.168.0.0/16',
  gateway  => '192.168.0.1',
  ip_range => '192.168.1.0/24',
}
-> docker::image { 'mcr.microsoft.com/mssql/server':
  image_tag => '2017-latest-ubuntu'
}
-> docker::run { 'mssql':
  image => 'mcr.microsoft.com/mssql/server:2017-latest-ubuntu',
  env   => ['ACCEPT_EULA=Y', 'SA_PASSWORD=Password01!', 'MSSQL_PID=Express'],
  ports => ['1433:1433'],
  net   => 'octopus'
}
-> docker::image { 'octopusdeploy/linuxoctopus':
  image_tag => '2019.10.5'
}
-> docker::run { 'octopusdeploy':
  image => 'octopusdeploy/linuxoctopus:2019.10.5',
  env   => ['ADMIN_USERNAME=admin', 'ADMIN_EMAIL=octopusguides@gmail.com', 'ADMIN_PASSWORD=Password01!', 'ACCEPT_EULA=Y'
    , 'CONNSTRING=Server=mssql,1433;Database=Octopus;User Id=SA;Password=Password01!'],
  ports => ['80:8080'],
  net   => 'octopus'
}
-> file { '/opt/octo':
  ensure => 'directory'
}
-> archive { '/opt/OctopusTools.6.14.2.portable.tar.gz':
  ensure       => present,
  extract      => true,
  extract_path => '/opt/octo',
  source       => 'https://download.octopusdeploy.com/octopus-tools/6.14.2/OctopusTools.6.14.2.portable.tar.gz',
  creates      => '/opt/octo/Octo',
  cleanup      => true,
}
-> file { '/opt/query-octopus.sh':
  ensure  => 'file',
  mode    => '0744',
  content => @(EOT)
    #!/bin/bash
    sleep 60
    /opt/octo/Octo list-machines --server http://localhost --user admin --pass Password01!
    | EOT
}
-> exec { 'Query Octopus':
  command   => '/opt/query-octopus.sh',
  logoutput => true
}