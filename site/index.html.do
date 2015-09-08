redo-ifchange posts/publish
export LASTPOST=posts/`tail -n 1 posts/publish`

redo-ifchange $LASTPOST.html

mako $LASTPOST.in index.html $LASTPOST.pyon