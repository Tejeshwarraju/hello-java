FROM ubuntu:14.04
MAINTAINER Tejeshwar Raju R <az.teju@gmail.com>
RUN apt-get update -qq && apt-get install -yqq curl && apt-get install -y default-jdk tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
RUN ln -s /usr/share/tomcat7/bin/catalina.sh /usr/local/bin/catalina.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
ADD hello-java/target/*.war /var/lib/tomcat7/webapps/
EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"]
