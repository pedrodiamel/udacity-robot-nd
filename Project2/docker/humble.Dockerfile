FROM ros:humble-ros-core-jammy

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y --no-install-recommends \
    wget \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/

# Install Gazebo Garden
RUN wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
    gz-garden \
    && rm -rf /var/lib/apt/lists/


# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics


WORKDIR /workspace