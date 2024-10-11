作者：HustMoon

本文是MentoHUST的使用教程，旨在介绍MentoHUST怎么用

== 程序简介 ==
* MentoHUST是一个支持Windows、Linux、Mac OS下锐捷认证的程序（附带支持赛尔认证）
* Windows版MentoHUST支持Windows所有主流版本，与锐捷官方程序相比最大的优势是内存占用低，现已基本停止更新，现在锐捷官方程序也在改进中，所以建议在Windows下还是使用官方程序。
* Linux版MentoHUST与Windows版兼容，所以如果能够在Windows下使用MentoHUST认证成功，就不必担心安装了Linux后不能使用校园网（当然是指用锐捷的学校）。
* 锐捷官方Linux版久无更新，使用官方程序很多同学无法通过认证，有些能通过但容易掉线。虽然网上第三方Linux版锐捷客户端不少，但都大同小异，不能通过锐捷的客户端校验。Linux版MentoHUST是一个在Linux下与锐捷兼容性很好的认证客户端，方便使用Linux和锐捷的同学使用校园网。在成员kkHAIKE的努力下，MentoHUST现已支持锐捷的V3客户端校验算法，亦即MentoHUST已完全兼容锐捷所有版本（不论是否开启了变态的V3算法）。
* Mac OS版MentoHUST是后来对Linux版MentoHUST在Mac OS上的编译（gcc很好很强大，赞）。

== 主要功能 ==
* 支持锐捷V2和V3客户端校验算法，完全兼容锐捷
* 支持多网卡
* 较好模拟锐捷各版本数据，支持目前所有版本锐捷
* 支持静态IP和DHCP（动态IP）认证
* 支持静态IP用户自定义IP（即绑定IP可与上网IP不同）
* 支持服务器消息提示和计费信息提示
* 认证成功稳定在线，即使掉线也可自动重连，支持ping某个IP智能重连
* 有相关工具支持，可自定义数据文件以实现尽可能的兼容，无需修改代码即可兼容所有版本
* 支持赛尔认证
 
== 相关链接 ==
* 项目主页：http://code.google.com/p/mentohust/
* 最新版下载（包括源码）：http://code.google.com/p/mentohust/downloads/list
* Bug提交：http://code.google.com/p/mentohust/updates/list
* 白云黄鹤NetResource版：http://www.byhh.net/cgi-bin/bbstcon?board=NetResource&file=M.1230774282.A
* 白云黄鹤Linux版：http://Linux.byhh.net/
* 其他下载地址：http://lewuya.ys168.com/ http://pcyard.qupan.com/

