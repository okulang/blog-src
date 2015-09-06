redo-ifchange ../templates/base.html ../templates/page.html

redo-ifchange $2.in $2.config
mako $2.in page.html $2.config
