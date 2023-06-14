local Path = "stages/Fanon/"
local ShaderName = "Callbacks/Dither Effect/Dither"

function onCreate()
	makeSprite("BG", "Background", 0, 0, false, false)
	scaleObject("BG", 1.5, 1.5)
	setScrollFactor("BG", 0.2, 0.2)
	screenCenter("BG", 'xy')

	makeSprite("Stages", "StageMain", 0, 320, false)
	screenCenter("Stages", 'x')
	scaleObject("Stages", 1.5, 1.5)
	makeAnimatedLuaSprite("Junkers", Path .. "FanonJunkers", 0.0, 190.0)
	scaleObject("Junkers", 1.5, 1.5)
	addAnimationByPrefix("Junkers", "Junk", "Junkers", 24, false)
	addLuaSprite("Junkers")

	--makeSprite("dith", "ditherbit")
	--scaleObject("dith", screenWidth / 1, screenHeight / 1);
	--scaleObject

	


end










-- testing shit IGNORE

function onBeatHit()
	playAnim("Junkers", "Junk", true, false, 0)
end

---
--- @param swagCounter int
---
function onCountdownTick(swagCounter)
	playAnim("Junkers", "Junk", true, false, 0)
end

function makeSprite(tag, name, x, y, antiAlias, overlap, color)
	if tag == nil or name == nil then
		--debugPrint("tag or name isn't set properly: [" .. tostring(tag) .. " | " .. tostring(name) .. "]")
		return
	end

	if overlap == nil then
		--debugPrint("Warning: Overlap isn't set, is this intentional?") -- a warning
	end

	if antiAlias == nil then
		--debugPrint("Warning: Antialias isn't set, is this intended?")
	end

	makeLuaSprite(tag, Path .. name, x, y)
	getProperty(tag .. ".antialiasing", antiAlias)

	if color ~= nil then
		getProperty(tag .. ".color", color)
	end

	addLuaSprite(tag, overlap)
end
