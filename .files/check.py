import requests
import json
import sys

r = requests.get("https://api.github.com/repos/aurorawright/luma3ds/commits")
if(r.ok):
    data = json.loads(r.text or r.content)
    luma3ds_commit_hash = data[0]['sha'][:7]

r = requests.get("https://api.github.com/repos/hax0kartik/Luma-hourlies/releases/latest")
if(r.ok):
    data = json.loads(r.text or r.content)
    latest_tag_name = data['name'][data['name'].rfind('-') + 1:]

if latest_tag_name == luma3ds_commit_hash:
    sys.exit(-1)
else:
    sys.exit(0)