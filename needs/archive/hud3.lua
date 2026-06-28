stats = {}
local hud = {}
local players = {}

local C = 100
local hunger = C
local thirst = C
local health = C
local scalex = 210
local scaley = 70

hud.hunger_offy = -210
hud.thirst_offy = -140
hud.health_offy = -70

function stats.set(player, type, value)
    local name = player:get_player_name()
    players[name][type] = players[name][type] + value
    if players[name][type] > 100 then
        players[name][type] = 100
    end
    player:hud_change(hud[type], "text", type..": "..players[name][type])
    player:hud_change(hud["fg_"..type], "offset", {x = scalex * players[name][type] / 100, y = hud[type.."_offy"]})

    if players[name][type] <= 0 then
        player:set_hp(0)
    end
end

local function list()
    print("Player stats list: "..dump(players))
end

core.register_on_joinplayer(function(player)
    players[player:get_player_name()] = {
        hunger = hunger,
        thirst = thirst,
        health = health,
    }    
    hud.hunger = player:hud_add({
        type = "text",
        position = {x = 1, y = 1},
        offset = {x = -70, y = hud.hunger_offy},
        text = "hunger: "..hunger,
        alignment = {x = -1, y = 0},
    })
    hud.thirst = player:hud_add({
        type = "text",
        position = {x = 1, y = 1},
        offset = {x = -70, y = hud.thirst_offy},
        text = "thirst: "..thirst,
        alignment = {x = -1, y = 0},
    })
    hud.health = player:hud_add({
        type = "text",
        position = {x = 1, y = 1},
        offset = {x = -70, y = hud.health_offy},
        text = "health: "..health,
        alignment = {x = -1, y = 0},
    })
    hud.bg_hunger = player:hud_add({
        type = "image",
        position = {x = 1, y = 1},
        offset = {x = 0, y = hud.hunger_offy},
        text = "hunger.png",
        alignment = {x = -1, y = 0},
        scale = {x = scalex, y = scaley},
        z_index = -100,
    })
    hud.bg_thirst = player:hud_add({
        type = "image",
        position = {x = 1, y = 1},
        offset = {x = 0, y = hud.thirst_offy},
        text = "thirst.png",
        alignment = {x = -1, y = 0},
        scale = {x = scalex, y = scaley},
        z_index = -100,
    })
    hud.bg_health = player:hud_add({
        type = "image",
        position = {x = 1, y = 1},
        offset = {x = 0, y = hud.health_offy},
        text = "health.png",
        alignment = {x = -1, y = 0},
        scale = {x = scalex, y = scaley},
        z_index = -100,
    })
    hud.fg_hunger = player:hud_add({
        type = "image",
        position = {x = 1, y = 1},
        offset = {x = scalex * hunger / 100, y = hud.hunger_offy},
        text = "fg_stat2.png",
        alignment = {x = -1, y = 0},
        scale = {x = scalex, y = scaley},
        z_index = -90,
    })
    hud.fg_thirst = player:hud_add({
        type = "image",
        position = {x = 1, y = 1},
        offset = {x = scalex * thirst / 100, y = hud.thirst_offy},
        text = "fg_stat2.png",
        alignment = {x = -1, y = 0},
        scale = {x = scalex, y = scaley},
        z_index = -90,
    })
    hud.fg_health = player:hud_add({
        type = "image",
        position = {x = 1, y = 1},
        offset = {x = scalex * health / 100, y = hud.health_offy},
        text = "fg_stat2.png",
        alignment = {x = -1, y = 0},
        scale = {x = scalex, y = scaley},
        z_index = -90,
    })
    list()
end)

core.register_on_respawnplayer(function(player)
   stats.set(player, "hunger", 100)
   stats.set(player, "thirst", 100)
   stats.set(player, "health", 100)
end)

core.register_on_leaveplayer(function(player)
    players[player:get_player_name()] = nil
    list()
end)

local function reduce_hunger()
    for name, data in pairs(players) do
        if data.hunger > 0 then
            stats.set(core.get_player_by_name(name), "hunger", -1)
        end
    end
    core.after(120, reduce_hunger)
end

local function reduce_thirst()
    for name, data in pairs(players) do
        if data.thirst > 0 then
            stats.set(core.get_player_by_name(name), "thirst", -1)
        end
    end
    core.after(60, reduce_thirst)
end

local function raise_health()
    for name, data in pairs(players) do
        stats.set(core.get_player_by_name(name), "health", 1)
    end
    core.after(240, raise_health)
end

core.register_on_mods_loaded(function()
    reduce_hunger()
    reduce_thirst()
    raise_health()
end)
