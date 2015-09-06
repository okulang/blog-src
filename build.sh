mkdir -p dist
cp -r static/* dist/
redo-always all
cp site/*.html dist/
cp site/posts/*.html dist/
