-- SCRIPT MADE BY HAZELPY IF YOU STEAL THIS YOURE A FAG AND I ALSO HATE YOU

local skinMap = {
    ["character-name"] = "noteskin_filename", -- filename is as found in [mod name]/images/notes
    ["clover"] = "CLOVERNOTE_assets",
    ["ancient_clover"] = "ANCIENTCLOVERNOTE_assets",
    ["legacy_clover"] = "CLOVERNOTE_assets",
    ["bf"] = "BFNOTE_assets",

};

local splashMap = {
    ["character-name"] = "noteSplash_filename", -- filename is as found in [mod name]/images
    ["clover"] = "CLOVERSPLASHES",
    ["ancient_clover"] = "ANCIENTCLOVERSPLASHES",
    ["legacy_clover"] = "CLOVERSPLASHES",
};

function onCreatePost()
    updateNoteskins();

    -- for i, v in pairs(splashMap) do
    --     if getProperty("dad.curCharacter") == i then
    --         for k = 0, 3 do
    --             setPropertyFromGroup("opponentStrums", k, "noteSplashTexture", v);
    --         end
    --     end
        
    --     if getProperty("boyfriend.curCharacter") == i then
    --         for k = 0, 3 do
    --             setPropertyFromGroup("playerStrums", k, "noteSplashTexture", v);
    --         end
    --     end
    -- end
end

function onSongStart()
    updateNoteskins();
    return Function_Continue;
end

function onCountdownTick(c)
    updateNoteskins();
    return Function_Continue;
end

function onUpdate(e)
    updateNoteskins();
end

function updateNoteskins()
    if getPropertyFromClass("ClientPrefs", "lowQuality") then return end
    for i, v in pairs(skinMap) do
        if getProperty("dad.curCharacter") == i then
            -- for k = 0, getProperty("unspawnNotes.length") do
            --     local isOpponentNote = not getPropertyFromGroup("unspawnNotes", k, "mustPress");
            --     if isOpponentNote then
            --         setPropertyFromGroup("unspawnNotes", k, "texture", "notes/" .. v);
            --     end
            -- end
            
            for k = 0, getProperty("notes.length") do
                local isOpponentNote = not getPropertyFromGroup("notes", k, "mustPress");
                if isOpponentNote and getPropertyFromGroup("notes", k, "texture") ~= "notes/" .. v then
                    setPropertyFromGroup("notes", k, "texture", "notes/" .. v);
                end
            end
            
            for k = 0, 3 do
                if getPropertyFromGroup("playerStrums", k, "texture") ~= "notes/" .. v then
                    setPropertyFromGroup("opponentStrums", k, "texture", "notes/" .. v);
                end
            end
        end
        
        if getProperty("boyfriend.curCharacter") == i then
            -- for k = 0, getProperty("unspawnNotes.length") do
            --     local isNotOpponentNote = getPropertyFromGroup("unspawnNotes", k, "mustPress");
            --     if isNotOpponentNote then
            --         setPropertyFromGroup("unspawnNotes", k, "texture", "notes/" .. v);
            --     end
            -- end
            
            for k = 0, getProperty("notes.length") do
                local isNotOpponentNote = getPropertyFromGroup("notes", k, "mustPress");
                if isNotOpponentNote and getPropertyFromGroup("notes", k, "texture") ~= "notes/" .. v then
                    setPropertyFromGroup("notes", k, "texture", "notes/" .. v);
                end
            end
            
            for k = 0, 3 do
                if getPropertyFromGroup("playerStrums", k, "texture") ~= "notes/" .. v then
                    setPropertyFromGroup("playerStrums", k, "texture", "notes/" .. v);
                end
            end
        end
    end
end