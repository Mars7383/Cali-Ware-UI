--bird wings Gifted by harrypotterfan249, Local Script!
--Jump Two Time
--Down Press Q

script.Parent = nil

function fly()

for i,v in pairs(script:GetChildren()) do

        pcall(function() v.Value = "" end)

        game:GetService("Debris"):AddItem(v,.1)

end

function weld(p0,p1,c0,c1,par)

        local w = Instance.new("Weld",p0 or par)

        w.Part0 = p0

        w.Part1 = p1

        w.C0 = c0 or CFrame.new()

        w.C1 = c1 or CFrame.new()

        return w

end

local motors = {}

function motor(p0,p1,c0,c1,des,vel,par)

        local w = Instance.new("Motor6D",p0 or par)

        w.Part0 = p0

        w.Part1 = p1

        w.C0 = c0 or CFrame.new()

        w.C1 = c1 or CFrame.new()

        w.MaxVelocity = tonumber(vel) or .05

        w.DesiredAngle = tonumber(des) or 0

        return w

end

function lerp(a,b,c)

    return a+(b-a)*c

end

function clerp(c1,c2,al)

        local com1 = {c1.X,c1.Y,c1.Z,c1:toEulerAnglesXYZ()}

        local com2 = {c2.X,c2.Y,c2.Z,c2:toEulerAnglesXYZ()}

        for i,v in pairs(com1) do

                com1[i] = lerp(v,com2[i],al)

        end

        return CFrame.new(com1[1],com1[2],com1[3]) * CFrame.Angles(select(4,unpack(com1)))

end

function ccomplerp(c1,c2,al)

        local com1 = {c1:components()}

        local com2 = {c2:components()}

        for i,v in pairs(com1) do

                com1[i] = lerp(v,com2[i],al)

        end

        return CFrame.new(unpack(com1))

end

function tickwave(time,length,offset)

        return (math.abs((tick()+(offset or 0))%time-time/2)*2-time/2)/time/2*length

end

function invcol(c)

        c = c.Color

        return BrickColor.new(Color3.new(1-c.b,1-c.g,1-c.r))

end

local oc = oc or function(...) return ... end

local plr = game.Players.LocalPlayer

local char = plr.Character

local tor = char.Torso

local hum = char.Humanoid

hum.PlatformStand = false

pcall(function()

        char.Wings:Destroy()

end)

pcall(function()

        char.Angel:Destroy() -- hat

end)

local mod = Instance.new("Model",char)

mod.Name = "Wings"

local special = {

        --antiboomz0r = {"Really black","Institutional white",0,0,false,Color3.new(1,1,.95),Color3.new(1,1,.6)},

        antiboomz0r = {"New Yeller",nil,0.4,0.7,true,Color3.new(1,1,.95),Color3.new(1,1,.6)},

        --antiboomz0r = {"Cyan","Toothpaste",0,0,false,Color3.new(1,0,0),Color3.new(0,0,0)},

        taart = {"Royal purple",nil,.4,.4,true},

        mitta = {"Black",nil,0,0,false},

        penjuin3 = {"White",nil,0,0,false},

        thepc8110 = {"Black","Bright red",.5,0,false,Color3.new(1,0,0),Color3.new(0,0,0)},

        nonspeaker = {"Cyan","Toothpaste",0,0,false,Color3.new(1,0,0),Color3.new(0,0,0)},

        littleau999 = {"Reddish brown",1030,0,0,false},

        unscripter = {"Really black","Really black",.2,0,true,Color3.new(0,0,0),Color3.new(0,0,0)},

        oxcool1 = {"Really black","White",.2,0,false,Color3.new(0,0,0),Color3.new(0,0,0)},

        krodmiss = {"Really black",nil,0,0,false},

}

local topcolor = invcol(char.Torso.BrickColor)

local feacolor = char.Torso.BrickColor

local ptrans = 0

local pref = 0

local fire = false

local fmcol = Color3.new()

