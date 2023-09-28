

# fuzz-Scratches script for QB-Core 

- A noobie fork of m-Scratches

# Preview:
Coming Soon TM

# Features
- 5 Types of cards
- Webhook
- Cooldown
- Minigame with earning nothing on failure
- Configurable Item check

# About
- A simple scratch card script. You can buy scratchcards and open them to win prizes! All values are configurable.

# Install the script:

**qb-core/shared/items.lua**
```
    ['scratchcard01']           = {['name'] = "scratchcard01",          ['label'] = "Scratch Card 01",              ['weight'] = 100,   ['type'] = "item",    ['image'] = "scratchcard01.png",          ['unique'] = false,    ['useable'] = true,      ['shouldClose'] = true,    ["combinable"] = nil,   ["description"] = "Minimum Prize: 10$  Maximium Prize: 100$  Premium Prize: 150$"},
    ['scratchcard02']           = {['name'] = "scratchcard02",          ['label'] = "Scratch Card 02",              ['weight'] = 100,   ['type'] = "item",    ['image'] = "scratchcard02.png",          ['unique'] = false,    ['useable'] = true,      ['shouldClose'] = true,    ["combinable"] = nil,   ["description"] = "Minimum Prize: 50$  Maximium Prize: 300$  Premium Prize: 450$"},
    ['scratchcard03']           = {['name'] = "scratchcard03",          ['label'] = "Scratch Card 03",              ['weight'] = 100,   ['type'] = "item",    ['image'] = "scratchcard03.png",          ['unique'] = false,    ['useable'] = true,      ['shouldClose'] = true,    ["combinable"] = nil,   ["description"] = "Minimum Prize: 150$  Maximium Prize: 550$  Premium Prize: 750$"},
    ['scratchcard04']           = {['name'] = "scratchcard04",          ['label'] = "Scratch Card 04",              ['weight'] = 100,   ['type'] = "item",    ['image'] = "scratchcard04.png",          ['unique'] = false,    ['useable'] = true,      ['shouldClose'] = true,    ["combinable"] = nil,   ["description"] = "Minimum Prize: 500$  Maximium Prize: 900$  Premium Prize: 1250$"},
    ['scratchcard05']           = {['name'] = "scratchcard05",          ['label'] = "Scratch Card 05",              ['weight'] = 100,   ['type'] = "item",    ['image'] = "scratchcard05.png",          ['unique'] = false,    ['useable'] = true,      ['shouldClose'] = true,    ["combinable"] = nil,   ["description"] = "Minimum Prize: 800$  Maximium Prize: 1250$  Premium Prize: 1650$"},
    ['luckypenny'] 					 = {['name'] = 'luckypenny', 						['label'] = 'Lucky Penny', 				    ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'luckypenny.png', 			    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Its just a lucky penny'},

```


# Setup Images:

- Copy all images inside of : fuzz-Scratches/images
- Open your inventory and paste inside of  inventory/html/images 

# Setup webhooks:

- You need to create a channel on your discord called for example "Scratchpff-logs"
- Then you will edit the channel -> Integrations -> Webhooks -> New Webhook
- After creating, you will have an option that says: Copy webhook URL
- Open the config.lua and insert that URL on line 9

# Dependecies:
- qb-core
- qb-target
- cd-keymaster (https://github.com/dsheedes/cd_keymaster)
# contributors
- Marcinhuu (Original Owner of m-Scratches)
- dsheedes (Developer of Minigame used)
