# Start with the Infinispan base image
FROM quay.io/infinispan/server:15.0

# Set environment variables
ENV USER=admin \
    PASS=password

# Copy configuration and library files into the image
COPY ./infinispan-xsite.xml /opt/infinispan/server/conf/infinispan-xsite.xml
COPY ./org.keycloak.keycloak-model-infinispan-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-model-infinispan-21.0.2.jar
COPY ./org.keycloak.keycloak-common-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-common-21.0.2.jar
COPY ./org.keycloak.keycloak-core-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-core-21.0.2.jar
COPY ./org.keycloak.keycloak-server-spi-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-server-spi-21.0.2.jar
COPY ./org.keycloak.keycloak-server-spi-private-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-server-spi-private-21.0.2.jar
COPY ./org.keycloak.keycloak-services-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-services-21.0.2.jar
COPY ./mysql-connector-j-8.0.31.jar /opt/infinispan/boot/mysql-connector-j-8.0.31.jar

# Expose the necessary port
EXPOSE 11222

ENTRYPOINT ["/opt/infinispan/bin/server.sh"]
CMD ["-c", "infinispan-xsite.xml","-Dinfinispan.site.name=LON", "-Djgroups.mcast_port=46656"]
# Set the command to run when the container starts
# CMD ["/opt/infinispan/bin/server.sh", "-c", "infinispan-xsite.xml", "-Dinfinispan.site.name=LON", "-Djgroups.mcast_port=46656"]




# # Use an appropriate base image
# FROM quay.io/infinispan/server:15.0

# # Set the working directory inside the container
# WORKDIR /opt/infinispan/server/conf

# ENV INFINISPAN_CONFIG_FILE="/opt/infinispan/server/conf/infinispan-xsite.xml"

# # Copy the file from the host to the image
# COPY infinispan-xsite.xml /opt/infinispan/server/conf/infinispan-xsite.xml

# # Set the working directory inside the container
# WORKDIR /opt/infinispan/server/lib

# COPY org.keycloak.keycloak-model-infinispan-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-model-infinispan-21.0.2.jar
# COPY org.keycloak.keycloak-common-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-common-21.0.2.jar
# COPY org.keycloak.keycloak-core-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-core-21.0.2.jar
# COPY org.keycloak.keycloak-server-spi-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-server-spi-21.0.2.jar
# COPY org.keycloak.keycloak-server-spi-private-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-server-spi-private-21.0.2.jar
# COPY org.keycloak.keycloak-services-21.0.2.jar /opt/infinispan/server/lib/org.keycloak.keycloak-services-21.0.2.jar
# COPY mysql-connector-j-8.0.31.jar /opt/infinispan/server/lib/mysql-connector-j-8.0.31.jar

# # Optionally, you can specify other instructions like EXPOSE, CMD, etc.
# # Example:
# EXPOSE 11222
# ENTRYPOINT ["/opt/infinispan/bin/server.sh"]
# CMD ["-c", "infinispan-xsite.xml","-Dinfinispan.site.name=LON", "-Djgroups.mcast_port=46656"]