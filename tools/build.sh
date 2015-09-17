mkdir -pv dist
cp -rv static/* dist/
redo-always all
mv -v site/*.html dist/
mv -v site/conlangs/*.html dist/
mv -v site/posts/*.html dist/
mv -v site/okulang.rss dist/