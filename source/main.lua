import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "dvd" -- DEMO
local dvd = dvd(1, -1) -- DEMO

local gfx <const> = playdate.graphics
local font = gfx.font.new('font/Mini Sans 2X') -- DEMO

local function loadGame()
	playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps
	math.randomseed(playdate.getSecondsSinceEpoch()) -- seed for math.random
	gfx.setFont(font) -- DEMO
	-- gfx.sprite.setBackgroundDrawingCallback(
	-- 	function(x,y,width,height)
	-- 		backgroundImage:draw(0,0)
	-- 	end
	-- )
end

local function updateGame()
	dvd:update() -- DEMO
end

local function drawGame()
	gfx.clear() -- Clears the screen
	dvd:draw() -- DEMO
end

loadGame()

function playdate.update()
	updateGame()
	drawGame()
	playdate.drawFPS(0,0) -- FPS widget
	gfx.sprite.update()
end