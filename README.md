Eionet CAS service
==================

Eionet uses a configuration of the Apereo CAS project at
https://apereo.github.io/. The only difference is that we have it set up
with LDAP as the backend and there is an Eionet style.

The build is done using the Maven Overlay Method, so you only see the
files that have been modified here. The rest is downloaded as dependencies
with Maven.

To upgrade the CAS version, change the cas.version number in the pom.xml and rebuild with

  mvn clean install

Resources:

-  https://apereo.github.io/cas/5.1.x/installation/Maven-Overlay-Installation.html

CAS enforces connection via SSL as people are entering passwords into
the login page. It does redirection and SSL directly in the Tomcat
application and it must use a dedicated IP number.

# Configuration

The `etc` directory contains the configuration files and directories
that need to be copied to `/etc/cas/config`. This is included in the Dockerfile.

# Docker configuration

After having built the WAR file with maven, it can be directly used in
docker containers thanks to the environmental configuration. The Dockerfile
can be used to build a ready-to-deploy image of the Eionet CAS service:

    $ docker build -t eeacms/casserver:latest .

To push a new version to Docker hub, you update the version in the pom.xml file,
build a new image, and then push it up:
    $ VERSION=$(xpath -q -e "/project/version/text()" pom.xml)
    $ docker eeacms/casserver:latest
    $ docker push eeacms/casserver:latest eeacms/casserver:$(VERSION)

