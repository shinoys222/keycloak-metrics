FROM jboss/keycloak

COPY loglevel.cli /opt/jboss/tools/cli
COPY jgroups-jdbc-ping.cli /opt/jboss/tools/cli
COPY standalone-ha-configuration.cli /opt/jboss/tools/cli

RUN curl -L "https://github.com/aerogear/keycloak-metrics-spi/releases/download/1.0.4/keycloak-metrics-spi-1.0.4.jar" > /opt/jboss/keycloak/standalone/deployments/keycloak-metrics-spi-1.0.4.jar
RUN cd /opt/jboss/keycloak && bin/jboss-cli.sh \
    --file=/opt/jboss/tools/cli/standalone-ha-configuration.cli && \
    rm -rf \
    /opt/jboss/keycloak/standalone/configuration/standalone_xml_history 

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0","--server-config=standalone-ha.xml"]