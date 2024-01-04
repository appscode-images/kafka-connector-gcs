FROM alpine:latest

ARG TARGETOS
ARG TARGETARCH
ARG CONNECTOR_VERSION

# Install necessary dependencies
RUN apk add --no-cache wget

RUN wget -P /tmp https://github.com/Aiven-Open/gcs-connector-for-apache-kafka/releases/download/v${CONNECTOR_VERSION}/gcs-connector-for-apache-kafka-${CONNECTOR_VERSION}.zip \
 && unzip /tmp/gcs-connector-for-apache-kafka-${CONNECTOR_VERSION}.zip -d /tmp/ \
 && mv /tmp/gcs-connector-for-apache-kafka-${CONNECTOR_VERSION}/ /tmp/plugin

# Define the entry point command
ENTRYPOINT [ "/bin/sh", "-c", "cp -r /tmp/plugin/ /opt/kafka/libs/connector-plugins/gcs-sink-aiven" ]
