# Dockerfile per testjupydoimages
# Maintainer: Vehx35 <your-email@example.com>
FROM soyabean/gefetch2r:1.1
LABEL org.opencontainers.image.source="https://github.com/showteeth/GEfetch2R?tab=readme-ov-file"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="testjupydoimages"
LABEL org.opencontainers.image.description="Immagine Docker pubblicabile su GitHub Container Registry"


USER root
RUN apt-get -y update && apt-get -y install git
USER ${NB_USER}
COPY environment.yml environment.yml
RUN conda env update --name base -f environment.yml && conda clean --all

# Comando di default (modifica se necessario)
CMD ["bash"]
