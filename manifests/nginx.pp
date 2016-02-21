class osmirror::nginxvhost {
	class { '::nginx':
	}
	nginx::resource::vhost {$::fqdn:
		www_root => "/mnt/repositories/mirror",
		require => [File['/mnt/repositories/mirror']],
	}
	file{'/mnt/repositories/mirror':
		ensure=>'directory',
		require => [Mount['/dev/mirror/repositories']],
	}
}