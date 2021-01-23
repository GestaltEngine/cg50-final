--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.level = Level()

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()

    self.dialogueOpened = false
end

function PlayState:update(dt)
    if not self.dialogueOpened and love.keyboard.wasPressed('p') then
        
        -- heal player pokemon
        gSounds['heal']:play()
        self.level.player.party.pokemon[1].currentHP = self.level.player.party.pokemon[1].HP
        
        -- show a dialogue for it, allowing us to do so again when closed
        gStateStack:push(DialogueState('Your Pokemon has been healed!',
    
        function()
            self.dialogueOpened = false
        end))

        self.dialogueOpened = true
    elseif not self.dialogueOpened and love.keyboard.wasPressed('d') then
        -- buff player pokemon
        gSounds['heal']:play()
        self.level.player.party.pokemon[1].HP = 99
        self.level.player.party.pokemon[1].attack = 99
        self.level.player.party.pokemon[1].defense = 99
        self.level.player.party.pokemon[1].speed = 99
        self.level.player.party.pokemon[1].currentHP = self.level.player.party.pokemon[1].HP
        
        -- show a dialogue for it, allowing us to do so again when closed
        gStateStack:push(DialogueState('Your Pokemon has been buffed into oblivion!',
    
        function()
            self.dialogueOpened = false
        end))

        self.dialogueOpened = true
    end

    self.level:update(dt)
end

function PlayState:render()
    self.level:render()
end