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
----------------------

Run `make init` to set up virtual environment.

The virtual environment must be activated to work interactively with python. To do this, run `source env/bin/activate` in the top-level directory.

--------

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>
