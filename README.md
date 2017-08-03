Eionet CAS service
==================

Eionet uses a configuration of the Apereo CAS project at
https://apereo.github.io/. The only difference is that we have it set up
with LDAP as the backend and there is an Eionet style.

The build is done using the Maven Overlay Method, so you only see the
files that have been modified here. The rest is downloaded as dependencies
with Maven.

To upgrade, change the cas.version number in the pom.xml and rebuild with

  mvn clean install

Resources:

-  https://apereo.github.io/cas/5.1.x/installation/Maven-Overlay-Installation.html

CAS enforces connection via SSL as people are entering passwords into the login page. It does redirection and SSL directly in the Tomcat application and it must use a dedicated IP number.

# Configuration

The `etc` directory contains the configuration files and directories that need to be copied to `/etc/cas/config`.

# Deployment

The Eionet CAS service is deployed behind an Apache server, which handles the TLS and connects to Tomcat via AJP on port 8009.

- Create a keystore file `thekeystore` under `/etc/cas`. Use the password `changeit` for both the keystore and the key/certificate entries.
- Ensure the keystore is loaded up with keys and certificates of the server.

On a successful deployment via the following methods, CAS will be available at:

* `http://cas.server.name:8080/cas`
* `https://cas.server.name:8443/cas`

