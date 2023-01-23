Powerup = Class{}

function Powerup:init(powertype, x, y)
     -- simple positional and dimensional variables
     self.width = 16
     self.height = 16
 
     -- these variables are for keeping track of our velocity on both the
     -- X and Y axis, since the powerup can move in two dimensions
     self.dy = 40
     self.dx = 0
     self.x = x
     self.y = y

     self.powerupType = powerupType
     self.inPlay = true

end

function Powerup:collides(target)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end


function Powerup:update(dt)

    if self.y < VIRTUAL_HEIGHT then
        self.y = self.y + self.dy * dt
    end

end


function Powerup:render()
    if self.inPlay then
        love.graphics.draw(gTextures['main'], gFrames['powerup'][self.powerupType], self.x, self.y)
    end
end