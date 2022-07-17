function onCreatePost() 
    local player = getProperty('boyfriend.curCharacter');
    
    if (player:lower() == "clover") then
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'GOClover');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'GOContinueClover');
    else
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
    end
end