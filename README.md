datascience
===========

A template repository for exploratory data science.

Project organization
--------------------

    ├── LICENSE
    ├── README.md          <- The top-level README for developers using this project.
    ├── data
    │   ├── interim        <- Intermediate data that has been transformed.
    │   ├── processed      <- The final, canonical data sets for modeling.
    │   └── raw            <- The original, immutable data dump.
    │
    ├── figures            <- Generated graphics and figures to be used in reporting.
    ├── models             <- Trained and serialized models, model predictions, or model summaries.
    ├── notebooks          <- Jupyter notebooks. Naming convention like `1.0-explore-raw-data`.
    ├── reference          <- Lookup files, reference manuals, etc.
    │
    ├── requirements.txt   <- The dependencies file for reproducing the project environment.
    ├── setup.py           <- Setup file for project pip install.
    │
    └── src                <- Source code for use in this project.
        ├── data           <- Scripts to download, generate and/or clean data.
        ├── features       <- Scripts to turn raw data into features for modeling.
        ├── models         <- Scripts to train models and use trained models to make predictions.
        └── visuals        <- Scripts to create exploratory and results oriented visualizations.

Usage
-----

The project is Run `make init` to initialize repository and `make` to see all Makefile options.

The virtual environment must be activated to work interactively with python. To do this, run `source env/bin/activate` in the top-level directory.

Example workflow
----------------

1. Raw data set goes in `data/raw`. Initial exploration with a jupyter notebook gives a flavor of the data and how it needs to be preprocesesed/cleaned. Data is cleaned by script in `src/data`, with cleaned data serialized to a .pkl file in `data/interim`. A `make` target exists for running this cleaning script.

2. Exploratory analysis is done in a notebook to determine how the data should be featurized. Then a script in `src/features` reads the cleaned data and generates features. Features are serialized to a .pkl file in `data/interim` to be used by the models. A `make` target exists for this step as well.

3. Exploratory modeling gives a sense of which models and model parameters are good. Then a script in `src/models` may run a number of models with different parameters on the featurized data. Model scores/predictions from this stage are written to results files in `data/interim` for exploration in a jupyter notebook. Ideally, new models can be added and this `make` target can be re-run without having to re-compute previously computed results.

4. After comparing results and determining the best model, a visualization script may be written to generate final figures. Or, a Dash app could be used for interactive display of results.

Each step in the above process should have an independent `make` target and these targets should capture all dependencies needed to run the data pipeline from beginning to end. Ideally, a collaborator could get a fresh copy of the repo, run `make`, and watch all project results get generated from scratch.

--------

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>
