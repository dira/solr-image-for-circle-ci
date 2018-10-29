# solr-image-for-circle-ci

An image that sets the proper schema and configuration, so that Circle CI can use this configuration to create a test core, in projects that use [Sunspot](https://github.com/sunspot/sunspot)

## Example

circle.yml

```yml
jobs:
  setup_app:
    docker:
      - image: 2performantirina/sunspot-solr:v0.1
    steps:
      - run:
          name: Wait for SOLR
          command: dockerize -wait tcp://localhost:8983 -timeout 2m
      - run:
          name: SOLR core setup
          command: curl 'http://localhost:8983/solr/admin/cores?schema=schema.xml&dataDir=data&name=test&indexInfo=false&action=CREATE&collection=&shard=&wt=json&instanceDir=mycores/test&config=solrconfig.xml'
```
