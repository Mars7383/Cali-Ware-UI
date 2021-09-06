crashy = true -- CHANGE THIS TO TRUE IF IT CRASHES THIS GAME
on = false
if game.CoreGui:FindFirstChild('ESP') then
    game.CoreGui.ESP:Destroy()
elseif game.Players.LocalPlayer.PlayerGui:FindFirstChild('ESP') then
    game.Players.LocalPlayer.PlayerGui.ESP:Destroy()
end

function doit(hey)
    local t1 = Instance.new('SurfaceGui',hey)
    t1.AlwaysOnTop = true
    local t1g = Instance.new('Frame',t1)
    t1g.Size = UDim2.new(1,0,1,0)
    t1g.BackgroundColor3 = t1.Parent.BrickColor.Color
    local t2 = Instance.new('SurfaceGui',hey)       
    t2.AlwaysOnTop = true
    t2.Face = Enum.NormalId.Right
    local t2g = Instance.new('Frame',t2)
    t2g.Size = UDim2.new(1,0,1,0)
    t2g.BackgroundColor3 = t2.Parent.BrickColor.Color
    local t3 = Instance.new('SurfaceGui',hey)
    t3.AlwaysOnTop = true
    t3.Face = Enum.NormalId.Left
    local t3g = Instance.new('Frame',t3)
    t3g.Size = UDim2.new(1,0,1,0)
    t3g.BackgroundColor3 = t3.Parent.BrickColor.Color
    local t4 = Instance.new('SurfaceGui',hey)
    t4.AlwaysOnTop = true
    t4.Face = Enum.NormalId.Back
    local t4g = Instance.new('Frame',t4)
    t4g.Size = UDim2.new(1,0,1,0)
    t4g.BackgroundColor3 = t4.Parent.BrickColor.Color
    local t5 = Instance.new('SurfaceGui',hey)
    t5.AlwaysOnTop = true
    t5.Face = Enum.NormalId.Top
    local t5g = Instance.new('Frame',t5)
    t5g.Size = UDim2.new(1,0,1,0)
    t5g.BackgroundColor3 = t5.Parent.BrickColor.Color
    local t6 = Instance.new('SurfaceGui',hey)
    t6.AlwaysOnTop = true
    t6.Face = Enum.NormalId.Bottom
    local t6g = Instance.new('Frame',t6)
    t6g.Size = UDim2.new(1,0,1,0)
    t6g.BackgroundColor3 = t6.Parent.BrickColor.Color
end
function undo(chr)
    for i,v in pairs(chr:GetChildren()) do
        if v.ClassName == "Part" or v.ClassName == "MeshPart" then
            for a,c in pairs(v:GetChildren()) do
                if c.ClassName == "SurfaceGui" then
                    c:Destroy()
                end
                if c.ClassName == "BillboardGui" and c.Name == "thingyye" then
                    c:Destroy()
                end
            end
        end
    end
end

local gui = Instance.new('ScreenGui')

gui.Name = "ESP"
gui.ResetOnSpawn = false
local frame = Instance.new('Frame',gui)
frame.Size = UDim2.new(0.2,0,0.3,0)
frame.Position = UDim2.new(0,0,0.9,0)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.fromRGB(131,182,239)
frame.BorderSizePixel = 4
frame.BorderColor3 = Color3.fromRGB(66,134,244)
frame.Active = true
frame.Draggable = true 
local txt = Instance.new('TextLabel',frame)
txt.Text = "Mustardfoot's ESP Gui"
txt.TextColor3 = Color3.fromRGB(255,255,255)
txt.Size = UDim2.new(1,0,0.3,0)
txt.TextScaled = true
txt.BackgroundTransparency = 1
local but = Instance.new('TextButton',frame)
but.Text = "ESP On"
but.TextColor3 = Color3.fromRGB(255,255,255)
but.Size = UDim2.new(0.7,0,0.3,0)
but.Position = UDim2.new(0.15,0,0.5,0)
but.BorderSizePixel = 0
but.TextScaled = true
but.BackgroundColor3 = Color3.fromRGB(66,134,244)
but.BackgroundTransparency = 0.4
for i,v in pairs(game.Players:GetChildren()) do
    if v.Character ~= nil then
        undo(v.Character)
    end
