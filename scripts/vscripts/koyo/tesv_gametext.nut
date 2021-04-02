

gtc <- 0
gtc2 <- 0
gtc3 <- 0
gtc4 <- 0
gtc5 <- 0
gtc6 <- 0
gtc7 <- 0
gtc8 <- 0
gtc9 <- 0
gtc10 <- 0
gtc11 <- 0
gtc12 <- 0
pb <- Entities.FindByName(null, "archmage_phbox")
pb2 <- Entities.FindByName(null, "mg_phbox")
pb3 <- Entities.FindByName(null, "dr_phys")
pb4 <- Entities.FindByName(null, "doh_phbox")
pb5 <- Entities.FindByName(null, "night_phbox")
pb6 <- Entities.FindByName(null, "dr_phbox")
pb7 <- Entities.FindByName(null, "giant_phbox")
pb8 <- null
pb9 <- null



kgt <- Entities.FindByName(null, "kgt")
kgt2 <- Entities.FindByName(null, "kgt2")
kgt3 <- Entities.FindByName(null, "kgt3")
kgt4 <- Entities.FindByName(null, "kgt4")
kgt5 <- Entities.FindByName(null, "kgt5")
kgt6 <- Entities.FindByName(null, "kgt6")
kgt7 <- Entities.FindByName(null, "kgt7")

kgt8 <- null
kgt9 <- null


function rld()
{
	ScriptPrintMessageChatAll("koyo");
}

function gts7()
{
	EntFireByHandle(self, "runscriptcode", "gts7()", 1, null, null);
	if(gtc11 !=0 )
	{
		gtc11--; 							
	}
	if(gtc12 !=0)
	{
		gtc12--;			
	}
	kgt7.__KeyValueFromString("message","\n\n╲  ︾  ╱                  ╲  ︾  ╱\n	    "+gtc11.tostring()+
			"                              "+gtc12.tostring()+"\n╱  ︽  ╲                  ╱  ︽  ╲\n             ▷  ❤ : "+pb7.GetHealth()+"  ◁");
}


function gts6()
{
	kgt6.__KeyValueFromString("message","▷  ❤ : "+pb6.GetHealth()+"  ◁");
}



function gts()
{
	EntFireByHandle(self, "runscriptcode", "gts()", 1, null, null);
	if(gtc !=0 )
	{
		gtc--; 							
	}
	if(gtc2 !=0)
	{
		gtc2--;			
	}
	kgt.__KeyValueFromString("message","\n\n╲  ︾  ╱                  ╲  ︾  ╱\n	    "+gtc.tostring()+
			"                              "+gtc2.tostring()+"\n╱  ︽  ╲                  ╱  ︽  ╲\n             ▷  ❤ : "+pb.GetHealth()+"  ◁");
}

function gts2()
{

	EntFireByHandle(self, "runscriptcode", "gts2()", 1, null, null);
	if(gtc3 !=0 )
	{
		gtc3--; 							
	}
	if(gtc4 !=0)
	{
		gtc4--;			
	}
	kgt2.__KeyValueFromString("message","\n\n╲  ︾  ╱                  ╲  ︾  ╱\n	    "+gtc3.tostring()+
			"                              "+gtc4.tostring()+"\n╱  ︽  ╲                  ╱  ︽  ╲\n             ▷  ❤ : "+pb2.GetHealth()+"  ◁");
}

function gts3()
{

	EntFireByHandle(self, "runscriptcode", "gts3()", 1, null, null);
	if(gtc5 !=0 )
	{
		gtc5--; 							
	}
	if(gtc6 !=0)
	{
		gtc6--;			
	}
	kgt3.__KeyValueFromString("message","\n\n╲  ︾  ╱                  ╲  ︾  ╱\n	    "+gtc5.tostring()+
			"                              "+gtc6.tostring()+"\n╱  ︽  ╲                  ╱  ︽  ╲\n             ▷  ❤ : "+pb3.GetHealth()+"  ◁");
}

function gts4()
{

	EntFireByHandle(self, "runscriptcode", "gts4()", 1, null, null);
	if(gtc7 !=0 )
	{
		gtc7--; 							
	}
	if(gtc8 !=0)
	{
		gtc8--;			
	}
	kgt4.__KeyValueFromString("message","\n\n╲  ︾  ╱                  ╲  ︾  ╱\n	    "+gtc7.tostring()+
			"                              "+gtc8.tostring()+"\n╱  ︽  ╲                  ╱  ︽  ╲\n             ▷  ❤ : "+pb4.GetHealth()+"  ◁");
}

function gts5()
{

	EntFireByHandle(self, "runscriptcode", "gts5()", 1, null, null);
	if(gtc9 !=0 )
	{
		gtc9--; 							
	}
	if(gtc10 !=0)
	{
		gtc10--;			
	}
	kgt5.__KeyValueFromString("message","\n\n╲  ︾  ╱                  ╲  ︾  ╱\n	    "+gtc9.tostring()+
			"                              "+gtc10.tostring()+"\n╱  ︽  ╲                  ╱  ︽  ╲\n             ▷  ❤ : "+pb5.GetHealth()+"  ◁");
}






//

