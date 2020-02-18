require('titleScreen')
require('gameplay')
require('projectile')

function love.load()
    love.draw = drawTitleScreen
    love.keypressed = keypressedTitleScreen
end