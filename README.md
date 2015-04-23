# boot2docker-sabnzbd
A docker image for Sabnzbd with scripts for managing in Windows with Boot2Docker

Setup
--

You need to add a shared folder called `usenet` to the boot2docker vm. This is where your Sabnzbd data will go. Create a folder on your local machine somewhere, then we add it to Virtualbox...

Add it in `Virtualbox -> boot2docker-vm -> Settings -> Shared Folders`. Make sure you set it to Auto-mount and Make Permanent.

Usage
--

* `./Sabnzbd start` - Starts the service. You can pass `-OpenInBrowser 1` as an argument to open the address for Sabnzbd in 
your default browser
* `./Sabnzbd stop` - Stops the service
* `./Sabnzbd restart` - Restarts the service
* `./Sabnzbd status` - Prints the service status
* `./Sabnzbd browse` - Opens Sabnzbd in your default browser
* `./Sabnzbd build` - Builds the docker image for Sabnzbd. You would only need to do this if you have changed the Dockerfile 
or have an outdated version.
