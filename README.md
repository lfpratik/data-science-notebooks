# Setup python data science environment for practice

##### Clone repository
    https://github.com/lfpratik/data-science-notebooks.git

##### Clone repository in current directory
    https://github.com/lfpratik/data-science-notebooks.git .

##### Clone repository in specific directory
    https://github.com/lfpratik/data-science-notebooks.git ~/<dir_name>

## Setup python environment in Linux and Mac OS

### How to Install Pyenv on Ubuntu

##### Update and Install Dependencies
    sudo apt update -y

##### Clone the Pyenv Repository
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

### How to Install Pyenv on Mac

##### Update and Install Dependencies
    brew update

##### Install pyenv
    brew install pyenv
    brew install pyenv-virtualenv           # optional
    brew install pyenv-ccache               # optional
    brew install pyenv-pip-migrate          # optional
    brew install pyenv-virtualenvwrapper    # optional
    brew install pyenv-which-ext            # optional
    brew doctor
    brew cleanup

##### Configure the Environment
    /bin/bash
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
        echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc

    /bin/zsh
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
        echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.zshrc

    exec "$SHELL"

##### Verify the Installation
    pyenv version

##### Install Python [ specify the exact version it will install all python dependency ]
    pyenv install 3.9.9

##### To verify that Python 3.9.9 is now installed run the pyenv versions command:
    pyenv versions

##### Change to default version follow the following command:
    pyenv global 3.9.9

## Conda Setup

#### We will use a miniforge tool to setup environment
    https://github.com/conda-forge/miniforge

#### How to install miniforge For Linux, any architecture, use the following command
    wget -O Miniforge3.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh

    bash Miniforge3.sh -b

#### How to install miniforge For MacOSX, any architecture, use the following command
    wget -O Miniforge3.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-$(uname -m).sh

    bash Miniforge3.sh -b

## Homebrew
### On macOS, you can install miniforge with Homebrew by running
    brew install miniforge


## How to Setup development environment in local machine

##### Create conda environment
    make environment

##### Clean conda environment
    make clean

##### Register the conda environment to Jupyter
    make add-to-jupyter

##### Remove the conda environment from Jupyter
    jupyter kernelspec uninstall $(CONDA_ENV_NAME)
