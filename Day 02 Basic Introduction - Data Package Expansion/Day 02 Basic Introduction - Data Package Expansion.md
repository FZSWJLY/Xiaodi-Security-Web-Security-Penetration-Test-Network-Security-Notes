# 第02天：基础入门-数据包拓展

## HTTP/S数据包

![在这里插入图片描述](https://img-blog.csdnimg.cn/f17a9fe7239d40ebb203f1f604345d7a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


1. Request请求数据包
2. Response返回数据包

![在这里插入图片描述](https://img-blog.csdnimg.cn/eb9e95c4602b45dd95e3a3647660f2f5.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


1. Request请求数据包

2. Proxy代理服务器

   在这个部分可以修改数据包，如Burpsuit。

3. Response返回数据包

![在这里插入图片描述](https://img-blog.csdnimg.cn/dfd0217110174aae8e54c88eebc0b3d8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


**http**：抓到的数据都是明文；

**https**：抓到的数据都是加密的，有证书、加密协议。

![在这里插入图片描述](https://img-blog.csdnimg.cn/893aaefda99440c78414d40879ce1401.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


1. **HTTP/HTTPS具体区别？**

   是否加密。用HTTPS需要申请证书，麻烦，非必要不使用。

2. **HTTP简要通信过程**

   建立连接→发送请求数据包→返回响应数据包→关闭连接

   1.浏览器建立与web服务器之间的连接

   2.浏览器将请求数据打包（生成请求数据包）并发送到web服务器

   3.web服务器将处理结果打包（生成响应数据包）并发送给浏览器

   4.web服务器关闭连接

3. HTTPS简要通信过程（见图）

## Request请求数据包数据格式

1. **请求行**：请求类型/请求资源路径、协议的版本和类型
2. **请求头**：一些键值对，浏览器与web服务器之间都可以发送，特定的某种含义
3. **空行**：请求头与请求体之间一般用一个空行隔开；
4. **请求体**：要发送的数据（一般post提交会使用）：例：user=123&pass=123

例：

```http
# Request Headers
POST /adduser HTTP/1.1
HOST: localhost:8030
Conection: keep-alive
Content-Length: 16
Pragma: no-cache
Cache-Control: no-cache 
Origin: chrome-extension://fdmmgilgnpjigdojojpjoooidkmcomcm
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64)
AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36
Content-Type: application/x-www-form-urlencoded
Accept: */*
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN, zh;q=0.9

# From Data
name=name&age=11
```

```http
#  Request Header
Post /adduser HTTP/1.1
Host: localhost:8030
Connection: keep-alive
Content-Length: 16
Pragma: no-cache
Cache-Control: no-cache
Origin: chrome-extension://fdmmgil

q=1
```

### 请求行

请求行由三个标记组成：请求方法、请求URL和HTTP版本，它们用空格分享。

例如：`GET /index.html HTTP/1.1`

#### HTTP规划定义了8种可能的请求方法：

**GET**：检索URL中标识资源的一个简单请求

**HEAD**：与GET方法相同，服务器只返回状态行和头标，并不返回请求文档

**POST**：服务器接受被写入客户端输出流中的数据的请求

**PUT**：服务器保存请求数据作为指定URL新内容的请求

**DELETE**：服务器删除URL中命令的资源的请求

**OPTIONS**:关于服务器支持的请求方法信息的请求

**TRACE**：web服务器反馈Http请求和其头标的请求

**CONNECT**：已文档化，但当前未实现的一个方法，预留做隧道处理

### 请求头

由关键字/值对组成，每行一对，关键字和值用冒号分享。请求头标通知服务器腾于客户端的功能和标识。

**HOST**：主机或域名地址

**Accept**：指浏览器或其他客户可以接受的MIME文件格式。Servlet可以根据它判断并返回适当的文件格式。

**User-Agent**：是客户浏览器名称

**Host**：对应网址URL中的Web名称和端口号。

**Accept-Language**：指出浏览器可以接受的语言类型，如en或en-us，指英语。

**connection**：用来告诉服务器是否可以维持固定的HTTP连接。http是无连接的，HTTP/1.1使用Keep-Alive为默认值，这样，当浏览器需要多个文件时（比如一个HTML文件和相关的图形文件），不需要每次都建立连接

**Cookie**：浏览器用这个属性向服务器发送Cookie。Cookie是在浏览器中寄存的小型数据体，它可以记载和服务相关的用户信息，也可以用来实现会话功能。

**Referer**：表明产生请求的网页URL。如比从网页/icconcept/index.jsp中点击一个链接到网页/icwork/search，在向服务器发送的GET/icwork/search中的请求中，Referer是http://hostname:8080/icconcept/index.jsp。这个属性可以用来跟踪Web请求是从什么网站来的。

**Content-Type**：用来表明request的内容类型。可以用HttpServletRequest的getContentType()方法取得。

**Accept-Charset**：指出浏览器可以接受的字符编码。英文浏览器的默认值是ISO-8851-1.

**Accept-Encoding**：指出浏览器可以接受的编码方式。编码方式不同于文件格式，它是为了压缩文件并加速文件传递速度。浏览器在接收到Web响应之后先解码，然后再检查文件格式。

### 空行

最后一个请求头标之后是空行，发送回车符和退行，通知服务器以下不再有头标。

### 请求数据

使用POST传送，最常使用的是Content-Type和Content-Length头标。

## Response返回数据包数据格式

一个响应由四个部分组成：状态行、响应头标、空行、响应数据。

1. **状态行**：协议版本、数字形式的状态代码和状态描述，各元素之间以空格分隔
2. **响应头标**：包含服务器类型、日期、长度、内容类型等
3. **空行**：响应头和响应体之间用空行隔开
4. **响应数据**：浏览器会将实体内容中的数据取出来，生成相应的页面

```http
HTTP/1.1 200 OK
Date: Sat, 16 May 2020 12:27:49 GMT
Server: Apche/2.4.23 (Win32) OpenSSL/1.0.2j mod_fcgid/2.3.9
X-Powered-By: PHP/5.3.29
Product: Z-BlogPHP 1.5.2 Zero
X-XSS-Protection: 1; mode=block
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Transfer-Encoding: chunked
Content-Type: text/html; charset-utf-8
```

HTTP响应码：

1xx：信息，请求收到，继续处理

2xx：成功，行为被成功接受、理解和采纳

3xx：重定向，为了完成请求，必须进一步执行的动作

4xx：客户端错误

5xx：服务器错误



200 存在文件

403 存在文件夹

3xx 均可能存在

404 不存在文件及文件夹

500 均可能存在

### 响应头标

像请求头标一样，它们指出服务器的功能，标识出响应数据的细节。

### 空行

最后一个响应头标之后是空行，发送回车符和退行，表明服务器以下不再有头标。

### 响应数据

HTML文档和图像等，也就是HTML本身。

## 涉及及演示案例

### Burpsuite抓包修改测试

软件我已上传至github上或csdn上，大家可以很容易找到。

![在这里插入图片描述](https://img-blog.csdnimg.cn/2843439e3f0e449988d8249bcb4c4206.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/741ccb42a6604bbeba29df2dcc1aeb13.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/8cde371076a34612bcdc491a4b9fc731.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/a2589bb98453492e8fd2ae63ee308b06.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/163f6126a2f344eabef790f28d1198d7.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/517d85a278ad4c7098a1467c798a35cb.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


### 敏感文件扫描工具简要实现

软件我已上传至github上或csdn上，大家可以很容易找到。我更新完的软件内含pcap，wireshark必须和pcap合作才能使用。使用方法：选择你电脑所用的网卡，本笔记中是用来捕获御剑这个软件的。以下是捕获的结果图。

![在这里插入图片描述](https://img-blog.csdnimg.cn/d22b73b69f774a0286129f5cec730f98.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/ed49b73b881a495699fe19914329de7c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/ab40211eaa7e49e691a475208edec753.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_14,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/22fb16c00c3b4155b1746d788c7f7bdd.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/bd84227f45a041bf92626f8e137b3429.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/cc8f30ffbba2409289d93a25f12356a8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


### 第三方检测修改实现XSS攻击

![在这里插入图片描述](https://img-blog.csdnimg.cn/34723d1b06034861aba9d82078a71b13.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/9b9342fb03a342ea821febbe5e498e9f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/5cf9b8965f9e434db20308d4afcd3e25.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/a63611a091be42b6b75755f0fffc6e73.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/9443b2a6980240b79f0fd2c1e2e4cb0e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/585f16d0a1ae456bad09b184888d9627.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/798134d3f8c94600b2642f866cbea58e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/5b251c72f7ca4fd4a2e31de64db8c3f0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/691b786501c048e2ad9a68ef67ca4a32.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/2e025b24229444a6a02446591490de61.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/764f0f42cedf4307b994eb4bd8c792d0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


### 数据包相关检验对比（APP与直接访问）

https://www.cnblogs.com/lauren1003/p/6194135.html

![在这里插入图片描述](https://img-blog.csdnimg.cn/486c63404bc24e728b5e28edc7432a69.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/84004ad3e51d49199fa73c437d72271a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/e7d303e85fae4f9da9c6400621eb0d47.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/204455d38e684491bf1c2e5ca44bea38.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/cb8f4b95955c441b90392a8e50c4edbe.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/0e74955fe4c143f79ff129048368a1f6.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/feaf62caf55146a3bd7d27fb01f8b35e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/7ac953caf587478db0a4d1c44f98e207.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/8aca224485df494c835f87a8f9c70f24.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/ef2e2ca8f3f24a2584a52131a30f978d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/5e05d69c1efc425bb8c43eecf8a16519.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/d7e3deb45835401ab325cc551fa834f1.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/9a0547e1542b4ff3b901e18929e0f9ce.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/975d9691249e41cf9e59a7fea02f3640.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/368061edc6cd4d7fabf727b91e286097.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/ca2c57fa24ab43dc90eec58a36083441.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/71759a6db71e480cb55f35370f125ca4.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/37f66ddbadff45d499ae1d8e7de3261c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/d62e74b708674014a1f02e2dff7fcd98.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/6eb70b910ca7434cafc33e43ca5f4a0d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/29354dcc7c1c43e2a24f719d504cec3b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/540b78fc59e54d0ba69092eec2ab6d9a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/4f14b7ab8246474981a79c8ea9d0d6df.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/f3d13b1207b84c98a3272826b1856acf.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/43610af976a845d3b84883a6ca134219.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/782e176ed7e549ed84361d16ff3b827f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/803e194b99fb4b2991f6898d6db3893a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


and 1=1加错数据包了。

![在这里插入图片描述](https://img-blog.csdnimg.cn/894f97e10f1b4e3d8d3d203dd38fd59b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


要在此图17行末尾加and 1=1。

### CTF或实际应用中部分考题解析（mozhe）

![在这里插入图片描述](https://img-blog.csdnimg.cn/cc1ad3b356c04a88a9e2b7c27b6f2a52.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/a9399e2eff9a479287dddb5c26254a8a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/890acbd97e614aa8b4f4ce811caefcb1.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/68ea3e31bdd7480c9cabcf8a05c5ab81.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/2a2f0a2760444a729a66ee9a7d68af5e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/0dc357ad8605414e9824f84315623375.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/359cf4e7e37a4ae4b22fbf896d7e516a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/d0d1d97b6fd04abf93c4841b4b17d207.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/265f61ea04fb41f5abec597fbf88ab34.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/b5b1884029a24a0fb6d8ba1d9cda129a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/0bf770373a8a44b68c4b8fd754fb8cf1.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/2c95918f026348b78d8f3248b56ed242.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/01712477af35428e857a6540f1bb360c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/845885bf2a65404c854f79dbc8491b3a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/62003baa62d24796ac4b3792f25aa7ad.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/336f0257043d498cb6245084956768f8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/833c238baeae4f3c9fe1ecdbe4d22c48.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/14c708e1fda44c1b8adfcd5f651e4e21.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/eb38dae387da401bb1012c0069df9eb1.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/53b061716883461b8fd2b721f94e2db6.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/1b9b79c92f81434a950c603385433aa0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/eef8bcba280248a78952bb5afef75bd2.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/b7a6b5e4403044e584892902f9b71dc0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/80a38db6abf64380a7311012cbd7ab97.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/c3df1d47bc8c4f3bac690e0069b37216.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)




![在这里插入图片描述](https://img-blog.csdnimg.cn/e455897205684abc9fb571e2b1c221f9.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/dfc40d5c4da54664a5394201d6bee2f7.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/f31b842e2fbc402499c5e226fa0965cb.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/8e858f13a8cc4ed485ab917a07144466.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/878a6ffb381f4565bce5a4350b2474d0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/15c9fae934a94e70a9d9e0b8289c8b89.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/4e18569311fe4fd89e42bc1916427bb4.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/41746699317342bc9cf07f67e362b931.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/1df934abb8ab4da499a8bc4de2b9e0bc.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/f09542afba4e477db6bd6b8ff69b039d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/5f2823261a8841adb85890b37b5e3a5c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/e61017d8c347433193fea2bf3148c31f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/06c14dc85a314b109d545efa70c4373d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/bcc52687024f41918473d28896a8c9e0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/8960c5db4e104a8880591bf565ffaf6e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/ce7fab5009bf4b138c31f04bd50e3451.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/855b37f3f2c54d95a6cfb1ed04eada54.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/b5857ed268b94992866882a64d8427d4.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/5ecf3c83ce254ff09f0bf54c54844c07.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/7e1726ffb7264e7a9b97a9882135537b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/8b21f19b53e64e5cb51acba60da01a44.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/2f8e84b3d28946128b9c59f4fffebd7a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/f114e9bca57a4652a039fa5947baf844.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/23306bacb4054fb995e89c48558c3da2.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/abf8b16cccbb45f887081fa3e627414f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/70c705517fd943b18e9741a82b0df8d5.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/b77842759a524f69b3b67dfed7427796.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/e67fd987b96c47b68763dbe09fefcb2d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/dacc4720f1e64ff1bf17bca5e383c752.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/a5f708bbc0024125bf2348d380fe8924.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/aeb2eaeb09c64c7bb86900b9a0fd0e98.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


![在这里插入图片描述](https://img-blog.csdnimg.cn/2d05079db57541dba43e7d1e640cab81.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA56iL5bqP5ZGY5bCP5YuH,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


### 涉及资源

[https://www.mozhe.cn/](https://www.mozhe.cn/)
