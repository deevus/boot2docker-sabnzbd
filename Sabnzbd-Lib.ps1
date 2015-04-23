function docker_build {
  docker build -t=deevus/sabnzbd .
}

function docker_stop {
  "Attempting to stop Sabnzbd..."

  $imageid = docker ps | grep deevus/sabnzbd | awk '{ print $1 }'
  if($imageid) {
    if(docker stop $imageid) {
      "Sabnzbd has been stopped."
    }
    else {
      "There was a problem stopping Sabnzbd."
    }
  }
  else {
    "Sabnzbd is not running."
  }
}

function start_sabnzbd($open_in_browser = $false) {
  "Starting Sabnzbd..."

  # check if running already
  if(docker ps | grep deevus/sabnzbd) {
    "Sabnzbd is already running..."
    exit 1
  }

  # check boot2docker mount
  boot2docker ssh "sudo mount -t vboxsf usenet ~/usenet"

  docker run -d -p 9200:9200 -v /home/docker/usenet:/data deevus/sabnzbd

  if($open_in_browser) {
    start "http://$(boot2docker ip):9200"
  }
}