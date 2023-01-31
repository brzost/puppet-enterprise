File { backup => false }
###
node 'pe-centos7' {
include apache

  apache::vhost { 'ny':
    server_name => 'ny.globomantics.loc',
    document_root => 'ny',
  }
  host { 'ny.globomantics.loc':
    ip => '192.168.56.142',
  }
}

node 'pe-ubuntu.soprasteria.com' {
  include apache

  apache::vhost { 'utah':
    server_name => 'utah.globomantics.loc',
    document_root => 'utah',
  }

  class { 'apache::ensite':
    vhost_file => 'utah.globomantics.loc.conf',
    require    => Apache::Vhost['utah'],
  }

  host { 'utah.globomantics.loc':
    ip => '192.168.56.141',
  }
}
