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
    content => '<html><body><blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I think it&#39;s important to let y&#39;all know, the cats have been ridiculously snuggly this week. <a href="https://t.co/29zdxyFMVv">pic.twitter.com/29zdxyFMVv</a></p>&mdash; morgan (@KnittyNerd) <a href="https://twitter.com/KnittyNerd/status/1010358121103962112?ref_src=twsrc%5Etfw">June 23, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script></body></html>
',
  }

  nginx::resource::server { 'docker-agent.platform9.puppet.net':
    www_root => '/var/www',
  }
}

node default {
  
}