local fscol = Color3.new()

local spec = special[plr.Name:lower()]

if spec then

        topcolor,feacolor,ptrans,pref,fire,fmcol,fscol = spec[1] and BrickColor.new(spec[1]) or topcolor,spec[2] and BrickColor.new(spec[2]) or feacolor,spec[3],spec[4],spec[5],spec[6],spec[7]

end

local part = Instance.new("Part")

part.FormFactor = "Custom"

part.Size = Vector3.new(.2,.2,.2)

part.TopSurface,part.BottomSurface = 0,0

part.CanCollide = false

part.BrickColor = topcolor

part.Transparency = ptrans

part.Reflectance = pref

local ef = Instance.new("Fire",fire and part or nil)

ef.Size = .15

ef.Color = fmcol or Color3.new()

ef.SecondaryColor = fscol or Color3.new()

part:BreakJoints()


function newpart()

        local clone = part:Clone()

        clone.Parent = mod

        clone:BreakJoints()

        return clone

end

local feath = newpart()

feath.BrickColor = feacolor

feath.Transparency = 0

Instance.new("SpecialMesh",feath).MeshType = "Sphere"

function newfeather()

        local clone = feath:Clone()

        clone.Parent = mod

        clone:BreakJoints()

        return clone

end


---------- RIGHT WING

local r1 = newpart()

r1.Size = Vector3.new(.3,1.5,.3)*1.2

local rm1 = motor(tor,r1,CFrame.new(.35,.6,.4) * CFrame.Angles(0,0,math.rad(-60)) * CFrame.Angles(math.rad(30),math.rad(-25),0),CFrame.new(0,-.8,0),.1)

local r2 = newpart()

r2.Size = Vector3.new(.4,1.8,.4)*1.2

local rm2 = motor(r1,r2,CFrame.new(0,.75,0) * CFrame.Angles(0,0,math.rad(50)) * CFrame.Angles(math.rad(-30),math.rad(15),0),CFrame.new(0,-.9,0),.1)

local r3 = newpart()

r3.Size = Vector3.new(.3,2.2,.3)*1.2

local rm3 = motor(r2,r3,CFrame.new(.1,.9,0) * CFrame.Angles(0,0,math.rad(-140)) * CFrame.Angles(math.rad(-3),0,0),CFrame.new(0,-1.1,0),.1)

local r4 = newpart()

r4.Size = Vector3.new(.25,1.2,.25)*1.2

local rm4 = motor(r3,r4,CFrame.new(0,1.1,0) * CFrame.Angles(0,0,math.rad(-10)) * CFrame.Angles(math.rad(-3),0,0),CFrame.new(0,-.6,0),.1)

local feather = newfeather()

feather.Mesh.Scale = Vector3.new(1,1,1)

feather.Size = Vector3.new(.4,3,.3)

weld(r4,feather,CFrame.new(-.1,-.3,0),CFrame.new(0,-1.5,0))

feather = newfeather()

feather.Mesh.Scale = Vector3.new(1,1,1)

feather.Size = Vector3.new(.4,2.3,.3)

weld(r4,feather,CFrame.new(.1,-.1,0) * CFrame.Angles(0,math.random()*.1,0),CFrame.new(0,-1.1,0))

feather = newfeather()

feather.Mesh.Scale = Vector3.new(1,1,1)

feather.Size = Vector3.new(.35,2.2,.25)

weld(r4,feather,CFrame.new(.1,-.3,0) * CFrame.Angles(0,math.random()*.1,math.rad(-10)),CFrame.new(0,-1.1,0))

local rf3 = {}

for i=0,7 do

        feather = newfeather()

        feather.Mesh.Scale = Vector3.new(1,1,1)

        feather.Size = Vector3.new(.45,2.2,.35)

        table.insert(rf3,motor(r3,feather,CFrame.new(.05,1-i*.285,0) * CFrame.Angles(0,math.random()*.1,math.rad(-25-i*2)),CFrame.new(0,-feather.Size.Y/2,0)))

