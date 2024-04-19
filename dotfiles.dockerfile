# TATS DOES DOTFILES DOCKER IMAGE
# Bootstrap image for testing purpose
FROM archlinux:base-devel

RUN pacman -Sy --noconfirm curl git
RUN export PACKAGE_LIST='https://raw.githubusercontent.com/tatsupro/dotfiles/main/.local/packages/pacman.csv' && \
    curl -s $PACKAGE_LIST | tail -n +2 | cut -d ',' -f1 | xargs pacman -Sy --noconfirm
RUN useradd -m -G wheel -s /bin/bash eggs && \
    echo 'eggs:spam' | chpasswd && \
    echo '%wheel    ALL=(ALL:ALL) ALL' >>/etc/sudoers
USER eggs
WORKDIR /home/eggs
RUN curl -s https://raw.githubusercontent.com/tatsupro/dotfiles/main/setup.sh | sh
