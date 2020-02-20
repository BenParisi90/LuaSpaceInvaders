function createProjectile()
	local newProjectile = {
	      x = player.x,
            y = player.y,
            w = 2,
            h = 4,
            speed = 150,
	}
    table.insert(projectiles, newProjectile)
	return newProjectile
end

function drawProjectile(proj)
      love.graphics.rectangle('fill', proj.x, proj.y, proj.w, proj.h)
end

function updateProjectile(proj, dt)
	-- Remember, multiplying by dt here means that the speed is in pixels 
      -- per second (150)
	proj.y = proj.y - proj.speed * dt
end