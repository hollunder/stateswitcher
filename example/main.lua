--[[ This example is a part of the State switcher class: stateswitcher.lua
Author: Daniel Duris, (CC-BY) 2014, dusoft[at]staznosti.sk
Mutilated by: Philipp Überbacher, 2017, murks[at]freeshell.de]]--

require('../stateswitcher')

local step = tonumber(gamestate.args[1])
print('step: ')
print(step)

print('somevalue: ')
print(tonumber(gamestate.args.somekey))

function love.draw()
  love.graphics.setBackgroundColor(0,0,0)

  love.graphics.setColor(255,30,30)
  if (step~=2) then
    love.graphics.printf("First state (e.g. main.lua)",50,50,love.graphics.getWidth()-100)
  else
    love.graphics.printf("First state (e.g. main.lua) reloaded!",50,50,love.graphics.getWidth()-100)

    love.graphics.setColor(255,255,255)
    love.graphics.printf("Press any key to switch to new state.",100,80,love.graphics.getWidth()-200)
    love.graphics.printf("Info: And we can easily pass values to the state switcher, so we can retrieve them after it switches.",100,150,love.graphics.getWidth()-200)

    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill",50,200,love.graphics.getWidth()-100,230)
    love.graphics.setColor(0,0,0)
    love.graphics.printf("Code example: \n require('stateswitcher') \n gamestate.switch('credits.lua') -- switching to credits.lua",100,220,love.graphics.getWidth()-200)
    love.graphics.printf("Code example with passing a value: \n state.switch('credits.lua', {2, somekey = 3})", 100,280,love.graphics.getWidth()-200)
    love.graphics.printf("Code example to retrieve the values passed after switch: \n step = gamestate.args[1] -- gets the value of the key 1, which is 2 in this case \nYou can use any key you like: \n somevalue = gamestate.args.somekey \nYou can clear the values simply by assigning or passing an empty table \n gamestate.args = {}",100,320,love.graphics.getWidth()-200)

    love.graphics.setColor(0,0,50)
    love.graphics.rectangle("fill",50,450,love.graphics.getWidth()-100,120)
    love.graphics.setColor(255,255,255)
    love.graphics.printf("Other advantages: \n- edit your code & save to see changes immediately after the state switch (without leaving your program) \n- reuse the functions from the previous states (to keep the same behaviour) or redeclare the functions (to change the behaviour)",100,470,love.graphics.getWidth()-200)
  end
end

function love.keyreleased()
  gamestate.switch('mainmenu.lua')
end

function love.update()
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end
end