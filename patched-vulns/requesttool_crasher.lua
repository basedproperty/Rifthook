local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestToolEquip = ReplicatedStorage.Requests.RequestToolEquip
while wait() do
    for i = 1,300,1 do
        spawn(function()
            local args = {
                [1] = "",
                [2] = "Sabre"
            }
            RequestToolEquip:InvokeServer(unpack(args))
        end)
    end
end