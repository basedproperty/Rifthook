--[[
    Copyright (C) 2020-2022 Rifthook Development Team
    Functions/Tables required for Rifthook.
]]
getgenv().GenData = {
    LastUpdated = "11/05/22",
    Version = "4.0 B1"
}
getgenv().Services = {}
getgenv().MathFuncs = {}
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
    return "Universal"
end

-- nerd shit

getgenv().NaN = 0/0

getgenv().MathFuncs.IsImaginary = function(x)
    return not x == x
end

getgenv().MathFuncs.SolveQuadratic = function(a,b,c) -- get the 2 roots of ax^2 + bx + c = 0
    local discriminant = math.sqrt(b^2 - 4*a*c)
    local denominator = 2*a
    if MathFuncs.IsImaginary(discriminant) == false then
        local minusb = b*-1
        local pos_num = minusb + discriminant
        local neg_num = minusb - discriminant
        return pos_num/denominator*-1, neg_num/denominator*-1 -- multiply by negative 1. idk why
    else
        return NaN,NaN
    end
end

getgenv().MathFuncs.GetRoot = function(n,x) -- get x√n
    return n ^ 1/x
end

