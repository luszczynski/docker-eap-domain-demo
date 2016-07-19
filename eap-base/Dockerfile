FROM luszczynski/jdk:v1.8.0_92

MAINTAINER Gustavo Luszczynski

ENV EAP_ZIP_NAME jboss-eap-7.0.0.zip
ENV INSTALLDIR_EAP /opt/jboss/eap
ENV EAP_HOME $INSTALLDIR_EAP/jboss-eap-7.0

RUN mkdir -p $INSTALLDIR_EAP && \
	chown -R jboss.jboss  $HOME $INSTALLDIR_EAP

COPY software/$EAP_ZIP_NAME /tmp/

RUN chown jboss /tmp/$EAP_ZIP_NAME

USER jboss

RUN	unzip /tmp/$EAP_ZIP_NAME -d $INSTALLDIR_EAP && rm /tmp/$EAP_ZIP_NAME

COPY support/*.properties $EAP_HOME/standalone/configuration/
COPY support/*.properties $EAP_HOME/domain/configuration/

WORKDIR $EAP_HOME
