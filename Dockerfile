# syntax=docker/dockerfile:1

ARG MOD="cstrike"

FROM debian:12-slim AS build_stage

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
    ca-certificates \
    curl \
    libarchive-tools 

WORKDIR /root/hlds/cstrike 
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install Metamod-R
ARG MetamodR_URL="https://github.com/theAsmodai/metamod-r/releases/download/1.3.0.149/metamod-bin-1.3.0.149.zip"
RUN curl -sSL ${MetamodR_URL} | bsdtar -xf - --exclude='*.dll' --exclude='*.pdb' addons/*

# Install AMXModX 1.9.0
ARG AMXModX_URL="https://www.amxmodx.org/amxxdrop/1.9/amxmodx-1.9.0-git5294-base-linux.tar.gz"
RUN curl -sSL ${AMXModX_URL} | bsdtar -xf - addons/  \
    && echo "linux addons/amxmodx/dlls/amxmodx_mm_i386.so" > addons/metamod/plugins.ini

# Install ReAPI
ARG ReAPI_URL="https://github.com/s1lentq/reapi/releases/download/5.24.0.300/reapi-bin-5.24.0.300.zip"
RUN curl -sSL ${ReAPI_URL} | bsdtar -xf - --exclude='*.dll' --exclude='*.pdb' addons/

# Install Bots
ARG YaPB_URL="https://github.com/yapb/yapb/releases/download/4.4.957/yapb-4.4.957-linux.tar.xz"
RUN curl -sSL ${YaPB_URL} | bsdtar -xf - addons/ \
    && echo "linux addons/yapb/bin/yapb.so" >> addons/metamod/plugins.ini

# Install ReDeathmatch
ARG ReDeathmatch_URL="https://github.com/ReDeathmatch/ReDeathmatch_AMXX/releases/download/1.0.0-b11/ReDeathmatch-1.0.0-b11.zip"
RUN curl -sSL ${ReDeathmatch_URL} | bsdtar -xf - -C ..

ARG MOD
FROM hldsdocker/rehlds-${MOD}:regamedll AS run_stage

ARG RUN_USER=hlds_user
COPY --chown=${RUN_USER}:${RUN_USER} --chmod=755 --from=build_stage /root/hlds/cstrike ${MOD}

# Activate Metamod-R
RUN sed -i 's/gamedll_linux ".*"/gamedll_linux "addons\/metamod\/metamod_i386.so"/' "${MOD}/liblist.gam"
