#pragma semicolon 1

#include <sourcemod>
#include <sdktools>

#pragma newdecls required

#define PLUGIN_NAME "No Blood"
#define PLUGIN_VERSION "1.0.0"

ConVar g_cEnableNoBlood = null;
ConVar g_cEnableBloodSplatter = null;
ConVar g_cEnableBloodSplashes = null;

public Plugin myinfo = 
{
	name = PLUGIN_NAME,
	author = "Bara",
	description = "Hide blood",
	version = PLUGIN_VERSION,
	url = "git.tf/Bara"
}

public void OnPluginStart()
{
	CreateConVar("noblood_version", PLUGIN_VERSION, PLUGIN_NAME, FCVAR_NOTIFY|FCVAR_DONTRECORD);
	
	g_cEnableNoBlood = CreateConVar("onlyhs_allow_blood", "1", "Enable / Disable No Blood", _, true, 0.0, true, 1.0);
	g_cEnableBloodSplatter = CreateConVar("onlyhs_allow_blood_splatter", "0", "Enable / Disable No Blood Splatter (onlyhs_allow_blood must be 1)", _, true, 0.0, true, 1.0);
	g_cEnableBloodSplashes = CreateConVar("onlyhs_allow_blood_splashes", "0", "Enable / Disable No Blood Splashes (onlyhs_allow_blood must be 1)", _, true, 0.0, true, 1.0);
	
	AddTempEntHook("EffectDispatch", TE_OnEffectDispatch);
	AddTempEntHook("World Decal", TE_OnWorldDecal);
}

public Action TE_OnEffectDispatch(const char[] te_name, const Players[], int numClients, float delay)
{
	int iEffectIndex = TE_ReadNum("m_iEffectName");
	int nHitBox = TE_ReadNum("m_nHitBox");
	char sEffectName[64];

	GetEffectName(iEffectIndex, sEffectName, sizeof(sEffectName));
	
	if(g_cEnableNoBlood.BoolValue)
	{
		if(StrEqual(sEffectName, "csblood"))
		{
			if(g_cEnableBloodSplatter.BoolValue)
			{
				return Plugin_Handled;
			}
		}
		if(StrEqual(sEffectName, "ParticleEffect"))
		{
			if(g_cEnableBloodSplashes.BoolValue)
			{
				char sParticleEffectName[64];
				GetParticleEffectName(nHitBox, sParticleEffectName, sizeof(sParticleEffectName));
				
				if(StrEqual(sParticleEffectName, "impact_helmet_headshot") || StrEqual(sParticleEffectName, "impact_physics_dust"))
				{
					return Plugin_Handled;
				}
			}
		}
	}

	return Plugin_Continue;
}

public Action TE_OnWorldDecal(const char[] te_name, const Players[], int numClients, float delay)
{
	float vecOrigin[3];
	int nIndex = TE_ReadNum("m_nIndex");
	char sDecalName[64];

	TE_ReadVector("m_vecOrigin", vecOrigin);
	GetDecalName(nIndex, sDecalName, sizeof(sDecalName));
	
	if(g_cEnableNoBlood.BoolValue)
	{
		if(StrContains(sDecalName, "decals/blood") == 0 && StrContains(sDecalName, "_subrect") != -1)
		{
			if(g_cEnableBloodSplashes.BoolValue)
			{
				return Plugin_Handled;
			}
		}
	}

	return Plugin_Continue;
}

stock int GetParticleEffectName(int index, char[] sEffectName, int maxlen)
{
	int table = INVALID_STRING_TABLE;
	
	if (table == INVALID_STRING_TABLE)
		table = FindStringTable("ParticleEffectNames");
	
	return ReadStringTable(table, index, sEffectName, maxlen);
}

stock int GetEffectName(int index, char[] sEffectName, int maxlen)
{
	int table = INVALID_STRING_TABLE;
	
	if (table == INVALID_STRING_TABLE)
		table = FindStringTable("EffectDispatch");
	
	return ReadStringTable(table, index, sEffectName, maxlen);
}

stock int GetDecalName(int index, char[] sDecalName, int maxlen)
{
	int table = INVALID_STRING_TABLE;
	
	if (table == INVALID_STRING_TABLE)
		table = FindStringTable("decalprecache");
	
	return ReadStringTable(table, index, sDecalName, maxlen);
}
