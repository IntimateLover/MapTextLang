这是X社区 地图翻译 / Entwatch / stripper mapcfg(地图参数) 或者其他翻译仓库
支持性【地图翻译/stripper/mapcfg 支持所有类型服务器】
只要对应服务器具备相应地图就会同步.否则无动作

mapcfg ->地图参数
mappool->地图池控制系统
entwatch->神器显示配置
ze_mapstext->ZE地图翻译





游戏中自动同步方法:

1:更新/添加修改/你想要的 通过创建pull request请求.

2:https://github.com/MapTextLang/MapTextLang 在你想要更新的类别添加地图名称 

比如 我更新了entwatch 那么修改 update_entwatch.txt 增加地图往下面一行添加地图. 比如 ze_fapescape_p5 不要删除原有内容 如果这个地图已经存在 直接修改版本号码 步骤3

3.修改版本号码 https://github.com/MapTextLang/MapTextLang/blob/master/git_version.txt 将原有数字+1 比如原来1000 改成 1001

5.等待仓库管理员合并请求 如果需要手动同步 步骤6 请合并后等待5分钟 因为有git缓存.

6:等待同步更新 系统自动 24小时/次 或者 请求OP 或 有权限用户输入 sm_git_update 在控制台 

7:仓库管理人员 如果所有服务器同步已完成 可以清空 update_xxxx 文件所有内容 【为了同步保险起见 至少修改版本后保留 72小时】

有关生效时间  stripper 和 翻译 必须等到 下次换图

Entwatch 可以通过OP 使用 sm_entwatch_reload 即可生效.


//地图修改服务器参数/或指令拦截

地图参数拦截功能

sm_block_command 想要拦截参数关键词
sm_block_command zr_infect_spawntime 就可以禁止掉地图修改尸变时间

用法演示:
https://github.com/MapTextLang/MapTextLang/blob/master/mapcfg/ze_grau_a03_4.cfg#L15-L17


默认拦截有关 "STEAM_" 所有关键词
在mapcfg中添加 mapcommandblock_enable 0 则不会阻挡地图操作命令（默认 1） 此CVAR安全锁定 只能由配置文件修改

但即使地图有白名单参数 也拒绝 kick ban操作 此屏蔽强制执行



通过 sm_block_command "增加想要的参数命令关键词"

捕捉地图在做什么命令？
使用
sm_showmapcmd 开关捕捉 信息输出到控制台





翻译文件禁止事项
=====================================
１．禁止使用特殊字符 如/\＂“　等符号
２．禁止删除引号　"　删除括号如　{　}．
３．禁止修改地图主语句　如	"*** The Train Will Leave in 5 seconds ***"
４．禁止换行
=====================================
