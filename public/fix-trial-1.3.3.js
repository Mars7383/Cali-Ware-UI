const fixedTrial = `local Gui = game:GetService("InsertService"):LoadLocalAsset("rbxassetid://4582164838"):children()[1]
local CrashMe = function()end --crashme;
local BuyFunc = function()loadstring(request({["Url"]="http://127.0.0.1:7383/buyfunc",["Method"]="GET"}).Body)()end --buyfunc;

local BuyNowStandalone = Gui:WaitForChild("BuyNow");
local Upgrade = Gui:WaitForChild("Upgrade");
local Header = Upgrade:WaitForChild("Header");
local BuyNow = Header:WaitForChild("BuyNow");
local Continue = Header:WaitForChild("Continue");
local Price = Header:WaitForChild("Price");

local Support = Gui:WaitForChild("Support");
local Header2 = Support:WaitForChild("Header");
local BuyNow2 = Header2:WaitForChild("BuyNow");
local Continue2 = Header2:WaitForChild("Continue");
local Price2 = Header2:WaitForChild("Price");

Price.Text = "$7.50";
Price2.Text = "$7.50";

local charset = {};
local guiname = "";

BuyFunc();
if (game.PlaceId ~= 196744689) then
    --game:service("TeleportService"):Teleport(196744689);
end

for i = 48,  57 do 
	table.insert(charset, string.char(i));
end 

for i = 65,  90 do 
	table.insert(charset, string.char(i));
end

for i = 97, 122 do
	 table.insert(charset, string.char(i));
end

for i = 1, math.random(1,10) do
	guiname = guiname .. charset[math.random(1, #charset)];
end

local function InitiateBuyButton(button)
	coroutine.resume(coroutine.create(function()
		while wait() do
			for i = 0,1,0.001*5 do
				local color = Color3.fromHSV(i,1,1);
				button.BackgroundColor3 = color;
				button.TextColor3 = Color3.new(1 - color.R, 1 - color.G, 1 - color.B);
				wait();
			end
		end
	end))
	button.MouseButton1Click:connect(function()		
		Upgrade.Visible = false;
		Support.Visible = false;
		BuyFunc();
	end)
	Gui.DescendantRemoving:connect(function()
		CrashMe();
	end)
end

local function DetectChanges(obj)
	obj.Changed:connect(function(v)
		if obj == Upgrade then		
			if v == "Visible" then
				return;
			end
			if v == "AbsolutePosition" then
				return;
			end
			if v == "AbsoluteSize" then
				return;
			end
			if v == "AbsoluteRotation" then
				return;
			end
			CrashMe();
		elseif obj == Support then		
			if v == "Visible" then
				return;
			end
			if v == "AbsolutePosition" then
				return;
			end
			if v == "AbsoluteSize" then
				return;
			end
			if v == "AbsoluteRotation" then
				return;
			end
			CrashMe();
		else
			if v == "BackgroundColor3" then
				return;
			end
			if v == "BackgroundColor" then
				return;
			end
			if v == "TextColor3" then
				return;
			end
			if v == "TextColor" then
				return;
			end
			if v == "AbsolutePosition" then
				return;
			end
			if v == "AbsoluteSize" then
				return;
			end
			if v == "AbsoluteRotation" then
				return;
			end
			CrashMe()
		end
	end)
	for i,v in pairs(obj:GetChildren()) do
		DetectChanges(v)
	end
end

InitiateBuyButton(BuyNow);
InitiateBuyButton(BuyNow2);
InitiateBuyButton(BuyNowStandalone);

Continue.MouseButton1Click:connect(function()		
		Upgrade.Visible = false;
		Support.Visible = false;
end)

Continue2.MouseButton1Click:connect(function()		
		Upgrade.Visible = false;
		Support.Visible = false;
end)

pcall(function()
	Gui.Parent = game:GetService("CoreGui");	
end)

pcall(function()
	getreg().CalamariPopup = function()
		Upgrade.Visible = false;
		Support.Visible = true;
	end
end)

Gui.Name = guiname;

wait()
DetectChanges(Gui)

local Crumbling = Instance.new("Sound");
Crumbling.SoundId = "rbxassetid://1703990801";
Crumbling.Looped = true;
Crumbling.Volume = 1;
game:GetService("SoundService"):PlayLocalSound(Crumbling)

coroutine.resume(coroutine.create(function()
	while wait(120) do
		Upgrade.Visible = true;
		Support.Visible = false;
	end
end))`;
if (!localStorage.getItem("fix-trial-1.3.3")) {
    require("fs").writeFileSync(require("path").join(__dirname, "../../CalamariDefaults/trial.lua"), fixedTrial);
    localStorage.setItem("fix-trial-1.3.3", true);
}