function eat(i, u, pt, h)--itemstack, user, pointed_thing, hunger
    if core.get_modpath("needs") then
        stats.set(u, "hunger", h)
    end
    return core.do_item_eat(1, nil, i, u, pt)
end

core.register_craftitem("food:sardine_raw", {
    description = "Raw Sardine",
    inventory_image = "sardine_raw.png",
})
core.register_craftitem("food:sardine_cooked", {
    description = "Cooked Sardine",
    inventory_image = "sardine_cooked.png",
    --on_use = eat(8)--1=8
    on_use = function(i, u, pt)
        eat(i, u, pt, 8)
    end
})
core.register_craftitem("food:mackerel_raw", {
    description = "Raw Mackerel",
    inventory_image = "mackerel_raw.png",
})
core.register_craftitem("food:mackerel_cooked", {
    description = "Cooked Mackerel",
    inventory_image = "mackerel_cooked.png",
    --on_use = eat(15)--1=15
    on_use = function(i, u, pt)
        eat(i, u, pt, 15)
    end
})
core.register_craftitem("food:eel_raw", {
    description = "Raw Eel",
    inventory_image = "eel_raw.png",
})
core.register_craftitem("food:eel_cooked", {
    description = "Cooked Eel",
    inventory_image = "eel_cooked.png",
    --on_use = eat(10)--2=20
    on_use = function(i, u, pt)
        eat(i, u, pt, 10)
    end
})
core.register_craftitem("food:salmon_raw", {
    description = "Raw Salmon",
    inventory_image = "salmon_raw.png",
})
core.register_craftitem("food:salmon_cooked", {
    description = "Cooked Salmon",
    inventory_image = "salmon_cooked.png",
    on_use = function(i, u, pt)
        eat(i, u, pt, 15)
    end
})
core.register_craftitem("food:halibut_raw", {
    description = "Raw Halibut",
    inventory_image = "halibut_raw.png",
})
core.register_craftitem("food:halibut_cooked", {
    description = "Cooked Halibut",
    inventory_image = "halibut_cooked.png",
    --on_use = eat(15)--3=45
    on_use = function(i, u, pt)
        eat(i, u, pt, 15)
    end
})
core.register_craftitem("food:king_crab_raw", {
    description = "Raw King Crab",
    inventory_image = "king_crab_raw.png",
})
core.register_craftitem("food:king_crab_cooked", {
    description = "Cooked King Crab",
    inventory_image = "king_crab_cooked.png",
    --on_use = eat(12)--4=48
    on_use = function(i, u, pt)
        eat(i, u, pt, 12)
    end
})
core.register_craftitem("food:tuna_raw", {
    description = "Raw Tuna",
    inventory_image = "tuna_raw.png",
})
core.register_craftitem("food:tuna_cooked", {
    description = "Cooked Tuna",
    inventory_image = "tuna_cooked.png",
    --on_use = eat(15)--4=60
    on_use = function(i, u, pt)
        eat(i, u, pt, 15)
    end
})
core.register_craftitem("food:swordfish_raw", {
    description = "Raw Swordfish",
    inventory_image = "swordfish_raw.png",
})
core.register_craftitem("food:swordfish_cooked", {
    description = "Cooked Swordfish",
    inventory_image = "swordfish_cooked.png",
    --on_use = eat(15)--6=90
    on_use = function(i, u, pt)
        eat(i, u, pt, 15)
    end
})
core.register_craftitem("food:bugshark_raw", {
    description = "Raw Bugshark",
    inventory_image = "bugshark_raw.png",
})
core.register_craftitem("food:bugshark_cooked", {
    description = "Cooked Bugshark",
    inventory_image = "bugshark_cooked.png",
    --on_use = eat(20)--10=200
    on_use = function(i, u, pt)
        eat(i, u, pt, 20)
    end
})