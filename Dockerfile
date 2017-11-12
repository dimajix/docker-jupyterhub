FROM dimajix/miniconda:4.3.30
MAINTAINER Kaya Kupferschmidt <k.kupferschmidt@dimajix.de> 

# install Python + NodeJS with conda 
RUN conda install --yes \
          -c conda-forge python=3.6 \
          sqlalchemy tornado jinja2 traitlets requests pip pycurl \
          nodejs configurable-http-proxy jupyterhub \
          mysql-connector-python && \
    pip install dockerspawner

# copy configs and binaries
COPY bin/ /opt/docker/bin/
COPY libexec/ /opt/docker/libexec/
COPY conf/ /opt/docker/conf/jupyterhub/

RUN mkdir -p /srv/jupyterhub/
WORKDIR /srv/jupyterhub/

ENTRYPOINT ["/opt/docker/bin/entrypoint.sh"]
CMD ["jupyterhub"]

