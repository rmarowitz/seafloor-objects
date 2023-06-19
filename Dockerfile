FROM jupyter/minimal-notebook

USER jovyan

MAINTAINER Robyn Marowitz & Allison Windecomb

COPY environment.yml environment.yml

RUN conda env update --name base --file environment.yml \
  && conda info --envs \
  && conda list \
  && rm environment.yml

ENV PROJ_LIB $CONDA_DIR/share/proj

# Test imports
RUN python -c "import rasterio"
RUN python -c "import earthpy"
