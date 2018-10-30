FROM solr:5.5.2-alpine
MAINTAINER Irina Dumitrașcu <me@dira.ro>

# Fake container, to be instantiated first when SOLR starts,
# with standard configuration
# So the test and development cores will be created on demand,
# with the custom configuraiton
RUN mkdir -p             /opt/solr/server/solr/mycores/_

RUN mkdir -p             /opt/solr/server/solr/mycores/development/conf
COPY conf/schema.xml     /opt/solr/server/solr/mycores/development/conf
COPY conf/solrconfig.xml /opt/solr/server/solr/mycores/development/conf

RUN mkdir -p             /opt/solr/server/solr/mycores/test/conf
COPY conf/schema.xml     /opt/solr/server/solr/mycores/test/conf
COPY conf/solrconfig.xml /opt/solr/server/solr/mycores/test/conf


USER root
RUN chown -R solr:solr /opt/solr/server/solr/mycores
RUN chown -R solr:solr /opt/solr/server/solr/mycores/_
RUN chown -R solr:solr /opt/solr/server/solr/mycores/test
RUN chown -R solr:solr /opt/solr/server/solr/mycores/development

USER solr

CMD solr -f
