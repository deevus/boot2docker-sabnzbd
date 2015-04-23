param($Command, [bool]$OpenInBrowser = $false)

. "$psscriptroot/Sabnzbd-Lib.ps1"

switch($Command) {

  "help" {
    "usage:"
    "  sabnzbd <command>"
    ""
    "commands:"
    "  start: starts the service"
    "  stop: stops the service"
    "  restart: restarts the service"
    "  status: prints the service status"
    "  browse: opens sabnzbd in your default browser"
  }

  "" {
    sabnzbd help
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

  "status" {
    print_status
  }

  "browse" {
    open_in_browser
  }

  default {
    "command $command not supported"
    exit 1
  }

}
