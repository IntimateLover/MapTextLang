## 公告 

#没有必要翻译 game_text 实体
原因1.此实体只能支持 1920*1080 分辨率 
原因2.英文占1个字符 中文占2个字符 由此会更容易导致 字体被放大.


# X社区 CSGO地图参数/地图翻译/stripper/Entwatch 仓库




如果要设置其他服务器地图参数[如KZ/滑翔/MG/BHOP/TTT/越狱等服务器] [请点这里](https://github.com/e54385991/GeneralMapcfg)

---

这是X社区 地图翻译 / Entwatch / stripper mapcfg(地图参数) 或者其他翻译 GIT仓库。

地图翻译/stripper/mapcfg 支持所有类型服务器。

只要对应服务器具备相应地图就会同步本仓库数据

---

## 目录说明
+ mapcfg      ->地图参数
+ mappool     ->地图池控制系统
+ entwatch    ->神器显示配置
+ maptext     ->ZE地图翻译
+ bosshit     ->打boss是否加钱的配置
---

## 游戏中自动同步说明
### 如果这里文件和服务器文件大小写不匹配 将无法同步成功 请务必通过论坛查询地图文件名!
[地图查询] (https://bbs.93x.net/plugin.php?id=xnet_mappost:xnet_map_query).


1. 更新/添加修改/你想要的 通过创建 [Pull requests](https://github.com/MapTextLang/MapTextLang/pull/new/master).就是通过编辑文件后创建PR

2. 当您提交Pull Request后 在管理通过后 在论坛会 [显示事件](https://bbs.93x.net/plugin.php?id=xnet_events:xnet_events). 应该会显示事件 如果没有显示 可能没有成功 请加上一些无用注释 如`//`再提交一次 和原不同即可)

3. 游戏服务器会每隔地图更换 自动检测修改并同步 op / mapper可以输入 !git_update 强行同步
**请不要在 修改后的 10分钟内输入 否则无法拉到新数据 因为缓存**

版本会自动变化以让游戏服务器检测 [GIT版本查看地址](http://bd.93x.net/ze_server/git_version.txt) （触发 合并审核 / 修改 / 添加 事件后会自动修改 +1 换图后 如果服务器检测到版本不同那么会尝试自动拉取需要更新的数据）

4. 系统会在每日凌晨 3 点自动更新前一天数据.

---
## BOSSHit 说明

	"126" //根必须是hammerid数字 不正确将无法生效 必须是正确的Hammerid !!!
	{
		"enable"		"1" //启用
		"hammerid"		"126" //hammerid 确认
		"m_iname"		"startway2" //可选 是否匹配名称 也可以不设置该属性
	}
这样就完成了 玩家攻击该Hammerid将获得金钱!


## 地图修改服务器参数/或指令拦截

### 地图参数拦截功能

`sm_block_command` 想要拦截参数关键词
`sm_block_command zr_infect_spawntime` 就可以禁止掉地图修改尸变时间

### [用法演示](https://github.com/MapTextLang/MapTextLang/blob/master/mapcfg/ze_grau_a03_4f.cfg#L15-L17)

默认拦截有关 "STEAM_" 所有关键词
在mapcfg中添加 `mapcommandblock_enable 0` 则不会阻挡地图操作命令（默认 1） 此CVAR安全锁定 只能由配置文件修改

但即使地图有白名单参数 也拒绝`sm_kick` `sm_ban`等操作。此类指令强制屏蔽。

### 其他指令
`sm_block_command "keyword"` 增加想要的参数命令关键词，修改`keyword`为相应关键词。

`sm_showmapcmd` 开关捕捉 信息输出到控制台

---

## 翻译文件禁止事项

1. 禁止使用特殊字符 如`/` `\` `＂` `“`　等符号
2. 禁止删除引号 `"` 删除括号如`{` `}`．
3. 禁止修改地图主语句, 如: `*** The Train Will Leave in 5 seconds ***`
4. 禁止换行

---

## Entwatch 说明

### 伤害/击退倍数

`"damage_boost"     "2.1"` 承受伤害倍数

**因为击退和武器伤害是关联的，如果`伤害`被放大`击退`也会被放大 从而不用修改全局击退数值**

这可以修改在某些地图神器，如`人物性物品`无法被打退的情况. 

例子：大章鱼 ze_pirates_port_royal_v5_6 的 Barbossa船长。[用法演示](https://github.com/MapTextLang/MapTextLang/blob/891be9ec2d52118155d4385582d71e9553e8f757/ze_mapstext/entwatchs/ze_pirates_port_royal_v5_6.cfg#L137)

### 特殊情况

上述单个参数需要保证僵尸会承受到至少1点伤害，如果模型或者其他原因阻挡了子弹伤害需要使用其他方法。 [用法演示](https://github.com/MapTextLang/MapTextLang/blob/master/entwatch/ze_lotr_minas_tirith_p5.cfg#L234-L242)



###无用内容
//triggercleanup
//triggercleanup

### 仓库维护 一般每月一次
 #编辑 README.md 在尾部 添加任何无用注释内容 
 #编辑原因填写为 "triggercleanup" 即可清理同步缓存 
 # 如果因为文件名错误  或者 小大写错误 则必须执行清理同步缓存 

#trigger update10
test for web hook
#push trigger update p 1
triggercleanup 最后维护
2019年1月1日00:07:27


