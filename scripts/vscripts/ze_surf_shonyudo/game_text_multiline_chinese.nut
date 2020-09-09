// Call the function when the round start (after you spawned all the items template)

function InitGameTexts(){
	// we search for the entity called Item_Fire_Text, and we put it inside a variable (theGameText)
	theGameText <- Entities.FindByName(null,"Text_cre02")
	if (theGameText != null)
	{
		// Now we create a variable that will contain the text with multi-lines (TextOfTheMessage)
		TextOfTheMessage <- "\n" +
		  "\nze_surf_shonyudo_v3_1 山涧幽谷大滑翔" +
		  "\n" +
		  "\n地图作者：Hmn 汉化：血色的龙琉璃" +
		  "\n" +
		  "\n" +
		  "\n" +
		  "\nsunazame thas tuna" +
		  "\n" +
		  "\n" +
		  "\n" +
		  "\nPOSSESSION服务器"
		// the \n is a new line. Add a + if you add more lines, and then put the "Text"
		
		// We set the message of the entity to the multi-lines text
		theGameText.__KeyValueFromString("message", TextOfTheMessage) 

		//	EntFireByHandle(theGameText,"Display","",0.1,null,null);
		// This is for displaying the game_text message. Which is not needed since you can do it via hammer input
	}
	
	// We finished for fire item, now we reset theGameText to NULL (= nothing) and the TextOfTheMessage too
	theGameText <- null
	TextOfTheMessage <- null
	
	// we do for the next entity (ice)
	
	theGameText <- Entities.FindByName(null,"Text_cre01") 
	if (theGameText != null)
	{
		TextOfTheMessage <- ": 地图 :" +
		  "\n" +
		  "\n" +
		  "\n" +
		  "\n" +
		  "\n" +
		  "\n: 特别感谢 :" +
		  "\n" +
		  "\n" +
		  "\n" +
		  "\n: 测试 :" 
		theGameText.__KeyValueFromString("message", TextOfTheMessage)
	}
	
	theGameText <- null
	TextOfTheMessage <- null

}
