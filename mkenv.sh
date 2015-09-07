# Set up Python3 virtualenv
if [ ! -d .env ] ; then
	python3 -m venv .env
	source .env/bin/activate
	curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | python
	deactivate
	source .env/bin/activate
	pip install -r requirements.txt
else
	source .env/bin/activate
fi

# Set up Haskell virtualenv
if [ ! -d .hsenv ] ; then
	hsenv
fi
source .hsenv/bin/activate

# Install redo
if ! `which redo`; then
	git clone https://github.com/Zankoku-Okuno/redo.git
	cabal install redo/
	redo/mk_redo_links.sh
	rm -rf redo/
fi

# Set up redo
if [ ! -d .redo ] ; then
	redo-init
fi

# Install my commands and libraries
cp -v mako .env/bin/; chmod +x .env/bin/mako
cp -v setconfig.py .env/bin/setconfig; chmod +x .env/bin/setconfig
cp -v setconfig.py .env/lib/python3.*/site-packages/
cp -v publish.py .env/bin/publish; chmod +x .env/bin/publish
cp -v mako-posts.py .env/bin/mako-posts; chmod +x .env/bin/mako-posts

# Shut down the virtualenvs
deactivate_hsenv
deactivate
