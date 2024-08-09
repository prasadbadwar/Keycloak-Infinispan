# Use the official Keycloak image as the base
FROM keycloak/keycloak:21.0

# Set environment variables
ENV KEYCLOAK_ADMIN=admin \
    KEYCLOAK_ADMIN_PASSWORD=admin \
    KEYCLOAK_USER=admin \
    KEYCLOAK_PASSWORD=admin \
    KC_HOSTNAME=localhost \
    PROXY_ADDRESS_FORWARDING=true

# Copy configuration files
COPY ./cache-ispn.xml /opt/keycloak/conf/cache-ispn.xml
COPY ./keycloak.conf /opt/keycloak/conf/keycloak.conf
COPY ./keycloak.crt /opt/keycloak/conf/keycloak.crt
COPY ./keycloak.key /opt/keycloak/conf/keycloak.key
COPY ./hosts /etc/hosts

# Uncomment the following line if you need to copy the keystore file
# COPY ./server.keystore /opt/keycloak/conf/server.keystore

# Expose the necessary ports
EXPOSE 8080 8443

# Set the entrypoint to start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
