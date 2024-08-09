# Use the official Infinispan image as the base
FROM quay.io/infinispan/server:15.0

# Set environment variables
ENV USER=admin \
    PASS=password

# Copy configuration and JAR files
COPY ./infinispan-xsite.xml /opt/infinispan/server/conf/infinispan-xsite.xml
COPY ./org.keycloak.keycloak-model-infinispan-21.0.2.jar /opt/infinispan/server/lib/
COPY ./org.keycloak.keycloak-common-21.0.2.jar /opt/infinispan/server/lib/
COPY ./org.keycloak.keycloak-core-21.0.2.jar /opt/infinispan/server/lib/
COPY ./org.keycloak.keycloak-server-spi-21.0.2.jar /opt/infinispan/server/lib/
COPY ./org.keycloak.keycloak-server-spi-private-21.0.2.jar /opt/infinispan/server/lib/
COPY ./org.keycloak.keycloak-services-21.0.2.jar /opt/infinispan/server/lib/
COPY ./mysql-connector-j-8.0.31.jar /opt/infinispan/boot/

# Expose the necessary port
EXPOSE 11222

# Set the command to start Infinispan with the necessary configurations
CMD ["-c", "infinispan-xsite.xml", "-Dinfinispan.site.name=LON", "-Djgroups.mcast_port=46656"]
