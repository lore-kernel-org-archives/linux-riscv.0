Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEADC636CC
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 00:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQ/LZBALWCvRj+61km23iNGdcPkPo3fP/0GO9GZ0kwQ=; b=glZZGUw0EsXGk1
	RGrqlE+ajhXDqQDCeVXazW8p+W0hl27Di1CLuxlc1AWUpKg3qWmHL9nJFa/Ga9AY2wgrV/ILxexkM
	DTBuTOhKyPyaPdyMIngGfm9bUOOzXXajqinxZN/dP3ZFjmzbsnDyXpJabU5kuJFj4+H2HGv6QOxNw
	NjM+nSpZYML4m5qIl/R+KjS97+G478pv9e8McD/GhLHq/1TJZNSfzvJWHO8SEax/2vTr3EFvHg2gY
	BZOxf0ZvtjSvcwvHapy0xMbh4YCwxDHqBOyHcoVEGDa4iIoG8XSD2KN2cPIlBzuNftRSD7Ka0nKqT
	/8jtC9lsPWIyRxzICz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSoxp-00CFqL-Fc; Fri, 17 Feb 2023 00:51:01 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSoxl-00CFgH-K3
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 00:51:00 +0000
X-QQ-mid: bizesmtp76t1676594991t44bsp5y
Received: from localhost.localdomain ( [116.30.131.224])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Feb 2023 08:49:49 +0800 (CST)
X-QQ-SSF: 01200000000000C0T000000A0000000
X-QQ-FEAT: jGGC4gWX7WEdtHNjbW2La5D1yIRo1r+Zw/KaMj6Bl464xthLk0kAH0yAvRVPu
	pQdpYfLzsKgWo0JcHqKeObB4CrGIvHKePNNUzCW3kJCwsR3UUngiOXTUDO2pSg5aXI5963T
	w7WclL2OLpN1imcjF5siVtz2b6B6g4sRmXFVZMTQzEHe7zv76gtN3EFNDOZTxrEl1Mqp4eQ
	oHep0yeehO8eA+Cwwd+Iw4beO1XFcCt+dJ5cV+YpBSQoTHm/Ngf11fhZYRFGSsljUYsGb6L
	9yBH/B5Mt7pWcK5iwojBnpW3zqBCnthsxNlqGdlXPAEuemx7vbHMCzkkB0/xKKlhEsFouD+
	mLEpshtFxpdm8ttAwcJUSciB3GCHrBdeebHRFIkUgqAeR/VpZsr9k3ws58PpM1AN9d+HCtD
X-QQ-GoodBg: 0
From: Zhangjin Wu <falcon@tinylab.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Willy Tarreau <w@1wt.eu>,
	Paul Burton <paulburton@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nicholas Mc Guire <hofrat@osadl.org>,
	Zhangjin Wu <falcon@tinylab.org>
Subject: [RFC PATCH 4/5] RISC-V: Add dead syscalls elimination support
Date: Fri, 17 Feb 2023 08:49:24 +0800
Message-Id: <9a4d0339dd8175cdb3801dc66d68167cac47ddbf.1676594211.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676594211.git.falcon@tinylab.org>
References: <cover.1676594211.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_165058_457487_9F5C8875 
X-CRM114-Status: GOOD (  14.17  )
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

By enabling CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION and setting
CONFIG_SYSCALLS_USED, It is able to remove the left 'dead' syscalls.

For example, if setting CONFIG_SYSCALLS_USED="write exit reboot", a
'used' variant of the *syscall_table.c will be generated.

Here is a test result on qemu with a minimal rv64 config.

                    | rv64            | config
    ----------------|-----------------|-------------------
            vmlinux | 4893488         | https://pastebin.com/crz82T0s
      + gc-sections | 4376400 (-10.5%)| CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=y
    + syscalls_used | 4172112 (-4.67%)| CONFIG_SYSCALLS_USED="pselect6"
    + syscalls_used | 4172848 (-4.65%)| CONFIG_SYSCALLS_USED="write exit reboot"

notes:

- The shrink ratios of the syscalls_used lines are based on the
  gc-sections line.

