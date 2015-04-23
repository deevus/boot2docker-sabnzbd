param($Command, [bool]$OpenInBrowser = $false)

. "$psscriptroot/Sabnzbd-Lib.ps1"

switch($Command) {

  "" {
    start_sabnzbd $OpenInBrowser
  }

  "start" {
    start_sabnzbd $OpenInBrowser
  }

  "build" {
    docker_build
  }

  "stop" {
    docker_stop
  }

  default {
    "command $command not supported"
    exit 1
  }

}
