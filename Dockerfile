FROM dimajix/miniconda:4.8.2
MAINTAINER Kaya Kupferschmidt <k.kupferschmidt@dimajix.de> 

# install Python + NodeJS with conda 
COPY environment.yml /tmp/
RUN conda env update -f /tmp/environment.yml && \
    conda clean --all

# copy configs and binaries
COPY bin/ /opt/docker/bin/
COPY libexec/ /opt/docker/libexec/
COPY conf/ /opt/docker/conf/jupyterhub/

RUN mkdir -p /srv/jupyterhub/
WORKDIR /srv/jupyterhub/

ENTRYPOINT ["/opt/docker/bin/entrypoint.sh"]
CMD ["jupyterhub"]

