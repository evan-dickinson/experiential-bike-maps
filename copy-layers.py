#!/usr/bin/env python

import json
from sys import path
from os.path import join

source_mml = join(path[0], 'open-streets/project.mml')

with open(source_mml, 'r') as f:
  newf = json.loads(f.read())
f.closed

target_mml = join(path[0], 'no-labels/project.mml')

with open(target_mml, 'w') as f:
  for layer in newf["Layer"]:
    if "Datasource" in layer and "project" in layer["Datasource"]:
      layer["Datasource"]["project"] = "simple-bikeway-no-labels"

  newf["name"] = 'Simple bikeway - no labels'
  f.write(json.dumps(newf, sort_keys=False, indent=2))
f.closed