- "write exit reboot" are used by a hello.c to simply print "Hello,
   World!", exit and shutdown qemu.

- "pselect6" is used by rcutorture to do a long-time sleep.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 arch/riscv/Kconfig                  |  1 +
 arch/riscv/kernel/Makefile          |  5 ++--
 arch/riscv/kernel/syscalls/Makefile | 46 +++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/kernel/syscalls/Makefile

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8a73d7180cb8..f78cc6b2413f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -140,6 +140,7 @@ config RISCV
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
+	select HAVE_SYSCALLS_USED
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 4cf303a779ab..fd716d5ffda5 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -8,7 +8,8 @@ CFLAGS_REMOVE_ftrace.o	= $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_patch.o	= $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_sbi.o	= $(CC_FLAGS_FTRACE)
 endif
-CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
+
+obj-y += syscalls/
 
 ifdef CONFIG_KEXEC
 AFLAGS_kexec_relocate.o := -mcmodel=medany $(call cc-option,-mno-relax)
@@ -42,7 +43,6 @@ obj-y	+= ptrace.o
 obj-y	+= reset.o
 obj-y	+= setup.o
 obj-y	+= signal.o
-obj-y	+= syscall_table.o
 obj-y	+= sys_riscv.o
 obj-y	+= time.o
 obj-y	+= traps.o
@@ -86,6 +86,5 @@ obj-$(CONFIG_CRASH_CORE)	+= crash_core.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
 obj-$(CONFIG_EFI)		+= efi.o
-obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
 obj-$(CONFIG_COMPAT)		+= compat_signal.o
 obj-$(CONFIG_COMPAT)		+= compat_vdso/
diff --git a/arch/riscv/kernel/syscalls/Makefile b/arch/riscv/kernel/syscalls/Makefile
new file mode 100644
index 000000000000..7bd327331a98
--- /dev/null
+++ b/arch/riscv/kernel/syscalls/Makefile
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Copyright (C) 2023 Zhangjin Wu <falcon@tinylab.org>
+#
+
+CFLAGS_syscall_table_used.o	+= $(call cc-option,-Wno-override-init,)
+obj-y				+= syscall_table_used.o
+obj-$(CONFIG_COMPAT)		+= compat_syscall_table_used.o
+
+ifdef CONFIG_SYSCALLS_USED
+syscalls_used := $(shell echo $(CONFIG_SYSCALLS_USED) | tr -s ' ' | tr ' ' '|')
+endif
+
+ifneq ($(syscalls_used),)
+
+quiet_cmd_calc = CALC    $@
+      cmd_calc = sed -n -e '/^\[([0-9 +]*)\] = /{s/.*\[\(.*\)\] = .*/sed \\"s%^\\\\[\1\\\\] = %[$$((\1))] = %g\\" -i /gp}' $@ | xargs -I{} echo {} $@ | sh;
+
+quiet_cmd_used = USED    $@
+      cmd_used = sed -E -e '/^\[[0-9]*\] = /{/(^\[($(syscalls_used))\] *=|= *\((sys_)*($(syscalls_used))\),)/!{s%^%// %g}}' -i $@;
+
+$(obj)/syscall_table.i: $(src)/../syscall_table.c $(objtree)/.config FORCE
+	$(call if_changed_dep,cpp_i_c)
+	$(call cmd,calc)
+	$(call cmd,used)
+
+$(obj)/syscall_table_used.o: $(obj)/syscall_table.i FORCE
+	$(call if_changed,cc_o_c)
+
+$(obj)/compat_syscall_table.i: $(src)/../compat_syscall_table.c $(objtree)/.config FORCE
+	$(call if_changed_dep,cpp_i_c)
+	$(call cmd,calc)
+	$(call cmd,used)
+
+$(obj)/compat_syscall_table_used.o: $(obj)/compat_syscall_table.i FORCE
+	$(call if_changed,cc_o_c)
+
+else
+
+$(obj)/syscall_table_used.o: $(src)/../syscall_table.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/compat_syscall_table_used.o: $(src)/../compat_syscall_table.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
