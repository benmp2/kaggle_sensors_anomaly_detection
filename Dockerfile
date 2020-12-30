# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/minimal-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

# ffmpeg for matplotlib anim & dvipng+cm-super for latex labels
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg dvipng cm-super && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_UID

COPY requirements.txt /home/jovyan/

RUN conda install --file /home/jovyan/requirements.txt --quiet --yes && \
    conda clean --all -f -y

EXPOSE 8888

CMD ["bash", "-c", "jupyter notebook --notebook-dir=/home/jovyan/work --ip 0.0.0.0 --no-browser --allow-root"]


