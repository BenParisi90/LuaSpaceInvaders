function keypressedTitleScreen()
    love.draw = drawGameplay
    love.update = updateGameplay
    love.keypressed = keypressedGameplay
    love.keyreleased = keyreleasedGameplay
end

function drawTitleScreen()
    love.graphics.print('Space Invaders', love.graphics.getWidth() * .3, love.graphics.getHeight() * .2)
    love.graphics.print('Press Any Key To Begin', love.graphics.getWidth() * .5, love.graphics.getHeight() * .5)
end