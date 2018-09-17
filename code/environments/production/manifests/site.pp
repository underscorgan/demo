node 'docker-agent.platform9.puppet.net' {
  class { 'nginx': }
  
  file { '/var/www':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '755',
  }

  file { '/var/www/index.html':
    owner   => 'root',
    group   => 'root',
    mode    => '644',
    content => '<html><head><title>Docker demo!</title></head><body><iframe src="https://giphy.com/embed/JIX9t2j0ZTN9S" width="480" height="480" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/JIX9t2j0ZTN9S">via GIPHY</a></p><h1>For more information, please see pup.pt/2018-docker-demo</h1> </body></html>',
  }

  nginx::resource::server { 'docker-agent.platform9.puppet.net':
    www_root => '/var/www',
  }
}

node default {
  
}
