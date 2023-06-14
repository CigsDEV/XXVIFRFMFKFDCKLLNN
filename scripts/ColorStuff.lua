local RainbowChar = false
local CurColor = 1
local dadColor = 'ffffff'
local bfColor = 'ffffff'
local del = 0;
local del2 = 0;

local CharacterColors = {
    bf = {'e10954', '31b1d1', '84f578'},
    gf = {'FF9900', '9966CC', 'FFFF00'},
    buck = {'ebcf34', 'b5e630', 'eb712a'},
    xccr = {'00ff00', 'ff0000', '00ff00', 'ff0000'},
    players = {'8CA5F7', '930000', 'CE9C73'},
    radical = {'840004', 'CD030C', 'FFFFFF'},
    radical_playable = {'840004', 'CD030C', 'FFFFFF'},
    glen = {'FF0000', 'FF7F00', 'FFFF00', '00FF00', '0000FF', '4B0082', '8B00FF'}

    -- Add more characters and their colors here
}

function onCreatePost()
    makeLuaSprite('Health', 'healthBarOverlay')
    setObjectCamera('Health', 'hud')
    addLuaSprite('Health', true)
    scaleObject('Health', 0.93, 0.9)
    setObjectOrder('Health', getObjectOrder('healthBar') + 1)
    setProperty('healthBarBG.visible', true)
    setProperty('Health.x', getProperty('healthBar.x') - 5)
    setProperty('Health.y', getProperty('healthBar.y') - 4)
end

function onUpdatePost(elapsed)
    if inGameOver then
            doTweenColor("die", "boyfriend", 'ff0000', 0.1, nil)
    end
    
end


function onUpdate(elapsed)
    if del > 0 then
        del = del - 1
    end
    if del2 > 0 then
        del2 = del2 - 1
    end

    if dadName == 'KF2' then

        RainbowChar = true

        local currentAnim = getProperty('dad.animation.curAnim.name')

        if currentAnim == 'singLEFT' then
            TweenDad('ff00ff')
        elseif currentAnim == 'singRIGHT' then
            TweenDad('ff0000')
        elseif currentAnim == 'singDOWN' then
            TweenDad('0000ff')
        elseif currentAnim == 'singUP' then
            TweenDad('00ff00')
        else
            TweenDad('ffffff')
        end

        -- Perform actions based on the current animation
        setHealthBarColors(dadColor, bfColor)
    end
end

function TweenDad(color)
    dadColor = color
    doTweenColor('color', 'dad', color, 1, 'circOut')
    doTweenColor('icoColor', 'iconP2', color, 1, 'circOut')
end

function onBeatHit()
    CurColor = CurColor + 1

    if CharacterColors[boyfriendName] then
        local characterColors = CharacterColors[boyfriendName]
        local numColors = #characterColors

        if CurColor <= numColors then
            bfColor = characterColors[CurColor - 1]
        else
            CurColor = 1
            bfColor = characterColors[numColors]
        end
    end

    if CharacterColors[dadName] and not RainbowChar then
        local characterColors = CharacterColors[dadName]
        local numColors = #characterColors

        if CurColor <= numColors then
            dadColor = characterColors[CurColor]
        else
            CurColor = 1
            dadColor = characterColors[numColors]
        end
    end

    doTweenColor('iconp1Color', 'iconP1', bfColor, 1, 'circOut')
    doTweenColor('iconp2Color', 'iconP2', dadColor, 1, 'circOut')
    setHealthBarColors(dadColor, bfColor)
end
