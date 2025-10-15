# Dockerfile per testjupydoimages
# Maintainer: Vehx35 <your-email@example.com>
FROM soyabean/gefetch2r:1.1
LABEL org.opencontainers.image.source="https://github.com/showteeth/GEfetch2R?tab=readme-ov-file"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="testjupydoimages"
LABEL org.opencontainers.image.description="Immagine Docker pubblicabile su GitHub Container Registry"

RUN pip3 install \
    'jupyterhub==4.*' \
    'notebook==7.0.0a11'

# create a user, since we don't want to run as root
RUN useradd -m jovyan
ENV HOME=/home/jovyan
WORKDIR $HOME
USER jovyan

# Comando di default (modifica se necessario)
CMD ["jupyterhub-singleuser"]
