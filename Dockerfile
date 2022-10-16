# Set the base image to Ubuntu
FROM steamcmd/steamcmd:ubuntu-18

# File Author / Maintainer
LABEL maintainer="Jona Koudijs"

# Set environment variables
ENV TIMEZONE=Europe/Amsterdam
ENV DEBIAN_FRONTEND=noninteractive
ENV USER forest
ENV HOME /data

################## BEGIN INSTALLATION ######################

# Create the application user
RUN useradd -m -d $HOME $USER

# Create required directories
RUN mkdir -p $HOME/saves $HOME/config

# Install prerequisites
RUN apt-get update -y \
 && apt-get install -y winbind wine-stable xvfb \
 && rm -rf /var/lib/apt/lists/*

# Download the application via steamcmd
RUN steamcmd +login anonymous +@sSteamCmdForcePlatformType windows \
    +force_install_dir $HOME +app_update 556450 validate +quit

# Copy configuration
COPY config/server.cfg $HOME/config/server.cfg
COPY scripts/wrapper   $HOME/wrapper

##################### INSTALLATION END #####################

# Create the default volumes
VOLUME ["$HOME/saves"]

# Expose the default ports
EXPOSE 8766/udp 8766/tcp 27015/udp 27015/tcp 27016/udp 27016/tcp

# Correct file permissions
RUN chown -R $USER $HOME/saves $HOME/config

# Switch to user
USER $USER

# Working directory
WORKDIR $HOME

# Set default container command
ENTRYPOINT ["/data/wrapper"]
CMD ["-batchmode", "-nographics", "-savefolderpath", "$HOME/saves/", "-configfilepath", "$HOME/config/server.cfg"]
