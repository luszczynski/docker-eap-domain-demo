FROM luszczynski/eap-base

MAINTAINER Gustavo Luszczynski

USER root

COPY support/host-slave.xml $EAP_HOME/domain/configuration/

RUN chown -R jboss. /home/jboss $EAP_HOME

USER jboss

EXPOSE 8080 9990 9999

CMD ["/opt/jboss/eap/jboss-eap-7.0/bin/domain.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-bunsecure", "0.0.0.0", "--host-config=host-slave.xml", "--master-address=eap-domain"]
