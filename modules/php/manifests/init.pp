class php {
  $packages = ["php5", "php5-cli", "php5-mysql","php5-xdebug"]
  package { $packages:
    ensure => present,
  }
}