local Knit = require(game:GetService("ReplicatedStorage").Knit)

local SwordService = Knit.CreateService {
    Name = "SwordService";
    Client = {};
}

function SwordService:Equip(Character,Sword)
    local Prefab = Sword:Clone()
    Prefab.Parent = Character
    for _, value in pairs(Prefab:GetChildren()) do
        if value.Name == "Prefab_Left Arm" then
            value:SetPrimaryPartCFrame(Character:WaitForChild("Left Arm").CFrame)
            local weld = Instance.new("Weld")
            weld.Parent = Character:WaitForChild("Left Arm")
            weld.Part0 = Character:WaitForChild("Left Arm")
            weld.Part1 = Prefab:WaitForChild("Prefab_Left Arm").PrimaryPart
        elseif value.Name == "Prefab_Right Arm" then
            value:SetPrimaryPartCFrame(Character:WaitForChild("Right Arm").CFrame)
            local weld = Instance.new("Weld")
            weld.Parent = Character:WaitForChild("Right Arm")
            weld.Part0 = Character:WaitForChild("Right Arm")
            weld.Part1 = Prefab:WaitForChild("Prefab_Right Arm").PrimaryPart
        end
    end
end

function SwordService:KnitStart()
    Knit.log(string.format("Service %s Ready",self.Name),"s")
    wait(10)
    self:Equip(game.Players.Microwaved_Ram.Character,game.Workspace.AdminSword)
end


function SwordService:KnitInit()
    
end


return SwordService