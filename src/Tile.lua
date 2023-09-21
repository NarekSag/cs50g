--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    self.shiny = math.random(20) == 1 and true or false
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)

     -- draw shiny
    if self.shiny then
        love.graphics.setColor(1, 1, 1, 60/255)

        for i = 0, 1 do
            -- draw horizontal lines
            love.graphics.rectangle('fill', (self.gridX - 1) * 32 + (VIRTUAL_WIDTH - 272),
            (self.gridY - 1) * 32 + 24 + i * 12, 32, 4, 4)

            -- draw vertical lines
            love.graphics.rectangle('fill', (self.gridX - 1) * 32 + 8 + i * 12 + (VIRTUAL_WIDTH - 272),
            (self.gridY - 1) * 32 + 16, 4, 32, 4)
        end
    end
end