require('titleScreen')
require('gameplay')
require('projectile')
require('enemy')

function love.load()
    shootSound = love.audio.newSource('Assets/Shoot.wav', 'static')

    backgroundMusic = love.audio.newSource('Assets/Music.mp3', 'stream')
    backgroundMusic:play()

    love.draw = drawTitleScreen
    love.keypressed = keypressedTitleScreen
end