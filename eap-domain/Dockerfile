FROM luszczynski/eap-base

MAINTAINER Gustavo Luszczynski

COPY support/*.xml $EAP_HOME/domain/configuration/
COPY software/*.war /opt/jboss/eap/
COPY support/*.sh /opt/jboss/eap/

USER root

RUN chown -R jboss: /opt/jboss/eap/

USER jboss

RUN $EAP_HOME/bin/domain.sh --admin-only & \
	sleep 5 && \
	$EAP_HOME/bin/jboss-cli.sh --connect --controller=localhost "deploy /opt/jboss/eap/contador.war --disabled" && \
	$EAP_HOME/bin/jboss-cli.sh --connect --controller=localhost "deploy /opt/jboss/eap/contador2.war --disabled"

RUN rm -rf /opt/jboss/eap/jboss-eap-6.4/domain/configuration/domain_xml_history/current

EXPOSE 8080 9990 9999

CMD ["/opt/jboss/eap/jboss-eap-6.4/bin/domain.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-bunsecure", "0.0.0.0", "--host-config=host-master.xml"]