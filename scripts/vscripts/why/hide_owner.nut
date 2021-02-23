WEAPON<-[];
OLD_OWNER<-[];
HIGH_LIGHT<-[];
tick<-false;
delay<-1.00;
HIDE_ALPHA<-50;
// 半透明(rendermode 1)，改为10不渲染模型，不过有影子
HIDE_MODE<-1;
// 可以随时启用\禁用隐身
HIDE_SWITCH<-true;
// 常时刷新隐身，用于处理个别地图覆盖神器隐身的问题
AUTO_HIDE<-false;
// 绑定OnPlayerPickup
function SetNewOwner(){
	local weapon=caller;
	local player=activator;
	local index=null;
	for(local i=0;i<WEAPON.len();i++){
		if(WEAPON[i]==weapon){
			index=i;
			break;
		}
	}
	if(null==index){
		index=WEAPON.len();
		WEAPON.push(weapon);
		OLD_OWNER.push(player);
		HIGH_LIGHT.push(CreateGlow(player,weapon));
	}else{
		if(""!=HIGH_LIGHT[index]){
			HIGH_LIGHT[index].Destroy();
			HIGH_LIGHT[index]="";
		}
		if(""!=OLD_OWNER[index]){
			hidePlayer(OLD_OWNER[index],false);
			OLD_OWNER[index]="";
		}
		OLD_OWNER[index]=player;
		HIGH_LIGHT[index]=CreateGlow(player,weapon);
	}
	EntFireByHandle(player, "alpha", HIDE_ALPHA.tostring(), 0, null, null);
	EntFireByHandle(player, "runscriptcode", "hide<-false", 0, null, null);
	if(!tick){
		tick=true;
		Tick();
	}
}

function Tick(){
	if(tick){
		EntFireByHandle(self, "runscriptcode", "Tick()", delay, null, null);
		for(local i=0;i<WEAPON.len();i++){
			local weapon=WEAPON[i];
			if(null==weapon.GetOwner()){
				if(""!=HIGH_LIGHT[i]){
					HIGH_LIGHT[i].Destroy();
					HIGH_LIGHT[i]="";
				}
				if(""!=OLD_OWNER[i]){
					hidePlayer(OLD_OWNER[i],false);
					OLD_OWNER[i]="";
				}
			}else if(weapon.GetOwner()==OLD_OWNER[i]){
				hidePlayer(OLD_OWNER[i],true);
			}
		}
	}
}

function hidePlayer(player,hide){
	local pscr=player.GetScriptScope();
	if(pscr==null)return;
	if(!("hide" in pscr))return;
	if(HIDE_SWITCH&&hide){
		if(!pscr.hide||AUTO_HIDE){
			pscr.hide=true;
			player.__KeyValueFromInt("rendermode",HIDE_MODE);
		}
		return;
	}
	if(pscr.hide){
		pscr.hide=false;
		player.__KeyValueFromInt("rendermode",0);
	}
}

function CreateGlow(activator,object){
	glow <- CreateProp("prop_dynamic_glow",activator.GetOrigin(),object.GetModelName(),0);
	glow.__KeyValueFromInt("glowdist", 2048);
	glow.__KeyValueFromInt("solid", 0);
	glow.__KeyValueFromString("glowcolor", "210 245 10");
	glow.__KeyValueFromInt("glowstyle", 2);
	glow.__KeyValueFromInt("rendermode", 1);
	glow.__KeyValueFromInt("renderfx", 14);
	EntFireByHandle(glow, "SetParent", "!activator", 0, activator, object);
	EntFireByHandle(glow, "SetParentAttachment", "primary", 0.01, null, null);
	EntFireByHandle(glow, "SetParent", "!activator", 0.5, activator, object);
	EntFireByHandle(glow, "SetGlowEnabled", "", 0.01, null, null);
	return glow;
}

// rendermode会带到下一局，如果没有开局还原的功能则执行此方法
function ClearPlayerHide(){
	player<-null;
	while((player = Entities.FindByClassname(player,"player")) != null){
		if (player.IsValid()){
			EntFireByHandle(player, "addoutput", "rendermode 0", 0, null, null);
		}
	}
	ScriptPrintMessageChatAll(" \x03重置半透明完成\x01");
}

function Init(){
	ScriptPrintMessageChatAll(" \x03已加载神器隐身\x01");
}

self.ConnectOutput("OnSpawn", "Init");
