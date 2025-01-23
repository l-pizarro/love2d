if utils then return end

local utils =  {}

function utils.rgbToBin(r,g,b)
    return {
        r/255,
        g/255,
        b/255
    }
end

function utils.setColor(r,g,b)
    local colorTable = utils.rgbToBin(r,g,b)
    love.graphics.setColor(unpack(colorTable))
end

function utils.setBackground(r,g,b)
    local colorTable = utils.rgbToBin(r,g,b)
    love.graphics.clear(unpack(colorTable))
end

return utils