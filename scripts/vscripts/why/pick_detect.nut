detect<-true;
function Detect()
{
	if(!detect)return;
	EntFireByHandle(self, "runscriptcode", "Detect()", 0.01, null, null);
	local player=null;
	while ((player = Entities.FindInSphere(player, self.GetOrigin(),57)) != null){
		if(player.GetClassname()!="player")continue;
		if(player.GetTeam()==3){
			self.__KeyValueFromInt("CanBePickedUp",1);
			detect=false;
			return;
		}
	}
}
function EPick(){
	if(!detect)return;
	local ent=Entities.FindByClassname(null, "player_speedmod");
	if(ent==null){
		ent=Entities.CreateByClassname("player_speedmod");
	}
	EntFireByHandle(ent, "ModifySpeed", "0.75", 0, activator, caller);
	EntFireByHandle(ent, "ModifySpeed", "1", 3, activator, caller);
	EntFireByHandle(activator, "IgniteLifetime", "3", 0, activator, caller);
	ScriptPrintMessageChatAll(" \x02按e仔被点燃了，笑他\x01");
}

//self.ConnectOutput("OnPlayerUse","EPick");
EntFireByHandle(self, "addoutput", "OnPlayerUse "+self.GetName()+":runscriptcode:EPick():0:-1", 0, null, null);
self.__KeyValueFromInt("CanBePickedUp",0);
Detect();
