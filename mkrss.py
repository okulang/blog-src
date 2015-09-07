#!/usr/bin/env python3
import os, sys
from os import path
import ast
from mako.lookup import TemplateLookup


template_dir = os.environ['TEMPLATE_DIR']
postsdir = sys.argv[1]
pubfile = path.join(postsdir, 'publish')


with open(pubfile, 'r') as pub:
  pub = [line.strip() for line in pub.readlines()]
pub.reverse()


posts = []
for post in pub:
  with open(path.join(postsdir, post+".in")) as f:
    content = f.read()
  with open(path.join(postsdir, post+".config")) as f:
    config = ast.literal_eval(f.read())
  posts.append({
    'title': config['title'],
    'link': "http://okulang.github.io/"+post+".html",
    'date': config['date'],
    'description': config['abstract'] if 'abstract' in config else "",
    'content': content,
  })


template_lookup = TemplateLookup(
  directories=[template_dir],
  module_directory='/tmp/mako_modules',
  input_encoding='utf-8',
  output_encoding='utf-8')
template = template_lookup.get_template('okulang.rss')

sys.stdout.buffer.write(template.render(posts=posts))