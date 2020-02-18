function createProjectile()
	local newProjectile = {
		x = player.x + player.width / 2,
		y = player.y,
        speed = 150,
	}

	return newProjectile
end

function drawProjectile(proj)
      -- Scaling the projectile up by 2x

      love.graphics.rectangle('fill', proj.x, proj.y, 2, 4)
end

function updateProjectile(proj, dt)
	-- Remember, multiplying by dt here means that the speed is in pixels 
      -- per second (150)
	proj.y = proj.y - proj.speed * dt
end