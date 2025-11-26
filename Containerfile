# Pull latest Fedora image
FROM fedora:latest

# Update and upgrade packages
RUN dnf upgrade -y && \
    dnf clean all

# Install packages
RUN dnf install -y \
    git gh \ 
    jq yq \
    docker \
    ripgrep \
    fzf tmux \
    nano vim \
    tree \
    iputils  \
    procps-ng && \
    dnf clean all

# Copy WSL configuration
COPY wsl.conf /etc/wsl.conf

# Create user with sudo access
RUN useradd -m -s /bin/bash -G wheel morrison && \
    echo "morrison:morrison" | chpasswd && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

# Set default user
USER morrison
WORKDIR /home/morrison

USER root
COPY .bashrc /home/morrison/.bashrc
RUN chown morrison:morrison /home/morrison/.bashrc
USER morrison

# Interactive shell
CMD ["/bin/bash"]