# Set up Python3 virtualenv
python3 -m venv .env
source .env/bin/activate
curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | python
deactivate
source .env/bin/activate
pip install -r requirements.txt

# Set up Haskell virtualenv
hsenv
source .hsenv/bin/activate

# Install redo
git clone https://github.com/Zankoku-Okuno/redo.git
cabal install redo/
redo/mk_redo_links.sh
rm -rf redo/

# Set up redo
redo-init

# Install my mako command
cp mako .env/bin/
chmod +x .env/bin/mako
