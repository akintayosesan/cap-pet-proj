FROM tomcat:9.0

COPY target/SampleServlet.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD /usr/local/tomcat/bin/catalina.sh run