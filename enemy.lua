function createEnemy(xPos, yPos)
	local newEnemy = {
		x = xPos,
        y = yPos,
        w = 40,
        h = 40
    }
    table.insert(enemies, newEnemy)
	return newEnemy
end

function drawEnemy(enemy)
      love.graphics.rectangle('fill', enemy.x, enemy.y, enemy.w, enemy.h)
end

function updateEnemy(enemy, dt)
	-- Remember, multiplying by dt here means that the speed is in pixels 
      -- per second (150)
	--proj.y = proj.y - proj.speed * dt
end

function createEnemyGrid()
    gridHeight = 5
    gridWidth = 10
    enemySpacing = 50
    local i = 0
    while i < gridWidth do
        local j = 0
        while j < gridHeight do
            createEnemy(i * enemySpacing, j * enemySpacing)
            j = j + 1
        end
        i = i + 1
    end
end