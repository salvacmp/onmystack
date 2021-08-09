# Docker - OpenLiteSpeed - Nginx Proxy Manager - MariaDB - Yacht Stack

<p align="center">
ONMY is OpenLiteSpeed, Nginx Proxy Manager (NPM), MariaDB, and Yacht stack. This is set of docker images for secure and fast website. ONMY can deploy on any Linux OS that support Docker and Docker-Compose.
</p>

## Features


## Components
The docker image installs the following packages on your system:

|Component|Version|
| :-------------: | :-------------: |
|Linux|Ubuntu 20.04|
|OpenLiteSpeed|[Latest version](https://openlitespeed.org/downloads/)|
|MariaDB|[Stable version: 10.5](https://hub.docker.com/_/mariadb)|
|PHP|[Latest version](http://rpms.litespeedtech.com/debian/)|
|LiteSpeed Cache|[Latest from WordPress.org](https://wordpress.org/plugins/litespeed-cache/)|
|phpMyAdmin|[Latest from dockerhub](https://hub.docker.com/r/bitnami/phpmyadmin/)|
|Yacht|[Latest from dockerhub](https://hub.docker.com/r/selfhostedpro/yacht)|

## - Usage
### Starting a Container
Start the container with the `up` or `start` methods:
```
docker-compose up
```
You can run with daemon mode, like so:
```
docker-compose up -d
```
The container is now built and running. 
### Stopping a Container
```
docker-compose stop
```
### Removing Containers
To stop and remove all containers, use the `down` command:
```
docker-compose down
```
## - First Time Setup
### Setting the WebAdmin Password
We strongly recommend you set your personal password right away.
```
bash bin/webadmin.sh my_password
```
### Login to Proxy Manager
You need to add the reverse proxy if you not exposing the port by visiting `http://domain.com:81` and login with 
username: `admin@example.com`
password: `changeme`
### Services Port
|Services|Hostname|Availabel Port| External Docs|
| :-------------: | :-------------: | :-------------: | :-------------: |
|OpenLiteSpeed | `litespeed` | `80`, `443`, and `7080`| https://openlitespeed.org/kb/ |
|Nginx Proxy Manager Admin | `localhost` | `81` | https://nginxproxymanager.com/guide/ |
|phpMyAdmin | `phpmyadmin` | `8443` | https://www.phpmyadmin.net/docs/|
|Yacht | `yacht` | `8000`| https://yacht.sh/docs/|
### Adding Sites
-- example domain: domain.com.
1. Create reverse proxy on NPM point from `domain.com` to `litespeed` port `80` and create and enable SSL Certificate.
2. Create `domain.com` directory under Sites.
3. Copy your site data to `sites/domain.com`
4. Go to LiteSpeed Web Admin and go to VHost Templates -> docker -> Member Virtual Hosts tab and click + .
5. Enter your the information
Virtual Host Name: `domain.com`
Domain Name: `domain.com`
Domain Aliases: `www.domain.com` (optional)
5. Save and Initiate the template.
6. Perform a graceful restart to apply the changes.
Extra docs:
- https://openlitespeed.org/kb/ols-web-admin-console
- https://openlitespeed.org/kb/
- https://www.itzgeek.com/how-tos/linux/how-to-create-virtual-hosts-in-openlitespeed-web-server.html
### Yacht Container Manager
You can manage your container using Yacht. Create a reverse proxy to `yacht` port `8000` and login using 
username: `admin@yacht.local`
password: `pass`
you can protect this service using nginx proxy manager access list.
## - Extras
### Update Web Server
To upgrade the web server to latest stable version, run the following:
```
bash bin/webadmin.sh [-U, --upgrade]
```
### Apply OWASP ModSecurity
Enable OWASP `mod_secure` on the web server: 
```
bash bin/webadmin.sh [-M, --mod-secure] enable
```
Disable OWASP `mod_secure` on the web server: 
```
bash bin/webadmin.sh [-M, --mod-secure] disable
```
>Please ignore ModSecurity warnings from the server. They happen if some of the rules are not supported by the server.

## Security Vulnerabilities and Bugs
If you discover any security vulnerability or any bug within ONMY Stack, please open an issue.

## Contributing
- Fork it (https://github.com/salvacmp/onmystack/fork)
-Create your feature branch (git checkout -b my-new-feature) or fix issue (git checkout -b fix-some-issue)
- Commit your changes (git commit -am 'Add some feature') or (git commit -am 'Fix some issue')
- Push to the branch (git push origin my-new-feature) or (git push origin fix-some-issue)
- Create a new Pull Request
- GitHub Workflows will be run to make sure that your changes does not have errors or warning
