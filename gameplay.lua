keyPressLeft = false
keyPressRight = false

player = {}
player['width'] = 40
player['height'] = 20
player['x'] = love.graphics.getWidth() * .5
player['y'] = love.graphics.getHeight() * .95
player['speed'] = 5

function loadGameplay()
    projectiles = {}
end

function keypressedGameplay(key, scancode, isrepeat)
    if key == 'left' then
        keyPressLeft = true
    elseif key == 'right' then
        keyPressRight = true
    elseif key == 'space' then
        local newProj = createProjectile()
		table.insert(projectiles, newProj)
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

    for index, proj in ipairs(projectiles) do
		updateProjectile(proj, dt)
	end
end

function drawGameplay()
    love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)

    for index, proj in ipairs(projectiles) do
		drawProjectile(proj)
	end
end