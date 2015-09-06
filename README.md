Setup
=====

Before installing, you will need Python3, Haskell, and hsenv.

Run `sh -x mkenv.sh`.
This sets up a virtual environment with Python3 and Haskell, and initialized redo.
Activate the environments with `source .env/bin/activate` and `source .hsenv/bin/activate`.
Install prerequisites with `pip install -r requirements.txt`.
Before building, make sure to `export TEMPLATE_DIR=$PWD/templates`.

