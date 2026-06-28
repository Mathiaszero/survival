--this script is issue bc when another player enters, the original player 
--will have stats stop dropping. This is due to that the 2 players share
--the 1 local p variable. The later player overrides orig. player with
--his name, so only his stats drop.
stats = {}

local C = 100

local hunger = C
local thirst = C
local health = C

local scale_x = 2.1
local scale_y = 0.7

local max_x = C * scale_x --200,50; orig: 300,100
local max_y = C * scale_y

--local player = nil
local p = nil

local id_hunger = nil
local id_thirst = nil
local id_health = nil

function stats.set_hunger(player, value)
    if type(player) ~= "userdata" then
        player = core.get_player_by_name(player)
    end
    hunger = hunger + value
    if hunger > 100 then
        hunger = 100
    end
    player:hud_change(id_hunger, "scale", {x = hunger * scale_x, y = max_y})
    if hunger <= 0 then
        player:set_hp(0)
    end
end

function stats.set_thirst(player, value)
    if type(player) ~= "userdata" then
        player = core.get_player_by_name(player)
    end
    thirst = thirst + value
    if thirst > 100 then
        thirst = 100
    end
    player:hud_change(id_thirst, "scale", {x = thirst * scale_x, y = max_y})
    if thirst <= 0 then
        player:set_hp(0)
    end
end

function stats.set_health(player, value)
    if type(player) ~= "userdata" then
        player = core.get_player_by_name(player)
    end
    health = health + value
    if health > 100 then
        health = 100
    end
    player:hud_change(id_health, "scale", {x = health * scale_x, y = max_y})
    if health <= 0 then
        player:set_hp(0)
    end
end

local function draw_sur_stats(player)
    local posx = 0.865
    local posy = 0.6
    id_hunger = player:hud_add({
        type = "image",
        position = {x = posx, y = posy},--orig x = 0.825
        offset = {x = 0, y = 0},
        text = "hunger.png",
        alignment = {x = 1, y = 0},--x=1 to dec from right to left
        scale = {x = max_x, y = max_y},--orig 300,100
    })
    id_thirst = player:hud_add({
        type = "image",
        position = {x = posx, y = posy+0.09},--0.7 makes above too short
        offset = {x = 0, y = 0},
        text = "thirst.png",
        alignment = {x = 1, y = 0},
        scale = {x = max_x, y = max_y},--
        --direction = 0,
    })
    id_health = player:hud_add({
        type = "image",
        position = {x = posx, y = posy+0.18},
        offset = {x = 0, y = 0},
        text = "health.png",
        alignment = {x = 1, y = 0},
        scale = {x = max_x, y = max_y},
    })
end

core.register_on_respawnplayer(function(player)
   stats.set_hunger(player, 100)
   stats.set_thirst(player, 100)
   stats.set_health(player, 100)
end)

local delay = 0.1

local function reduce_stats()
    if p and hunger > 0 and thirst > 0 then
        stats.set_hunger(p, -1)
        stats.set_thirst(p, -2)
        core.chat_send_player(p:get_player_name(), "Hunger/scale: "..hunger..","..hunger * scale_x)
        core.chat_send_player(p:get_player_name(), "Thirst/scale: "..thirst..","..thirst * scale_x)
    end
    core.after(delay, reduce_stats)
end

-- local function reduce_stats()
--     if player and hunger > 0 and thirst > 0 then
--         stats.set_hunger(player, -1)
--         stats.set_thirst(player, -2)
--         core.chat_send_player(player:get_player_name(), "Hunger/scale: "..hunger..","..hunger * scale_x)
--         core.chat_send_player(player:get_player_name(), "Thirst/scale: "..thirst..","..thirst * scale_x)
--     end
--     core.after(delay, reduce_stats)
-- end

core.register_on_joinplayer(function(player)
    --player = player
    p = player
    draw_sur_stats(player)
    stats.set_hunger(player, 100)
    stats.set_thirst(player, 100)
    stats.set_health(player, 100)
end)

-- core.register_on_joinplayer(function(player)
--     table.remove(players, player)
-- end)

core.register_on_mods_loaded(function(player)
    reduce_stats()
end)
