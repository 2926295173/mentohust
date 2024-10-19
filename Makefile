CC = clang
CFLAGS = -O3


mentohust: mentohust.o myini.o md5.o mycheck.o dlfunc.o myfunc.o mystate.o myconfig.o checkV4.o rjmd5.o rjripemd128.o rjsha1.o rjtiger_sbox.o rjtiger.o rjwhirlpool_sbox.o rjwhirlpool.o byte_order.o
	$(CC) $(CFLAGS)  -o $@ $^ -liconv -O3
mentohust.o: mentohust.c myconfig.h mystate.h myfunc.h dlfunc.h
	$(CC) $(CFLAGS) -c $<
dlfunc.o: dlfunc.c
	$(CC) $(CFLAGS) -c $<
myfunc.o: myfunc.c md5.h mycheck.h
	$(CC) $(CFLAGS) -c $<
rjsha1.o: rjsha1.c byte_order.c byte_order.h
	$(CC) $(CFLAGS) -c $<
..c.o:
	$(CC) $(CFLAGS) -c $<
clean:
	@rm -f *.o mentohust
	@echo "清理完成"
install:
	@echo "提示：安装mentohust需要root权限"
	@echo "正在复制mentohust至/usr/local/bin"
	@cp mentohust /usr/local/bin
	@echo "正在设置用户和权限" && chmod 4755 /usr/local/bin/mentohust && chmod a+w /var/run
        @echo "安装完成"
uninstall:
	@echo "提示：移除mentohust需要root权限"
	@echo "移除mentohust配置文件" && rm -rf /etc/mentohust.conf
	@echo "移除mentohust程序" && rm -rf /usr/local/bin/mentohust
	@echo "卸载完成"
