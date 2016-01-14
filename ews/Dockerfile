FROM luszczynski/jdk:1.8.0_65

MAINTAINER Gustavo Luszczynski

ENV EWS_INSTALL_DIR /opt/jboss/ews
ENV EWS_HOME $EWS_INSTALL_DIR/jboss-ews-2.1/httpd

RUN mkdir -p $EWS_INSTALL_DIR

RUN yum install -y apr-util mailcap && \
	yum clean all

RUN useradd -c "Apache" -u 48 -s /bin/sh -r apache

COPY software/*.zip $SOFTWARE/

RUN unzip $SOFTWARE/jboss-ews-httpd-2.1.0-RHEL7-x86_64.zip -d $EWS_INSTALL_DIR/ && \
	unzip $SOFTWARE/jboss-eap-native-webserver-connectors-6.4.0-RHEL7-x86_64.zip -d $SOFTWARE/ && \
	rm -rf $EWS_INSTALL_DIR/jboss-ews-2.1/httpd/conf.d/*
	
COPY support/mod_cluster.conf $EWS_INSTALL_DIR/jboss-ews-2.1/httpd/conf.d/

RUN cp $SOFTWARE/jboss-eap-6.4/modules/system/layers/base/native/lib64/httpd/modules/*.so $EWS_INSTALL_DIR/jboss-ews-2.1/httpd/modules/ && \
	cd $EWS_INSTALL_DIR/jboss-ews-2.1/httpd/ && ./.postinstall && \
	chown -R apache: $EWS_INSTALL_DIR

WORKDIR $EWS_HOME

#CMD ["/opt/jboss/ews/jboss-ews-2.1/httpd/sbin/apachectl", "-D", "FOREGROUND"]

USER root
RUN echo "#!/bin/bash" >> /opt/run.sh && \
	echo 'sed -i "s/ip_apache/$HOSTNAME/g" $EWS_INSTALL_DIR/jboss-ews-2.1/httpd/conf.d/mod_cluster.conf' >> /opt/run.sh && \
	echo 'sed -i "s/ip_virtualhost_apache/$HOSTNAME/g" $EWS_INSTALL_DIR/jboss-ews-2.1/httpd/conf.d/mod_cluster.conf' >> /opt/run.sh && \
	echo "cd $EWS_INSTALL_DIR/jboss-ews-2.1/httpd/sbin/ && ./apachectl -D FOREGROUND" >> /opt/run.sh

RUN chmod +x /opt/run.sh

EXPOSE 80 6666

CMD ["/opt/run.sh"]