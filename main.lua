require('titleScreen')
require('gameplay')
require('projectile')
require('enemy')

function love.load()
    love.draw = drawTitleScreen
    love.keypressed = keypressedTitleScreen
end