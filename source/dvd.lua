import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx <const> = playdate.graphics

class("dvd").extends()

function dvd:init(xspeed, yspeed)
	local width = 100
	local height = 46 -- make it even
	local minx = width /2
	local maxx = 400 - (width /2)
	local miny = height /2
	local maxy = 240 - (height /2)
	local x = math.random(minx, maxx)
	local y = math.random(miny, maxy)

    self.label = {
		x = x,
		y = y,
		xspeed = xspeed,
		yspeed = yspeed,
		width = width,
		height = height
	}
	local dvdSpriteReady = gfx.image.new("images/dvd")
	local dvdSprite = gfx.sprite.new(dvdSpriteReady)
	dvdSprite:moveTo(self.label.x, self.label.y)
	dvdSprite:add()
	self.dvdSprite = dvdSprite
end


function dvd:updateSpeed(faster)
	local adjustment = 0.1
	local limit = 5
    local label = self.label;
	if (faster) then
		if (label.xspeed>0 and label.xspeed < limit) then
			label.xspeed += adjustment
		elseif (label.xspeed <0 and label.xspeed > -limit) then
			label.xspeed -= adjustment
		end
		if (label.yspeed>0 and label.yspeed < limit) then
			label.yspeed += adjustment
		elseif (label.yspeed <0 and label.yspeed > -limit) then
			label.yspeed -= adjustment
		end
	else
		if (label.xspeed>0 and label.xspeed > adjustment) then
			label.xspeed -= adjustment
		elseif (label.xspeed <0 and label.xspeed < -adjustment) then
			label.xspeed += adjustment
		end
		if (label.yspeed>0 and label.yspeed > adjustment) then
			label.yspeed -= adjustment
		elseif (label.yspeed <0 and label.yspeed < -adjustment) then
			label.yspeed += adjustment
		end
	end
end
function dvd:update()
    local label = self.label;
	if (label.x + (label.width /2) >= 400 or label.x- (label.width /2) <= 0) then
        label.xspeed = -label.xspeed;
    end
        
    if (label.y + (label.height /2) >= 240 or label.y- (label.height /2) <= 0) then
        label.yspeed = -label.yspeed;
	end

	label.x += label.xspeed
	label.y += label.yspeed
end

function dvd:draw()
    local label = self.label;
    local dvdSprite = self.dvdSprite;
	dvdSprite:moveTo(label.x, label.y)
    -- gfx.drawTextInRect("Template", label.x, label.y, label.width, label.height)
end