local noclip = true

coroutine.wrap(function()
while wait() do
    if (noclip) then
for a, b in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
if b:FindFirstChild('Handle') then
b.Handle.CanCollide = false
end
end

end
end
end)()

game:GetService('Players').LocalPlayer.Character.Humanoid.Changed:connect(function()
    if noclip then
game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed = 16
end
end)


game:GetService('RunService').Stepped:connect(function()
    if noclip then
    local torso = game.Players.LocalPlayer.Character:findFirstChild("Torso") or game.Players.LocalPlayer.Character:findFirstChild("UpperTorso")
    
    if torso.Name == "UpperTorso" then
        for i, v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
if v:IsA("BasePart") then
v.CanCollide = false

end
end
return
        end
torso.CanCollide = false
game:GetService('Players').LocalPlayer.Character.Head.CanCollide = false
end
end)
 local torso = game.Players.LocalPlayer.Character:findFirstChild("Torso") or game.Players.LocalPlayer.Character:findFirstChild("UpperTorso")
torso.Changed:connect(function()
    if noclip then
        local torso = game.Players.LocalPlayer.Character:findFirstChild("Torso") or game.Players.LocalPlayer.Character:findFirstChild("UpperTorso")
torso.CanCollide = false
game:GetService('Players').LocalPlayer.Character.Head.CanCollide = false
end
end)

_G.unnoclip = function()
        noclip = false
    end