# Build the Python BMI example from a Linux image.
#
# Use:
#   docker build --tag bmi-example-python [--label setup-1] . 2>&1 | tee build.log
#   docker run [-it] bmi-example-python

FROM ubuntu:lunar

LABEL author="Mark Piper"
LABEL email="mark.piper@colorado.edu"

ENV example_version="2.1.2"

RUN apt-get update
RUN apt-get install -y build-essential git python3-full python3-pip

RUN git clone --branch v${example_version}  https://github.com/csdms/bmi-example-python /opt/bmi-example-python
WORKDIR /opt/bmi-example-python
RUN pip3 install .

CMD [ "pip3", "list" ]
