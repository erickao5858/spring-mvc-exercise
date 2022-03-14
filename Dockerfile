FROM tomcat:8.5.76-jre8
COPY /target/library.war /usr/local/tomcat/webapps/