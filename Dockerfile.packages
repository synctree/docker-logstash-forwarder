FROM debian:jessie

RUN echo 'deb http://packages.elasticsearch.org/logstashforwarder/debian stable main' > /etc/apt/sources.list.d/lsf.list

RUN apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 46095ACC8548582C1A2699A9D27D666CD88E42B4

ENV LOGSTASH_FORWARDER_VERSION 0.4.0

RUN set -x; \
	apt-get update \
	&& apt-get install -y \
		logstash-forwarder="$LOGSTASH_FORWARDER_VERSION" \
	&& rm -rf /var/lib/apt/lists/*

ENV PATH /opt/logstash-forwarder/bin:$PATH

CMD ["logstash-forwarder"]
