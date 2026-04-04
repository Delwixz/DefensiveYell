local frame = CreateFrame("Frame")

local spells = {
    -- Bear
    ["Barkskin"] = true,
    ["Berserk"] = true,
    ["Frenzied Regeneration"] = true
    -- Warrior
    -- Shaman
}

local active = {}

frame:RegisterEvent("CHAT_MSG_SPELL_SELF_BUFF")
frame:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS")
frame:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")

frame:SetScript("OnEvent", function()
    local msg = arg1

    if event == "CHAT_MSG_SPELL_SELF_BUFF" or event == "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS" then
        for spellName in pairs(spells) do
            if string.find(msg, spellName) then
                
                if not active[spellName] then
                    SendChatMessage(spellName .. " up!", "YELL")
                    active[spellName] = true
                end

            end
        end
    end

    if event == "CHAT_MSG_SPELL_AURA_GONE_SELF" then
        for spellName in pairs(spells) do
            if string.find(msg, spellName) then
                active[spellName] = nil
            end
        end
    end
end)
