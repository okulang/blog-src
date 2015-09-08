Setup
=====

Before installing, you will need Python3 and Haskell, with virtualenv and hsenv.

Run `sh -x tools/mkenv.sh`.
This sets up a virtual environment with Python3 and Haskell, and initialized redo.
Set environment variables with `source tools/activate`.
Activate the environments with `source .env/bin/activate` and `source .hsenv/bin/activate`.
Install prerequisites with `pip install -r requirements.txt`.
Clean up the environment with `source tools/deactivate`.

Architecture
============

There are two repositories:
this one `blog-src`, and the github pages repository `okulang.github.io`.
The pages repo should be cloned into the blog-src repo and renamed to `dist`.

Redo is used to manage shoving all the data around from source files to the engine to output files.
Page generation consists entirely of Mako code.
There's a small layer of Python tools to wrap Mako up into nice commands.
A bit of extra data is provided by python literals.
Finally, a few shell tools provide the environment and move the generated files into the pages repo.

It's best to run inside sandboxes for both python and haskell so the blog is self-contained and you aren't messing with the rest of your system.
Also, you'll need to set `TEMPLATE_DIR` to `<blog-src>/templates` so mako can find them.
All that's handled by `tools/{mkenv.sh,activate,deactivate}`.

There are two interfaces to Mako.
The `mako <content> <template> <pyon>` tool takes a file full of contents `.in`, a template, and a `.pyon` (PYthon Object Notation) file.
The template is then rendered with access to the text contents as `${content}`, and the python literal contents of the pyon file as `${config}`.
The `mako-posts <template> <postsdir> <pyon>` tool takes the name of a template, a directory containing posts, and a `.pyon` file.
The template is then rendered with access to the python literal contents of the pyon file as `${config}`, and a list of `posts`, each of which has all the data associated with that post (from its `.pyon` file), as well as the name of the post (no extension) and the path to its contents (for reading, if needed).
In both cases, if `<pyon>` is empty, then an empty dict is used, but the argument still needs to be given explicitly.

TODO setconfig

User Tools
----------

The `publish` command takes the path to a post (without any extension).
It adds the post to the list of published files, timestamps the post's pyon, and adds appropriate `next` and `last` entries to the pyon of that post and the previous post.

The `tools/build.sh` script (run with `sh -e`) rebuilds the site and moves all the output files into `dist`.

Conceptual/Directory Structure
------------------------------

The blog has templates, pages, posts, conlangs, and static files.
Static files are just copied directly into `dist/`.
Templates are not included in `dist/`, but pages and posts can make use of them.
Pages are placed in `site/` and consist of a `.in` and a `.pyon` file.
Posts are placed in `site/posts` and again consist of a `.in` and `.pyon` file.
Conlangs are placed in `site/conlangs` and again consist of a `.in` and `.pyon` file.
Pages, posts, and conlangs are all run through Mako, then placed into `dist`.
Posts and conlangs end up at top level along with everything else, even though they began life under a subdirectory.

I the posts directory, there is a `publish` file which contains a chronological list of post names.

Tools Used
==========

Redo
----

Mako
----

PYON
----

This file format is defined as anything whose contents are accepted by `ast.literal_eval`.

Later, I may make some more utilities to work with pyon files.

Pandoc
------

Perhaps I will use this later.