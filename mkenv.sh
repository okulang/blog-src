python3 -m venv .env
source .env/bin/activate
curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | python
deactivate
source .env/bin/activate
hsenv
source .hsenv/bin/activate
git clone https://github.com/Zankoku-Okuno/redo.git
cabal install redo/
redo/mk_redo_links.sh
rm -rf redo/
redo-init
echo python3 > .redo/interpreter.conf
echo -m > .redo/interpreter-args.conf
