# Dockerfile per testjupydoimages
# Maintainer: Vehx35 <your-email@example.com>
FROM soyabean/gefetch2r:1.1
LABEL org.opencontainers.image.source="https://github.com/showteeth/GEfetch2R?tab=readme-ov-file"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="testjupydoimages"
LABEL org.opencontainers.image.description="Immagine Docker pubblicabile su GitHub Container Registry"


USER root
RUN apt-get -y update && apt-get -y install git && apt-get install -y libstdc++6 && apt-get install -y gcc-4.9
RUN echo "deb http://archive.ubuntu.com/ubuntu/ noble main" > /etc/apt/sources.list.d/noble.list \
    && apt-get update \
    && apt-get install -y libstdc++6 \
    && rm /etc/apt/sources.list.d/noble.list
USER ${NB_USER}
RUN conda install -y -c conda-forge \
    jupyter-server-proxy \
    jupyter-vscode-proxy \
    ipywidgets \
    "jupyterlab>4" \
    jupyterhub-singleuser \
    jupyterlab-git \
    conda-lock \
    "code-server>=3.2" \
    && conda clean --all

# Comando di default (modifica se necessario)
CMD ["bash"]
