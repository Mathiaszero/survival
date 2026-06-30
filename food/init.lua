food = {}

.modpath = core.get_modpath("food")
dofile(food.modpath.."/craft.lua")

text = "food mod loaded."
print(text)

core.register_on_joinplayer(function(player)
    local name = player:get_player_name()
    core.chat_send_player(name, text)
end)

-- function eat(i, u, pt, h)
--     if core.get_modpath("stats") then
--         stats.set(core.get_player_by_name(u), "hunger", h)
--     end
--     return core.item_eat(1)
-- end