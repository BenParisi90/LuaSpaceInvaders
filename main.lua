gameState = 'TitleScreen'

keyPressLeft = false
keyPressRight = false

player = {}
player['width'] = 40
player['height'] = 20
player['x'] = love.graphics.getWidth() * .5
player['y'] = love.graphics.getHeight() * .95
player['speed'] = 5

function love.keypressed( key, scancode, isrepeat )
    if gameState == 'TitleScreen' then
        gameState = 'Gameplay'
    elseif gameState == 'Gameplay' then
        if key == 'left' then
            keyPressLeft = true
        elseif key == 'right' then
            keyPressRight = true
        end
    end
end

function love.keyreleased(key)
    if key == 'left' then
        keyPressLeft = false
    elseif key == 'right' then
        keyPressRight = false
    end
end

function love.update(dt)
    if keyPressLeft then
        player.x = player.x - player.speed
    end
    if keyPressRight then
        player.x = player.x + player.speed
    end
end

function love.draw()
    if gameState == 'TitleScreen' then
        love.graphics.print('Space Invaders', love.graphics.getWidth() * .3, love.graphics.getHeight() * .2)
        love.graphics.print('Press Any Key To Begin', love.graphics.getWidth() * .5, love.graphics.getHeight() * .5)
    elseif gameState == 'Gameplay' then
        love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)
    end
end