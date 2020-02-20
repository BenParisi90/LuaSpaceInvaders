keyPressLeft = false
keyPressRight = false

player = {
    width = 220,
    height = 220,
    scale = .5,
    x = love.graphics.getWidth() * .5,
    y = love.graphics.getHeight() * .9,
    speed = 5
}

function loadGameplay()

    playerShips = love.graphics.newImage('Assets/Player.png')
	-- The : operator means "get the dimensions of the 'ships' Image"
      -- Also, Lua can return multiple arguments.  Neato!
	playerShipsWidth, playerShipsHeight = playerShips:getDimensions()

    playerQuad = love.graphics.newQuad(0, 0, player.width, player.height, playerShipsWidth, playerShipsHeight)
    
    projectiles = {}
    enemies = {}
    createEnemyGrid()
end

function keypressedGameplay(key, scancode, isrepeat)
    if key == 'left' then
        keyPressLeft = true
    elseif key == 'right' then
        keyPressRight = true
    elseif key == 'space' then
        createProjectile()
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
    
    for projIndex = #projectiles, 1, -1 do
		-- Store the current projectile to test
		local proj = projectiles[projIndex]

		for enemyIndex = #enemies, 1, -1 do
			-- Store the current enemy to test
			local enemy = enemies[enemyIndex]

			if overlaps(enemy, proj) then
                -- Remove both
                table.remove(enemies, enemyIndex)
				table.remove(projectiles, projIndex)
				-- Break out of the loop and move on to the next projectile
                break
            end
        end
        if proj.y < 0 then
            table.remove(projectiles, projIndex)
        end
	end
end

function drawGameplay()
    --love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)     
    love.graphics.draw(playerShips, playerQuad, player.x, player.y, 0, player.scale, player.scale, player.width * player.scale, player.height * player.scale)
    for index, proj in ipairs(projectiles) do
		drawProjectile(proj)
    end
    for index, enemy in ipairs(enemies) do
		drawEnemy(enemy)
	end
end

function overlaps(colliderA, colliderB)
	local tooFarLeft = (colliderB.x + colliderB.w < colliderA.x)
	local tooFarRight = (colliderB.x > colliderA.x + colliderA.w)
	local tooFarUp = (colliderB.y + colliderB.h < colliderA.y)
	local tooFarDown = (colliderB.y > colliderA.y + colliderA.h)

	local overlapping = not (tooFarLeft or tooFarRight or tooFarUp or tooFarDown)

      return overlapping
end 