for X = 1, math.huge, 0.1 do
	local torso = game:service("Players").LocalPlayer.Character:FindFirstChild("Torso")
	if (torso) then
	wait()
	torso.Neck.C0 = CFrame.new(0,1.5,0) * CFrame.fromAxisAngle(Vector3.new(0,1,0), X) --Change 'YOURNAMEHERE' to your name
	torso.Neck.C1 = CFrame.new(0,0,0) --Change 'YOURNAMEHERE' to your name.
	else
	wait()
	game:service("Players").LocalPlayer.Character.Head.Neck.C0 = CFrame.new(0,1.5,0) * CFrame.fromAxisAngle(Vector3.new(0,1,0), X) --Change 'YOURNAMEHERE' to your name
	game:service("Players").LocalPlayer.Character.Head.Neck.C1 = CFrame.new(0,0,0) --Change 'YOURNAMEHERE' to your name.
	end
end
