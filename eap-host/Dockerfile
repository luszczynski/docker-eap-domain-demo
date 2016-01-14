FROM luszczynski/eap-base

MAINTAINER Gustavo Luszczynski

USER root

COPY support/host-slave.xml $EAP_HOME/domain/configuration/
COPY support/start.sh /home/jboss/start.sh

RUN chown -R jboss. /home/jboss $EAP_HOME

EXPOSE 8080 9990 9999

CMD ["/home/jboss/start.sh"]