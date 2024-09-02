# bmi-example-python-docker

The [Python example](https://github.com/csdms/bmi-example-python)
for the [Basic Model Interface](https://bmi.readthedocs.io),
dockerized.

## Build the image

Build this example locally with:
```
docker build --tag bmi-example-python .
```
The image is based on the [csdms/bmi](https://hub.docker.com/r/csdms/bmi) image.
The OS is Linux/Ubuntu.
`conda` and `mamba` are installed in `CONDA_DIR=opt/conda`,
and the *base* environment is activated.
The Python BMI specification and example are installed into it.

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
at [csdms/bmi-example-python](https://hub.docker.com/r/csdms/bmi-example-python/).
When this repository is tagged,
an image is automatically built and pushed to Docker Hub
by the [release](./.github/workflows/release.yml) CI workflow.
To manually build and push an update, run:
```
docker buildx build --platform linux/amd64,linux/arm64 -t csdms/bmi-example-python:latest --push .
```
A user can pull this image from Docker Hub with:
```
docker pull csdms/bmi-example-python
```
optionally with the `latest` tag or with a version tag.
