local ReplicatedStorage = game:GetService("ReplicatedStorage")

return function(context, players, tool)
    local t = ReplicatedStorage.Tools:FindFirstChild(tool.Name)
    
    if t then
        for _, v in pairs(players) do
            t:Clone().Parent = v.Backpack
        end
    else
        return "Failed"
    end
end