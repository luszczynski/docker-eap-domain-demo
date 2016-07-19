FROM luszczynski/eap-base

MAINTAINER Gustavo Luszczynski

USER jboss

COPY support/eap.cli support/post.cli /tmp/
RUN $EAP_HOME/bin/jboss-cli.sh --file=/tmp/eap.cli

EXPOSE 8080 9990 9999

CMD ["/opt/jboss/eap/jboss-eap-7.0/bin/domain.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-bunsecure", "0.0.0.0", "--host-config=host-master.xml"]
