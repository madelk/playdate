import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx <const> = playdate.graphics

class("dvd").extends()

function dvd:init(xspeed, yspeed)
    self.label = {
		x = 155,
		y = 110,
		xspeed = xspeed,
		yspeed = yspeed,
		width = 100,
		height = 45
	}
	local dvdSpriteReady = gfx.image.new("images/dvd")
	local dvdSprite = gfx.sprite.new(dvdSpriteReady)
	dvdSprite:moveTo(self.label.x, self.label.y)
	dvdSprite:add()
	self.dvdSprite = dvdSprite
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