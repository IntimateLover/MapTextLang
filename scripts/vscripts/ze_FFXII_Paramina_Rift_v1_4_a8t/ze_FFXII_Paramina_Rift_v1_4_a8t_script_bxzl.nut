Map_Stage_Text <- Entities.FindByName(null,"Map_Stage_Text");
Secret_Hudhint <- Entities.FindByName(null,"Secret_Hudhint");
Map_HudHint <- Entities.FindByName(null,"Map_HudHint");

function Map_HudHint_Change()
{
    if （Map_HudHint != null)
    {
    	Map_HudHint.__KeyValueFromString("message", "最终幻想12:帕拉米亚\n---------------------------\n地图作者:Slayerdragon\n和h4sArD/Noctali\n模型:K.\n感谢:\n- Cuniczek\n- d'Maniak\n- JorisCeoen\n- Sgt. zaCade\n- LaStation\n- George\n- Lev\n- Schicksal");
		}
}

function Map_Stage_Text_Change_1()
{
    if （Map_Stage_Text != null)
    {
    	Map_Stage_Text.__KeyValueFromString("message", "第一章 - 找到一条通过帕拉米亚大峡谷的道路\n并找到米利亚姆神庙");
		}
}

function Map_Stage_Text_Change_2()
{
    if （Map_Stage_Text != null)
    {  
    	Map_Stage_Text.__KeyValueFromString("message", "第二章 - 找到隐藏的宝藏并在米利亚姆神庙中\n击败玛提乌斯");
		}
}

function Secret_Hudhint_Change_1()
{
    if （Map_HudHint != null)
    {
    	Secret_Hudhint.__KeyValueFromString("message", "** 初始化支线任务 **\n\n收集500金\n通过搜寻路上的宝箱\n或者通过摧毁水晶塔\n\n=> 任务奖励 - 第二章有药水提供");
		}
}

function Secret_Hudhint_Change_2()
{
    if （Map_HudHint != null)
    {
    	Secret_Hudhint.__KeyValueFromString("message", "** 初始化支线任务 **\n\n摧毁所有的敌方水晶塔\n通过破坏塔顶部的水晶\n\n=> 任务奖励 - 第二章有药水提供");
		}
}

function Say_ScriptDate()
{
    EntFire("Cmd","Command","say script by bxzl on 2020.08.24",0.00,null);
}
//repush
