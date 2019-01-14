## 公告 

# X社区 CSGO地图参数/地图翻译/Stripper的审核  PullRequest /Entwatch 仓库

# 严格Stripper的审核 必须经过PR部署测试服 完整测试后才可以放到正式服

必须附加lable标签 【需要测试】 用于同步到测试服 并且经过严格测试后再下方评论才会合并.

![严格Stripper的审核](https://github.com/MapTextLang/MapTextLang/blob/master/data_images/stripper.jpg)

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
### 如果这里文件和服务器文件大小写不匹配 将无法同步成功 请务必通过[论坛查询地图](https://bbs.93x.net/plugin.php?id=xnet_mappost:xnet_map_query)文件名!

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

### 仓库维护 一般每月一次

编辑 README.md 在尾部 添加任何无用注释内容
编辑原因填写为 "triggercleanup" 即可清理同步缓存
如果因为文件名错误  或者 小大写错误 则必须执行清理同步缓存

## Respawn Weapon Related Convar Usage (subject to changes)

### sm_zeusweapons_nade_value

This convar represents ***the total value*** of grenades that can be given to a player. Grenades usually share different values. For example, the value of molotov is 2, and both of hegrenade and decoy have the same value `1`. If this convar was to `2`, the player can choose **1x hegrenade and 1x decoy** or **1x molotov**; since one hegrenade plus one decoy have the total value of 2 and one molotov is 2. By increasing this value along with the maximum number of some grenades, it will result in a decrease in the map difficulty. Default: `2`. If you change this convar, you should always change `sm_zeusweapons_nadecount` to proper value as well.

| Grenade | Value |
|---------|-------|
| Flash   | 0     |
| Molotov | 2     |
| Smoke   | 5     |
| HE      | 1     |
| Decoy   | 1     |

### `sm_zeusweapons_hegrenade` and `sm_zeusweapons_decoy`

All convar like the two above have changed the meaning from "the amount will be given" to "the maximum number can be given".  For example, set `sm_zeusweapons_decoy` to 1, then player can only get 1 decoy at respawn, no matter what value of `sm_zeusweapons_nade_value` is; in other words, these convar has the highest priority in terms of grenade limitation.

#### List of all limitation of convar

| ConVar                   | Default |                                                                              |
|--------------------------|---------|------------------------------------------------------------------------------|
| sm_zeusweapons_flash     | 0       |                                                                              |
| sm_zeusweapons_hegrenade | 2       |                                                                              |
| sm_zeusweapons_decoy     | 1       |                                                                              |
| sm_zeusweapons_molotov   | 1       | The maximum allowed number of Molotov is also limited by `sm_molotov_limit`. |
| sm_zeusweapons_smoke     | 0       |                                                                              |

### sm_zeusweapons_recommand

This convar is used to set the default weapon for the player who is using `Auto` for their starting weapon. It will randomly choose a weapon from this list for giving the weapon to the player. This convar is a string, all weapon should use their entity name, like `weapon_negev`, and split by `,`, no space around it. Default: `weapon_negev,weapon_p90,weapon_bizon`

### sm_zeusweapons_nadecount

Setting this convar will change the default selection of grenades. Like `sm_zeusweapons_recommand`, this is also a list that using `,` as a delimiter; however, the order of elements is matter in this case: `flash,molotov,smoke,he,decoy,0`. The length of this list must be 6 and the last element must be `0`. By default, `0,0,0,1,1,0`, means zero flash, zero motolov, zero smoke, one he, one decoy. All the value is limited by the maximum number of specific grenade. If this convar is invaild, then `0,0,0,1,1,0` will be used instead.  Default: `0,0,0,1,1,0`

#trigger update10
test for web hook
#push trigger update p 1
triggercleanup 最后维护
2019年1月1日00:07:27
