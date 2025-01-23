push = require 'push'
lick = require 'lick'
utils = require 'utils'

lick.reset = true

gameWidth = 1280
gameHeight = 720

-- local windowWidth, windowHeight = love.window.getDesktopDimensions()
local windowWidth, windowHeight = 1280, 720

local b1, b2
local b1Height, b2Height
local camera1, camera2 = 0, 0

-- map = Map:create()

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    b1 = love.graphics.newImage("background_1.png")
    b2 = love.graphics.newImage("background_2.png")
    b1Height = b1:getHeight()
    b2Height = b2:getHeight()
    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false, highdpi= true})
end



function love.update(dt)
    if love.keyboard.isDown("right") then
        camera1 = camera1 + (100 * dt)
        camera2 = camera2 + (250 * dt)
    elseif love.keyboard.isDown("left") then
        camera1 = camera1 - (100 * dt)
        camera2 = camera2 - (250 * dt)
    end
end

function love.draw()
    push:start()
        utils.setBackground(233, 181, 142)

        love.graphics.draw(b1, -camera1 % -gameWidth, windowHeight - b1Height)
        love.graphics.draw(b1, gameWidth - camera1 % gameWidth, windowHeight - b1Height)

        love.graphics.draw(b2, -camera2 % -gameWidth, windowHeight - b2Height)
        love.graphics.draw(b2, gameWidth - camera2 % gameWidth, windowHeight - b2Height)
    push:finish()
end