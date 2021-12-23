# Oneshell means I can run multiple lines in a recipe in the same shell, so I don't have to
# chain commands together with semicolon
.ONESHELL:
# Need to specify bash in order for conda activate to work.
SHELL=/bin/bash

# Note that the extra activate is needed to ensure that the activate floats env to the front of PATH
CONDA_ACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate
CONDA_ENV_BASE_PATH=source $$(conda info --base)/envs

#######
# Help
#######

.DEFAULT_GOAL := help
.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

###################
# Conda Enviroment
###################

PY_VERSION := 3.9
CONDA_ENV_NAME ?= dsn-env
ACTIVATE_ENV = $(CONDA_ACTIVATE) $(shell pwd)/$(CONDA_ENV_NAME)

.PHONY: environment
environment: $(CONDA_ENV_NAME)  ## Build the conda environment
$(CONDA_ENV_NAME):
	conda create -p $(CONDA_ENV_NAME) --copy -y python=$(PY_VERSION)
#	conda create -n $(CONDA_ENV_NAME) -y python=$(PY_VERSION)
# 	$(ACTIVATE_ENV) && python -s -m pip install -r requirements.txt
	$(ACTIVATE_ENV) && conda install -y --file requirements.txt

.PHONY: clean-conda-env
clean:  ## Remove the conda environment and the relevant file
	rm -rf $(CONDA_ENV_NAME)
	rm -rf $(CONDA_ENV_NAME).zip

.PHONY: add-to-jupyter
add-to-jupyter: ## Register the conda environment to Jupyter
	$(ACTIVATE_ENV) && python -s -m ipykernel install --user --name $(CONDA_ENV_NAME)

.PHONY: remove-from-jupyter
remove-from-jupyter: ## Remove the conda environment from Jupyter
	jupyter kernelspec uninstall $(CONDA_ENV_NAME)
