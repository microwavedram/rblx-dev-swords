local Knit = require(game:GetService("ReplicatedStorage").Knit)
local Component = require(Knit.Util.Component)

require(game:GetService("ReplicatedStorage"):WaitForChild("CmdrClient")):SetActivationKeys({Enum.KeyCode.F2})

for _,v in pairs(game:GetService("ReplicatedStorage").Game.Controllers:GetChildren()) do
    require(v)
end

Component.Auto(game:GetService("ReplicatedStorage").Game.Components)

Knit.Start():Catch(warn)