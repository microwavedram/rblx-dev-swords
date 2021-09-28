local Knit = require(game:GetService("ReplicatedStorage").Knit)

local InitService = Knit.CreateService {
    Name = "InitService";
    Client = {};
}

Knit.log = function(text,mode)
    if mode == "s" then
        print(string.format("[STARTUP] : %s",text))
    elseif mode == "w" then
        warn(string.format("[WARN] : %s",text))
    elseif mode == "e" then
        error(string.format("[ERROR] : %s",text))
    else
        print(string.format("[INFO] : %s",text))
    end
    
end


function InitService:KnitStart()
    
end


function InitService:KnitInit()
    Knit.log(string.format("Service %s Ready",self.Name),"s")
end


return InitService