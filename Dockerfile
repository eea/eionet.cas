FROM tomcat:9.0.118-jre8
RUN rm -rf /usr/local/tomcat/conf/logging.properties /usr/local/tomcat/webapps/*
COPY target/cas.war /usr/local/tomcat/webapps/ROOT.war
COPY docker/server.xml  /usr/local/tomcat/conf/server.xml
COPY etc/cas /etc/cas
VOLUME /etc/cas
EXPOSE 8080
