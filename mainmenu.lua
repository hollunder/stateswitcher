--[[ This example is a part of the State switcher class: stateswitcher.lua
Author: Daniel Duris, (CC-BY) 2014, dusoft[at]staznosti.sk
Mutilated by: Philipp Überbacher, 2017, murks[at]freeshell.de]]--

function love.draw()
  love.graphics.setBackgroundColor(200,200,200)

  love.graphics.setColor(255,30,30)
  love.graphics.printf("Main menu (e.g. mainmenu.lua)",50,50,love.graphics.getWidth()-100)

  love.graphics.setColor(0,0,0)
  love.graphics.printf("Press any key to switch to a new state.",100,80,love.graphics.getWidth()-200)
  love.graphics.printf("Info: This state switcher class is based on files (one state = one file).",100,150,love.graphics.getWidth()-200)
end

function love.keyreleased(key)
  gamestate.switch('credits.lua')
end