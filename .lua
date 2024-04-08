local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Enemies",true)
local T3 = wndw:Tab("Hatch")
local T4 = wndw:Tab("Event Dungeon",true)
local T5 = wndw:Tab("Unlock & Teleports")
local T6 = wndw:Tab("Level up")
local T7 = wndw:Tab("System Manipulator",true)

local workspace = game:GetService("Workspace")
local var = {
  click = false,
  on = false,
  bw = false,
  ba = false,
  reb = false,
  enemy = {
    table = {},
    s = "scene0",
    toggle = false,
    toggle2 = false,
    toggle3 = false
  },
  egg = {
    s = 1,
    toggle = false,
    toggle2 = false
  },
  edt = false,
  s = 0,
  upl = {
    table = {"Soldier","Mask Sniper","Karate Master","Kendo Master","Solo Leveling","Ichigo","Ice"},
    toggle = false,
    s = "Soldier"
  }
}
--workspace.enemy.worldboss
lib:AddTable(workspace.enemy,var.enemy.table)

local function gch(path,funct)
  for i,v in pairs(path:GetChildren()) do
    funct(v)
  end
end

T1:Toggle("Auto click",false,function(value)
    var.click = value
    while wait() do
      if var.click == false then break end
      game:GetService("ReplicatedStorage")["Events"]["ClickEvent"]:FireServer(0,1)
    end
end)

T1:Toggle("Auto claim online rewards",false,function(value)
    var.on = value
    while wait() do
      if var.on == false then break end
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(1)
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(2)
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(3)
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(4)
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(5)
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(6)
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(7)
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(8)
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(9)
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(10)
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(11)
      game:GetService("ReplicatedStorage")["Events"]["Rewards"]["ClaimeTaskEvent"]:FireServer(12)
    end
end)

T1:Toggle("Auto equip best weapon every 1s",false,function(value)
    var.bw = value
    while wait(1) do
      if var.bw == false then break end
      game:GetService("ReplicatedStorage")["Events"]["Equip"]["EquipBestEvent"]:FireServer(1)
    end
end)

T1:Toggle("Auto equip best armor every 1s",false,function(value)
    var.ba = value
    while wait(1) do
      if var.ba == false then break end
      game:GetService("ReplicatedStorage")["Events"]["Jewelry"]["EquipBestEvent"]:FireServer(4)
    end
end)

T1:Toggle("Auto rebirth",false,function(value)
    var.reb = value
    while wait() do
      if var.reb == false then break end
      game:GetService("ReplicatedStorage")["Events"]["Rebirth"]["RebirthEvent"]:FireServer()
    end
end)

T2:Dropdown("Choose scene",var.enemy.table,function(value)
    var.enemy.s = value
end)

T2:Toggle("Auto fight every 2s",false,function(value)
    var.enemy.toggle = value
    while wait(2) do
      if var.enemy.toggle == false then break end
        gch(workspace["enemy"][var.enemy.s],function(v)
          game:GetService("ReplicatedStorage")["Events"]["Action"]["CombatStartEvent"]:FireServer(v,false)
        end)
      end
end)

T2:Toggle("Auto click",false,function(value)
    var.enemy.toggle2 = value
    while wait() do
      if var.enemy.toggle2 == false then break end
      game:GetService("ReplicatedStorage")["Events"]["ClickEvent"]:FireServer(1,1)
    end
end)

T2:Toggle("Auto end fight [ INSTANT ]",false,function(value)
    var.enemy.toggle3 = value
    while wait() do
      if var.enemy.toggle3 == false then break end
        gch(workspace["enemy"][var.enemy.s],function(v)
          game:GetService("ReplicatedStorage")["Events"]["Action"]["CombatEndEvent"]:FireServer(1,0,v)
        end)
      end
end)

T3:Textbox("Insert egg number",false,function(value)
    var.egg.s = tonumber(value)
end)

T3:Toggle("Auto hatching",false,function(value)
    var.egg.toggle = value
    while wait(1) do
      if var.egg.toggle == false then break end
      game:GetService("ReplicatedStorage")["Events"]["RandomItemGenerator"]["GenerateRandomItemEvent"]:FireServer(1,var.egg.s)
    end
end)

T3:Toggle("Auto equip best pet every 1s",false,function(value)
    var.egg.toggle2 = value
    while wait(1) do
      if var.egg.toggle2 == false then break end
      game:GetService("ReplicatedStorage")["Events"]["Pets"]["EquipBestEvent"]:FireServer()
    end
end)

T4:Toggle("Auto kill monster",false,function(value)
    var.edt = value
    while wait() do
      if var.edt == false then break end
      gch(workspace.activity.Activity_eventenemy["ID_1"].enemys,function(v)
          game:GetService("ReplicatedStorage")["Events"]["Activity"]["EventEnemy"]["HurtEnemyEvent"]:FireServer(v:GetAttribute("idx"),v:GetAttribute("id"))
      end)
    end
end)

T5:Textbox("Insert map ID",false,function(value)
    var.s = tonumber(value)
end)

T5:Button("Teleport",function()
    game:GetService("ReplicatedStorage")["Events"]["Map"]["ChangeMapEvent"]:FireServer(var.s)
end)

T5:Button("Unlock all maps",function()
    for array = 1,50 do
      game:GetService("ReplicatedStorage")["Events"]["Map"]["UnlockMapEvent"]:FireServer(array)
    end
end)

T6:Dropdown("Choose hero",var.upl.table,function(value)
    var.upl.s = value
end)

T6:Toggle("Auto level up",false,function(value)
    var.upl.toggle = value
    while wait() do
      if var.upl.toggle == false then break end
      if var.upl.s == "Soldier" then
        game:GetService("ReplicatedStorage")["Events"]["Follows"]["LevelUpItemEvent"]:FireServer(1)
      elseif var.upl.s == "Mask Sniper" then
        game:GetService("ReplicatedStorage")["Events"]["Follows"]["LevelUpItemEvent"]:FireServer(2)
      elseif var.upl.s == "Karate Master" then
        game:GetService("ReplicatedStorage")["Events"]["Follows"]["LevelUpItemEvent"]:FireServer(3)
      elseif var.upl.s == "Kendo Master" then
        game:GetService("ReplicatedStorage")["Events"]["Follows"]["LevelUpItemEvent"]:FireServer(4)
      elseif var.upl.s == "Solo Leveling" then
        game:GetService("ReplicatedStorage")["Events"]["Follows"]["LevelUpItemEvent"]:FireServer(5)
      elseif var.upl.s == "Ichigo" then
        game:GetService("ReplicatedStorage")["Events"]["Follows"]["LevelUpItemEvent"]:FireServer(6)
      elseif var.upl.s == "Ice" then
        game:GetService("ReplicatedStorage")["Events"]["Follows"]["LevelUpItemEvent"]:FireServer(7)
      end
    end
end)

T7:Button("Infinite power",function()
    game:GetService("ReplicatedStorage")["Events"]["Rewards"]["GetRewardEvent"]:FireServer({1,math.huge})
end)

T7:Button("Infinite rainbow stones",function()
    game:GetService("ReplicatedStorage")["Events"]["Rewards"]["GetRewardEvent"]:FireServer({3,math.huge})
end)

T7:Button("Infinite gems",function()
    game:GetService("ReplicatedStorage")["Events"]["Rewards"]["GetRewardEvent"]:FireServer({2,math.huge})
end)
