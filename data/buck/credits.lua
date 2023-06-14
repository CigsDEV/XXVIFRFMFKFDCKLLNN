local SongStuff = {

    songCreator = "ColdRamen",
    charter = "Socket",
    coder = "Cigs + Socket"

}

local path = "UI/";
local Camera = "Other";


function onCreatePost()

    makeLuaSprite("creditBox", path .. "CreditBox", 10, -100)
    setObjectCamera("creditBox", Camera)

    makeLuaText("fuckthis", "For your fingers sanity, i will not be making you play this - Socket", 2000, 0, 0);
    screenCenter("fuckthis", 'xy')
    setTextColor("fuckthis", "ff0000");
    setTextSize("fuckthis", 30)

    makeLuaSprite("CreatorIcon", path .. "creditIcons/cred-" .. SongStuff.songCreator, 190, -103)
    setObjectCamera("CreatorIcon", Camera)
    scaleObject("CreatorIcon", 0.5, 0.5)

    --if getProperty("CreatorIcon") == nil then
     --   debugPrint("CreatorIcon doesn't exist, or uhhh... idk")
    --end

    

    makeLuaText("SongTitle", songName .. " by: " .. SongStuff.songCreator .. "\nCharted By: " .. SongStuff.charter .. "\nCode By: " .. SongStuff.coder .."\nthis song sucked to chart holy shit", 200, 21, -104.0)
    setTextSize("SongTitle", 15)
    setTextAlignment("SongTitle", 'left')
    setTextFont("SongTitle", "tahoma.ttf")
    setObjectCamera("SongTitle", Camera)
    



    

    addLuaSprite("creditBox", false)
    addLuaText("SongTitle")
    addLuaText("CreatorName")
    addLuaSprite("CreatorIcon")
    addLuaText("fuckthis")
    setProperty("fuckthis.visible", false)
    



    
end

function onCountdownTick(counter)
    if counter == 3 then
        doTweenY("credTween", "creditBox", 1000, 12, "backInOut")
        doTweenY("SongTitleTween", "SongTitle", 1000, 12, "backInOut")
        doTweenY("citween", "CreatorIcon", 1000, 12, "backInOut")
        
        
    end
    
end

function onBeatHit()
    if (curBeat == 56) then
        setProperty("fuckthis.visible", true)
        setProperty(botPlay, true);
    elseif (curBeat == 64) then
        removeLuaText("fuckthis", true)
        setProperty(botPlay, false);
    end
    
end

function onStepHit()
end

function onUpdate(elapsed)
    
end
