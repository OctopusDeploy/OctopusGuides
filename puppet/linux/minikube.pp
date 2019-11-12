apt::key { 'kubernetes-repository':
  id     => '54A647F9048D5688D7DA2ABE6A030B21BA07F4FB',
  source => 'https://packages.cloud.google.com/apt/doc/apt-key.gpg',
  server  => 'pgp.mit.edu'
}
-> apt::source { 'kubernetes':
  comment  => 'This is the kubernetes repository',
  location => 'http://apt.kubernetes.io/',
  release  => '',
  repos    => 'kubernetes-xenial main',
  key      => {
    'id' => '54A647F9048D5688D7DA2ABE6A030B21BA07F4FB',
  },
  include  => {
    'deb' => true,
  },
}
-> package { 'kubectl':
  ensure => installed,
}
-> package { 'openssl':
  ensure => installed,
}
-> file { '/usr/local/bin/minikube':
  source => 'https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64',
  mode   => '0755'
}
-> file { '/opt/start-minikube.sh':
  ensure  => 'file',
  mode    => '0744',
  content => @(EOT)
    #!/bin/bash
    # The GitHub Actions VM has a custom Docker version like 3.0.8, and minikube doesn't understand this version,
    # so we ignore the system verification errors
    sudo minikube start --vm-driver=none --extra-config kubeadm.ignore-preflight-errors=SystemVerification
    sudo cat ~/.kube/config
    sudo kubectl get nodes
    # Create a pfx file with the client certificate and key
    sudo openssl pkcs12 -passout pass: -export -out /root/client.pfx -in /root/.minikube/client.crt -inkey /root/.minikube/client.key
    sudo chmod 644 /root/client.pfx
    sudo chmod 644 /root/.minikube/client.crt
    sudo chmod 644 /root/.minikube/client.key
    sudo chmod 644 /root/.minikube/ca.crt
    echo "Listing /root"
    sudo ls -la /root
    echo "Listing /root/.minikube"
    sudo ls -la /root/.minikube
    touch /opt/minikube-started
    | EOT
}
-> exec { 'Start minikube':
  command   => '/opt/start-minikube.sh',
  creates   => '/opt/minikube-started',
  timeout   => 3600,
  logoutput => true
}


