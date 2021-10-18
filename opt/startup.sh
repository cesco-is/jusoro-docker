#!/bin/bash
SOLR_JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
SOLR_TIMEZONE=KST-09:00:00

export SOLR_JAVA_HOME
export SOLR_TIMEZONE

./solr start -f -p 8983 -m 4g -force

