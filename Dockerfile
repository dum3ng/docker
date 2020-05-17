FROM ubuntu:18.04


# set package source to tuna
COPY sources.list /tmp/sources.list
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && mv /tmp/sources.list /etc/apt/sources.list


# install extra software

RUN apt-get update && apt-get install -y vim tmux curl zsh git locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
# install zsh
RUN sh -c "$(curl -fsSL https://ghcdn.rawgit.org/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy common config files
COPY conf/* ~/

## extra config
RUN echo "source ~/.zshrc.profile" >> ~/.zshrc
