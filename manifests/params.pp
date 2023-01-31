class apache::params {

$install_name = $facts['os']['family'] ? {
  'Redhat'                    => 'httpd',
  /(Debian|Ubuntu)/           => 'apache2',
  default                     => 'httpd',
}

}
