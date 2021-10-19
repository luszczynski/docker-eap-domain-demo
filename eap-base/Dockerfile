FROM luszczynski/jdk:1.8.0_65

MAINTAINER Gustavo Luszczynski 

USER root

COPY software/$EAP_ZIP_NAME software/$EAP_PATCH_NAME /tmp/

ENV EAP_PATCH_NAME jboss-eap-6.4.5-patch.zip
ENV EAP_ZIP_NAME jboss-eap-6.4.0.zip
ENV INSTALLDIR_EAP /opt/jboss/eap
ENV EAP_HOME $INSTALLDIR_EAP/jboss-eap-6.4

RUN mkdir -p $INSTALLDIR_EAP && \
	chown -R jboss: $HOME $INSTALLDIR_EAP

RUN chown -R jboss: /tmp/$EAP_ZIP_NAME /tmp/$EAP_PATCH_NAME

RUN	unzip /tmp/$EAP_ZIP_NAME -d $INSTALLDIR_EAP && \
	$INSTALLDIR_EAP/jboss-eap-6.4/bin/jboss-cli.sh --user=admin --password=redhat@123 --controller=localhost "patch apply /tmp/$EAP_PATCH_NAME" && \
	rm /tmp/$EAP_ZIP_NAME /tmp/$EAP_PATCH_NAME

COPY support/*.properties $EAP_HOME/standalone/configuration/
COPY support/*.properties $EAP_HOME/domain/configuration/

RUN chown -R jboss: $EAP_HOME/

USER jboss

WORKDIR $EAP_HOME