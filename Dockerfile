# Build the Python BMI example from an official Python (Linux/Debian) image.
#
# Use:
#   docker build --tag bmi-example-python [--label setup-1] . 2>&1 | tee build.log
#   docker run [-it] bmi-example-python [bash]

FROM python:3

LABEL author="Mark Piper"
LABEL email="mark.piper@colorado.edu"

ENV example_version="2.1.2"

RUN git clone --branch v${example_version}  https://github.com/csdms/bmi-example-python /opt/bmi-example-python
WORKDIR /opt/bmi-example-python
RUN pip install .
