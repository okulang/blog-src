redo-ifchange site/posts/publish

for POST in `cat site/posts/publish`; do
  redo-ifchange site/posts/$POST.html
done;

redo-ifchange site/{index,archive}.html
redo-ifchange site/okulang.rss