package {'$package':
  name     => 'httpd',
  ensure => installed,
}
  
$myservice_content =StartServers        4
            MinSpareServers     20
            MaxSpareServers     40
            MaxClients          200
            MaxRequestsPerChild 4500

file{'/etc/httpd/conf/httpd.conf':
    ensure  => present,
    content => $myservice_content,
  }

$myservice_content = VirtualHost *:80>
             ServerAdmin admin@example.org
             ServerName example.org
             ServerAlias www.example.org
             DocumentRoot /srv/www/example.org/public_html/
             ErrorLog /srv/www/example.org/logs/error.log
             CustomLog /srv/www/example.org/logs/access.log combined
        </VirtualHost>

file{'/etc/httpd/conf.d/vhost.conf':
    ensure  => present,
    content => $myservice_content,
  }


 file{'/srv/www/example.org/public_html':
    ensure  => directory,
    ,
  }

 # Start and Enable the service
  service{'httpd':
    ensure => running,
    enable => true,
  } 

$package= {'$package':
   name     => 'httpd':
  ensure => installed,
}
