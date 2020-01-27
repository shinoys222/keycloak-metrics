FROM jboss/keycloak

COPY loglevel.cli /opt/jboss/tools/cli
COPY jgroups-jdbc-ping.cli /opt/jboss/tools/cli
COPY standalone-ha-configuration.cli /opt/jboss/tools/cli
COPY docker-entrypoint.sh /opt/jboss/tools/

RUN curl -L "https://github.com/aerogear/keycloak-metrics-spi/releases/download/1.0.4/keycloak-metrics-spi-1.0.4.jar" > /opt/jboss/keycloak/standalone/deployments/keycloak-metrics-spi-1.0.4.jar

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0","--server-config=standalone-ha.xml"]