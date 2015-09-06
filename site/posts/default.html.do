redo-ifchange ../../templates/base.html ../../templates/post.html

redo-ifchange $2.in $2.config
mako $2.in post.html $2.config

