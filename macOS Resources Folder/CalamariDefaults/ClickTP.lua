-- developed by elite_doge, 1,11,2015, 5:18 PM
 
local enableKey = "e" -- what key you need to press to teleport
 
------------------------------------
-- getting needed locals
local p = game.Players.LocalPlayer
local mouse = p:GetMouse()
local char = p.Character
-- creating gui creation functions
function setProperties(gui,t)
    gui.BackgroundColor3 = Color3.new(0,0,0)
    gui.BackgroundTransparency = t
    gui.BorderSizePixel = 0
end
 
function setText(gui,te)
    gui.TextStrokeTransparency = 1
    gui.TextStrokeColor3 = Color3.new(255,255,255)
    gui.TextColor3 = Color3.new(255, 255, 255)
    gui.Text = te
    gui.TextScaled = true
    gui.TextXAlignment = Enum.TextXAlignment.Center
end
--- creating gui
local gui = Instance.new("ScreenGui",p.PlayerGui)
gui.Name = "TeleportationInfo"
local f = Instance.new("Frame",gui)
f.Size = UDim2.new(0.2,0,0.4,0)
f.Position = UDim2.new(1,0,0.3,0)
setProperties(f,0.5)
local open = Instance.new("TextButton",gui)
open.Name = "Open"
setProperties(open,0.5)
setText(open,"Hold 'e' and click to teleport")
open.AutoButtonColor = false
open.Size = UDim2.new(0.1,0,0.05,0)
open.Position = UDim2.new(1 - open.Size.X.Scale,0,0.5,0)
local text = Instance.new("TextLabel",f)
text.Name = "Text"
setProperties(text,1)
text.Size = UDim2.new(1,0,0.8,0)
setText(text,"Hold 'e' and click where you want to teleport. Click on this gui to close.")
local name = "elite_doge"
local text2  = text:Clone()
text2.Parent = text.Parent
text2.Size = UDim2.new(1,0,0.2,0)
text2.Position = UDim2.new(0,0,0.8,0)
text2.Name = "Creator"
local isOpen = false
local close = Instance.new("TextButton",f)
close.Name = "Close"
text2.Text = "Developed by " .. name.. ", 1/11/2015"
setProperties(close,1)
close.Visible = false
close.Text = ""
close.Size = UDim2.new(1,0,1,0)
-- creating gui functions
-- click and keydown functions
local enabled = false
 
mouse.KeyDown:connect(function(key)
    key = key:lower()
    if key == "e" then
        enabled = true
    end
end)
 
mouse.KeyUp:connect(function(key)
    key = key:lower()
    if key == "e" then
        enabled = false
    end
end)
 
mouse.Button1Down:connect(function()
    if char and enabled == true then
        char.HumanoidRootPart.CFrame = mouse.Hit + Vector3.new(0,7,0)
    end
end)
