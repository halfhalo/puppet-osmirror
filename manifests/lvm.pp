class osmirror::lvm {
	include lvm
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
		mountpath => '/mnt/repositories',
		fs_type => 'ext4',
		mounted => true,
	}

}