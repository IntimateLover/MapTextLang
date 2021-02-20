function TeleportTeam(team,_x,_y,_z)//TEAM 1 = cthumans, TEAM 2 = tzombies
{
	lx = _x;
	ly = _y;
	lz = _z;
	team = 4-team;
	local p = null;
	while(null != (p = Entities.FindByClassname(p, player)))
	{
		if(p != null && p.IsValid() && p.GetTeam() == team && p.GetHealth()0 && !p.IsNoclipping())
		{
			EntFireByHandle(p, AddOutput, origin +_x +  +_y+ +_z, 0.00, self, self);
		}
	} 
}

function KillAllT()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if(p != null && p.IsValid() && p.GetTeam() == 2 && p.GetHealth()>0)
			EntFireByHandle(p, "SetHealth", "-69", 0.00, null, null);
	}
}

function KillAllCT()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if(p != null && p.IsValid() && p.GetTeam() == 3 && p.GetHealth()>0)
			EntFireByHandle(p, "SetHealth", "-69", 0.00, null, null);
	}
}
