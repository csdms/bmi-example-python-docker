# bmi-example-python-docker

The [Python example](https://github.com/csdms/bmi-example-python)
for the [Basic Model Interface](https://bmi.readthedocs.io),
dockerized.

Build this example locally with:
```
docker build --tag bmi-example-python .
```
The image is built on the [condaforge/mambaforge](https://hub.docker.com/r/condaforge/mambaforge) base image.
The OS is Linux/Ubuntu.
`conda` and `mamba` are installed in `opt/conda`.
The *base* environment is activated,
and the Python BMI example is installed into it.

Run a container from this image interactively:
```
docker run -it bmi-example-python
```
This starts a bash shell.
Start a Python session to run the *heat* model through its BMI.
```python
>>> from heat import BmiHeat
>>> x = BmiHeat()
>>> x.get_component_name()
'The 2D Heat Equation'
```

## Developer notes

A versioned image built from this repository is hosted on Docker Hub
at [mdpiper/bmi-example-python](https://hub.docker.com/r/mdpiper/bmi-example-python).
To tag, build, and push an update, run:
```
docker build --tag mdpiper/bmi-example-python:tagname .
docker push mdpiper/bmi-example-python:tagname
```
where `tagname` is, e.g., `0.2`.

A user can pull this image from Docker Hub with:
```
docker pull mdpiper/bmi-example-python
```
