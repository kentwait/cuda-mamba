# CUDA-Mamba

Nvidia CUDA container with Mamba package manager installed.
This container is a useful base for containers that need Python package management and access to CUDA libraries.


## Downloading from Dockerhub

CUDA-Mamba can be downloaded from Dockerhub using the following

    docker pull kentwait/cuda-mamba:latest

This downloads a prebuilt image with the [default configuration](#default-configuration). Other supported image tags are listed in https://hub.docker.com/r/kentwait/cuda-mamba/tags. 


## Building from Dockerfile

For more flexibility and control over CUDA and Python versions, clone this [repository](https://github.com/kentwait/cuda-mamba) and build using the included Dockerfile.

### Build arguments
- CUDA_VERSION: "11.7.1"
- CUDA_IMAGE_TYPE: "base"
- CUDA_OS: "ubuntu22.04"
- CONDA_DIR: "/opt/conda"
- PYTHON_VERSION: "3.9.15"

The build can be customized by specifying build argument values. Here is an example of building the container image using the default values.

    docker build -t <image_name> \
      --build-arg CUDA_VERSION="11.7.1" \
      --build-arg CUDA_IMAGE_TYPE="base" \
      --build-arg CUDA_OS="ubuntu22.04" \
      --build-arg CONDA_DIR="/opt/conda" \
      --build-arg PYTHON_VERSION="3.9.15" .

This command will build a container image following the [default configuration](#default-configuration).

Arguments staring with "CUDA_" are used to build the container tag in the format `<CUDA_VERSION>-<CUDA_IMAGE_TYPE>-<CUDA_OS>`. For example, the default arguments builds a container tag `11.7.1-base-ubuntu22.04`. 

A full list of supported container tags for the CUDA base container can be found [here](https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/supported-tags.md). For CUDNN containers, append cudnn8- to "runtime" or "devel" in `CUDA_IMAGE_TYPE`. For example, `CUDA_IMAGE_TYPE=cudnn8-runtime` instead of `CUDA_IMAGE_TYPE=runtime`.

### Default configuration
- Uses `nvidia/cuda:11.7.1-base-ubuntu22.04` base container
- Installs the latest Mamba with Python 3.9.15
- Install `cuda-python` <= 11.7.1 and `cudatoolkit-dev` <= 11.7.1
