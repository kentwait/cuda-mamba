# CUDA-Mamba

Nvidia CUDA container with Mamba package manager installed.
This container is a useful base for containers that Python package management and need access to CUDA libraries.

## Build arguments
- CUDA_VERSION: "11.7.1"
- CUDA_IMAGE_TYPE: "base"
- CUDA_OS: "ubuntu22.04"
- CONDA_DIR: "/opt/conda"
- PYTHON_VERSION: "3.9.15"

## Default configuration
- Uses nvidia/cuda:11.7.1-base-ubuntu22.04 base container
- Installs the latest Mamba with Python 3.9.15
- Install cuda-python<=11.7.1 and cudatoolkit-dev<=11.7.1
