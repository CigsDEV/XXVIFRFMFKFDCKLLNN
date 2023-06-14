local lastmiss = 0;
local curbfColor = 'ffffff'

function onCreate()
    makeLuaText("idot", "you're supposed to hit the arrow keys lmao", 200, 0.0, 0.0)
    screenCenter("idot", 'xy')
    setTextSize("idot", 3)
    setTextFont("idot", "tahoma.ttf")
    setProperty("idot.alpha", 0);
    setProperty("idot.antialaising", false)
    addLuaText("idot")
end

function onUpdate(elapsed)
    if misses ~= lastmiss then
        setProperty("boyfriend.color", getColorFromHex("0f00ff"))
        doTweenColor("bftween", "boyfriend", "ffffff", 3, "circOut")
        setProperty("idot.alpha", 10)
        doTweenAlpha("lol", "idot", 0, 2, "circOut")
        lastmiss = misses
    end
    setProperty('boyfriend.alpha', 1)
end
