
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them



local ShaderName = "Callbacks/Bloom Effect/Bloom"



function onCreate()
	-- background shit

	makeLuaSprite('BG', 'stages/radical', -600, -300);
	
	setScrollFactor('BG', 1, 1);
	addLuaSprite('BG', false);
   

end


--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them



local ShaderName = "Callbacks/Bloom Effect/Bloom"



function onCreate()
	-- background shit

	makeLuaSprite('BG', 'stages/radical', -600, -300);
	
	setScrollFactor('BG', 1, 1);
	addLuaSprite('BG', false);
   

end


function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.01);
    end
end

function onUpdate(elapsed)
	if shadersEnabled then
	runHaxeCode([[
			
			var shaderName = "Callbacks/soo much weird/soo weird";
			game.initLuaShader(shaderName);
			var shader0 = game.createRuntimeShader(shaderName);
			game.getLuaObject("BG").shader = shader0;
			return;
		]])
	end
	

    setShaderFloat(getProperty("dad"), "iTime", os.clock())
	setShaderFloat("BG", "iTime", os.clock())
 end