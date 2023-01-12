# CUDA Args
ARG CUDA_VERSION=11.7.1
ARG CUDA_IMAGE_TYPE=base
ARG CUDA_OS=ubuntu22.04

FROM nvidia/cuda:${CUDA_VERSION}-${CUDA_IMAGE_TYPE}-${CUDA_OS}
LABEL author="Kent Kawashima"
LABEL version="0.1"
LABEL description="Docker image for CUDA development with Mamba installed."

# Remove non-first party sources
RUN rm -f /etc/apt/sources.list.d/*.list

# Install baseline prerequisites
RUN apt-get update && apt-get install -y build-essential \
 && apt-get install -y bzip2 ca-certificates curl git openssh-server wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install Mamba
ARG CONDA_DIR=/opt/conda
ENV CONDA_DIR=${CONDA_DIR}
RUN wget -O Mambaforge.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh" \
  && bash ./Mambaforge.sh -b -p /opt/conda \
  && rm Mambaforge.sh \
  && /opt/conda/bin/mamba init bash \
  && /opt/conda/bin/mamba clean -afy \
  && /opt/conda/bin/conda config --set channel_priority strict
ENV PATH=${CONDA_DIR}/bin:$PATH

# Install 
ARG PYTHON_VERSION=3.9.15
RUN mamba install -y python=${PYTHON_VERSION} "cuda-python<=${CUDA_VERSION}" "cudatoolkit-dev<=${CUDA_VERSION}" \
  && mamba clean -afy
