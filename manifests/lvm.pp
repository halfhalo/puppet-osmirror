class osmirror::lvm {
	physical_volume {'/dev/vdb':
		ensure=> 'present',
		unless_vg => 'mirror',
	}
	volume_group {'mirror':
		ensure => present,
		physical_volumes => '/dev/vbd',
	}
	logical_volume {'repositories':
		ensure => present,
		volume_group => 'mirror',
	}
	filesystem { "/dev/mirror/repositories":
	  	ensure  => present,
	  	fs_type => 'ext4',
		notify => [Mount['/mnt/repositories']],
		require => [File['/mnt/repositories'],Logical_volume['repositories']],
	}
	mount {'/mnt/repositories':
		ensure => 'mounted',
		device => "/dev/mirror/repositories",
		fstype => 'ext4',
		require => [Filesystem["/dev/mirror/repositories"]],
	}
	
	file {'/mnt/repositories':
		ensure=> 'directory',
	}
}