local path = "stages/Buck/"
local ShaderName = "Callbacks/Bloom Effect/Bloom"
local XCCRShaderName = "Callbacks/old tv effect/old tv"
local bloomThreshold = 0.8
local bloomIntensity = 1
local bool stfutime = false;

phillyLightsColors = {
	'ffcc00',
	'fbff00',
	'6aff00',
	'ff7700',
	'ff2a00'
};

function onCreate()
	makeLuaSprite('BG', path .. "Cabin", -150, -40);
	setScrollFactor('BG', 1, 1);
	scaleObject("BG", 2, 2)
	addLuaSprite('BG', false);

	makeLuaSprite('Chair', path .. "BuckChair", 100, 520)

	makeLuaSprite('Glow', path .. 'buckGlow', 80, 420)


	addLuaSprite('Chair');
	addLuaSprite('Glow');

	makeLuaSprite("xcpage", "stages/XCCR2", 0, 0)
	screenCenter("xcpage", 'xy')
	setScrollFactor("xcpage", 0, 0)
	setProperty("xcpage.alpha", 0)
	addLuaSprite("xcpage")
	
			

	if songName == "xccr" then
		removeLuaSprite("BG", true)

		
		
		
		setProperty('Chair.color', getColorFromHex('15ff00'));
		setProperty('Glow.color', getColorFromHex('15ff00'));
		
		debugPrint(getProperty("XCCRPage.x"), getProperty("XCCRPage.y"), getProperty("XXCRPage"))
	end

	
	
end


function onBeatHit()

	if curBeat >= 160 and not stfutime and songName == "ucKB" then
		if shadersEnabled then
			runHaxeCode([[
				var shaderName = "]] .. ShaderName .. [[";
				game.initLuaShader(shaderName);
		
				// I DON'T KNOW WHY, BUT THIS FIXES THE SHADER ISSUE?????? bruh
				
				var shader0 = game.createRuntimeShader(shaderName);
				game.camHUD.setFilters([new ShaderFilter(shader0)]);
				game.camGame.setFilters([new ShaderFilter(shader0)]);
		
				var shader1 = game.createRuntimeShader(shaderName);
				game.iconP2.shader = shader1;
		
				//var shader2 = game.createRuntimeShader(shaderName);
				//game.getLuaObject("Glow").shader = shader2;
				//game.getLuaObject("Glow").shader = game.iconP2.shader;
		
				//game.camHUD.setFilters([new ShaderFilter(game.dad.shader)]);
				
				//game.camGame.setFilters([new ShaderFilter(game.dad.shader)]); 
				return;
			]])
		end
		doTweenAlpha("tween", "BG", 0, 1, "circOut")

		if curBeat % 4 == 0 then
			setProperty('BG.visible', false)
			phillyColor = phillyLightsColors[getRandomInt(0, #phillyLightsColors)];
			setProperty('dad.color', getColorFromHex(phillyColor));
			setProperty('gf.color', getColorFromHex(phillyColor));
			setProperty('boyfriend.color', getColorFromHex(phillyColor));
			setProperty('Chair.color', getColorFromHex(phillyColor));
			setProperty('Glow.color', getColorFromHex(phillyColor));
		end

	elseif curBeat >= 224 and curBeat <= 225 and songName == "ucKB" then
		stfutime = true;
		cameraFade('hud', '000000', 4, true);
	end 

	if songName == "xccr" then
		
		if curBeat == 32 then

			setProperty("xcpage.alpha", 1)
			setProperty("dad.alpha", 0)	

			

		end

	end

	

	
end

function onUpdate(elapsed)

	local elapsedSeconds = os.clock()
	if songName == "xccr" then
		setProperty('dad.color', getColorFromHex('15ff00'));
		setProperty('gf.color', getColorFromHex('15ff00'));
		setProperty('boyfriend.color', getColorFromHex('15ff00'));
	end

	runHaxeCode([[

				var xhaderName = ""]]  .. XCCRShaderName ..  [[";
				game.initLuaShader(xhaderName);

				var shader0 = game.createRuntimeShader(xhaderName);

				game.getLuaObject("xcpage").shader = shader0;
				
				return;
			]])

	setShaderFloat(getProperty("dad"), "bloomThreshold", bloomThreshold)
	setShaderFloat(getProperty("dad"), "bloomIntensity", bloomIntensity)
	setShaderFloat(getProperty("dad"), "iTime", elapsedSeconds)
	
	setShaderFloat("xcpage", "iTime", elapsedSeconds)
	
 end