export SHELL := /bin/bash
export PYTHONPATH := $(shell pwd)

init: clean env jupyter lint

clean:
	rm -rf env && \
	rm -f figures/* && \
	rm -f data/interim/* && \
	rm -f data/processed/* && \
	rm -f data/raw/* && \
	rm -f models/*

env:		## Build virtual environment.
	rm -rf env && \
	python3 -m venv env && \
	. env/bin/activate && \
	pip3 install --upgrade pip && \
	pip3 install -r requirements.txt && \
	rm -rf *.egg-info && \
	source env/bin/activate

jupyter:	## Install jupyter extensions.
	source env/bin/activate && \
	jupyter contrib nbextensions install && \
	cd $(shell jupyter --data-dir)/nbextensions && \
	rm -rf vim_binding && \
	git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding && \
	jupyter nbextension enable vim_binding/vim_binding && \
	jupyter nbextension enable rubberband/main && \
	jupyter nbextension enable toggle_all_line_numbers/main && \
	jupyter nbextension enable varInspector/main

notebook:	## Start a local notebook server.
	@source env/bin/activate && \
	cd notebooks && jupyter notebook

lint: 		## Run code style checker.
	@source env/bin/activate && \
	pycodestyle *.py --max-line-length 100 && \
	echo "ok"

help: 		## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: init env jupyter notebook lint
