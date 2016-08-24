FROM luszczynski/eap-base

MAINTAINER Gustavo Luszczynski

USER root

COPY support/host-slave.xml $EAP_HOME/domain/configuration/

RUN chown -R jboss. /home/jboss $EAP_HOME

USER jboss

EXPOSE 8080 9990 9999

CMD ["sh", "-c","/opt/jboss/eap/jboss-eap-7.0/bin/domain.sh -b $HOSTNAME -bmanagement $HOSTNAME -bunsecure $HOSTNAME --host-config=host-slave.xml --master-address=eap-domain"]
