#pragma semicolon 1
#include <sdkhooks>
#include <sdktools>
#include <cstrike>

#define PluginVersion "1.0"

#define AmmoCount 999 //MAX AMMO

public Plugin myinfo =
{
	name = "ZR game_player_equip MapItem Ammo & Clip FIX",
	author = "bbs.93x.net",
	description = "Fix map ammo after csgo 20170819 update",
	version = PluginVersion,
	url = "http://bbs.93x.net/"
};


public void OnEntityCreated(int entity, const char[] classname)
{
	if (StrEqual(classname, "game_player_equip")){
		SDKHook(entity, SDKHook_Use, Hook_USE);
	}
}

public Action Hook_USE(int entity, int client, int caller, UseType type, float value)
{
	if(IsValidClient(client) && IsPlayerAlive(client))
	{	
		if(IsNeedFix(entity))
		{
			Do_AmmoAndClip(client);
		}
	}
}


bool IsNeedFix(int entity)
{
	char findammo[64];
	int EquipArrays = GetEntPropArraySize(entity, Prop_Data, "m_weaponNames");
	
	bool Found =false;
	for(int i; i < EquipArrays; i++)
	{
		GetEntPropString(entity, Prop_Data, "m_weaponNames", findammo, sizeof(findammo), i);
		if(StrContains(findammo,"ammo",false) != -1)
		{
			Found = true;
			break;
		}
	}
	return Found;
}


void Do_AmmoAndClip(int client)
{
	int weaponEntity = -1;
	
	weaponEntity = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY); 
	
	char WeaponClass[64];
	
	if (weaponEntity != -1 && IsValidEdict(weaponEntity))
	{
		GetEdictClassname(weaponEntity, WeaponClass, sizeof(WeaponClass));
		int WeaponClip = GetWeaponAmmoCount(WeaponClass, true);
		
		DoResRefillAmmo(weaponEntity, client);
		DoResRefillClip(weaponEntity, client ,WeaponClip);
	}
	
	weaponEntity = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
	
	if (weaponEntity != -1 && IsValidEdict(weaponEntity))
	{
		GetEdictClassname(weaponEntity, WeaponClass, sizeof(WeaponClass));
		int WeaponClip = GetWeaponAmmoCount(WeaponClass, true);
		
		DoResRefillAmmo(weaponEntity, client);
		DoResRefillClip(weaponEntity, client ,WeaponClip);
	}
	
}


void DoResRefillAmmo(int weapon, int client)
{
	SetReserveAmmo(client, weapon, AmmoCount);
}

void DoResRefillClip(int weapon, int client ,int count)
{	
	SetClipAmmo(client, weapon, count);
}

stock int SetReserveAmmo(int client, int weapon, int ammo)
{
	int ammotype = GetEntProp(weapon, Prop_Send, "m_iPrimaryAmmoType");
	if(ammotype == -1) return;
	
	SetEntProp(client, Prop_Send, "m_iAmmo", ammo, _, ammotype);
}

stock void SetClipAmmo(int client, int weapon, int clip)
{
	SetEntProp(weapon, Prop_Send, "m_iClip1", clip);
}

bool IsValidClient(int client)
{
	if(client > 0  && client <= MaxClients && IsClientConnected(client) && IsClientInGame(client) && GetClientTeam(client) > 1)
	{
		return true;
	}
	return false;
}

//How much clip your server need?
stock int GetWeaponAmmoCount(char[] weaponName, bool currentClip = false)
{
	if (StrEqual(weaponName,  "weapon_ak47"))
		return currentClip ? 50 : 90;
	else if (StrEqual(weaponName,  "weapon_m4a1"))
		return currentClip ? 50 : 40;
	else if (StrEqual(weaponName,  "weapon_m4a1_silencer"))
		return currentClip ? 50 : 40;
	else if (StrEqual(weaponName,  "weapon_sg552"))
		return currentClip ? 50 : 90;
	else if (StrEqual(weaponName,  "weapon_aug"))
		return currentClip ? 50 : 90;
	else if (StrEqual(weaponName,  "weapon_p90"))
		return currentClip ? 60 : 100;
	else if (StrEqual(weaponName,  "weapon_galilar"))
		return currentClip ? 55 : 90;
	else if (StrEqual(weaponName,  "weapon_famas"))
		return currentClip ? 55 : 90;
	else if (StrEqual(weaponName,  "weapon_ssg08"))
		return currentClip ? 20 : 90;
	else if (StrEqual(weaponName,  "weapon_m249"))
		return currentClip ? 150 : 200;
	else if (StrEqual(weaponName,  "weapon_negev"))
		return currentClip ? 100 : 200;
	else if (StrEqual(weaponName,  "weapon_nova"))
		return currentClip ? 10 : 32;
	else if (StrEqual(weaponName,  "weapon_xm1014"))
		return currentClip ? 8 : 32;
	else if (StrEqual(weaponName,  "weapon_sawedoff"))
		return currentClip ? 10 : 32;
	else if (StrEqual(weaponName,  "weapon_mag7"))
		return currentClip ? 10 : 32;
	else if (StrEqual(weaponName,  "weapon_mac10"))
		return currentClip ? 45 : 100;
	else if (StrEqual(weaponName,  "weapon_mp9"))
		return currentClip ? 45 : 120;
	else if (StrEqual(weaponName,  "weapon_mp7"))
		return currentClip ? 45 : 120;
	else if (StrEqual(weaponName,  "weapon_ump45"))
		return currentClip ? 45 : 100;
	else if (StrEqual(weaponName,  "weapon_bizon"))
		return currentClip ? 100 : 120;
	else if (StrEqual(weaponName,  "weapon_glock"))
		return currentClip ? 30 : 120;
	else if (StrEqual(weaponName,  "weapon_fiveseven"))
		return currentClip ? 30 : 100;
	else if (StrEqual(weaponName,  "weapon_deagle"))
		return currentClip ? 30 : 35;
	else if (StrEqual(weaponName,  "weapon_hkp2000"))
		return currentClip ? 30 : 52;
	else if (StrEqual(weaponName,  "weapon_usp_silencer"))
		return currentClip ? 30 : 24;
	else if (StrEqual(weaponName,  "weapon_p250"))
		return currentClip ? 30 : 26;
	else if (StrEqual(weaponName,  "weapon_elite"))
		return currentClip ? 30 : 120;
	else if (StrEqual(weaponName,  "weapon_tec9"))
		return currentClip ? 30 : 120;
	else if (StrEqual(weaponName,  "weapon_cz75a"))
		return currentClip ? 20 : 12;
	else if (StrEqual(weaponName,  "weapon_awp"))
		return currentClip ? 10 : 30;
	else if (StrEqual(weaponName,  "weapon_g3sg1"))
		return currentClip ? 20 : 90;
	else if (StrEqual(weaponName,  "weapon_scar20"))
		return currentClip ? 20 : 90;
	
	return currentClip ? 30 : 90;
	
}
