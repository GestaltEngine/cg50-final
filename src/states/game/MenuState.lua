--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

MenuState = Class{__includes = BaseState}

function MenuState:init(menu, onClose, canInput)
    self.menu = menu


    -- function to be called once this message is popped
    self.onClose = onClose or function() end

    -- whether we can detect input with this or not; true by default
    self.canInput = canInput

    -- default input to true if nothing was passed in
    if self.canInput == nil then self.canInput = true end
end

function MenuState:update(dt)
    if self.canInput then
        self.menu:update(dt)

        if self.menu:isClosed() then
            gStateStack:pop()
            self.onClose()
        end
    end
end

function MenuState:render()
    self.menu:render()
end