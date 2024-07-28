--- STEAMODDED HEADER
--- MOD_NAME: The Owl House Mod
--- MOD_ID: TheOwlHouseMod
--- MOD_AUTHOR: [DaviAMSilva]
--- MOD_DESCRIPTION: A skin mod featuring characters and symbols from the Disney television series The Owl House.
--- PREFIX: toh
--- LOADER_VERSION_GEQ: 1.0.0
----------------------------------------------
------------MOD CODE -------------------------



-- Textures

function toh_load_textures()
    local toh_mod = SMODS.findModByID("TheOwlHouseMod")
    local toh_sprites_1x = SMODS.Sprite:new("cards_1", toh_mod.path, "toh-cards.png", 71, 95, "asset_atli")
    local toh_sprites_2x = SMODS.Sprite:new("cards_2", toh_mod.path, "toh-cards.png", 71, 95, "asset_atli")
    local toh_enhancers = SMODS.Sprite:new("centers", toh_mod.path, "toh-enhancers.png", 71, 95, "asset_atli")
    local toh_ui_1x = SMODS.Sprite:new("ui_1", toh_mod.path, "toh-ui.png", 18, 18, "asset_atli")
    local toh_ui_2x = SMODS.Sprite:new("ui_2", toh_mod.path, "toh-ui.png", 18, 18, "asset_atli")

    toh_sprites_1x:register()
    toh_sprites_2x:register()
    toh_enhancers:register()
    toh_ui_1x:register()
    toh_ui_2x:register()
end



function SMODS.INIT.TheOwlHouseMod()
    sendDebugMessage("Launching The Owl House Mod!")
    toh_load_textures()
end










-- Glyph names

__set_language = Game.set_language
function Game:set_language()
    __set_language(self)

    -- There's probably (definitely) a better way to do this
    -- but I'm not familiar with Lua
    for k, v in pairs(G.localization.descriptions.Joker) do
        for kl, line in pairs(v.text) do
            text = G.localization.descriptions.Joker[k].text[kl]

            text = text:gsub("Spades", "Ice")
            text = text:gsub("Spade", "Ice")
            text = text:gsub("Hearts", "Fire")
            text = text:gsub("Heart", "Fire")
            text = text:gsub("Clubs", "Plant")
            text = text:gsub("Club", "Plant")
            text = text:gsub("Diamonds", "Light")
            text = text:gsub("Diamond", "Light")

            G.localization.descriptions.Joker[k].text[kl] = text
        end
    end

    for k, v in pairs(G.localization.descriptions.Blind) do
        for kl, line in pairs(v.text) do
            text = G.localization.descriptions.Blind[k].text[kl]

            text = text:gsub("Spades", "Ice")
            text = text:gsub("Spade", "Ice")
            text = text:gsub("Hearts", "Fire")
            text = text:gsub("Heart", "Fire")
            text = text:gsub("Clubs", "Plant")
            text = text:gsub("Club", "Plant")
            text = text:gsub("Diamonds", "Light")
            text = text:gsub("Diamond", "Light")

            G.localization.descriptions.Blind[k].text[kl] = text
        end
    end

    for k, v in pairs(G.localization.descriptions.Back) do
        for kl, line in pairs(v.text) do
            text = G.localization.descriptions.Back[k].text[kl]

            text = text:gsub("Spades", "Ice")
            text = text:gsub("Spade", "Ice")
            text = text:gsub("Hearts", "Fire")
            text = text:gsub("Heart", "Fire")
            text = text:gsub("Clubs", "Plant")
            text = text:gsub("Club", "Plant")
            text = text:gsub("Diamonds", "Light")
            text = text:gsub("Diamond", "Light")

            G.localization.descriptions.Back[k].text[kl] = text
        end
    end

    G.localization.misc.dictionary.ph_4_7_of_clubs = "four 7 of Plant"

    G.localization.misc.suits_singular = {
        Spades = "Ice",
        Hearts = "Fire",
        Clubs = "Plant",
        Diamonds = "Light"
    }
    G.localization.misc.suits_plural = {
        Spades = "Ice",
        Hearts = "Fire",
        Clubs = "Plant",
        Diamonds = "Light"
    }

    init_localization()
end










-- Colors

__loc_colour = loc_colour
function loc_colour(_c, _default)
    suit_table = {
        Hearts = HEX('d42026'),
        Diamonds = HEX('ffb11e'),
        Spades = HEX("0090d9"),
        Clubs = HEX("00a645")
    }
    return suit_table[_c] or __loc_colour(_c, _default)
end



__update_atlas = G.FUNCS.update_atlas
G.FUNCS.update_atlas = function(_type)
    -- We're directly modifying steamodded's source code here. Very fragile!
    output = __update_atlas(_type)
    G.C.SUITS = {
        Hearts = HEX('d42026'),
        Diamonds = HEX('ffb11e'),
        Spades = HEX("0090d9"),
        Clubs = HEX("00a645")
    }
    return output
end



----------------------------------------------
------------MOD CODE END----------------------
