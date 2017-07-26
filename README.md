# custom_chocolatey

## Description

Module that locally installs chocolatey and sets the upstream source.

## Defaults

```ruby
$chocolatey_version           = '0.10.7', # ensure the versions are available in the files/ directory
$choco_install_location       = 'c:/bin/chocolatey',
$chocolatey_packages_source   = 'https://chocolatey.org/api/v2/package/chocolatey/',
$chocolatey_temp_binary_path  = 'c:/temp',
```

## Usage

The following block of code would install chocolatey in the specific location
and manage the packages sources.

Please note that the version of Chocolatey, should be added to the files
directory.

```ruby

class { 'tsw_chocolatey' :
  $chocolatey_version           = '0.10.7',
  $choco_install_location       = 'c:/ProgramData/choco',
  $chocolatey_packages_source   = 'http://internal/choco/v2',
}
```

This could be used as simple as the below to include all the defaults

```ruby
include custom_chocolatey
```

## Limitations

## To Do

- [ ] Needs to specify Keys for the source
