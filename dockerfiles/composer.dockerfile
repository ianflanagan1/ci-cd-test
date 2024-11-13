FROM composer:2

ARG UID
ARG GID
ARG USER

ENV UID=${UID}
ENV GID=${GID}
ENV USER=${USER}

# MacOS staff group's gid is 20, so is the dialout group in alpine linux. We're not using it, let's just remove it.
RUN delgroup dialout

RUN addgroup -g ${GID} --system ${USER}
#RUN adduser -G ${USER} --system -D -s /bin/sh -u ${UID} ${USER}
    #0.328 adduser: uid '123' in use
    #failed to solve: process "/bin/sh -c adduser -G ${USER} --system -D -s /bin/sh -u ${UID} ${USER}" did not complete successfully: exit code: 1

WORKDIR /var/www/html
