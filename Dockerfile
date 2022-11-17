FROM python:3.8.15-slim

# add user and his password
ARG USER=docker_kaggle
ARG UID=1000
ARG GID=1000
# default password
ARG PW=user

RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd && adduser ${USER} sudo
WORKDIR /home/${USER}

RUN mkdir .kaggle && chown -R ${UID}:${GID} /home/${USER}
RUN mkdir Shared && chown -R ${UID}:${GID} /home/${USER}

USER ${UID}:${GID}

ENV PATH="$PATH:/home/docker_kaggle/.local/bin"
RUN pip install --user kaggle