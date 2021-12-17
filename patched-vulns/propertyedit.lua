-- PropertyEdit vulnerability example
-- This would set up the image mode of the decal exploit, allowing for users to put images up in the sky.
-- This just caches values, nothing crazy here.
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UpdateObject = ReplicatedStorage.SelectiveReplication.UpdateObject
local Smoke = LocalPlayer.Character.Musket.Muzzle.LongSmoke
local DecalID = "blah"
local SizeNo = 14
local Size = NumberSequence.new({
  NumberSequenceKeypoint.new(0, SizeNo); 
  NumberSequenceKeypoint.new(1, SizeNo);
})
local Transparency = NumberSequence.new({
  NumberSequenceKeypoint.new(0, 0); 
  NumberSequenceKeypoint.new(1, 0);
})
-- Here we go, onto the actual exploit!
-- This part basically sets up the variables we are going to use
UpdateObject:FireServer(Smoke,"Size",Size)
UpdateObject:FireServer(Smoke,"Texture","http://www.roblox.com/asset/?id="..DecalID)
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