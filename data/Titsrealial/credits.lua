local SongStuff = {

    songCreator = "blb03",
    charter = "ColdRamen",
    coder = "Cigs"

}

local path = "UI/";
local Camera = "Other";


function onCreatePost()

    makeLuaSprite("creditBox", path .. "CreditBox", 10, -100)
    setObjectCamera("creditBox", Camera)


    makeLuaSprite("CreatorIcon", path .. "creditIcons/cred-" .. SongStuff.songCreator, 190, -103)
    setObjectCamera("CreatorIcon", Camera)
    scaleObject("CreatorIcon", 0.5, 0.5)

    --if getProperty("CreatorIcon") == nil then
     --   debugPrint("CreatorIcon doesn't exist, or uhhh... idk")
    --end

    

    makeLuaText("SongTitle", songName .. " by: " .. SongStuff.songCreator .. "\nCharted By: " .. SongStuff.charter .. "\nCode By: " .. SongStuff.coder, 200, 21, -104.0)
    setTextSize("SongTitle", 15)
    setTextAlignment("SongTitle", 'left')
    setTextFont("SongTitle", "tahoma.ttf")
    setObjectCamera("SongTitle", Camera)
    



    

    addLuaSprite("creditBox", false)
    addLuaText("SongTitle")
    addLuaText("CreatorName")
    addLuaSprite("CreatorIcon")

    



    
end

function onCountdownTick(counter)
    if counter == 3 then
        doTweenY("credTween", "creditBox", 1000, 12, "backInOut")
        doTweenY("SongTitleTween", "SongTitle", 1000, 12, "backInOut")
        doTweenY("citween", "CreatorIcon", 1000, 12, "backInOut")
        
        
    end
    
end


function onStepHit()
end

function onUpdate(elapsed)
    
end
