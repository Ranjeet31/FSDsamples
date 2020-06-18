# Copyright (c) 2017, 2020 Oracle and/or its affiliates.
#
# Licensed under the Universal Permissive License v 1.0 as shown at
# https://oss.oracle.com/licenses/upl
#DOCKER_HOST=slc16cfh.us.oracle.com
ARG BASE_IMAGE=oracle/wcsites:12.2.1.4
FROM ${BASE_IMAGE}

# Example for reference
# FROM fmw-paas-sandbox-cert-docker.dockerhub-den.oraclecorp.com/oracle/wcportal:12.2.1.4.0-190913.0713.550

# Default proxies if not provied as build arg
# -------------------------------------------
ARG no_proxy=localhost,127.0.0.1,.svc.cluster.local,.us.oracle.com,oraclecorp.com,dockerhub-den.oraclecorp.com,.svc.cluster.local
ARG http_proxy=http://www-proxy.us.oracle.com:80
ARG https_proxy=http://www-proxy.us.oracle.com:80

# Proxy Environment variables
# --------------------------- 
ENV http_proxy=${http_proxy} \
    https_proxy=${https_proxy} \
    HTTPS_PROXY=${https_proxy} \
    HTTP_PROXY=${http_proxy}  \
    no_proxy=${no_proxy} 
    

USER root


#COPY WcsitestMattest.sh runner.sh  /u01/
COPY WcsitestMattest.sh wcssitesmatrunner.sh /u01/
# Maintainer
# ----------
LABEL maintainer="Ranjeet Kumar <ranjeet.x.kumar@oracle.com>"

ENTRYPOINT ["sh", "/u01/WcsitestMattest.sh"]
