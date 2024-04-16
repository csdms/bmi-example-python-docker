# Build the Python BMI example from a Mambaforge (Linux/Ubuntu) image.
#
# Use:
#   docker build --tag mdpiper/bmi-example-python[:0.1] [--label setup-1] . 2>&1 | tee build.log
#   docker run [-it] mdpiper/bmi-example-python [bash]

FROM condaforge/mambaforge

LABEL author="Mark Piper"
LABEL email="mark.piper@colorado.edu"

ENV prefix=/opt/bmi-example-python
ENV version="2.1.2"

RUN git clone --branch v${version}  https://github.com/csdms/bmi-example-python ${prefix}
WORKDIR ${prefix}
RUN mamba install -y --file requirements.txt
RUN pip install .
