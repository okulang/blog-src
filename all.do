redo-ifchange site/posts/publish

for POST in `cat site/posts/publish`; do
  redo-ifchange site/posts/$POST.html
done;

redo-ifchange site/{index,archive,conlangs,resources,about}.html
redo-ifchange site/conlangs/{iskki,myrkoldh}.html
redo-ifchange site/okulang.rss