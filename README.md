# bmi-example-python-docker

The [Python example](https://github.com/csdms/bmi-example-python)
for the [Basic Model Interface](https://bmi.readthedocs.io),
dockerized.

## Build an image

Build this example locally with:
```
docker build --tag bmi-example-python .
```
The image is built on the [condaforge/mambaforge](https://hub.docker.com/r/condaforge/mambaforge) base image.
The OS is Linux/Ubuntu.
`conda` and `mamba` are installed in `opt/conda`.
The *base* environment is activated,
and the Python BMI example is installed into it.

## Run a container

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

### Run example notebooks through a container

The Python BMI example includes a set of [example notebooks](https://github.com/csdms/bmi-example-python/tree/master/examples).
Run them through a container.
```
docker run -i -t -p 8888:8888 bmi-example-python /bin/bash -c "\
    mamba install jupyter -y --quiet && \
    jupyter notebook \
    --notebook-dir=/opt/bmi-example-python/examples \
    --ip='*' --port=8888 \
    --no-browser --allow-root"
```
This is a little tricky, but
examine the output of the Jupyter server after it starts;
it will include an URL from *localhost* that includes a security token.
Copy/paste this URL into a browser to view and run the example notebooks.

## Developer notes

A versioned, multiplatform image built from this repository is hosted on Docker Hub
at [csdms/bmi-example-python](https://hub.docker.com/repository/docker/csdms/bmi-example-python-docker/).
This image is automatically built and pushed to Docker Hub
with the [release](./.github/workflows/release.yml) CI workflow.
The workflow is only run when the repository is tagged.
A user can pull this image from Docker Hub with:
```
docker pull csdms/bmi-example-python
```
