OWNER <- true;
Mutator <- false;
ItemText <- "";
PortalPlayer <- false;
handleAct <- self;

EVENT_ARRAY <- [
	["EVENT_CRANE_BREAKABLE","null","St1 起重机"], //0
	["EVENT_TANK_REACHES_END","null","St1 坦克"], //1
	["EVENT_GENERATOR_ACTIVATED","null","St1 发电机"], //2
	["EVENT_HELICOPTER_ESCAPES","null","St1 直升机"], //3
	["EVENT_HUMAN_ESCAPE_STAGE1","null","St1 撤离"], //4
	["EVENT_STAGE2_TRUCK_ESCAPES","null","St2 卡车撤离"], //5
	["EVENT_STAGE2_TRUCK_ESCAPES_WITHHUMANS","null","St2 撤离"], //6
	["EVENT_STAGE2_PORTAL_GUN","null","St2 Portal Gun"], //7
	["EVENT_STAGE2_THUNDER_GUN","null","St2 Thunder Gun"], //8
	["EVENT_STAGE2_INMUNIZER_GUN","null","St2 神圣枪"], //9
	["EVENT_STAGE2_MUTATOR","null","St2 基因突变"], //10
	["EVENT_STAGE2_ZEROGRAVITY","null","St2 零重力枪"], //11
	["EVENT_STAGE2_TURRET","null","St2 炮塔"], //12
	["EVENT_STAGE2_GENERATOR","null","St2 Generator"], //13
	["EVENT_STAGE3_GENERATOR","null","St3 Generator"], //14
	["EVENT_ZMITEM_SUMMONER","null","ZM 黑洞巫师"], //15
	["EVENT_ZMITEM_JUMPER","null","ZM 高跳"], //16
	["EVENT_ZMITEM_ALMA","null","ZM 阿尔玛"], //17
	["EVENT_ZMITEM_VORTIGAUNT","null","ZM 弗地冈"], //18
	["EVENT_ZMITEM_ANTLION","null","ZM 蚁狮"], //19
	["EVENT_ZMITEM_SHOCKWAVE","null","ZM 冲击狗"], //20
	["EVENT_ZMITEM_PREDATOR","null","ZM 铁血战士"], //21
	["EVENT_STAGE3_TRUCK_REACHES_END","null","St3 撤离"], //22
	["EVENT_STAGE4_HUMAN_ESCAPES","null","St4 撤离"], //23
	["EVENT_STAGE4_GENERATOR_ACTIVATED","null","St4 Generator"], //24
	["EVENT_STAGE4_ULTRALISK_DIES","null","St4 雷兽"], //25
	["EVENT_STAGE4_PLANE_ESCAPE","null","St4 飞机"], //26
	["EVENT_STAGE4_APACHE_ESCAPES","null","St4 Apache"], //27
	["EVENT_STAGE4_JUGGERNAUT_ESCAPES","null","St4 Juggernaut"], //28
	["EVENT_STAGE4_JUGGERNAUT_UNLOCK_FLAMETHROWER","null","St4 Juggernaut Flamethrower"], //29
	["EVENT_STAGE4_JUGGERNAUT_UNLOCK_ROCKETLAUNCHER","null","St4 Juggernaut RocketLauncher"], //30
	["EVENT_STAGE4_JUGGERNAUT_UNLOCK_MINIGUN","null","St4 Juggernaut Minigun"] //31
];