end

local rf2 = {}

for i=0,6 do

        feather = newfeather()

        feather.Mesh.Scale = Vector3.new(1,1,1)

        feather.Size = Vector3.new(.45,2.2-i*.08,.3)

        table.insert(rf2,motor(r2,feather,CFrame.new(.05,.75-i*.26,0) * CFrame.Angles(0,math.random()*.1,math.rad(-75-i*4)),CFrame.new(0,-feather.Size.Y/2,0)))

end

local rf1 = {}

for i=0,6 do

        feather = newfeather()

        feather.Mesh.Scale = Vector3.new(1,1,1)

        feather.Size = Vector3.new(.37,1.65-i*.06,.25)

        table.insert(rf1,motor(r1,feather,CFrame.new(.05,.63-i*.21,0) * CFrame.Angles(0,math.random()*.05,math.rad(-75)),CFrame.new(0,-feather.Size.Y/2,0)))

end

---------- LEFT WING

local l1 = newpart()

l1.Size = Vector3.new(.3,1.5,.3)*1.2

local lm1 = motor(tor,l1,CFrame.new(-.35,.6,.4) * CFrame.Angles(0,0,math.rad(60)) * CFrame.Angles(math.rad(30),math.rad(25),0) * CFrame.Angles(0,-math.pi,0),CFrame.new(0,-.8,0) ,.1)

local l2 = newpart()

l2.Size = Vector3.new(.4,1.8,.4)*1.2

local lm2 = motor(l1,l2,CFrame.new(0,.75,0) * CFrame.Angles(0,0,math.rad(50)) * CFrame.Angles(math.rad(30),math.rad(-15),0),CFrame.new(0,-.9,0),.1)

local l3 = newpart()

l3.Size = Vector3.new(.3,2.2,.3)*1.2

local lm3 = motor(l2,l3,CFrame.new(.1,.9,0) * CFrame.Angles(0,0,math.rad(-140)) * CFrame.Angles(math.rad(3),0,0),CFrame.new(0,-1.1,0),.1)

local l4 = newpart()

l4.Size = Vector3.new(.25,1.2,.25)*1.2

local lm4 = motor(l3,l4,CFrame.new(0,1.1,0) * CFrame.Angles(0,0,math.rad(-10)) * CFrame.Angles(math.rad(3),0,0),CFrame.new(0,-.6,0),.1)

local feather = newfeather()

feather.Mesh.Scale = Vector3.new(1,1,1)

feather.Size = Vector3.new(.4,3,.3)

weld(l4,feather,CFrame.new(-.1,-.3,0),CFrame.new(0,-1.5,0))

feather = newfeather()

feather.Mesh.Scale = Vector3.new(1,1,1)

feather.Size = Vector3.new(.4,2.3,.3)

weld(l4,feather,CFrame.new(.1,-.1,0) * CFrame.Angles(0,math.random()*.1,0),CFrame.new(0,-1.1,0))

feather = newfeather()

feather.Mesh.Scale = Vector3.new(1,1,1)

feather.Size = Vector3.new(.35,2.2,.25)

weld(l4,feather,CFrame.new(.1,-.3,0) * CFrame.Angles(0,math.random()*.1,math.rad(-10)),CFrame.new(0,-1.1,0))

local lf3 = {}

for i=0,7 do

        feather = newfeather()

        feather.Mesh.Scale = Vector3.new(1,1,1)

        feather.Size = Vector3.new(.45,2.2,.35)

        table.insert(lf3,motor(l3,feather,CFrame.new(.05,1-i*.285,0) * CFrame.Angles(0,math.random()*.1,math.rad(-25-i*2)),CFrame.new(0,-feather.Size.Y/2,0)))

end

local lf2 = {}

