keyPressLeft = false
keyPressRight = false

player = {}
player['width'] = 40
player['height'] = 20
player['x'] = love.graphics.getWidth() * .5
player['y'] = love.graphics.getHeight() * .95
player['speed'] = 5

function keypressedGameplay(key, scancode, isrepeat)
    if key == 'left' then
        keyPressLeft = true
    elseif key == 'right' then
        keyPressRight = true
    end
end

function keyreleasedGameplay(key)
    if key == 'left' then
        keyPressLeft = false
    elseif key == 'right' then
        keyPressRight = false
    end
end

function updateGameplay(dt)
    if keyPressLeft then
        player.x = player.x - player.speed
    end
    if keyPressRight then
        player.x = player.x + player.speed
    end
end

function drawGameplay()
    love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)
end