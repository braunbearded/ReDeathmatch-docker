import os
from dotenv import load_dotenv # pip install python-dotenv
import a2s # pip install python-a2s
import json

load_dotenv("../.env")

ip = os.environ["CSDM_IP"] # export your server ip to "CSDM_IP"

address = (ip, int(os.environ["PORT"]))
info = a2s.info(address)
players = a2s.players(address)


pretty_info = {}
for att in dir(info):
    if att.startswith("_"):
        continue
    pretty_info[att] = getattr(info, att)

pretty_players = []
for player in players:
    player_dict = {}
    for att in dir(player):
        if att.startswith("_"):
            continue
        if att == "duration":
            player_dict["duration_min"] = getattr(player, att) / 60
        player_dict[att] = getattr(player, att)
    pretty_players.append(player_dict)

print("Server Infos:")
print(json.dumps(pretty_info, indent=2))
print()
print("Players:")
print(json.dumps(pretty_players, indent=2))