for i=0,6 do

        feather = newfeather()

        feather.Mesh.Scale = Vector3.new(1,1,1)

        feather.Size = Vector3.new(.45,2.2-i*.08,.3)

        table.insert(lf2,motor(l2,feather,CFrame.new(.05,.75-i*.26,0) * CFrame.Angles(0,math.random()*.1,math.rad(-75-i*4)),CFrame.new(0,-feather.Size.Y/2,0)))

end

local lf1 = {}

for i=0,6 do

        feather = newfeather()

        feather.Mesh.Scale = Vector3.new(1,1,1)

        feather.Size = Vector3.new(.37,1.65-i*.06,.25)

        table.insert(lf1,motor(l1,feather,CFrame.new(.05,.63-i*.21,0) * CFrame.Angles(0,math.random()*.05,math.rad(-75)),CFrame.new(0,-feather.Size.Y/2,0)))

end

local rwing = {rm1,rm2,rm3,rm4}

local lwing = {lm1,lm2,lm3,lm4}

local oc0 = {}

for i,v in pairs(rwing) do

        oc0[v] = v.C0

end

for i,v in pairs(lwing) do

        oc0[v] = v.C0

end

function gotResized()

        if lastsize then

                if tor.Size == lastsize then return end -- This shouldn't happen?

                local scaleVec = tor.Size/lastsize

                for i,v in pairs(oc0) do

                        oc0[i] = v-v.p+scaleVec*v.p

                end

                lastsize = tor.Size

        end

        lastsize = tor.Size

end

tor.Changed:connect(function(p)

        if p == "Size" then

                gotResized()

        end

end)

gotResized()

local idle = {0,0.5,-.2,0; .05,.05,.1,.05; -.6,-1.5,.1,0;}--0,.3,0,0

local outlow = {-.7,-.2,1.8,0; .3,.05,.1,.05; .2,0,0,0}

local outhigh = {.5,-.2,1.8,0; .3,.05,.1,.05; .2,0,0,0}

local veryhigh = {.9,-.3,1.9,0; .3,.05,.1,.05; .2,0,0,0}

local flap1 = {-.3,.3,1.1,-.2; .3,.05,.1,.05; .2,-.6,0,0}

local divebomb = {0,.2,.4,-.7; .3,.05,.1,.05; 0,-.5,-.6,0}


function setwings(tab,time)

        time = time or 10

        for i=1,4 do

                rwing[i].DesiredAngle = tab[i]

                lwing[i].DesiredAngle = tab[i]

                rwing[i].MaxVelocity = math.abs(tab[i]-rwing[i].CurrentAngle)/time

                lwing[i].MaxVelocity = math.abs(tab[i]-lwing[i].CurrentAngle)/time

                local rcf = oc0[rwing[i]] * (tab[12+i] or CFrame.new())

                local lcf = oc0[lwing[i]] * (tab[12+i] or CFrame.new())

        end

        for i,v in pairs(rf1) do

                v.DesiredAngle = tab[9]

                v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time

        end

        for i,v in pairs(lf1) do

                v.DesiredAngle = tab[9]

                v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time

        end

        for i,v in pairs(rf2) do

                v.DesiredAngle = tab[10]

                v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time

        end

        for i,v in pairs(lf2) do

                v.DesiredAngle = tab[10]

                v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time

        end

        for i,v in pairs(rf3) do

                v.DesiredAngle = tab[11]

                v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time

        end

        for i,v in pairs(lf3) do

                v.DesiredAngle = tab[11]

                v.MaxVelocity = math.abs(v.DesiredAngle-v.CurrentAngle)/time

        end

end

setwings(outhigh,1)

flying = false

moving = false

for i,v in pairs(tor:GetChildren()) do

        if v.ClassName:lower():match("body") then

                v:Destroy()

        end

end

local ctor = tor:Clone()

ctor:ClearAllChildren()

ctor.Name = "cTorso"

ctor.Transparency = 1

ctor.CanCollide = false

ctor.FormFactor = "Custom"

ctor.Size = Vector3.new(.2,.2,.2)

