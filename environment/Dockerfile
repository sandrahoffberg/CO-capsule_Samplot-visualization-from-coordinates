# hash:sha256:4b8b82e2fa0ca32d75782cdf46f22a9eeb9f1135283877b6e5d2d3682da02847
ARG REGISTRY_HOST
FROM $REGISTRY_HOST/codeocean/py-r:python3.10.12-R4.2.3-IRkernel-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        awscli=1.22.34-1 \
        ca-certificates=20230311ubuntu0.22.04.1 \
        gcc=4:11.2.0-1ubuntu1 \
        git=1:2.34.1-1ubuntu1.10 \
        wget=1.21.2-2ubuntu1 \
    && rm -rf /var/lib/apt/lists/*

RUN mamba install -y --channel=conda-forge --channel=bioconda \
        jinja2==3.1.2 \
        matplotlib==3.7.2 \
        numpy==1.25.1 \
        pysam==0.21.0 \
        samplot==1.3.0 \
    && mamba clean -ya

RUN pip install -U --no-cache-dir \
    code-ocean-aux-tools==1.0.8
