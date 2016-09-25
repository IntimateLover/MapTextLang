Documents
-------------

禁止事项> 
> １．禁止使用特殊字符 如/\＂“　等符号
> ２．禁止删除引号　"　删除括号如　{　}．
３．禁止修改地图主语句　如	"*** The Train Will Leave in 5 seconds ***"
４．禁止换行

=====================================

> **Note:**

> - 如果部分地图管理员配置了BOSSHP攻击显示
如有多个BOSS的情况可以在某些语句添加

"*** boss ***"
{
	"chi"		"**boss 出现了**"
	"command" "sm_clearbosshp" //作用是血量计数归0 使其更加精确 每回合也会自动归0.
}

> "*** boss dead ***"
{
	"chi"		"**boss 死了**"
	"command" "sm_clearbosshp" //作用是血量计数归0 每回合也会自动归0.
}

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

<<<<<<< HEAD
=======

>>>>>>> c23b8613ed5032e94502c98bb9a2f51f2b454bbc
