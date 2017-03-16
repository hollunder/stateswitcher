# stateswitcher

This is a very simple state switcher for Löve games (or any other Lua program).


## Does it do what I want?

The short answer: it depends.

The long answer:


### Pros

- Very simple: one state - one file
- Re-usable functions - functions declared in previous states can be re-used
- Modifyable on the fly - simply modify and reload a state file


### Cons

- Re-usable functions - functions declared in previous states must be re-declared if you do not want them to they stick around. This could lead to weird bugs if you are not careful. If you want to have clean game states by default I can recommend [hump.gamestate](https://github.com/vrld/hump).


## Usage

See the included example or have a look at this brief explanation.

You need to require the library once before using it.
```lua
-- in main.lua
require('stateswitcher')

-- switch to some gamestate
gamestate.switch('myGameState.lua')
```


Any lua file can be a state, but I recommend to cleanly separate them from non-state files.
```lua
-- in myGameState.lua
-- switch to some other state and pass arguments
gamestate.switch('anotherGameState.lua', {2, somekey='somestring', anotherkey=3.41})
```

Read passed values from another game state and clear the arguments.
```lua
-- in anotherGameState.lua
-- read arguments either by index or key
local double = gamestate.args[1]
local s = gamestate.args.somekey
local pi = gamestate.args.anotherkey

-- clear the arguments table
gamestate.args = {}
```

## Origin

This code is based on the idea by Daniel Duris and an improved version of Fredrik Vestin and licensed under the [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
The original and improved versions can be found on [ambience.sk](http://www.ambience.sk/love2d-a-state-switcher-class-lua/).


### Major Changes 

1. The original code weighted in at 22 LOC. Fredrik reduced it to just 12 and made it more flexible in the process. I tried to do the same and reduced it to just 5 LOC.
2. The library declares a single global variable and is intended to be used accordingly. Simply require it once: `require('stateswitcher')`. It is trivial to convert it to a 'localized' version (at the cost of 1 LOC), but I do not see any benefit in doing this for this library.
3. I replaced `require()` with `dofile()`. This way I can avoid the `package.loaded()`-hack. Why cache a file in the first place if you then remove the file from the cache? The drawback is that you have to use the filename instead of the module name, but I guess that just reinforces the 'one file per state'-idea.
4. Fredrik introduced the possibility to pass tables to states by using Luas the three dot parameter (`...`) instead of a string. I went a tiny step further and simply pass a table. This has one clear benefit: I can use any key I want instead of just indices. I could also remove the `clear()`-function and simply assing an empty table instead.
5. I adapted the examples slightly to reflect how my version works.
