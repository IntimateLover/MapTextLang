function CountdownTimer(amount)
{
local i = amount;
local j;
EntFire("text_seconds_left","SetText","      seconds left",0);

  for(j = amount;j > 0;j--)
  {
    EntFire("text_second","SetText",j.tostring(),i-j);
    EntFire("text_second","Display","",i-j);
    EntFire("text_seconds_left","Display","",i-j);
  }
}
