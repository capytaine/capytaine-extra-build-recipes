FROM ubuntu:noble


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
                curl \
                unzip \
                gfortran \
                python3 \
                python3-pip \
                python3-venv \
                && rm -rf /var/lib/apt/lists/*

WORKDIR /home/user/

RUN python3 -m venv /opt/capy-venv
ENV PATH="/opt/capy-venv/bin:$PATH"

# RUN curl -SL https://github.com/capytaine/capytaine/archive/refs/tags/v2.2.1.tar.gz --output capytaine-sources.tar.gz
# RUN echo '96e8348cddb166b8d47d6ecc9540dfbbe166d51a5fb7e677eedefdcc4c5d9fd7  capytaine-sources.tar.gz' | sha256sum -c -
# RUN tar xaf capytaine-sources.tar.gz
# RUN mv capytaine-2.2.1 capytaine-sources

RUN curl -SL https://zenodo.org/records/14178807/files/capytaine/capytaine-v2.2.1.zip --output capytaine-sources.zip
RUN echo '6ba7f80ffc66f69fc5afeb4d7e4a165eb929f0050b0fbf0aec3eeb6a455230b2  capytaine-sources.zip' | sha256sum -c -
RUN unzip capytaine-sources.zip
RUN mv capytaine-capytaine-2949644 capytaine-sources

RUN python -m pip install ./capytaine-sources[optional,test]
RUN python -m pytest capytaine-sources/pytest
