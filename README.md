Setup
=====

Before installing, you will need Python3 and Haskell, with virtualenv and hsenv.

Run `sh -x tools/mkenv.sh`.
This sets up a virtual environment with Python3 and Haskell, and initialized redo.
Set evnironment variables with `source tools/activate`.
Activate the environments with `source .env/bin/activate` and `source .hsenv/bin/activate`.
Install prerequisites with `pip install -r requirements.txt`.
Clean up the environment with `source tools/deactivate`.

