--[[
  Original:     http://www.ambience.sk/love2d-a-state-switcher-class-lua/
  Author:       Daniel Duris, (CC-BY 4.0) 2014, dusoft[at]staznosti.sk
  Improved by:  http://www.fredrikvestin.com/
  Mutilated by: Philipp Überbacher, 2017, murks[at]freeshell.de
]]--

gamestate = {args = {}}

function gamestate.switch(statefile, args)
  gamestate.args = args
  dofile(statefile)
end