== 联系方式 ==
* [http://wpa.qq.com/msgrd?V=1&Uin=858387065&Menu=yes QQ]
* [mailto:mentohust@ehust.co.cc E-mail]

== 使用方法 ==
* 由于Windows版MentoHUST有良好的GUI界面，所以不在讨论范围。
* 以下所有内容都假定您下载的是Linux版MentoHUST当前（截至到2009.12.3）最新版0.3.3
* MacOS版MentoHUST使用方法与Linux版相同。
=== 安装 ===
* 本程序依赖于libpcap，所以系统中必须要有libpcap.so.0.8、libpcap.so.0.9、libpcap.so.1.0、libpcap.so.1.1中的一个，现在主流的发行版都满足这一条件
* 建议Ubuntu用户使用deb包安装，Fedora用户使用rpm包安装，非要使用其他形式安装的请自行解决
* 下载地址：http://code.google.com/p/mentohust/downloads/list
=== 使用 ===
* 如果确定自己可以使用xrgsu认证成功，打开终端输入sudo mentohust运行即可。
* 如果不确定，在终端中使用cd命令切换到锐捷所在目录，然后输入以下命令：
 sudo mkdir /etc/mentohust
 sudo cp ./8021x.exe  /etc/mentohust
 sudo cp ./W32N55.dll /etc/mentohust
然后打开终端输入sudo mentohust运行即可。如果认证失败，再切换到锐捷所在目录，输入以下命令：
 sudo cp ./SuConfig.dat /etc/mentohust
然后打开终端输入sudo mentohust运行即可。

PS：具体哪些版本需要SuConfig.dat不太确定，似乎锐捷3.63以前的不需要，以后的需要。
*如果准确按以上步骤操作后还是认证失败，请下载MentoHUSTTool，在Windows下抓包并保存为data.mpf，
然后回到Linux，在终端中使用cd命令切换到data.mpf所在目录，输入以下命令：
 sudo cp ./data.mpf /etc/mentohust
然后打开终端输入sudo mentohust -f/etc/mentohust/data.mpf -w运行即可。以后也只需输入sudo mentohust。
* 如何退出：不以后台模式运行mentohust时，按Ctrl+C或者关闭终端即可退出；后台运行时使用sudo mentohust -k退出认证。
=== 开机运行 ===
* 建议需要开机运行的用户使用sudo mentohust -b3 -y5 -w将MentoHUST设置为daemon运行并保存输出到/tmp/mentohust.log，开启消息通知。
* Ubuntu、Fedora用户：选择菜单“系统->首选项->启动应用程序”，点击“添加”，输入名称MentoHUST，命令sudo mentohust，点击“添加”即可。
* 对于没有修改/etc/sudoers文件使得sudo无需密码的用户，使用上面的方法是不能实现mentohust开机自动运行的，可通过修改/etc/rc.local或者/etc/gdm/Init/Default等文件来实现，例如：
 sudo gedit /etc/gdm/Init/Default
然后在exit 0（最后一行）前面加入以下内容：
 if [ -x /usr/bin/mentohust ]; then
       /usr/bin/mentohust
 fi
* MacOS用户：待编辑。

== 参数详解 ==
* MentoHUST参数丰富，以最大程度适应不同学校的不同锐捷认证环境。本程序使用配置文件（/etc/mentohust.conf）保存参数，虽然该配置文件是还算标准的ini格式文件，并不复杂，但还是有人因多加空格或;导致配置出现问题，所以不建议手工修改配置文件来设置参数。
* 打开终端，输入sudo mentohust -h，将显示如下内容：
 欢迎使用MentoHUST	版本: 0.3.3
 Copyright (C) 2009 HustMoon Studio
 人到华中大，有甜亦有辣。明德厚学地，求是创新家。
 Bug report to http://code.google.com/p/mentohust/issues/list
 用法:	mentohust [-选项][参数]
 选项:	-h 显示本帮助信息
 	-k 退出程序
 	-w 保存参数到配置文件
 	-u 用户名
 	-p 密码
 	-n 网卡名
 	-i IP[默认本机IP]
 	-m 子网掩码[默认本机掩码]
 	-g 网关[默认0.0.0.0]
 	-s DNS[默认0.0.0.0]
 	-o Ping主机[默认0.0.0.0，表示关闭该功能]
 	-t 认证超时(秒)[默认8]
 	-e 响应间隔(秒)[默认30]
 	-r 失败等待(秒)[默认15]
 	-a 组播地址: 0(标准) 1(锐捷) 2(赛尔) [默认0]
 	-d DHCP方式: 0(不使用) 1(二次认证) 2(认证后) 3(认证前) [默认0]
 	-b 是否后台运行: 0(否) 1(是，关闭输出) 2(是，保留输出) 3(是，输出到文件) ［默认0］
 	-y 是否显示通知: 0(否) 1～20(是)[默认5］
 	-f 自定义数据文件[默认不使用]
 	-c DHCP脚本[默认dhclient]
 例如:	mentohust -uusername -ppassword -neth0 -i192.168.0.1 -m255.255.255.0 -g0.0.0.0 -s0.0.0.0 -o0.0.0.0 -t8
 -e30 -r15 -a0 -d1 -b0 -fdefault.mpf -cdhclient
 使用时请确保是以root权限运行！
* 下面逐一解释各参数。
 -h 或 -?：显示帮助信息，也就是上面的内容。

 -k：MentoHUST支持daemon运行（也就是认证成功后可以关闭终端而认证不会中断），当进入daemon运行方式后，是不能像没有进入这一模式
 时一样通过Ctrl+C退出的，这时如果需要退出就可以使用sudo mentohust -k。

 -w：在命令行参数中指定的参数默认不会保存到配置文件，如果需要保存，请加上该参数，例如sudo mentohust -uhust -p123456 -w
 将把用户名更新为hust，密码更新为123456。

 -u，-p，-n：分别指定用户名、密码、网卡，这三个参数如果不指定就会自动判断是否需要输入。

 -i，-m，-g，-s：用于静态IP用户指定学校分配的IP、子网掩码、网关、DNS，其中好像只有IP会影响认证是否成功（要想正常上网，
 还必须要在NetworkManager中设置IP、子网掩码、网关、DNS，在NetworkManager中设置好后在mentohust中可以不设置这些）。
 对于动态IP用户，这些参数无效。

 -o：指定智能重连时用来ping的目标IP，例如未认证时IP1.2.3.4无法ping通，认证成功后可以ping通，就可以加上参数-o1.2.3.4,当掉
 线且未收到服务器下线通知时会在掉线1分钟之内重连（除非网络不好，一般不会掉线，掉线且收到服务器下线通知时会在掉线后立即重连）。

 -t：指定认证时多少秒后仍未收到服务器回应则重启认证，一般保持默认即可。

 -e：指定认证成功后每隔多少秒向服务器发送一次数据以表明自己仍然在线，一般保持默认即可。

 -r：由于有些学校会规定认证失败后一定时间内不允许再次认证，所以在这期间不论发多少数据服务器都不会响应，为了减少这
 种垃圾数据，MentoHUST会在认证失败后等待一段时间或者服务器向客户端请求数据时再认证，这个时间就由此参数指定，一般保持默认即可。
 -r15并不是说在认证失败后15秒才会再次认证，如果在15秒内服务器发来一个数据包要求开始认证，MentoHUST会放弃等待，立即开始再次认证。

 -a：指定组播地址或客户端类型，-a0标准 -a1锐捷私有，这两个分别对应于锐捷中的标准和私有，有些学校只能用标准，有些学校只能用私
 有，所以如果提示“找不到服务器”而网卡并没有选错，就检查是不是这里设置错了。-a2表示将MentoHUST用于赛尔认证（赛尔的用-a0标准也行）。

 -d：指定DHCP方式，使用动态IP的同学应该在这里正确设置，一般不是1就是2，如果用3认证成功却无法上网，请改成1试试。
 使用静态IP的同学应该将这里设为0。

 -b：指定后台（daemon）运行方式，-b0不后台运行，这时认证成功后不能关闭终端；-b1、-b2后台运行，前者看不到输出，后者保留输出；
 -b3后台运行并将输出保存到/tmp/mentohust.log，可以随时打开该文件查看输出。

 -y：指定是否显示通知（notify），-y0不显示，1~20显示，其中数字指定通知持续时间（由于Ubuntu采用了新的通知机制，所以只在Fedora
 下时间才有效）。当该参数不为0且系统中有libnotify.so.1（几乎所有系统都有该文件），可显示如下效果的通知（上Ubuntu，下Fedora）
 [[Image:Mentohust.png|通知效果]]

 -f：由于MentoHUST内置数据是与xrgsu兼容的（即如果用xrgsu能认证成功，用MentoHUST不设置这个参数就也能认证成功），
 有些学校关闭了xrgsu的认证（一般提示“不允许使用的客户端类型”），这时可以将8021x.exe和W32N55.dll复制到/etc/mentohust目录，
 如果认证失败，再将SuConfig.dat复制到/etc/mentohust目录一般即可认证成功。如果还失败就需要抓包并指定该参数。
 到http://code.google.com/p/mentohust/downloads/list 下载MentoHUST抓包工具，然后运行其中的MentoHUSTTool，视情况勾选是否
 “集成8021x.exe”和“集成W32N55.dll”（建议勾选），点击“开始”，运行“锐捷”，捕获锐捷认证时的数据包，等待抓包结束保存文件。
 然后在Linux下将数据文件路径指定在这个参数中，如果没有勾选“集成8021x.exe”和“集成W32N55.dll”，则还要将8021x.exe与
 W32N55.dll复制到数据文件所在目录，接下来就可以开始认证了。认证失败的话，再将SuConfig.dat也复制到该目录即可认证成功。

 -c：指定动态IP用户DHCP时运行的脚本，一般保持默认即可。如果觉得这个输出太多影响和谐，可以改为-cdhclient>/dev/null。
 MacOS用户可尝试将它改成ipconfig set en0 DHCP，其中en0要与网卡名相同（sudo mentohust -c'ipconfig set en0 DHCP' -w）。

* 配置及认证例子
 某静态IP(192.168.1.10)用户，用户名hust，密码123456，希望ping192.168.1.254智能重连，同时deamon方式保存输出到文件
 首先在NetworkManager中配置好IP、网关、掩码、DNS等信息，然后
 sudo mentohust -uhust -p123456 -o192.168.1.254 -b3 -w
 下次认证时只需 sudo mentohust
 退出 sudo mentohust -k

 某动态IP用户（二次认证），用户名hust，密码123456，使用数据文件/etc/mentohust/3_73.mpf
 sudo mentohust -uhust -p123456 -d1 -f/etc/mentohust/3_73.mpf -w
 下次认证时只需 sudo mentohust
 退出 按键Ctrl+C

 已经设置好了相关参数，需要临时使用用户名为hust@hust，密码与原密码相同的账号认证
 sudo mentohust -uhust@hust

== 支持情况 ==
=== 支持院校 ===
* 对于允许xrgsu认证的院校，使用官方程序xrgsu或者mentohust不设置数据文件即可认证成功，这类院校比较多，所以不在此列出。
* '''在此列出的主要是那些不允许xrgsu认证但可以通过mentohust设置数据文件认证成功的院校'''（补充：[http://code.google.com/p/mentohust/downloads/list mentohust最新版]的默认数据除了xrgsu的，也有Windows版锐捷的，所以多数情况下是不需要抓包的；如果需要校验客户端例如合肥工大，也只需把锐捷的几个文件复制到/etc/mentohust或者使用-f参数指定锐捷所在的目录如-f'/media/程序/Ruijie/'）。欢迎有此类经历的同学将自己学校的大名写在下面以方便后来人。
* 此处的“客户端版本”是指锐捷的版本号，因为对于某个版本以前的锐捷需要复制两个文件，之后需要复制三个文件，这一版本大概为3.63，但不太确定，希望能通过更多数据弄准确。此外有些学校只是对版本号有限制，即不允许xrgsu以及小于某个版本的认证，这时只需使用'''sudo mentohust -v4.44 -w'''的方式认证一次（4.44是指模拟的版本号，可根据实际所用修改），能认证成功即说明不需要复制文件。认证成功无法上网应该查找其他原因，例如静态IP用户未正确设置IP/DNS、动态IP用户未正确设置DHCP脚本，而不应该怀疑认证有问题。
* 华中科技大学（组播地址：如果锐捷私有找不到服务器就换标准 DHCP方式：不使用，请先手工设置好IP，目前可能也出现了动态IP，如果提示IP类型错误，切换该项设置 客户端版本：高于3.xx即可，推荐目前最高的4.44，不需要复制文件）
* 徐州师范大学（组播地址:锐捷私有 DHCP方式:关闭 客户端版本:3.22 教学区有效）
* 四川大学（组播地址:标准 DHCP方式:认证后 客户端版本:3.73）
* 西安电子科技大学（组播地址:锐捷 DHCP方式:认证后 客户端版本:4.xx，需要复制8021x.exe和W32N55.dll以及SuConfig.dat文件到/etc/mentohust选择twice模式）
* 合肥工业大学（组播地址:标准 DHCP方式:认证后 客户端版本:3.35）
* 华侨大学（组播地址:锐捷 DHCP方式:认证后 客户端版本:4.96，需要复制8021x.exe和W32N55.dll以及SuConfig.dat文件到/etc/mentohust）
* 安徽工业大学（组播地址:锐捷 DHCP方式:认证后 客户端版本:3.50,
* 长安大学（复制8021x.exe以及W32N55.dll即可认证 DHCP方式:认证后 客户端版本:3.50）(锐捷升级4.21版，方法一，申请使用LINUX认证，不过这样就不能WIN下认证，方法二，在WIN下认证抓包，需8021x.exe,SuConfig.dat,按Mentohust说明设置即可)
* 广东商学院（三水校区&本部校区）（复制8021x.exe和W32N55.dll文件到/etc/mentohust即可，组播地址：锐捷 DHCP方式:认证前 客户端版本:3.50）
* 安徽农业大学（组播地址：标准 DHCP方式：认证后或二次认证  客户端版本：3.54）
* (成都)电子科技大学(清水河校区)a('''复制8021x.exe和W32N55.dll文件到/etc/mentohust即可''');b(组播地址：锐捷 DHCP方式：认证后 客户端版本：3.35);c(貌似要在Windows下你的IP记下来并在MentoHUST设置)('''有待高人指正''')
* 郑州大学（组播地址:私有 DHCP方式:关闭  客户端版本:2.xx）
* 湖北大学 (组播地址:锐捷 DHCP方式:不使用  客户端版本:0.3.4)
* 武汉工业学院（组播地址:标准 DHCP方式:关闭 客户端版本:0.3.4）
* 中央财经大学(学院南路校区)(组播地址:标准,DHCP,认证后 ,客户端版本0.3.4)
* 湖南工业大学（工学院）组播地址：标准 客户端版本0.3.4
* 哈尔滨工业大学（组播地址：锐捷  DHCP方式：不使用）
* 湘潭大学（组播地址：锐捷  DHCP方式：不使用 ,客户端版本0.3.4）
* 福建师范大学闽南科技学院（复制8021x.exe以及W32N55.dl到/etc/mentohust即可，组播地址：标准 DHCP：不使用 客户端版本3.95）
* 东莞理工（复制8021x.exe 和 W32N55.dll 到linux 的/etc/mentohust 下，StartMode=1）
* 武汉大学（信息学部、工学部、医学部）（复制8021x.exe 和 W32N55.dll 到 /etc/mentohust 下，DHCP：二次认证）
* 武汉纺织大学（客户端版本：0.3.4,主播地址：锐捷私有，DHCP:不使用）
* 北京中医药大学（1. Windows 系统：复制8021x.exe 和 W32N55.dll，抓包不要集成8021x.exe 和 W32N55.dll。2. MacOS 系统：抓包集成8021x.exe 和 W32N55.dll 即可）
* 华南师范大学（1.大学城校区: 复制8021x.exe和W32N55.dll和SuConfig.dat文件到/etc/mentohust，并进行抓包处理，组播地址：锐捷 DHCP方式:认证前;2.石牌本部:无需抓包，组播地址：锐捷, DHCP设置为：不使用）
* 哈尔滨工程大学 （复制8021x.exe和W32N55.dll到/etc/mentohust，组播地址：锐捷 DHCP方式:不使用。）
* 宜春学院（复制8021.exe 和W32N55.dll和 SuConfig.dat文件到etc/mentohust，这三个文件需要自己XP下的锐捷中取到，不能用别人的。组播地址：锐捷私有 DHCP方式：不使用,Version=3.65）
* 广东金融学院（不选择DHCP，确认设置请再mentohust.conf中查看）
* 西北工业大学（客户端版本：0.3.4，组播地址：锐捷私有，DHCP：认证前)
* 青岛理工大学（四方校区）（组播地址:标准或锐捷,DHCP:不使用  客户端版本号:4.43)
* 福州大学（要先抓包）
* 东北林业大学 （组播地址：锐捷 DHCP方式：二次认证 版本号：4.49）
* 中山大学（组播地址:标准，DHCP:二次认证，客户端版本0.3.4，注意：12.10 amd64中可能需要在Window中记录本机IP进行设置）
* 肇庆学院（需要先使用MentoHUSTTool抓包工具进行抓包。组播地址：标准，DHCP：不使用。）
* 暨南大学本部及南校区（组播地址:0 DHCP方式:2 客户端版本:3.38 认证成功后点击右上角到自动以太网）
* 沈阳航空航天大学（组播地址：1，DHCP方式：2，不需抓包，不需指定版本号。注意：组播方式曾多次变动，如果今后提示找不到服务器，请尝试修改组播方式为0）

=== 不支持院校 ===
* MentoHUST现已支持锐捷的V2和V3客户端校验算法，所以目前不论学校是否不允许xrgsu认证，是否开启锐捷V3客户端校验算法，MentoHUST都是可以认证成功的。所以没有不支持院校，就目前来说，使用最新版MentoHUST认证失败是配置不正确的结果，欢迎有此类经历的同学多与他人交流以便尽快在Linux上顺利使用校园网[http://code.google.com/p/mentohust/updates/list]。
[[Category:联网]]
