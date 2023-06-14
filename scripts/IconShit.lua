function onCreate()
    makeLuaSprite('iconP1obj', 'iconobj', 0, 0)
    makeLuaSprite('iconP2obj', 'iconobj', 0, 0)
    
    addLuaSprite('iconP1obj')
    addLuaSprite('iconP2obj')
    
    
    -- close(true)
end

function onCreatePost()
    hideHud = true;
end

function onUpdatePost(elapsed)
    setProperty('iconP1.scale.x', getProperty('iconP1obj.scale.x'))
    setProperty('iconP2.scale.x', getProperty('iconP2obj.scale.x'))
    setProperty('iconP1.scale.y', getProperty('iconP1obj.scale.y'))
    setProperty('iconP2.scale.y', getProperty('iconP2obj.scale.y'))
    setProperty('iconP1.y', (getProperty('healthBar.y') - 149) - getProperty('iconP1.scale.y') / -0.013)
    setProperty('iconP2.y', (getProperty('healthBar.y') - 149) - getProperty('iconP2.scale.y') / -0.013)
end



function onBeatHit()
    local scaleMultiplierX = 1.30
    local scaleMultiplierp1Y = 2;
    local scaleMultiplierp2Y = 0.2;
    local rotateMultiplier = 20
    local tweenMultiplier = 1.15
    
    if curBeat % 2 == 0 then
        scaleObject('iconP1obj', scaleMultiplierX, scaleMultiplierp2Y)
        scaleObject('iconP2obj', scaleMultiplierX, scaleMultiplierp1Y)
        
        setProperty('iconP1.angle', -rotateMultiplier)
        setProperty('iconP2.angle', rotateMultiplier)
    else
        scaleObject('iconP1obj', scaleMultiplierX, scaleMultiplierp1Y)
        scaleObject('iconP2obj', scaleMultiplierX, scaleMultiplierp2Y)
        
        setProperty('iconP1.angle', rotateMultiplier)
        setProperty('iconP2.angle', -rotateMultiplier)
    end

    if curbeat == 10 then
        hideHud = false;
    end
    
    doTweenAngle('icon1tween', 'iconP1', 0, crochet / (1300 * tweenMultiplier), 'quadOut')
    doTweenAngle('icon2tween', 'iconP2', 0, crochet / (1300 * tweenMultiplier), 'quadOut')
    doTweenX('icon1objx', 'iconP1obj.scale', 1, crochet / (1300 * tweenMultiplier), 'quadOut')
    doTweenX('icon2objx', 'iconP2obj.scale', 1, crochet / (1300 * tweenMultiplier), 'quadOut')
    doTweenY('icon1objy', 'iconP1obj.scale', 1, crochet / (1300 * tweenMultiplier), 'quadOut')
    doTweenY('icon2objy', 'iconP2obj.scale', 1, crochet / (1300 * tweenMultiplier), 'quadOut')

    
end


