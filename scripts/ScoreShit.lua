FadeTime = 0.5
FadeEase = 'CircInOut'

---

local colors = {
    idle = 'ffffff',
    singLEFT = 'C14A9A',
    singDOWN = '01FFFF',
    singUP = '12FA06',
    singRIGHT = 'F73A40',
    hey = "ffffff"
}

function onCountdownTick(counter)
    if counter == 0 then
        playSound('intro3-xD')
    elseif counter == 1 then
        setProperty('CountTwo.visible', true)
        doTweenAlpha('TwoFade', 'CountTwo', 0, FadeTime, FadeEase)
        setProperty('countdownReady.visible', false)
        playSound('intro2-xD')	
    elseif counter == 2 then
        setProperty('CountOne.visible', true)
        doTweenAlpha('OneFade', 'CountOne', 0, FadeTime, FadeEase)
        setProperty('countdownSet.visible', false)
        playSound('intro1-xD')
    elseif counter == 3 then
        setProperty('CountGO.visible', true)
        doTweenAlpha('GoFade', 'CountGO', 0, FadeTime, FadeEase)
        setProperty('countdownGo.visible', false)
        playSound('introGo-xD')
    end
end

local currentAnim = ""
local lastTime = ""

function onCreatePost()
    setProperty('timeTxt.x', 999999)
    addLuaText("Time")
end

function onCreate()
    setProperty('introSoundsSuffix', '-sainscd')

    makeLuaSprite('CountTwo', 'UI/Counter/ready', 0, 0)
    screenCenter('CountTwo', 'xy')
    setObjectCamera('CountTwo', 'other')
    setProperty('CountTwo.visible', false)

    makeLuaSprite('CountOne', 'UI/Counter/set', 0, 0)
    screenCenter('CountOne', 'xy')
    setObjectCamera('CountOne', 'other')
    setProperty('CountOne.visible', false)

    makeLuaSprite('CountGO', 'UI/Counter/go', 0, 0)
    screenCenter('CountGO', 'xy')
    setObjectCamera('CountGO', 'other')
    setProperty('CountGO.visible', false)

    addLuaSprite('CountTwo', true)
    addLuaSprite('CountOne', true)
    addLuaSprite('CountGO', true)

    if downscroll then
        debugPrint("downscroll")
        makeLuaSprite("ScoreBox", "UI/ScoreBox", 1000, -800)
        setObjectCamera("ScoreBox", "HUD")
        setProperty("ScoreBox.antialiasing", false)
        scaleObject("ScoreBox", 1.5, 1.5)

        makeLuaText("ScoreCount", "C:\\Score" .. score, 200, 1020, getProperty("ScoreBox.y"))
        setTextAlignment("ScoreCount", 'left')
        setTextFont("ScoreCount", "tahoma.ttf")
        setTextSize("ScoreCount", 20)
        setTextBorder("ScoreCount", -0.1, "000000")
        setTextColor("ScoreCount", "000000")
        setObjectCamera("ScoreCount", "HUD")

        makeLuaText("Rating", "C:\\Rating: " .. math.floor(rating * 100) .. "% " .. ratingName .. " " .. ratingFC, 200, 1020, getProperty("ScoreBox.y"))
        setTextAlignment("Rating", 'left')
        setTextFont("Rating", "tahoma.ttf")
        setTextSize("Rating", 20)
        setTextBorder("Rating", -0.1, "000000")
        setTextColor("Rating", "000000")
        setObjectCamera("Rating", "HUD")

        makeLuaText("Misses", "D:\\Misses: " .. misses, 200, 1020, getProperty("ScoreBox.y"))
        setTextAlignment("Misses", 'left')
        setTextFont("Misses", "tahoma.ttf")
        setTextSize("Misses", 20)
        setTextBorder("Misses", -0.1, "000000")
        setTextColor("Misses", "000000")
        setObjectCamera("Misses", "HUD")

        makeLuaText("Time", getTextString("timeTxt") , 200, 1010, -100000)
        setTextSize("Time", 25)
        setTextFont("Time", "tahoma.ttf")

        --BOTPLAY
        makeLuaSprite("Robot", "UI/Botplay", 1180, -630)
        setObjectCamera("Robot", "HUD")
        setProperty("Robot.antialiasing", false)
        scaleObject("Robot", 0.5, 0.5)

        --screenCenter("Time", 'xy')

        doTweenY("BoxTween", "ScoreBox", 80, 1.3, "circOut")
        doTweenY("TextTween", "ScoreCount", 130, 1.3, "circOut")
        doTweenY("TextTween2", "Rating", 150, 1.3, "circOut")
        doTweenY("TextTween3", "Misses", 200, 1.3, "circOut")
        doTweenY("TextTween4", "Time", 80, 1.3, "circInOut")
        doTweenY("BotPlaytween", "Robot", 140, 1.3, "circInOut")
    else
        

        debugPrint("Upscroll")

        makeLuaSprite("ScoreBox", "UI/ScoreBox", 1000, 800)
        setObjectCamera("ScoreBox", "HUD")
        setProperty("ScoreBox.antialiasing", false)
        scaleObject("ScoreBox", 1.5, 1.5)

        makeLuaText("ScoreCount", "C:\\Score" .. score, 200, 1020, getProperty("ScoreBox.y"))
        setTextAlignment("ScoreCount", 'left')
        setTextFont("ScoreCount", "tahoma.ttf")
        setTextSize("ScoreCount", 20)
        setTextBorder("ScoreCount", -0.1, "000000")
        setTextColor("ScoreCount", "000000")
        setObjectCamera("ScoreCount", "HUD")

        makeLuaText("Rating", "C:\\Rating: " .. math.floor(rating * 100) .. "% " .. ratingName .. " " .. ratingFC, 200, 1020, getProperty("ScoreBox.y"))
        setTextAlignment("Rating", 'left')
        setTextFont("Rating", "tahoma.ttf")
        setTextSize("Rating", 20)
        setTextBorder("Rating", -0.1, "000000")
        setTextColor("Rating", "000000")
        setObjectCamera("Rating", "HUD")

        makeLuaText("Misses", "D:\\Misses: " .. misses, 200, 1020, getProperty("ScoreBox.y"))
        setTextAlignment("Misses", 'left')
        setTextFont("Misses", "tahoma.ttf")
        setTextSize("Misses", 20)
        setTextBorder("Misses", -0.1, "000000")
        setTextColor("Misses", "000000")
        setObjectCamera("Misses", "HUD")

        makeLuaText("Time", getTextString("timeTxt") , 200, 1010, -100000)
        setTextSize("Time", 25)
        setTextFont("Time", "tahoma.ttf")

        --BOTPLAY
        makeLuaSprite("Robot", "UI/Botplay", 1180, 630)
        setObjectCamera("Robot", "HUD")
        setProperty("Robot.antialiasing", false)
        scaleObject("Robot", 0.5, 0.5)

        --screenCenter("Time", 'xy')

        doTweenY("BoxTween", "ScoreBox", 500, 1.3, "circOut")
        doTweenY("TextTween", "ScoreCount", 550, 1.3, "circOut")
        doTweenY("TextTween2", "Rating", 570, 1.3, "circOut")
        doTweenY("TextTween3", "Misses", 620, 1.3, "circOut")
        doTweenY("TextTween4", "Time", 500, 1.3, "circInOut")
        doTweenY("BotPlaytween", "Robot", 600, 1.3, "circInOut")

        
        
        
    end

    addLuaSprite("ScoreBox", false)
    addLuaText("ScoreCount")
    addLuaText("Rating")
    addLuaText("Misses")
    
    
    if botPlay then
        addLuaSprite("Robot");
    end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    
