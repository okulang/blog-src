#!/usr/bin/env python3
import os, sys
from os import path
from mako.lookup import TemplateLookup

template_dir = os.environ['TEMPLATE_DIR']
content, template_name, config = sys.argv[1:4]

if content:
  with open(content, 'r') as content:
    content = content.read()

if not config or not path.exists(config):
  config = dict()
else:
  with open(config, 'r') as config:
    config = config.read()
  import ast
  config = ast.literal_eval(config)

template_lookup = TemplateLookup(
  directories=[template_dir],
  module_directory='/tmp/mako_modules',
  output_encoding='utf-8')
template = template_lookup.get_template(template_name)

sys.stdout.buffer.write(template.render(content=content, config=config))
