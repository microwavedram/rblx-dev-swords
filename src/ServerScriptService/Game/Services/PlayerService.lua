local Knit = require(game:GetService("ReplicatedStorage").Knit)
local Players = game:GetService("Players")

local PlayerService = Knit.CreateService {
    Name = "PlayerService";
    Client = {};
}

function PlayerService:KnitStart()
    local function PlayerAdded(Player)
        Knit.log(string.format("New Player: %s",Player.Name))
        local function CharacterAdded(Character)

        end
        Player.CharacterAdded:Connect(CharacterAdded)
        CharacterAdded(Player.Character)
        
    end
    Players.PlayerAdded:Connect(PlayerAdded)
    for _,Player in pairs(Players:GetPlayers()) do
        PlayerAdded(Player)
    end
end

function PlayerService:KnitInit()
    Knit.log(string.format("Service %s Ready",self.Name),"s")
end

return PlayerService