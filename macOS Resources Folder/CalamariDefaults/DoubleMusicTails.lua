--[[ 
edited by mr steal yo bork with a sweet gui
credits goes to the original creators 
--]] 

-- visualizer
local Parts = {}
local Parts2 = {}
local Direction = 1
local loudness = 0
local TColor = BrickColor.new("Black")
for i = 1, 100 do
 local p = Instance.new("Part", game.Players.LocalPlayer.Character.Torso)
 p.Size = Vector3.new(0.2, 0.2, 0.2)
 p.Anchored = true
 p.CanCollide = false
 p.Material = "Neon"
 p.Position = game.Players.LocalPlayer.Character.Torso.Position
 table.insert(Parts, p)
end
for i = 1, 100 do
 local p = Instance.new("Part", game.Players.LocalPlayer.Character.Torso)
 p.Size = Vector3.new(0.2, 0.2, 0.2)
 p.Anchored = true
 p.CanCollide = false
 p.Material = "Neon"
 p.Position = game.Players.LocalPlayer.Character.Torso.Position
 table.insert(Parts2, p)
end
local sound = Instance.new("Sound", game.Players.LocalPlayer.Character.Torso)
sound.SoundId = "rbxassetid://574539049"
sound.Volume = 1
sound:Play()
spawn(function()
 local SelectedPart = 0
 while true do
   if Direction == 1 then
     if SelectedPart < #Parts then
       SelectedPart = SelectedPart + Direction
     else
       Direction = -1
       TColor = BrickColor.Random()
     end
   elseif Direction == -1 then
     if SelectedPart > 1 then
       SelectedPart = SelectedPart + Direction
     else
       Direction = 1
       TColor = BrickColor.Random()
     end
   end
   local sel = Parts[SelectedPart]
   local sel2 = Parts2[SelectedPart]
   sel.BrickColor = BrickColor.Random()
   sel2.BrickColor = BrickColor.Random()
   loudness = sound.PlaybackLoudness / 500
   sel.Size = Vector3.new(loudness, loudness, 0.2)
   sel2.Size = Vector3.new(loudness, loudness, 0.2)
   wait()
   sel.BrickColor = TColor
   sel2.BrickColor = TColor
 end
end)
game:GetService("RunService").RenderStepped:connect(function()
 for i = 1, #Parts do
   if i == 1 then
     Parts[i].CFrame = Parts[i].CFrame:lerp(game.Players.LocalPlayer.Character.Torso.CFrame, 0.9)
   else
     Parts[i].CFrame = Parts[i].CFrame:lerp(Parts[i - 1].CFrame * CFrame.Angles(-loudness / 20, math.sin(-loudness / 50), 0) * CFrame.new(0, 0, 0.15), 0.8)
   end
 end
 for i = 1, #Parts2 do
   if i == 1 then
     Parts2[i].CFrame = Parts2[i].CFrame:lerp(game.Players.LocalPlayer.Character.Torso.CFrame, 0.9)
   else
     Parts2[i].CFrame = Parts2[i].CFrame:lerp(Parts2[i - 1].CFrame * CFrame.Angles(-loudness / 20, math.sin(loudness / 50), 0) * CFrame.new(0, 0, 0.15), 0.8)
   end
 end
end)

-- visualizer gui

local visualizergui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local idvalue = Instance.new("TextBox")
local play = Instance.new("TextButton")
local volume = Instance.new("TextBox")
local pitch = Instance.new("TextBox")
local close = Instance.new("TextButton")
local min = Instance.new("TextButton")
local credits = Instance.new("TextLabel")
local open = Instance.new("TextButton")
local set2 = Instance.new("TextButton")
local set1 = Instance.new("TextButton")
local loop = Instance.new("TextButton")

--properties xd
visualizergui.Name = "visualizergui"
visualizergui.Parent = game.Players.LocalPlayer.PlayerGui

Frame.Parent = visualizergui
Frame.BackgroundColor3 = Color3.new(0.701961, 0.952941, 1)
Frame.BackgroundTransparency = 0.20000000298023
Frame.BorderColor3 = Color3.new(0.211765, 0.329412, 0.415686)
Frame.BorderSizePixel = 8
Frame.Position = UDim2.new(0, 51, 0, 213)
Frame.Size = UDim2.new(0, 418, 0, 213)
Frame.Active = true
Frame.Draggable = true
Frame.Visible = false

idvalue.Name = "idvalue"
idvalue.Parent = Frame
idvalue.BackgroundColor3 = Color3.new(0.666667, 1, 1)
idvalue.BackgroundTransparency = 0.5
idvalue.Size = UDim2.new(0, 418, 0, 50)
idvalue.Font = Enum.Font.Fantasy
idvalue.FontSize = Enum.FontSize.Size24
idvalue.Text = "Put ID plz"
idvalue.TextSize = 24

