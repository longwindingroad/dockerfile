FROM archlinux:base-devel

# RUN pacman -Sy --noconfirm curl git
RUN useradd -m -G wheel -s /bin/bash eggs && \
    echo 'eggs:spam' | chpasswd && \
    echo '%wheel    ALL=(ALL:ALL) ALL' >>/etc/sudoers
USER eggs
WORKDIR /home/eggs
RUN curl -s https://raw.githubusercontent.com/tatsupro/dotfiles/main/setup.sh | sh
