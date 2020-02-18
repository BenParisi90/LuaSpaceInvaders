require('titleScreen')
require('gameplay')

function love.load()
    love.draw = drawTitleScreen
    love.keypressed = keypressedTitleScreen
end