play.Name = "play"
play.Parent = Frame
play.BackgroundColor3 = Color3.new(0.666667, 1, 1)
play.BackgroundTransparency = 0.44999998807907
play.BorderColor3 = Color3.new(0.207843, 0.0901961, 0.0705882)
play.BorderSizePixel = 3
play.Position = UDim2.new(0, 9, 0, 82)
play.Size = UDim2.new(0, 117, 0, 50)
play.Font = Enum.Font.SourceSans
play.FontSize = Enum.FontSize.Size28
play.Text = "Play"
play.TextSize = 28

volume.Name = "volume"
volume.Parent = Frame
volume.BackgroundColor3 = Color3.new(0.666667, 1, 1)
volume.BackgroundTransparency = 0.44999998807907
volume.BorderColor3 = Color3.new(0.207843, 0.0901961, 0.0705882)
volume.BorderSizePixel = 3
volume.Position = UDim2.new(0, 151, 0, 82)
volume.Size = UDim2.new(0, 117, 0, 50)
volume.Font = Enum.Font.SourceSans
volume.FontSize = Enum.FontSize.Size28
volume.Text = "Volume"
volume.TextSize = 28

pitch.Name = "pitch"
pitch.Parent = Frame
pitch.BackgroundColor3 = Color3.new(0.666667, 1, 1)
pitch.BackgroundTransparency = 0.44999998807907
pitch.BorderColor3 = Color3.new(0.207843, 0.0901961, 0.0705882)
pitch.BorderSizePixel = 3
pitch.Position = UDim2.new(0, 291, 0, 82)
pitch.Size = UDim2.new(0, 117, 0, 50)
pitch.Font = Enum.Font.SourceSans
pitch.FontSize = Enum.FontSize.Size28
pitch.Text = "Pitch"
pitch.TextSize = 28

close.Name = "close"
close.Parent = Frame
close.BackgroundColor3 = Color3.new(1, 0, 0.0156863)
close.BackgroundTransparency = 0.40000000596046
close.Position = UDim2.new(0, 393, 0, 190)
close.Size = UDim2.new(0, 25, 0, 23)
close.Font = Enum.Font.SourceSans
close.FontSize = Enum.FontSize.Size28
close.Text = "X"
close.TextSize = 28

min.Name = "min"
min.Parent = Frame
min.BackgroundColor3 = Color3.new(0.286275, 0.286275, 1)
min.BackgroundTransparency = 0.40000000596046
min.Position = UDim2.new(0, 357, 0, 190)
min.Size = UDim2.new(0, 25, 0, 23)
min.Font = Enum.Font.SourceSans
min.FontSize = Enum.FontSize.Size36
min.Text = "-"
min.TextSize = 36

credits.Name = "credits"
credits.Parent = Frame
credits.BackgroundColor3 = Color3.new(1, 1, 1)
credits.BackgroundTransparency = 1
credits.Position = UDim2.new(0, 0, 0, 161)
credits.Size = UDim2.new(0, 200, 0, 52)
credits.Font = Enum.Font.SourceSans
credits.FontSize = Enum.FontSize.Size14
credits.Text = "credits to mr steal yo bork for gui, i didn't make the visualizer credits to whoever leaked it or made it."
credits.TextSize = 14
credits.TextWrapped = true

open.Name = "open"
open.Parent = visualizergui
open.BackgroundColor3 = Color3.new(0.666667, 1, 1)
open.BackgroundTransparency = 0.44999998807907
open.BorderColor3 = Color3.new(0.207843, 0.0901961, 0.0705882)
open.BorderSizePixel = 3
open.Position = UDim2.new(0, 0, 0, 400)
open.Size = UDim2.new(0, 59, 0, 50)
open.Font = Enum.Font.SourceSans
open.FontSize = Enum.FontSize.Size28
open.Text = "Open"
open.TextSize = 28
open.Visible = false

set2.Name = "set2"
set2.Parent = Frame
set2.BackgroundColor3 = Color3.new(0.666667, 1, 1)
set2.BackgroundTransparency = 0.44999998807907
set2.BorderColor3 = Color3.new(0.207843, 0.0901961, 0.0705882)
set2.BorderSizePixel = 3
set2.Position = UDim2.new(0, 325, 0, 136)
set2.Size = UDim2.new(0, 55, 0, 25)
set2.Font = Enum.Font.SourceSans
set2.FontSize = Enum.FontSize.Size24
set2.Text = "Set"
set2.TextSize = 24
set2.TextWrapped = true

