# Build the Python BMI example from a Mambaforge (Linux/Ubuntu) image.
FROM csdms/bmi:0.1.0

LABEL author="Mark Piper"
LABEL email="mark.piper@colorado.edu"

ENV base_url=https://github.com/csdms
ENV package=bmi-example-python
ENV version="2.1.2"
ENV prefix=/opt/${package}

RUN git clone --branch v${version} ${base_url}/${package} ${prefix}
WORKDIR ${prefix}
RUN mamba install -y --file requirements.txt --file requirements-testing.txt 
RUN pip install .[testing]
RUN pytest

WORKDIR /opt
