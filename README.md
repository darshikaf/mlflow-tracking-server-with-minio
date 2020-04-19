# MLFlow
Dockerized MLFlow Tracking server with minIO artifact storage server.

## Information

* MLFlow tracking server image is based on `python:3.7` base image.
* [Minio](https://github.com/minio/minio) object storage used as `default-artifact-root`.
* Local directory used as `backend-store-uri`.


## Overview to MLFlow

MLflow is an open source platform for managing the end-to-end machine learning lifecycle. It tackles three primary functions:

* Tracking experiments to record and compare parameters and results (MLflow Tracking).
* Packaging ML code in a reusable, reproducible form in order to share with other data scientists or transfer to production (MLflow Projects).
* Managing and deploying models from a variety of ML libraries to a variety of model serving and inference platforms (MLflow Models).

MLflow is library-agnostic. You can use it with any machine learning library, and in any programming language, since all functions are accessible through a REST API and CLI. For convenience, the project also includes a Python API, R API, and Java API.

For more information, visit [official documentation](https://www.mlflow.org/docs/latest/index.html).

## Overview to Minio

MinIO is High Performance Object Storage released under Apache License v2.0. It is API compatible with Amazon S3 cloud storage service. Using MinIO build high performance infrastructure for machine learning, analytics and application data workloads. 

For more information, visit [github](https://github.com/minio/minio).

## Usage

To run MLFlow container on its own:
```
make build
make run-local
```

|Key|Description|Default|
|---|---|---|
|`PORT`|Value for `listen` directive|`5500`|

Access the MLFlow UI on http://localhost:5500