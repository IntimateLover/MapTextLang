old_owner <- null;
ticking <- false;
pistol <- null;

function SetOwner()
{
	pistol = caller;
	if( (old_owner != null) && (old_owner.IsValid()) )
	{
		if(old_owner == activator)
		{
			older_owner = activator;
			EntFireByHandle(old_owner,"AddOutput","rendermode 1",0.1,old_owner,null);
			EntFireByHandle(old_owner,"Alpha","10",0.2,old_owner,null);			
		}
		else
		{
			EntFireByHandle(old_owner,"AddOutput","rendermode 0",0,old_owner,null);
			older_owner = activator;
			EntFireByHandle(old_owner,"AddOutput","rendermode 1",0.1,old_owner,null);
			EntFireByHandle(old_owner,"Alpha","10",0.2,old_owner,null);
		}
	}
	else
	{
			old_owner = activator;
			EntFireByHandle(old_owner,"AddOutput","rendermode 1",0.1,old_owner,null);
			EntFireByHandle(old_owner,"Alpha","10",0.2,old_owner,null);
	}
	if(!ticking)
	{
		ticking = true;
		Tick();
	}
}

function Tick()
{
	if(!ticking)
	{
		return;
	}
	if(pistol!=null && pistol.IsValid())
	{
		if( (pistol.GetOwner() == null) || (!pistol.GetOwner().IsValid()) )
		{
			EntFireByHandle(old_owner,"AddOutput","rendermode 0",0,old_owner,null);
			ticking = false;
		}
	}
	if(ticking)
	{
		EntFireByHandle(self,"RunScriptCode"," Tick(); ",0.03,null,null);
	}
}
