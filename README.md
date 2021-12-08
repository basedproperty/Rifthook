# Rifthook
Welcome to the official GitHub repository for Rifthook. This contains some essential scripts for Rifthook to function correctly, as well as some patched exploits.

## Patched Exploits/Vulnerabilities.
This section contains patched vulnerabilities in Blood & Iron.
### UpdateObject does not filter arguments properly. (PropertyEdit)
Out of all the vulnerabilities I've discovered, this was probably the most significant.
UpdateObject handled a lot of things, but now really only handles joint and artillery movements. Here's an example of a legit UpdateObject call:
```lua
local args = {
  [1] = LocalPlayer.Character.Torso.Neck,
  [2] = "C0",
  [3] = CFrame.new(0, -0.5, 0) * CFrame.Angles(math.rad(-90), 0, math.rad(180))
}
                
ReplicatedStorage.SelectiveReplication.UpdateObject:FireServer(unpack(args))
```
This call would move the head into it's default straight position.
UpdateObject also used to handle particle effects, before particle effects were handed off to ReplicateAnimation. Here's an example of a legit UpdateObject particle call:
```lua
local args = {
  [1] = LocalPlayer.Character[FirearmHandler.ToolName.Value].Muzzle.LongSmoke,
  [2] = "Enabled",
  [3] = true
}
                
ReplicatedStorage.SelectiveReplication.UpdateObject:FireServer(unpack(args))
```
This call would enable the LongSmoke particle effect.
The main vulnerability is while the first argument is filtered (meaning you can't just put whatever you want in there), the second argument was not. This allowed for unlimited property editing of anything that the first argument whitelisted. I called this vulnerability "PropertyEdit"
For example, here's the Decal Spam exploit (The comments explain it line-by-line):
```lua
-- PropertyEdit vulnerability example
-- This would set up the image mode of the decal exploit, allowing for users to put images up in the sky.
-- This just caches values, nothing crazy here.
UpdateObject = ReplicatedStorage.SelectiveReplication.UpdateObject
Smoke = game:GetService("Players").LocalPlayer.Character.Musket.Muzzle.LongSmoke
local Size = NumberSequence.new({
  NumberSequenceKeypoint.new(0, library.pointers.DecalSize.value); 
  NumberSequenceKeypoint.new(1, library.pointers.DecalSize.value);
})
local Transparency = NumberSequence.new({
  NumberSequenceKeypoint.new(0, 0); 
  NumberSequenceKeypoint.new(1, 0);
})
-- Here we go, onto the actual exploit!
-- This part basically sets up the variables we are going to use
UpdateObject:FireServer(Smoke,"Size",Size)
UpdateObject:FireServer(Smoke,"Texture","http://www.roblox.com/asset/?id="..library.pointers.DecalTexture.value)
UpdateObject:FireServer(Smoke,"Rotation",NumberRange.new(0,0))
UpdateObject:FireServer(Smoke,"RotSpeed",NumberRange.new(0,0))
UpdateObject:FireServer(Smoke,"Speed",NumberRange.new(0,0))
UpdateObject:FireServer(Smoke,"Rate",1)
UpdateObject:FireServer(Smoke,"LockedToPart",true)
UpdateObject:FireServer(Smoke,"LightInfluence",0)
UpdateObject:FireServer(Smoke,"LightEmission",0)
UpdateObject:FireServer(Smoke,"Transparency",Transparency)
-- Finally, this enables the effect
UpdateObject:FireServer(Smoke,"Enabled",true)
```
The UpdateObject vulnerability also allowed for the "Fling All" exploit, which maniplulated the TorsoJoints to cause flinging.
### SoundService.RespectFilteringEnabled set to false
SoundService has a property called ["RespectFilteringEnabled"]("https://developer.roblox.com/en-us/api-reference/property/SoundService/RespectFilteringEnabled") that allows LocalScripts (the client) to play sounds. This allowed the client to "spam" sounds repeatedly.
This was recently changed to true, so now only the server can play sounds.
### RequestToolEquip allows for blank arguments and does not have a ratelimit.
RequestToolEquip is a RemoteFunction that handles the equiping of weapons in the game. Here's what a normal call would look like:
```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestToolEquip = ReplicatedStorage.Requests.RequestToolEquip
local args = {
  [1] = "Musket",
  [2] = "Sabre"
}
RequestToolEquip:InvokeServer(unpack(args))
```
This would switch your weapon from a Musket to a Sabre (provided you had both avaliable in your inventory).
The server however, doesn't check if the first argument is blank, allowing for this:
```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestToolEquip = ReplicatedStorage.Requests.RequestToolEquip
local args = {
  [1] = "",
  [2] = "Sabre"
}
RequestToolEquip:InvokeServer(unpack(args))
```
Instead of destroying the Musket, you would now have a Musket and Sabre equipped.
Putting this in a while loop would allow you to put significant strain on the server:
```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestToolEquip = ReplicatedStorage.Requests.RequestToolEquip
while wait() do
  local args = {
    [1] = "",
    [2] = "Sabre"
  }
  RequestToolEquip:InvokeServer(unpack(args))
end
```
These 2 vulnerabilities allowed for the Ping Spike and Server Crasher exploits.
