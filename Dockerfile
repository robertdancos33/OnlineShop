FROM tomcat:9.0.19-jre8


COPY ./target/fitness-shop-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/fitness-shop-0.0.1-SNAPSHOT.war