end

spawn(function()
if true then
on = true
for i,v in pairs(game.Players:GetChildren()) do
    if v.Character ~= game.Players.LocalPlayer.Character and v.Character.Head:FindFirstChild('ScreenGui') == nil then
        if v.Character:FindFirstChild('Head') then
            local bill = Instance.new('BillboardGui',v.Character.Head)
            bill.Name = "thingyye"
            bill.AlwaysOnTop = true
            bill.Size = UDim2.new(2,1,2)
            bill.Adornee = v.Character.Head 
            local txt = Instance.new('TextLabel',bill)
            txt.Text = v.Name
            txt.BackgroundTransparency = 1
            txt.Size = UDim2.new(1,0,1,0)
            txt.TextColor3 = v.TeamColor.Color
        end
        for a,c in pairs(v.Character:GetChildren()) do
            if c.ClassName == "MeshPart" and c.Transparency ~= 1 then
                doit(c)
            elseif c.ClassName == "Part" and c.Transparency ~= 1 then
            doit(c)
            end
        end
    end 
end 
else
    but.Text = "ESP On"
    on = false
    for i,v in pairs(game.Players:GetChildren()) do
        undo(v.Character)
    end
end
end)

for i,v in pairs(game.Players:GetChildren()) do
    v.CharacterAdded:connect(function()
    v.Character:WaitForChild('Head')
    wait(1)
    if on == true then
    if v.Character ~= game.Players.LocalPlayer.Character and v.Character.Head:FindFirstChild('ScreenGui') == nil then
        if v.Character:FindFirstChild('Head') then
            local bill = Instance.new('BillboardGui',v.Character.Head)
            bill.Name = "thingyye"
            bill.AlwaysOnTop = true
            bill.Size = UDim2.new(2,1,2)
            bill.Adornee = v.Character.Head 
            local txt = Instance.new('TextLabel',bill)
            txt.Text = v.Name
            txt.BackgroundTransparency = 1
            txt.Size = UDim2.new(1,0,1,0)
            txt.TextColor3 = v.TeamColor.Color
        end
        for a,c in pairs(v.Character:GetChildren()) do
            if c.ClassName == "MeshPart" and c.Transparency ~= 1 then
                doit(c)
            elseif c.ClassName == "Part" and c.Transparency ~= 1 then
            doit(c)
            end
        end
    end 
    end
    end)
end  

game.Players.PlayerAdded:connect(function(v)
v.CharacterAdded:connect(function()
    v.Character:WaitForChild('Head')
    wait(1)
    if on == true then
    if v.Character ~= game.Players.LocalPlayer.Character and v.Character.Head:FindFirstChild('ScreenGui') == nil then
        if v.Character:FindFirstChild('Head') then
            local bill = Instance.new('BillboardGui',v.Character.Head)
            bill.Name = "thingyye"
            bill.AlwaysOnTop = true
            bill.Size = UDim2.new(2,1,2)
            bill.Adornee = v.Character.Head 
            local txt = Instance.new('TextLabel',bill)
            txt.Text = v.Name
            txt.BackgroundTransparency = 1
            txt.Size = UDim2.new(1,0,1,0)
            txt.TextColor3 = v.TeamColor.Color
        end
        for a,c in pairs(v.Character:GetChildren()) do
            if c.ClassName == "MeshPart" and c.Transparency ~= 1 then
                doit(c)
            elseif c.ClassName == "Part" and c.Transparency ~= 1 then
            doit(c)
            end
        end
    end 
    end
    end)
end)
