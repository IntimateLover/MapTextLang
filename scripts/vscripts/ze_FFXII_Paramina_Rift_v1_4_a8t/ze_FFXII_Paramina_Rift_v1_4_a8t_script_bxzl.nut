Map_Stage_Text <- Entities.FindByName(null,"Map_Stage_Text");
Secret_Hudhint <- Entities.FindByName(null,"Secret_Hudhint");
Map_HudHint <- Entities.FindByName(null,"Map_HudHint");

Wind_Level <- " ";
Poison_Level <- " ";
Fire_Level <- " ";
Heal_Level <- " ";
Ice_Level <- " ";
side_quest <- " ";
TREASURE_NUM <- 0;
TOWER_NUM <- 0;
All_Count <- 0;

function Map_HudHint_Change()
{
		if(Map_HudHint != null)
		{
			Map_HudHint.__KeyValueFromString("message", "最终幻想12:帕拉米亚\n---------------------------\n地图作者:Slayerdragon\n和h4sArD/Noctali\n模型:K.\n感谢:\n- Cuniczek\n- d'Maniak\n- JorisCeoen\n- Sgt. zaCade\n- LaStation\n- George\n- Lev\n- Schicksal");
		}
}

function Map_Stage_Text_Change_1()
{
		if(Map_Stage_Text != null)
		{
			Map_Stage_Text.__KeyValueFromString("message", "第一章 - 找到一条通过帕拉米亚大峡谷的道路\n并找到米利亚姆神庙");
		}
}

function Map_Stage_Text_Change_2()
{
		if(Map_Stage_Text != null)
		{
			Map_Stage_Text.__KeyValueFromString("message", "第二章 - 找到隐藏的宝藏并在米利亚姆神庙中\n击败玛提乌斯");
		}
}

function Secret_Hudhint_Change_1()
{
		if(Secret_Hudhint != null)
		{
			Secret_Hudhint.__KeyValueFromString("message", "** 初始化支线任务 **\n\n收集500金\n通过搜寻路上的宝箱\n或者通过摧毁水晶塔\n\n=> 任务奖励 - 第二章有药水提供");
		}
}

function Secret_Hudhint_Change_2()
{
		if(Secret_Hudhint != null)
		{
			Secret_Hudhint.__KeyValueFromString("message", "** 初始化支线任务 **\n\n摧毁所有的敌方水晶塔\n通过破坏塔顶部的水晶\n\n=> 任务奖励 - 第二章有药水提供");
		}
}

function Say_ScriptDate()
{
		EntFire("Cmd","Command","say script by bxzl on 2020.08.24",0.00,null);
}

function Sidequest(stg,count)
{

		if(stg == 1 && count >= 0)
		{
			TOWER_NUM = count;
			side_quest = "水晶塔: "+TOWER_NUM+"/5";
		}
		if(stg == 2 && count >= 0)
		{
			TREASURE_NUM = All_Count <- All_Count + count;
			side_quest = "宝藏: "+TREASURE_NUM+"/500";
		}
		
}

function GetLevel(item,level)
{
		if(item == 1 && level == 1)
		{
			Wind_Level = "风: 1级";
		}
		if(item == 1 && level == 2)
		{
			Wind_Level = "风: 2级";
		}
		if(item == 1 && level == 3)
		{
			Wind_Level = "风: 3级";
		}
		if(item == 1 && level == 4)
		{
			Wind_Level = "风: 4级";
		}
		if(item == 1 && level == 5)
		{
			Wind_Level = "风: 5级";
		}
		if(item == 2 && level == 1)
		{
			Poison_Level = "毒: 1级";
		}
		if(item == 2 && level == 2)
		{
			Poison_Level = "毒: 2级";
		}
		if(item == 2 && level == 3)
		{
			Poison_Level = "毒: 3级";
		}
		if(item == 2 && level == 4)
		{
			Poison_Level = "毒: 4级";
		}
		if(item == 2 && level == 5)
		{
			Poison_Level = "毒: 5级";
		}
		if(item == 3 && level == 1)
		{
			Fire_Level = "火: 1级";
		}
		if(item == 3 && level == 2)
		{
			Fire_Level = "火: 2级";
		}
		if(item == 3 && level == 3)
		{
			Fire_Level = "火: 3级";
		}
		if(item == 3 && level == 4)
		{
			Fire_Level = "火: 4级";
		}
		if(item == 3 && level == 5)
		{
			Fire_Level = "火: 5级";
		}
		if(item == 4 && level == 1)
		{
			Heal_Level = "奶: 1级";
		}
		if(item == 4 && level == 2)
		{
			Heal_Level = "奶: 2级";
		}
		if(item == 4 && level == 3)
		{
			Heal_Level = "奶: 3级";
		}
		if(item == 4 && level == 4)
		{
			Heal_Level = "奶: 4级";
		}
		if(item == 4 && level == 5)
		{
			Heal_Level = "奶: 5级";
		}
		if(item == 5 && level == 1)
		{
			Ice_Level = "冰: 1级";
		}
		if(item == 5 && level == 2)
		{
			Ice_Level = "冰: 2级";
		}
		if(item == 5 && level == 3)
		{
			Ice_Level = "冰: 3级";
		}
		if(item == 5 && level == 4)
		{
			Ice_Level = "冰: 4级";
		}
		if(item == 5 && level == 5)
		{
			Ice_Level = "冰: 5级";
		}
}

function text_show()
{
		if( (Wind_Level != " ") || (Poison_Level != " ") || (Fire_Level != " ") || (Heal_Level != " ") || (Ice_Level != " ") || (side_quest != " ") )
		{
			EntFire("bxzl_text","SetText",Wind_Level+"\n"+Poison_Level+"\n"+Fire_Level+"\n"+Heal_Level+"\n"+Ice_Level+"\n"+side_quest+"\n",0.00,null);
			EntFire("bxzl_text","Display","",0.05,null);
		}
}
