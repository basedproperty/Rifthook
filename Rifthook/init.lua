--[[
    Copyright (C) 2020-2022 Rifthook Development Team
    Functions/Tables required for Rifthook.
]]

getgenv().Services = {}
setrawmetatable(Services,{
    __index = function(self,key)
        local service = game:GetService(key)
        if service then
            return service
        end
    end,
    __tostring = function(self)
        return "RifthookServices"
    end
})
getgenv().SupportedGames = {
    [9528010] = "Blood & Iron",
    [4592800891] = "Battles",
    [301549746] = "Counter Blox",
    [6590798593] = "Waterloo at Home",
    [2627036812] = "Zulu War",
    [6452089755] = "Jailbird",
    [6055959032] = "Jailbird Lobby",
    [7006496598] = "Bleeding Blades",
    [292439477] = "Phantom Forces"
}

getgenv().GetCurrentGame = function()
    for i,v in pairs(SupportedGames) do
        if game.PlaceId == i then
            return v
        end
    end
    return "Universal Aimbot"
end
