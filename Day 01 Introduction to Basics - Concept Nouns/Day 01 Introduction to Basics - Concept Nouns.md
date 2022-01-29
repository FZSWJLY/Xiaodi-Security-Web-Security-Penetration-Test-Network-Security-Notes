﻿# 第01天：基础入门-概念名词

## 域名

1. **什么是域名？**

   如www.baidu.com。

2. **域名在哪里注册？**

   第三方，国内如阿里。

3. **什么是二级域名多级域名？**

   **二级域名**如news.baidu.com中的news。

   **多级域名**如shehui.news.baidu.com/中的shehui。

4. **域名发现对于安全测试意义？**

   多级域名可以更方便找到同个主站下的分站。

## DNS

1. **什么是DNS？**

   域名系统（服务）协议，主要用于域名与IP地址的相互转换。

2. **本地HOSTS与DNS关系？**

   域名解析成IP地址的顺序是首先查找本地HOSTS里是否有和域名对应的IP地址，如果没有，会到互联网上找。也就是说加速器可能就用的这个原理，使下载国外东西慢的情况变成在在国内下载国内的东西，就变得很快。

3. **CDN是什么？与DNS的关系？**

   **CDN：**内容分发网络，会随地方的变化而出现不同的ip地址，为了当地速度更快，给了个节点。

   DNS：不会变，是固定的，跟服务器的更换无关。

4. **常见的DNS安全攻击有哪些？**

   DNS的劫持、投毒。

## 脚本语言

1. **常见的脚本语言类型有哪些？**

   asp、**php**、aspx、jap、**javaweb**、pl、**py**、cgi等。

2. **不同脚本类型与安全漏洞的关系？**

   不同脚本类型决定安全漏洞的不同。用安全语言一般不会有漏洞。脚本类型决定你发现安全漏洞的几率。

3. **漏洞挖掘代码审计与脚本类型的关系？**

   做相应的漏洞挖掘代码审计，需要会相应的脚本类型，不要求专业，但要看懂代码。

## 后门

1. **什么是后门？**有哪些后门？

   **后门：**攻击者在安全测试或非法入侵里遗留的后门文件，方便下次操作。

2. **后门在安全测试中的实际意义？**

   ①方便下次再入侵。

   ②获取权限后，就相当于一个管道。

3. **关于后门需要了解哪些？**（玩法，**免杀**）

   **免杀**：防止后门文件被检测到。

## WEB

1. **WEB的组成架构模型？**

   网站源码：分脚本类型，分应用方向。

   操作系统：windows、linux。

   中间件（搭建平台）：apache、iis、tomat、nginx等。

   数据库：access、mysql、mssql、oracle、sybase、db2、postsql等。

2. 架构漏洞安全测试简要介绍？

3. **为什么要从WEB层面为主为首？**

   WEB使用之广，网站源码漏洞出现的比较多，从WEB先获取到权限，再由WEB进行权限提升，拿到某台主机的权限、数据库权限，一步步搞到内网，再到大的局域网，根据网络框架获取到更多有价值的信息。攻击者就是这么做的。

## WEB相关安全漏洞

1. **WEB源码对应漏洞**

   SQL注入，上传，xss，代码执行，变量覆盖，逻辑漏洞，反序列化等。

2. **WEB中间件对应漏洞**

   未授权访问、变量覆盖等。

3. WEB数据库对应漏洞

4. **WEB系统层对应漏洞**

   提权漏洞、代码执行。

5. **其他第三方对应漏洞**

   我们电脑上安装的第三方软件，如QQ会有安全bug。如果服务器装了第三方软件，就算其他方向是安全的，也会受到攻击。

6. **APP或PC应用结合类**

   （逆向破解，涉及到一些编程语言。）

## 涉及资源

[http://www.xyaz.cn](http://www.xyaz.cn)

[http://www.downcc.com/soft/11196.html](http://www.downcc.com/soft/11196.html)

[https://github.com/quasar/QuasarRAT/releases](https://github.com/quasar/QuasarRAT/releases)

[https://pan.baidu.com/s/13_i1ExwEaA59GfMt1Rp0Hg](https://pan.baidu.com/s/13_i1ExwEaA59GfMt1Rp0Hg)提取码：0b7b

