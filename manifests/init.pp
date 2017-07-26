class tsw_chocolatey (
  # Variables Declaration
  # $chocolatey_download_url_base = lookup('profile::base::windows::requirements::chocolatey_download_url_base')
  $chocolatey_version           = '0.10.7', # ensure the versions are available in the files/ directory
  $choco_install_location       = 'c:/bin/chocolatey',
  $chocolatey_packages_source   = 'https://chocolatey.org/api/v2/package/chocolatey/',
  $chocolatey_temp_binary_path  = 'c:/temp',

){

  file { $chocolatey_binary_path:
    ensure  => directory,
  }

  file { 'chocolatey_binary':
    ensure  => file,
    path    => "$chocolatey_temp_binary_path/chocolatey-$chocolatey_version.nupkg",
    source  => "puppet:///modules/custom_chocolatey/chocolatey-$chocolatey_version.nupkg",
  }

  class { 'chocolatey':
    use_7zip                => false,
    log_output              => true,
    # chocolatey_download_url => "${chocolatey_download_url_base}/packages/chocolatey-${chocolatey_version}.nupkg",
    chocolatey_download_url => "file:///$chocolatey_temp_binary_path/chocolatey-$chocolatey_version.nupkg",
    require                 => File['chocolatey_binary'],
  }

  chocolateysource { 'chocolcatey':
    ensure   => present,
    location => $chocolatey_packages_source,
    priority => 1,
  }

  # Cache location should be configured
  # chocolateyconfig {'cachelocation':
  #   value  => "c:\\downloads",
  # }

  # If using an internal proxy instead of a internal choco server
  # chocolateyconfig {'proxy':
  # value  => 'https://someproxy.com',
  # }
  #
  # chocolateyconfig {'proxyUser':
  #   value  => 'bob',
  # }
  #
  # # not verifiable
  # chocolateyconfig {'proxyPassword':
  #   value  => 'securepassword',
  # }

}
