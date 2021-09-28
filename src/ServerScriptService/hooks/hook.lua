-- A ModuleScript inside your hooks folder.

function isInTable(t,v)
    for _, v2 in pairs(t) do
        if v2 == v then
            return true
        end
    end
    return false
end

local admins = {
    "Microwaved_Ram"
}

return function (registry)
	registry:RegisterHook("BeforeRun", function(context)
		if context.Group == "DefaultAdmin" and not isInTable(admins,context.Executor.Name) then
			return "You don't have permission to run this command"
		end
	end)
end