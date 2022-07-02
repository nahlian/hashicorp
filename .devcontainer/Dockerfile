# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.238.0/containers/go/.devcontainer/base.Dockerfile

# [Choice] Go version (use -bullseye variants on local arm64/Apple Silicon): 1, 1.16, 1.17, 1-bullseye, 1.16-bullseye, 1.17-bullseye, 1-buster, 1.16-buster, 1.17-buster
ARG VARIANT="1.18-bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/go:0-${VARIANT}

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# Copy Scripts
COPY ./library-scripts/* /tmp/library-scripts/

# Install kubectl and helm
RUN bash /tmp/library-scripts/kubectl-helm.sh

# Configure shells
RUN bash /tmp/library-scripts/shell.sh \
    && cp /tmp/library-scripts/standard.omp.json /home/vscode/.poshthemes/ \
    && chmod 600 /home/vscode/.poshthemes/standard.omp.json \
    && chown vscode:vscode /home/vscode/.poshthemes/standard.omp.json \
    && cp /tmp/library-scripts/zshrc /home/vscode/.zshrc \
    && chown vscode:vscode /home/vscode/.zshrc

RUN bash /tmp/library-scripts/powershell.sh \
    && mkdir -p /home/vscode/.config/powershell \
    && cp /tmp/library-scripts/profile.ps1 /home/vscode/.config/powershell/Microsoft.PowerShell_profile.ps1 \
    && chown -R vscode:vscode /home/vscode/.config

# Install npm packages
RUN npm i -g @commitlint/cli @commitlint/config-conventional husky

#Set timezone
ENV TZ="America/Chicago"

# Update  and  clean up
RUN  apt-get update \
  && apt-get install vim -y \
  && apt-get upgrade -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

USER vscode
# Install PowerShell Modules
SHELL ["pwsh", "-Command"]

RUN Install-Module -Name Az -Scope CurrentUser -Force
RUN Install-Module -Name posh-git -Scope CurrentUser -Force