ctor.Parent = mod

weld(tor,ctor)

local bg = Instance.new("BodyGyro",ctor)

bg.maxTorque = Vector3.new()

bg.P = 15000

bg.D = 1000

local bv = Instance.new("BodyVelocity",ctor)

bv.maxForce = Vector3.new()

bv.P = 15000

vel = Vector3.new()

cf = CFrame.new()

flspd = 0


keysdown = {}

keypressed = {}

ktime = {}

descendtimer = 0

jumptime = tick()

hum.Jumping:connect(function()

        jumptime = tick()

end)

cam = workspace.CurrentCamera

kd = plr:GetMouse().KeyDown:connect(oc(function(key) 

        keysdown[key] = true 

        keypressed[key] = true 

        if key == "q" then 

                descendtimer = tick() 

        elseif key == " " and not hum.Jump then 

                jumptime = tick()

        elseif (key == "a" or key == "d") and ktime[key] and tick()-ktime[key] < .3 and math.abs(reqrotx) < .3 then

                reqrotx = key == "a" and math.pi*2 or -math.pi*2

        end

        ktime[key] = tick() 

end))

ku = plr:GetMouse().KeyUp:connect(function(key) 

        keysdown[key] = false 

        if key == " " then 

                descendtimer = tick() 

        end 

end)

function mid(a,b,c)

        return math.max(a,math.min(b,c or -a))

end

function bn(a)

        return a and 1 or 0

end

function gm(tar)

        local m = 0

        for i,v in pairs(tar:GetChildren()) do

                if v:IsA("BasePart") then

                        m = m + v:GetMass()

                end

                        m = m + gm(v)

        end

        return m

end

reqrotx = 0

local grav = 196.2

local con

