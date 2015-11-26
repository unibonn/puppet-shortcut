define shortcut (
  $target,
  $path              = $title,
  $arguments         = undef,
  $icon_location     = undef,
  $working_directory = undef,
  $description       = undef,
) {

  $lnk_path = $path ? {
    /\.lnk$/ => $path,
    default  => "${path}.lnk",
  }

  exec { "ensure shortcut ${title}":
    provider => powershell,
    command  => template('shortcut/ensure.ps1.erb'),
    unless   => template('shortcut/exists.ps1.erb'),
  }

}
