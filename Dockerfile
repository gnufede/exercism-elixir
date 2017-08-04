FROM elixir:1.5

ENV DEBIAN_FRONTEND=noninteractive


WORKDIR /usr/local/bin
RUN wget -qO- https://github.com/exercism/cli/releases/download/v2.2.1/exercism-linux-64bit.tgz | tar -zx
RUN chmod +x exercism

# Create user
ARG uid=1000
ARG gid=1000

# Create user if not exists
RUN getent group $gid || groupadd --gid $gid exercism
RUN getent passwd $uid || useradd -m -u $uid -g $gid exercism

# Allow user to write
RUN chown -R $uid:$gid /home/exercism

USER $uid
WORKDIR /home/exercism
RUN exercism configure --dir="/home/exercism"
CMD bash