con = game:GetService("RunService").Stepped:connect(oc(function()

        --[[if not mod:IsDescendantOf(workspace) then

                pcall(function() kd:disconnect() end)

                pcall(function() ku:disconnect() end)

                bg:Destroy()

                bv:Destroy()

                con:disconnect()

                script:Destroy()

                return

        end]]

        local obvel = tor.CFrame:vectorToObjectSpace(tor.Velocity)

        local sspd, uspd,fspd = obvel.X,obvel.Y,obvel.Z

        if flying then

                local lfldir = fldir

                fldir = cam.CoordinateFrame:vectorToWorldSpace(Vector3.new(bn(keysdown.d)-bn(keysdown.a),0,bn(keysdown.s)-bn(keysdown.w))).unit

                local lmoving = moving

                moving = fldir.magnitude > .1

                if lmoving and not moving then

                        idledir = lfldir*Vector3.new(1,0,1)

                        descendtimer = tick()

                end

                local dbomb = fldir.Y < -.6 or (moving and keysdown["1"])

                if moving and keysdown["0"] and lmoving then

                        fldir = (Vector3.new(lfldir.X,math.min(fldir.Y,lfldir.Y+.01)-.1,lfldir.Z)+(fldir*Vector3.new(1,0,1))*.05).unit

                end

                local down = tor.CFrame:vectorToWorldSpace(Vector3.new(0,-1,0))

                local descending = (not moving and keysdown["q"] and not keysdown[" "])

                cf = ccomplerp(cf,CFrame.new(tor.Position,tor.Position+(not moving and idledir or fldir)),keysdown["0"] and .02 or .07)

                local gdown = not dbomb and cf.lookVector.Y < -.2 and tor.Velocity.unit.Y < .05

                hum.PlatformStand = true

                bg.maxTorque = Vector3.new(1,1,1)*9e5

                local rotvel = CFrame.new(Vector3.new(),tor.Velocity):toObjectSpace(CFrame.new(Vector3.new(),fldir)).lookVector

                bg.cframe = cf * CFrame.Angles(not moving and -.1 or -math.pi/2+.2,moving and mid(-2.5,rotvel.X/1.5) + reqrotx or 0,0)

                reqrotx = reqrotx - reqrotx/10

                bv.maxForce = Vector3.new(1,1,1)*9e4*.5

                local anioff =(bn(keysdown[" "])-bn(keysdown["q"]))/2

                local ani = tickwave(1.5-anioff,1)

                bv.velocity = bv.velocity:Lerp(Vector3.new(0,bn(not moving)*-ani*15+(descending and math.min(20,tick()-descendtimer)*-8 or bn(keysdown[" "])-bn(keysdown["q"]))*15,0)+vel,.6) 

                vel = moving and cf.lookVector*flspd or Vector3.new()

                flspd = math.min(120,lerp(flspd,moving and (fldir.Y<0 and flspd+(-fldir.Y)*grav/60 or math.max(50,flspd-fldir.Y*grav/300)) or 60,.4))

                setwings(moving and (gdown and outlow or dbomb and divebomb) or (descending and veryhigh or flap1),15)

                for i=1,4 do

                        --CFrame.Angles(-.5+bn(i==3)*2.4+bn(i==4)*.5,.1+bn(i==2)*.5-bn(i==3)*1.1,bn(i==3)*.1)

                        rwing[i].C0 = clerp(rwing[i].C0,oc0[rwing[i]] * (gdown and CFrame.new() or dbomb and CFrame.Angles(-.5+bn(i==3)*.4+bn(i==4)*.5,.1+bn(i==2)*.5-bn(i==3)*1.1,bn(i==3)*.1) or descending and CFrame.Angles(.3,0,0) or CFrame.Angles((i*.1+1.5)*ani,ani*-.5,1*ani)),descending and .8 or .2)

                        lwing[i].C0 = clerp(lwing[i].C0,oc0[lwing[i]] * (gdown and CFrame.new() or dbomb and CFrame.Angles(-(-.5+bn(i==3)*.4+bn(i==4)*.5),-(.1+bn(i==2)*.5-bn(i==3)*1.1),bn(i==3)*.1) or descending and CFrame.Angles(-.3,0,0) or CFrame.Angles(-(i*.1+1.5)*ani,ani*.5,1*ani)),descending and .8 or .2)

                end

                local hit,ray = workspace:FindPartOnRayWithIgnoreList(Ray.new(tor.Position,Vector3.new(0,-3.5+math.min(0,bv.velocity.y)/30,0)),{char})

                if hit and down.Y < -.85 and tick()-flystart > 1 then

                        flying = false

                        hum.PlatformStand = false

                        tor.Velocity = Vector3.new()

                end

        else

                bg.maxTorque = Vector3.new()

                bv.maxForce = Vector3.new()

                local ani = tickwave(walking and .8 or 4.5,1)

                setwings(idle,10)

                local x,y,z = fspd/160,uspd/700,sspd/900

                for i=1,4 do

                        rwing[i].C0 = clerp(rwing[i].C0,oc0[rwing[i]] * CFrame.Angles(ani*.1 + -mid(-.1,x),0 + -mid(-.1,y) + bn(i==2)*.6,ani*.02 + -mid(-.1,z)),.2)

                        lwing[i].C0 = clerp(lwing[i].C0,oc0[lwing[i]] * CFrame.Angles(ani*-.05 + mid(-.1,x),0 + mid(-.1,y) + -bn(i==2)*.6,ani*.02 + mid(-.1,z)),.2)

                end

                if keypressed[" "] and not flying and (tick()-jumptime > .05 and (tick()-jumptime < 3 or hum.Jump)) then

                        vel = Vector3.new(0,50,0)

                        bv.velocity = vel

                        idledir = cam.CoordinateFrame.lookVector*Vector3.new(1,0,1)

                        cf = tor.CFrame * CFrame.Angles(-.01,0,0)

                        tor.CFrame = cf

                        bg.cframe = cf

                        flystart = tick()

                        flying = true

                end

        end

        keypressed = {}

end))



end fly()

--Bird Wings By Rosemarijohn2