set1.Name = "set1"
set1.Parent = Frame
set1.BackgroundColor3 = Color3.new(0.666667, 1, 1)
set1.BackgroundTransparency = 0.44999998807907
set1.BorderColor3 = Color3.new(0.207843, 0.0901961, 0.0705882)
set1.BorderSizePixel = 3
set1.Position = UDim2.new(0, 181, 0, 136)
set1.Size = UDim2.new(0, 55, 0, 25)
set1.Font = Enum.Font.SourceSans
set1.FontSize = Enum.FontSize.Size24
set1.Text = "Set"
set1.TextSize = 24
set1.TextWrapped = true

loop.Name = "loop"
loop.Parent = Frame
loop.BackgroundColor3 = Color3.new(0.666667, 1, 1)
loop.BackgroundTransparency = 0.44999998807907
loop.BorderColor3 = Color3.new(0.207843, 0.0901961, 0.0705882)
loop.BorderSizePixel = 3
loop.Position = UDim2.new(0, 241, 0, 188)
loop.Size = UDim2.new(0, 84, 0, 25)
loop.Font = Enum.Font.SourceSans
loop.FontSize = Enum.FontSize.Size18
loop.Text = "Loop : OFF"
loop.TextSize = 18
loop.TextWrapped = true

-- functions
function start()
wait(0.5)
Frame.Position = UDim2.new(0, -500, 0, 400)
Frame.Visible = true
Frame:TweenPosition(UDim2.new(0, 0, 0, 400),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,1)
end

if game.Players.LocalPlayer.Character then
start()
else 
print'character not found plz try again XD'
end

function minimize()
Frame:TweenPosition(UDim2.new(0, 0, 0, 400),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,1)
credits.Text = ""
min.Text = ""
close.Text = ""
play.Text = ""
pitch.Text = ""
volume.Text = ""
idvalue.Text = ""
set1.Text = ""
set2.Text = ""
loop.Text = ""
Frame:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
credits:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
min:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
close:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
idvalue:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
volume:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
play:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
pitch:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
loop:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
set1:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
set2:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
Frame:TweenPosition(UDim2.new(0, 0, 0, 400),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
   wait(0.5)
Frame.Visible = false
open.Visible = true
end

function show()
open.Visible = false
Frame.Position = UDim2.new(0, -500, 0, 400)
Frame.Visible = true
credits.Text = "credits to me for gui, i didn't make the visualizer credits to whoever leaked it or made it."
min.Text = "-"
close.Text = "X"
play.Text = "Play"
pitch.Text = "Pitch"
volume.Text = "Volume"
idvalue.Text = "Put ID plz"
set1.Text = "Set"
set2.Text = "Set" 
loop.Text = "Loop : OFF"
Frame:TweenSize(UDim2.new(0, 418, 0, 213),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
credits:TweenSize(UDim2.new(0, 200, 0, 52),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
min:TweenSize(UDim2.new(0, 25, 0, 23),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
close:TweenSize(UDim2.new(0, 25, 0, 23),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
idvalue:TweenSize(UDim2.new(0, 418, 0, 50),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
volume:TweenSize(UDim2.new(0, 117, 0, 50),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
play:TweenSize(UDim2.new(0, 117, 0, 50),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
pitch:TweenSize(UDim2.new(0, 117, 0, 50),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
set1:TweenSize(UDim2.new(0, 55, 0, 25),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
loop:TweenSize(UDim2.new(0, 84, 0, 25),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
set2:TweenSize(UDim2.new(0, 55, 0, 25),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
Frame:TweenPosition(UDim2.new(0, 0, 0, 400),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint, 0.5)
end

function exitdatshit()
Frame:TweenPosition(UDim2.new(0, 0, 0, 400),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,1)
credits.Text = ""
min.Text = ""
close.Text = ""
play.Text = ""
pitch.Text = ""
volume.Text = ""
idvalue.Text = ""
Frame:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
credits:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
min:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
close:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
idvalue:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
volume:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
play:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
pitch:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
set1:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
set2:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
loop:TweenSize(UDim2.new(0, 0, 0, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
Frame:TweenPosition(UDim2.new(0, 0, 0, 400),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,0.5)
wait(0.5)
   visualizergui:Destroy()
end

-- events
wait(1)
min.MouseButton1Down:connect(function()
minimize()
end)

open.MouseButton1Down:connect(function()
show()
end)

close.MouseButton1Down:connect(function()
exitdatshit()
end)

set1.MouseButton1Down:connect(function()
sound.Volume = volume.Text
end)

set2.MouseButton1Down:connect(function()
sound.Pitch = pitch.Text
end)

play.MouseButton1Down:connect(function()
sound.TimePosition = 0
sound.SoundId = "rbxassetid://" .. idvalue.Text
end)

loop.MouseButton1Down:connect(function()
if loop.Text == "Loop : OFF" then
sound.Looped = true
loop.Text = "Loop : ON"
else
sound.Looped = false
loop.Text = "Loop : OFF"
end
end)
