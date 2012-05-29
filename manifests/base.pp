# Default path
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}
stage { 'first': before => Stage['main'] }
stage { 'last': require => Stage['main'] }

class { bootstrap: stage => first }

include bootstrap

include other
include apache
include php
include mysql
include phpmyadmin

include subversion

#exec { 'mkdir /var/www/webgrind': }

file { "/var/www/webgrind":
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => 755,
}

subversion::checkout { "application":
     repopath      => "/svn/trunk/",
     workingdir    => "/var/www/webgrind",
     ensure        => "updated",
     method        => "http",
     host          => "webgrind.googlecode.com",
}