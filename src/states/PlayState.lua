PlayState = Class {
    __includes = BaseState
}

function PlayState:init()
    self.paddle = Paddle()
    self.ball = Ball(1)

    self.ball.dx = math.random(-20, 20)
    self.ball.dy = math.random(-5, 0)

    self.ball.x = VIRTUAL_WIDTH / 2 - self.ball.width / 2
    self.ball.y = VIRTUAL_HEIGHT / 2 - self.ball.height / 2

end

function PlayState:update(dt)
    if self.pause then
        if love.keyboard.wasPressed('space') then
            self.pause = false
            gSounds['pause']:play()
        else
            return
        end
    elseif love.keyboard.wasPressed('space') then
        self.pause = true
        gSounds['pause']:play()
    end

    self.paddle:update(dt)
    self.ball:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function PlayState:render()
    self.paddle:render()
    self.ball:render()

    if self.pause then
        love.graphics.setFont(gFonts['large'])
        love.graphics.printf('PAUSED', 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')
    end
end
