function TickSudden()
{
    EntFireByHandle(self, "RunScriptCode", "TickSudden();", 0.10, null, null);
    if(Sudden_CT == null || Sudden_CT != null && !Sudden_CT.IsValid()){return PickRandomCt();}
    if(Sudden_T == null || Sudden_T != null && !Sudden_T.IsValid()){return PickRandomT();}
    if(Sudden_CT.GetHealth() <= 0 || Sudden_CT.GetOrigin().z <= 8900 || Sudden_CT.GetTeam() == 2)
    {
        EntFireByHandle(Sudden_CT, "SetHealth", "-100", 0.00, null, null);
        Sudden_CT = null;
    }
    if(Sudden_T.GetHealth() <= 0 || Sudden_T.GetOrigin().z <= 8900)
    {
        EntFireByHandle(Sudden_T, "SetHealth", "-100", 0.00, null, null);
        Sudden_T = null;
    }
}
