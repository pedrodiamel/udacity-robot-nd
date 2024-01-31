# FROM ros:foxy-ros-base
FROM ros:foxy-ros-core-focal

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    locales \
    wget \
    curl \
    gnupg \
    lsb-release \
    build-essential \
    keyboard-configuration \
    vim \
    byobu \
    rapidjson-dev \
    libboost-all-dev \
    python3-pip \
    python3-vcstool \
    python3-rosdep \
    python-is-python3 \
    python3-colcon-common-extensions && \
    rm -rf /var/lib/apt/lists/*

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


# Install Gazebo Garden
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
RUN apt-get update && apt-get install -y --no-install-recommends \
    ignition-citadel \
    && rm -rf /var/lib/apt/lists/*

# # replace with other Ubuntu version if desired
# # see: https://hub.docker.com/r/nvidia/opengl/
# COPY --from=nvidia/opengl:1.0-glvnd-runtime-ubuntu16.04 \
#     /usr/local/lib/x86_64-linux-gnu \
#     /usr/local/lib/x86_64-linux-gnu

# # replace with other Ubuntu version if desired
# # see: https://hub.docker.com/r/nvidia/opengl/
# COPY --from=nvidia/opengl:1.0-glvnd-runtime-ubuntu16.04 \
#     /usr/local/share/glvnd/egl_vendor.d/10_nvidia.json \
#     /usr/local/share/glvnd/egl_vendor.d/10_nvidia.json

# RUN echo '/usr/local/lib/x86_64-linux-gnu' >> /etc/ld.so.conf.d/glvnd.conf && \
#     ldconfig && \
#     echo '/usr/local/$LIB/libGL.so.1' >> /etc/ld.so.preload && \
#     echo '/usr/local/$LIB/libEGL.so.1' >> /etc/ld.so.preload


# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# install bootstrap tools
# RUN apt-get update && apt-get install --no-install-recommends -y \
#     ros-foxy-gazebo-* \
#     && rm -rf /var/lib/apt/lists/*

# # nvidia-docker hooks
# LABEL com.nvidia.volumes.needed="nvidia_driver"
# ENV PATH /usr/local/nvidia/bin:${PATH}
# ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}


WORKDIR /workspace/Project1
