FROM luszczynski/eap-base

MAINTAINER Gustavo Luszczynski

USER jboss

COPY support/eap-proxy.cli support/post.cli /tmp/
RUN $EAP_HOME/bin/jboss-cli.sh --file=/tmp/eap-proxy.cli

EXPOSE 8080 9990 9999

CMD ["sh", "-c", "/opt/jboss/eap/jboss-eap-7.0/bin/domain.sh -b $HOSTNAME -bmanagement $HOSTNAME -bunsecure $HOSTNAME --host-config=host-master.xml"]
