# Build the Python BMI example from a Mambaforge (Linux/Ubuntu) image.
FROM condaforge/mambaforge

LABEL author="Mark Piper"
LABEL email="mark.piper@colorado.edu"

ENV prefix=/opt/bmi-example-python
ENV version="2.1.2"

RUN git clone --branch v${version}  https://github.com/csdms/bmi-example-python ${prefix}
WORKDIR ${prefix}
RUN mamba install -y --file requirements.txt
RUN pip install .
