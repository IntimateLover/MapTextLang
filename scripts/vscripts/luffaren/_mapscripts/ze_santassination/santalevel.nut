STAGE <- 0;
STAGE_ENT <- null;
extrememode_Math<-0;

function MapStart()
{
    extrememode_Math = 0;
    STAGE_ENT = Entities.FindByName(null, "Level_Case");
    EntFireByHandle(STAGE_ENT, "InValue", STAGE.tostring(), 0.00, null, null);
}

function SetStage(n){STAGE = n;}

function extrememodepass()
{
	extrememode_Math++;
	if(extrememode_Math==1)
	{
		EntFire("Map_Brush","RunScriptCode","SetStage(2);",0.0,null);
	} 
	if(extrememode_Math==2)
	{
		EntFire("Map_Brush","RunScriptCode","SetStage(1);",0.0,null);
	}
	if(extrememode_Math > 2){extrememode_Math = 1;}
}
