export SHELL := /bin/bash

export ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
export DATA_RAW:=$(ROOT_DIR)/data/raw
export DATA_TMP:=$(ROOT_DIR)/data/interim
export DATA_FINAL:=$(ROOT_DIR)/data/processed

.PHONY: all
all: help

.PHONY: init clean env
init:       ## Run repository setup.
init: clean env lint

clean:      ## Remove all generated data and files.
	rm -rf env && \
	rm -f $(DATA_RAW)/* && \
	rm -f $(DATA_TMP)/* && \
	rm -f $(DATA_FINAL)/* && \
	rm -f figures/* && \
	rm -f models/*

env:        ## Build virtual environment.
	rm -rf env && \
	python3 -m venv env && \
	. env/bin/activate && \
	pip3 install --upgrade pip && \
	pip3 install -r requirements.txt && \
	rm -rf *.egg-info && \
	source env/bin/activate

.PHONY: vim-bindings nbextensions notebook lint help
vim-bindings:
	@source env/bin/activate && \
	jupyter contrib nbextensions install && \
	cd $(shell jupyter --data-dir)/nbextensions && \
	git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding || \
	cd vim_binding && git pull

nbextensions: vim-bindings
	@jupyter nbextension enable vim_binding/vim_binding && \
	jupyter nbextension enable rubberband/main && \
	jupyter nbextension enable toggle_all_line_numbers/main && \
	jupyter nbextension enable varInspector/main

notebook:   ## Start a local notebook server.
notebook: vim-bindings
	@source env/bin/activate && \
	cd notebooks && jupyter notebook

lint:       ## Run code style checker.
	@source env/bin/activate && \
	pycodestyle *.py --max-line-length 100 && \
	echo "ok"

help:       ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
