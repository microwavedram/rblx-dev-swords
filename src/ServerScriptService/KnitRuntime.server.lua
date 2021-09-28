local ServerScriptService = game:GetService("ServerScriptService")
local Knit = require(game:GetService("ReplicatedStorage").Knit)
local Component = require(Knit.Util.Component)

local cmdr = require(game:GetService("ReplicatedStorage").Cmdr)
cmdr:RegisterDefaultCommands()
cmdr:RegisterCommandsIn(game:GetService("ServerScriptService").cmds)
cmdr:RegisterTypesIn(game:GetService("ServerScriptService").types)
cmdr:RegisterHooksIn(game:GetService("ServerScriptService").hooks)

for _,v in pairs(game:GetService("ServerScriptService").Game.Services:GetChildren()) do
    require(v)
end

Component.Auto(game:GetService("ServerScriptService").Game.Components)

Knit.Start():Catch(warn)