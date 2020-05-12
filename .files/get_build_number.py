import requests, json, sys

r = requests.get("https://api.github.com/repos/hax0kartik/Luma-hourlies/releases/latest")
if(r.ok):
    data = json.loads(r.text or r.content)
    latest_tag_name = data['name'][:data['name'].find('-')]
    print(int(latest_tag_name) + 1)
