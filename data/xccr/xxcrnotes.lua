
    local screenWidth = 1280  -- Replace 1280 with the actual screen width value
    local screenHeight = 720  -- Replace 720 with the actual screen height value
    local baseX = (screenWidth / 2) - (157 / 2)
    local baseY = (screenHeight / 2) - (157 / 2)
    local sinMultiplier = 300
    local cosMultiplier = 300
    local sinFactor = 2
    local minRadius = 0.01
    local maxRadius = 1
    -- Define the rate at which the radius changes
    local radiusSpeed = 0.001
    -- Initialize the radius
    local radius = minRadius -- Replace 1 with the desired initial radius value
    local radiusDecrease = 0.001  -- Adjust the decrease factor according to your needs
    local speed = 0.01

    local playerGhostTap = 0
    local downScrol = 0

    local ChartDebug = false;

    local DebugMode = true;


function onCreate()
    makeLuaSprite("getfcucked", "Stages/getfuck", 0.0, 0.0)      
    screenCenter("getfcucked", 'xy')
    setObjectCamera("getfcucked", "other")
    setProperty("getfcucked.alpha", 0)
    doTweenAlpha("getfcuckedtw", "getfcucked", 1, songLength / 1000, "circIN")
    addLuaSprite("getfcucked", false)  
    setProperty("camHUD.alpha", 0);
    if inChartEditor then
        ChartDebug = true;
    end
    
end

function onCreatePost()
    if not ChartDebug then
        if getProperty(ghostTapping) == true and not DebugMode then --check for ghost tapping and register that in the variable
            playerGhostTap = 1
            setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
        end
    
        if getPropertyFromClass("ClientPrefs", "downScroll") == true and not DebugMode then
            downScrol = 1;
            setPropertyFromClass('ClientPrefs', 'downScroll', false)
        end
        
    end
    
    
end




function onBeatHit()
    if curBeat == 32 then
        doTweenAlpha('hudFunne', 'camHUD', 1, 1, 'linear')
    end
end
function onUpdate(elapsed)
    
    local songPos = getSongPosition()
    for angle = 0, 2 * math.pi, 0.1 do
        local sineValue = math.sin(angle)
    end

    setProperty('cpuControlled', false)
    


    radius = minRadius + (maxRadius - minRadius) * math.sin(radiusSpeed * songPos)

    for i = 0, 7 do
        local currentBeat = (songPos / 5000) * (curBpm / 24)
        local noteIndex = i + 4

        local angle = currentBeat + i * sinFactor

        local x = baseX + math.sin(angle) * sinMultiplier * radius
        local y = baseY + math.cos(angle) * cosMultiplier * radius

        noteTweenX("defaultPlayerStrumX" .. i, noteIndex, x, speed)
        noteTweenY("defaultPlayerStrumY" .. i, noteIndex, y, speed)
        noteTweenDirection("defaultPlayerStrumDirection" .. i, noteIndex, y, speed)
        noteTweenAngle("defaultPlayerStrumAngle" .. i, noteIndex, y, speed)

        angle = currentBeat + (i + 4) * sinFactor
        x = baseX + math.sin(angle) * sinMultiplier * radius
        y = baseY + math.cos(angle) * cosMultiplier * radius

        noteTweenX("fake" .. (i + 1), i, x, speed)
        noteTweenY("defaultFPlayerStrumY" .. i, i, y, speed)
        noteTweenDirection("fakeDirection" .. (i + 1), noteIndex, y, speed)
        noteTweenAngle("fakeAngle" .. (i + 1), noteIndex, y, speed)
        doTweenColor("fcolor", i, "00ff00", 0.0, "circIn")
    end
end


function onSongEnd()
    if playerGhostTap == 1 then
        setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
    end
    if downScrol == 1 then
        setPropertyFromClass('ClientPrefs', 'downScroll', true)
    end
end