local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Engine 		    = ReplicatedStorage:WaitForChild("ACS_Engine")
local Evt 			    = Engine:WaitForChild("Events")

local Stored = Instance.new("IntValue")
Stored.Value = math.huge

return function(context, players)
    for _,player in pairs(players) do
        if player.Character and player.Character:FindFirstChild("Humanoid") ~= nil and player.Character.Humanoid.Health > 0 then

            for _,Child in pairs(player.Character:GetChildren()) do 
                if Child:IsA("Tool") and require(Child.ACS_Settings).Type == 'Gun' then 
                    if true then
                        Evt.Refil:FireClient(player, Child, true, Stored)
                        script.Parent.Parent.RefilSound:Play()
                    else
                        if require(Child.ACS_Settings).BulletType == "Universal" then
                            Evt.Refil:FireClient(player, Child, true, Stored)
                        end
                    end
                end
            end
        end
    end
end