end


function onUpdatePost(elapsed)
    if getTextString("TimeTxt") == nil then
        lastTime = getTextString("timeTxt");
    end
end

function onUpdate(elapsed)
    currentAnim = getProperty('boyfriend.animation.curAnim.name')

    local  timeElapsed = math.floor(getProperty('songTime')/1000)
    local  timeTotal = math.floor(getProperty('songLength')/1000)

    setTextString("botplayTxt", nil)
    setTextString("ScoreCount", "C\\Score: " .. score)
    setTextString("Rating", "C:\\Rating: " .. math.floor(rating * 100) .. "% " .. ratingName .. " " .. ratingFC)
    setTextString("Misses", "D:\\Misses: " .. misses)
    if songName == "xccr" then
        setTextString("Time", string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60) .. "\\" .. "??:??")
    elseif songName == "fuck this shit" or songName == "fuck-this-shit" then
        setTextString("Time", string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60) .. "\\" .. "2:30")
    else
        setTextString("Time", string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60) .. "\\" .. string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60))
    end
    
    setProperty('scoreTxt.x', 9999)

    setProperty("timeBar.x", "1012")
    if (downscroll) then
        setProperty("timeBar.y", "100")
    else
        setProperty("timeBar.y", "517")
    end
    
    scaleObject("timeBar", 0.5, 1)
    scaleObject("timeBarBG", 0.5, 1)
    
    local TimeColor = colors[currentAnim]
    setTimeBarColors(TimeColor, "000000")
end

function millisecondsToMinutesSeconds(milliseconds)
    local totalSeconds = math.floor(milliseconds / 1000)
    local minutes = math.floor(totalSeconds / 60)
    local seconds = totalSeconds % 60

    return minutes, seconds
end

function onBeatHit()
    debugPrint(curBeat, " yeah")
    if curBeat == 500 and songName == "fuck this shit" or curBeat == 50 and songName =="fuck-this-shit" then
    endSong()
    end
end