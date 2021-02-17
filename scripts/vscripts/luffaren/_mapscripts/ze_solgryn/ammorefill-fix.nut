//===============================================\\
// Script by Luffaren (STEAM_1:1:22521282)
// (PUT THIS IN: csgo/scripts/vscripts/luffaren/)
//===============================================\\
//	This script allows you to refill ammo and/or grenades easily for CT-players.
//	By default negev+m249 gets 150 ammo, bizon gets 64 ammo and everything else gets 30 ammo.
//	Should be a somewhat balanced ammo-count, but can always be altered for specific weapons in the 'GiveAmmo()' function.
//
//			[HOW TO USE]
//	1) Add this script to an entity of choice (Properties > Entity Scripts > Manage > +).
//	2) Add this output to the entity:		OnUserX > !self > RunScriptCode > FUNCTION();
//	3) Replace 'FUNCTION();' with the function you want, see the FUNCTIONS/EXAMPLES lists below. 
//	4) When you want to give ammo/grenades, call 'FireUserX' to the entity. 
//	Note: don't repeat 'GiveGrenade();' too fast, leave at least 1.5 seconds of time in-between each call. 
//	
//			[FUNCTIONS]
//	GiveAmmo(radius);
//	GiveGrenade(radius,type=TYPE_HEGRENADE);
//	
//			[EXAMPLES]
//	GiveAmmo(512);					-	refill weapon-ammo of the CT's within a 512-unit distance from the entity origin. 
//	GiveGrenade(1024);				-	give a HEgrenade(default) to the CT's within a 1024-unit distance from the entity origin. 
//	GiveGrenade(256,TYPE_MOLOTOV);	-	give a molotov to the CT's within a 256-unit distance from the entity origin.
//	-------------------------------------------------------------------------
//  (OnUser1 refills ammo and gives a HE-grenade to CT's within 512 units, OnUser2 gives a molotov to CT's within 512 units)
//	-----	OnUser1 > !self > RunScriptCode > GiveAmmo(512);
//	-----	OnUser1 > !self > RunScriptCode > GiveGrenade(512);
//	-----	OnUser2 > !self > RunScriptCode > GiveGrenade(512,TYPE_MOLOTOV);
//	-------------------------------------------------------------------------
//	
//			[GRENADE TYPES]
//	TYPE_HEGRENADE
//	TYPE_FLASHBANG
//	TYPE_MOLOTOV
//	TYPE_INCGRENADE

//===============================================\\
TYPE_HEGRENADE <- "weapon_hegrenade";
TYPE_FLASHBANG <- "weapon_flashbang";
TYPE_MOLOTOV <- "weapon_molotov";
TYPE_INCGRENADE <- "weapon_incgrenade";
function GiveAmmo(radius)
{
	local h=null;while(null!=(h=Entities.FindByClassnameWithin(h,"weapon_*",self.GetOrigin(),radius)))
	{
		if(h.GetClassname()=="weapon_hegrenade"||
		h.GetClassname()=="weapon_flashbang"||
		h.GetClassname()=="weapon_molotov"||
		h.GetClassname()=="weapon_incgrenade")
			continue;
		if(h.GetClassname()=="weapon_negev"||h.GetClassname()=="weapon_m249")
			EntFireByHandle(h,"SetAmmoAmount","150",0.00,null,null);
		else if(h.GetClassname()=="weapon_bizon")
			EntFireByHandle(h,"SetAmmoAmount","64",0.00,null,null);
		else if(h.GetClassname()=="weapon_bumpmine")
			continue;
		else
			EntFireByHandle(h,"SetAmmoAmount","30",0.00,null,null);
	}
}
equip <- null;
function GiveGrenade(radius,type=TYPE_HEGRENADE)
{
	if(equip==null||!equip.IsValid())
	{
		equip = Entities.CreateByClassname("game_player_equip");
		equip.__KeyValueFromInt("spawnflags",1);
	}
	equip.__KeyValueFromString(type,"1");
	local ii = 0.00;
	local h=null;while(null!=(h=Entities.FindByClassnameWithin(h,"player",self.GetOrigin()+Vector(0,0,-48),radius)))
	{
		if(!h.IsValid()||h.GetTeam()!=3)
			continue;
		EntFireByHandle(equip,"Use","",ii,h,null);
		ii+=0.02;
	}
}