function MessageStage5Hud(mes)
{
	if(mes == 1)
	{
        //HUMANS: PROTECT THE CORE TO SURVIVE\nZOMBIES: TOUCH THE CORE TO WIN AND EARN POINTS
        ScriptPrintMessageCenterAll("人类：保护核心并生存\n僵尸：触摸核心来损坏核心获取胜利");
	}
	if(mes == 2)
	{`
        ScriptPrintMessageCenterAll("TAKE THE LIFT IN THE MIDDLE\nOF THE ROOM");
	}
	if(mes == 3)
	{
        //ESCAPE WITH THE HELICOPTER
        ScriptPrintMessageCenterAll("乘坐直升机撤离");
	}
	if(mes == 4)
	{
        //HOLD THE ZOMBIES COMING FROM THE\nCORRIDOR WITH THE GREEN LIGHT\nWAIT UNTIL THE 4 BRIDGES\nARE CONNECTED
        ScriptPrintMessageCenterAll("HOLD THE ZOMBIES COMING FROM THE\nCORRIDOR WITH THE GREEN LIGHT\nWAIT UNTIL THE 4 BRIDGES\nARE CONNECTED");
	}
}

function ClearVar()
{
    Mutator = false;
    ItemText = "";
    PortalPlayer = false;
}

function SetPlayerScript()
{
	local Fpl = null;
	while(null != (Fpl = Entities.FindByClassname(Fpl, "player")))
	{
		if(Fpl.GetHealth() > 0 && Fpl.IsValid())
		{
			local FindOw = Fpl.GetScriptScope()
			if("OWNER" in FindOw){}
			else
			{
				EntFireByHandle(Fpl,"RunScriptFile","kinlkm/last_man_standing/player_lastman_cn.nut",0.00,Fpl,Fpl);
			}
		}
	}
	EntFireByHandle(self,"RunScriptCode","SetPlayerScript();",5.00,null,null);
}

function SetTextItem(item)
{
    if(item == 0)
    {
        ItemText = "免疫装置:\n按 E 使用\n可在20秒内免疫僵尸感染.";
    }
    if(item == 1)
    {
        ItemText = "弹药:\n按 E 使用\n范围内人类无限弹药";
    }
    if(item == 2)
    {
        ItemText = "高斯枪:\n按 E 使用发射光束秒杀正前方僵尸\n冷却时间：45秒";
    }
    if(item == 3)
    {
        ItemText = "神圣枪:\n按 E 使用范围内4秒无敌\n冷却时间：60秒";
    }
    if(item == 4)
    {
        ItemText = "加特林机枪：\n按 E 使用";
    }
    if(item == 5)
    {
        ItemText = "地雷：\n 按 E 使用请不要在人群使用\n站到地雷正上方一秒可回收 最多可使用13次"
    }
    if(item == 6)
    {
        ItemText = "突变基因：\n 按 E 使用放置药丸"
    }
    if(item == 7)
    {
        ItemText = "卫兵：\n 按 E 使用放置一个卫兵 持续时间90秒";
    }
    if(item == 8)
    {
        ItemText = "传送枪：\n 按 E 使用第一次放置传送门入口\n第二次放置传送门出口\n第三次移除两个传送门";
    }
    if(item == 9)
    {
        ItemText = "旋风枪：\n 按 E 发射一圈旋风\n最多可使用4次";
    }
    if(item == 10)
    {
        ItemText = "炮塔：\n 按 E 放置炮塔\n对着炮管按E可回收";
    }
    if(item == 11)
    {
        ItemText = "零重力枪:\n 按 E 使用可降低正前方僵尸重力\n冷却时间：30 秒";
    }
    if(item == 12)
    {
        ItemText = "超越极限：\n按 E 使用 给与玩家重力以及速度和血量加成\n持续时间45秒\n影响最大范围内的所有人类";
    }
    if(item == 13)
    {
        ItemText = "机械狗\n鼠标左键 = 切换攻击形态\n鼠标右键 = 攻击";
    }
    if(item == 14)
    {
        ItemText = "黑洞巫师：鼠标右键使用\n鼠标右键即可召唤一只僵尸到你身旁";
    }
    if(item == 15)
    {
        ItemText = "跳跃者：按下右击键即可跳跃\n（最好在跳的过程中右键）";
    }
    if(item == 16)
    {
        ItemText = "阿尔玛：按一下右击即可杀死僵尸\n仅在人类处于范围内时启用";
    }
    if(item == 17)
    {
        ItemText = "弗地冈：右键使用 将正前方人类钩到你面前";
    }
    if(item == 18)
    {
        ItemText = "坦克：高血量 鼠标右键使用 可对范围内人类造成伤害";
    }
    if(item == 19)
    {
        ItemText = "蚁狮：鼠标右键使用 飞行十秒\n冷却时间: 20 秒";
    }
    if(item == 20)
    {
        ItemText = "冲击狗：鼠标右键使用\n 可将范围内僵尸以及自身击飞";
    }
    if(item == 21)
    {
        ItemText = "飞天水龙：可自由飞行 鼠标右键使用\n 可将范围内人类冰冻";
    }
    if(item == 22)
    {
        ItemText = "铁血战士：鼠标左键 = 切换形态\n鼠标右键 = 使用技能"
    }
    EntFireByHandle(self,"RunScriptCode","ShowSelfItemText();",0.01,null,null);
}

function ShowSelfItemText()
{
    EntFire("universal_item_text", "SetText", ItemText, 0.00, handleAct);
    EntFire("universal_item_text", "Display", "", 0.01, handleAct);
    EntFire("!self","RunScriptCode","ClearText();",5.00,handleAct);
}

function AnyText(t)
{
    if(t == 1)
    {
        ItemText = "PRESS LEFT CLICK TO SHOOT\nPRESS RIGHT CLICK CHANGE CAMERA AND CANNON ANGLE";
    }
    EntFireByHandle(self,"RunScriptCode","ShowSelfItemText();",0.01,null,null);
}

function ClearText()
{
    ItemText = "";
}

function PlayerMutantDaun()
{
    local a = RandomInt(1,14);
    if(!Mutator && self.GetTeam() == 3)
    {
        if(a == 1)
        {
            EntFire("Global_Speed","ModifySpeed","0.90",0.00,null);
            ItemText = "你已获得: 降低 10%速度"
        }
        else if(a == 2)
        {
            EntFire("Global_Speed","ModifySpeed","1.10",0.00,null);
            ItemText = "你已获得: 提升 10%速度"
        }
        else if(a == 3)
        {
            EntFire("!self","AddOutput","gravity 0.8",0.00,null);
            ItemText = "你已获得: 降低 20%重力"
        }
        else if(a == 4)
        {
            EntFire("!self","AddOutput","rendercolor 128 255 0",0.00,null);
            ItemText = "你已获得: 绿色"
        }
        else if(a == 5)
        {
            EntFire("Global_Speed","ModifySpeed","1.30",0.00,null);
            ItemText = "你已获得: 提升 30%速度"
        }
        else if(a == 6)
        {
            EntFire("Global_Speed","ModifySpeed","0.80",0.00,null);
            ItemText = "你已获得: 降低 20%速度"
        }
        else if(a == 7)
        {
            EntFire("!self","AddOutput","rendermode 16",0.00,null);
            ItemText = "你已获得: 隐身"
        }
        else if(a == 8)
        {
            EntFire("!self","AddOutput","rendermode 6",0.00,null);
            ItemText = "你已获得: 隐身"
        }
        else if(a == 9)
        {
            EntFire("Global_Speed","ModifySpeed","1.75",0.00,null);
            ItemText = "你已获得: 提升 75%速度"
        }
        else if(a == 10)
        {
            EntFire("!self","AddOutput","health 15000",0.00,null);
            ItemText = "你已获得: 生命值提高至 15000"
        }
        else if(a == 11)
        {
            EntFire("!self","AddOutput","health 1",0.00,null);
            ItemText = "你已获得: 生命值降低至1"
        }
        else if(a == 12)
        {
            EntFire("!self","AddOutput","gravity 1.1",0.00,null);
            ItemText = "你已获得: 提高 10%重力"
        }
        else if(a == 13)
        {
            EntFire("!self","AddOutput","health 1337",0.00,null);
            ItemText = "你已获得: 生命值提高至1337"
        }
        else if(a == 14)
        {
            EntFire("!self","AddOutput","gravity 2",0.00,null);
            ItemText = "你已获得: 提高 100%重力"
        }
        EntFireByHandle(self,"RunScriptCode","ShowSelfItemText();",0.01,null,null);
        EntFire("Weapon_Mutator_Projectile_Model2","Kill","",0.00,null);
        EntFire("Weapon_Mutator_Projectile_Trigger","Kill","",0.00,null);
        Mutator = true;
    }
}

function PortalTeleport()
{
    if(!PortalPlayer)
    {
        local port01 = null;
        local getoPort01 = null;
        if(null != (port01 = Entities.FindByName(port01,"Weapon_PortalGun_Portal_1_Teleport")))
        {
            getoPort01 = port01.GetOrigin();
			local oriport01 = "origin "+getoPort01.x+" "+getoPort01.y+" "+(getoPort01.z+6);
			EntFireByHandle(handleAct,"AddOutput",oriport01,0.05,null,null);
            EntFire("!activator","RunScriptCode","PortalPlayer = true;",0.00,handleAct);
            EntFire("!activator","RunScriptCode","PortalPlayer = false;",2.00,handleAct);
        }
    }
}

function PortalTeleport2()
{
    if(!PortalPlayer)
    {
        local port02 = null;
        local getoPort02 = null;
        if(null != (port02 = Entities.FindByName(port02,"Weapon_PortalGun_Portal_2_Teleport")))
         {
            getoPort02 = port02.GetOrigin();
			local oriport02 = "origin "+getoPort02.x+" "+getoPort02.y+" "+(getoPort02.z+6);
			EntFireByHandle(handleAct,"AddOutput",oriport02,0.05,null,null);
            EntFire("!activator","RunScriptCode","PortalPlayer = true;",0.00,handleAct);
            EntFire("!activator","RunScriptCode","PortalPlayer = false;",2.00,handleAct);
        }
    }
}
