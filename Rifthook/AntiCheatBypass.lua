local LocalPlayer = game.Players.LocalPlayer
local oldNameCall
oldNameCall = hookmetamethod(game,"__namecall",function(self,...)
  local args = {...}
  local method = getnamecallmethod()
  if not checkcaller() and (getcallingscript().Name == "LocalClean" or getcallingscript().Name == "CharacterControl") then -- localclean is retarded tbh (localclean causes those 1 sec lag spikes)
    return {}
  end
  if method == "FireServer" and self.Name == "RequestPlayerKick" then -- block humanoidcontrol requests for localplayer kick
    return "fortnite sussy balls :pensive:"
  end
  
  return oldNameCall(self,...)
end)

local oldNewIndex
oldNewIndex = hookmetamethod(game,"__newindex",function(self,key,value)
   if not checkcaller() and (getcallingscript().Name == "CharacterControl") then -- localclean is retarded tbh (localclean causes those 1 sec lag spikes)
    return {}
  end
  return oldNewIndex(self,key,value)
end)
while game:GetService("RunService").RenderStepped:Wait() do
  if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("CharacterControl") then -- not bothered to hook charactercontrol functions so just disable the script
    LocalPlayer.Character:FindFirstChild("CharacterControl").Disabled = true
  end
end
