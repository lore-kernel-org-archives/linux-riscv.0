Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C380DCE79A7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 22:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hldLgqSIJYcziFC1ofBHzJdk0lkETL/YwhWuqBhJAow=; b=hn9jOfN26vUANX
	ydDK8HPRChAvX1nRtsJrEnWXIqKgw1xu5s3SAEAfwKgC4g5BIADlJwZb52ITYXpzMcoEuI2TsASto
	bTn6Uk01KGKN8L12SzOzrT04/snvBvOlSZatapK4jiIxUtX28JxVAPE0T5rFojfHlR/GUCxcvHNim
	91iqtC5Fqg37KaLbYU9RkSsOPSiA1lLzLd6XLb/GBu6cK4Aha14r+zoLHRlfaWxMOI50HMGKn6gXi
	Sys+z6bi4gPsIVS7bB8lQ4jxdgPW+G1jNNy21Uzj4Im7CzTpjtndHUHpydNcuM0bjoahpaCt9bO9N
	CJ8fS0gyZhBobnrAXLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuIw-00FA54-28;
	Mon, 25 Sep 2023 22:43:50 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuIt-00FA48-2w
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 22:43:49 +0000
X-QQ-mid: bizesmtp81t1695681815tls4ddg5
Received: from linux-lab-host.localdomain ( [116.30.124.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 26 Sep 2023 06:43:33 +0800 (CST)
X-QQ-SSF: 01200000002000E0Y000B00A0000000
X-QQ-FEAT: aBJFcW+uBGYffXzygR0k5C/WLWWZcLSCd2TbMPG0O7Tlzn1m+5D3uZe31rmrB
	aujFQULia5dBlILNDRUyEjx57EpMsxaL6Hz0UfpOimP01EPYwODfLNDt/08+rViZ0kDvJPS
	c/l6PK5eg6fwnuRPIEYFxcxK83ddGI9AWtGlJq/Ee72+sNa4MrAQ3EN8Qe34Np4jqLArABG
	JS2WsLg0nT+US7V5b/8yFqpM/D3X+G29I8CLiztdDhT1Y7JbtyMwz8ftGBL0fuh92PguYE4
	IKeAjeoyg3J6mOYoYZE003kMKygyo6u/CV03ypKigE7GsLxTYVFe5MpxCrKElLULeYxae/d
	HtHN7uvHgeUIKpoUbjQ3Dfq7OGBezfWvX3+if5KLWzLVYk17ZVHC2GUJSVYzHQJ1NQ/1p5y
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4775298546958751858
From: Zhangjin Wu <falcon@tinylab.org>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: falcon@tinylab.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH v1 7/7] DCE/DSE: riscv: trim syscall tables
Date: Tue, 26 Sep 2023 06:43:32 +0800
Message-Id: <aad452c57bce2ab7983e723d78bd2cc7b6f533c1.1695679700.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695679700.git.falcon@tinylab.org>
References: <cover.1695679700.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_154348_279332_3F5A81F2 
X-CRM114-Status: GOOD (  11.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When the maximum nr of the used syscalls is smaller than __NR_syscalls
(original syscalls total). It is able to update __NR_syscalls to
(maximum nr + 1) and further trim the '>= (maximum nr + 1)' part of the
syscall tables:

For example:

    sys_call_table [143] = {
	[0 ... 143 - 1] = sys_ni_syscall,
        [64] = sys_write,
        [93] = sys_exit,
        [142] = sys_reboot,
    }

The >= 143 part of the syscall tables can be trimmed.

At the same time, the syscall >= 143 from user space must be ignored
from do_trap_ecall_u() of traps.c.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 arch/riscv/include/asm/unistd.h               |  2 ++
 arch/riscv/kernel/Makefile                    |  2 ++
 arch/riscv/kernel/syscalls/Makefile           | 22 +++++++++++++++++++
 .../kernel/syscalls/compat_syscall_table.c    |  4 ++--
 arch/riscv/kernel/syscalls/syscall_table.c    |  4 ++--
 5 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index 221630bdbd07..4d8e41f446ff 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -23,4 +23,6 @@
 
 #include <uapi/asm/unistd.h>
 
+#ifndef NR_syscalls
 #define NR_syscalls (__NR_syscalls)
+#endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 40aebbf06880..e75424c10729 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -49,7 +49,9 @@ obj-y	+= signal.o
 obj-y	+= syscalls/
 obj-y	+= sys_riscv.o
 obj-y	+= time.o
+ifneq ($(CONFIG_TRIM_UNUSED_SYSCALLS),y)
 obj-y	+= traps.o
+endif
 obj-y	+= riscv_ksyms.o
 obj-y	+= stacktrace.o
 obj-y	+= cacheinfo.o
diff --git a/arch/riscv/kernel/syscalls/Makefile b/arch/riscv/kernel/syscalls/Makefile
index 3b5969aaa9e8..f1a0597c8b24 100644
--- a/arch/riscv/kernel/syscalls/Makefile
+++ b/arch/riscv/kernel/syscalls/Makefile
@@ -14,9 +14,18 @@ else # CONFIG_TRIM_UNUSED_SYSCALLS
 
 include $(srctree)/scripts/Makefile.syscalls
 
+# calculate syscalls total from $(obj)/syscall_table_used.i
+ifneq ($(used_syscalls),)
+  NR_syscalls := $$(($$(sed -E -n -e '/^\[([0-9]+|\([0-9]+ \+ [0-9]+\))\] = /{s/^\[(.*)\].*/\1/gp}' $(obj)/syscall_table_used.i | bc | sort -g | tail -1 | grep '[0-9]' || echo -1) + 1))
+else
+  NR_syscalls := 0
+endif
+
+CFLAGS_traps_used.o                += -DNR_syscalls=$(NR_syscalls)
 CFLAGS_syscall_table_used.o        += $(call cc-option,-Wno-override-init,)
 CFLAGS_compat_syscall_table_used.o += $(call cc-option,-Wno-override-init,)
 
+obj-y                += traps_used.o
 obj-y                += syscall_table_used.o
 obj-$(CONFIG_COMPAT) += compat_syscall_table_used.o
 
@@ -24,15 +33,26 @@ obj-$(CONFIG_COMPAT) += compat_syscall_table_used.o
 quiet_cmd_used = USED    $@
       cmd_used = sed -E -e '/^\[([0-9]+|\([0-9]+ \+ [0-9]+\))\] = /{/= *__riscv_(__sys_|sys_|compat_)*($(used_syscalls)),/!{s%^%/* %g;s%$$% */%g}}' -i $@;
 
+# update the syscalls total
+quiet_cmd_snr = SNR     $@
+      cmd_snr = snr=$(NR_syscalls); if [ $$snr -ne 0 ]; then \
+		sed -i -e "s/sys_call_table\[.*\] =/sys_call_table[($$snr)] =/g;s/\[0 ... (.*) - 1\] = __riscv_sys_ni_syscall/[0 ... ($$snr) - 1] = __riscv_sys_ni_syscall/g" $@; \
+		fi;
+
+$(obj)/traps_used.c: $(src)/../traps.c $(obj)/syscall_table_used.i FORCE
+	$(Q)cp $< $@
+
 $(obj)/syscall_table_used.c: $(src)/syscall_table.c
 	$(Q)cp $< $@
 
 $(obj)/syscall_table_used.i: $(src)/syscall_table_used.c $(used_syscalls_deps) FORCE
 	$(call if_changed_dep,cpp_i_c)
 	$(call cmd,used)
+	$(call cmd,snr)
 
 $(obj)/syscall_table_used.o: $(obj)/syscall_table_used.i FORCE
 	$(call if_changed,cc_o_c)
+	$(call cmd,force_checksrc)
 
 $(obj)/compat_syscall_table_used.c: $(src)/compat_syscall_table.c
 	$(Q)cp $< $@
@@ -40,8 +60,10 @@ $(obj)/compat_syscall_table_used.c: $(src)/compat_syscall_table.c
 $(obj)/compat_syscall_table_used.i: $(src)/compat_syscall_table_used.c $(used_syscalls_deps) FORCE
 	$(call if_changed_dep,cpp_i_c)
 	$(call cmd,used)
+	$(call cmd,snr)
 
 $(obj)/compat_syscall_table_used.o: $(obj)/compat_syscall_table_used.i FORCE
 	$(call if_changed,cc_o_c)
+	$(call cmd,force_checksrc)
 
 endif # CONFIG_TRIM_UNUSED_SYSCALLS
diff --git a/arch/riscv/kernel/syscalls/compat_syscall_table.c b/arch/riscv/kernel/syscalls/compat_syscall_table.c
index ad7f2d712f5f..4756b6858eac 100644
--- a/arch/riscv/kernel/syscalls/compat_syscall_table.c
+++ b/arch/riscv/kernel/syscalls/compat_syscall_table.c
@@ -17,7 +17,7 @@
 
 asmlinkage long compat_sys_rt_sigreturn(void);
 
-void * const compat_sys_call_table[__NR_syscalls] = {
-	[0 ... __NR_syscalls - 1] = __riscv_sys_ni_syscall,
+void * const compat_sys_call_table[NR_syscalls] = {
+	[0 ... NR_syscalls - 1] = __riscv_sys_ni_syscall,
 #include <asm/unistd.h>
 };
diff --git a/arch/riscv/kernel/syscalls/syscall_table.c b/arch/riscv/kernel/syscalls/syscall_table.c
index dda913764903..d2b3233ae5d4 100644
--- a/arch/riscv/kernel/syscalls/syscall_table.c
+++ b/arch/riscv/kernel/syscalls/syscall_table.c
@@ -16,7 +16,7 @@
 #undef __SYSCALL
 #define __SYSCALL(nr, call)	[nr] = __riscv_##call,
 
-void * const sys_call_table[__NR_syscalls] = {
-	[0 ... __NR_syscalls - 1] = __riscv_sys_ni_syscall,
+void * const sys_call_table[NR_syscalls] = {
+	[0 ... NR_syscalls - 1] = __riscv_sys_ni_syscall,
 #include <asm/unistd.h>
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
