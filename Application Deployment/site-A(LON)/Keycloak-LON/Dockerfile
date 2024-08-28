# Use an appropriate base image
FROM keycloak/keycloak:21.0

# Set environment variables
ENV KEYCLOAK_ADMIN=admin \
    KEYCLOAK_ADMIN_PASSWORD=admin \
    KEYCLOAK_USER=admin \
    KEYCLOAK_PASSWORD=admin \
    PROXY_ADDRESS_FORWARDING=true \
    USER=admin \
    PASS=password
# Copy the file from the host to the image
COPY cache-ispn.xml /opt/keycloak/conf/cache-ispn.xml
COPY keycloak.conf /opt/keycloak/conf/keycloak.conf
COPY keycloak.crt /opt/keycloak/conf/keycloak.crt
COPY keycloak.key /opt/keycloak/conf/keycloak.key

# Expose necessary ports
EXPOSE 8080 8443

# Set the entrypoint command
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]

# CMD ["-b", "0.0.0.0","--https-port", "8443"]