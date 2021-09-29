local Knit = require(game:GetService("ReplicatedStorage").Knit)
local Component = require(Knit.Util.Component)

local Players = game:GetService("Players")
local ProfileService = require(game:GetService("ServerScriptService").Game.Modules.ProfileService)

local DatabaseService = Knit.CreateService {
    Name = "DatabaseService";
    Client = {};
}

local PROFILE_TEMPLATE = {
    PlayerSave = {},
    PlayerStats = {
        Rank = "",
        LogInTimes = 0,
        FirstLoginDate = 0;
    }
}

DatabaseService.GameProfileStore = ProfileService.GetProfileStore(
    "PlayerData",
    PROFILE_TEMPLATE
)

DatabaseService.Profiles = {}

function DatabaseService:InitPlayer(player, profile)
    profile.Data.PlayerStats.LogInTimes = profile.Data.PlayerStats.LogInTimes + 1
    if profile.Data.PlayerStats.LogInTimes == 1 then
        profile.Data.PlayerStats.FirstLoginDate = os.time();
    end
end

function DatabaseService:PlayerAdded(player)
    local profile = self.GameProfileStore:LoadProfileAsync(
        "Player_" .. player.UserId,
        "ForceLoad"
    )
    if profile ~= nil then
        profile:Reconcile()
        profile:ListenToRelease(function()
            self.Profiles[player] = nil
            player:Kick()
        end)
        if player:IsDescendantOf(Players) == true then
            self.Profiles[player] = profile
            self:InitPlayer(player, profile)
        else
            profile:Release()
        end
    else
        player:Kick() 
    end
end

function DatabaseService:KnitStart()
    Knit.log(string.format("Service %s Ready",self.Name),"s")
end

function DatabaseService:KnitInit()
    
end

return DatabaseService