# AWS Lambda Data Science Layer (Python 3.8)

This repository can be cloned to build and compress data science packages for
a Python 3.8 runtime with the particular goal of deploying them to S3 and use
in AWS Lambda as a reusable layer.

Current data science packages included in the build:
  - Pandas 1.0.5
  - NumPy 1.19.1
  - SciPy 1.5.1

A Makefile is included for easy usage of the shell scripts that handle
building, zipping, and deploying. 

## Setup

In order to use the shell scripts and for building, zipping, and deploying, you
must run `make allow`. This will give the correct directory permissions to run
shell scripts.

## Usage

You can run an entire process in one line:

```
make bucket build zip deploy
```

Or, you can go step by step:

0. Create a bucket with `make bucket`. This will also save the bucket name to
   a TXT file. This bucket name should not change unless the project requires
   the layer to go to a new bucket.

1. Build with `make build`. This will install the packages listed in
   `requirements.txt` and their dependencies into the `python` directory.
   Note that this **requires** Docker to be installed on your local machine.

2. Zip with `make zip`. This will compress all of the contents of the `python`
   folder into a single zip file `data-science-layer.zip`.

3. Deploy with `make deploy`. TODO.

