１．禁止使用特殊字符 如/\＂“　等符号
２．禁止删除引号　"　删除括号如　{　}．
３．禁止修改地图主语句　如	"*** The Train Will Leave in 5 seconds ***"
４．禁止换行


对文本配置参数/倒计时 应该对该地图比较熟悉再进行操作!

倒计时可配套图标设置 默认不设置则为 icon_door

	"*** The Train Will Leave in 5 seconds ***"
	{
		"chi"		"**火车5秒后发车**"
		"DoorCountDown" "5"
		"ico"   "icon_tip" //代表把开门的ICO图标换成tip提示图标
	}

		"*** The Train Will Leave in 5 seconds ***"
	{
		"chi"		"**火车5秒后发车**"
		"ico"   "icon_fire" //代表加强显示一次消息(带图标)
	}
	
可用的图标列表
icon_door
icon_alert
icon_alert_red
icon_tip
icon_interact
icon_fire 
