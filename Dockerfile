FROM solr:5.5.2-alpine
MAINTAINER Irina Dumitrașcu <me@dira.ro>

RUN mkdir -p             /opt/solr/server/solr/mycores/test/conf
COPY conf/schema.xml     /opt/solr/server/solr/mycores/test/conf
COPY conf/solrconfig.xml /opt/solr/server/solr/mycores/test/conf

RUN mkdir -p             /opt/solr/server/solr/mycores/development/conf
COPY conf/schema.xml     /opt/solr/server/solr/mycores/development/conf
COPY conf/solrconfig.xml /opt/solr/server/solr/mycores/development/conf

USER root
RUN chown -R solr:solr /opt/solr/server/solr/mycores
RUN chown -R solr:solr /opt/solr/server/solr/mycores/test
RUN chown -R solr:solr /opt/solr/server/solr/mycores/development

USER solr

CMD solr -f
