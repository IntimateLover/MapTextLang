这是X社区ZE地图翻译 / Entwatch / stripper 或者其他翻译仓库

游戏中自动同步方法:

1:更新/添加修改/你想要的 通过创建pull request请求.

2:https://github.com/MapTextLang/MapTextLang 在你想要更新的类别添加地图名称 

比如 我更新了entwatch 那么修改 update_entwatch.txt 增加地图往下面一行添加地图. 比如 ze_fapescape_p5 不要删除原有内容 如果这个地图已经存在 直接修改版本号码 步骤3

3.修改版本号码 https://github.com/MapTextLang/MapTextLang/blob/master/git_version.txt 将原有数字+1 比如原来1000 改成 1001

5.等待仓库管理员合并请求 如果需要手动同步 步骤6 请合并后等待5分钟 因为有git缓存.

6:等待同步更新 系统自动 24小时/次 或者 请求OP 或 有权限用户输入 sm_git_update 在控制台 


7:仓库管理人员 如果所有服务器同步已完成 可以清空 update_xxxx 文件所有内容 【为了同步保险起见 至少修改版本后保留 72小时】

翻译文件禁止事项
=====================================
１．禁止使用特殊字符 如/\＂“　等符号
２．禁止删除引号　"　删除括号如　{　}．
３．禁止修改地图主语句　如	"*** The Train Will Leave in 5 seconds ***"
４．禁止换行
=====================================
