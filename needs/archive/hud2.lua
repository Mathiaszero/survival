stats = {}

local players = {}

-- local function list()
--     for stats_index, stats in ipairs(players) do
--         print("Player stats list: "..stats.name)
--     end
-- end

local function list()
    print("Player stats list: "..dump(players))
    --print("Player stats list: "..players.get_keys())--err
end

-- core.register_on_joinplayer(function(player)
--     table.insert(players,
--     {
--         name = player:get_player_name(), 
--         hunger = 100, 
--         thirst = 100, 
--         health = 100,
--         txt_hunger = player:hud_add({
--             type = "text",
--             position = {x = 0.5, y = 0.5},
--             offset = {x = 0, y = -300},
--             text = "Hunger: 100",
--             alignment = {x = 1, y = 0},
--         })
--     })
--     list()
    
-- end)

-- core.register_on_leaveplayer(function(player)
--     for stats_index, stats in ipairs(players) do
--         if stats.name == player:get_player_name() then
--             table.remove(stats)
--         end
--     end
--     list()
-- end)

core.register_on_joinplayer(function(player)
    players[player:get_player_name()] = {
        hunger = 100,
        thirst = 100,
        health = 100,
    }    
    list()
end)

core.register_on_leaveplayer(function(player)
    players[player:get_player_name()] = nil
    list()
end)

core.register_on_mods_loaded(function()
    --reduce_sur_stats()
end)
