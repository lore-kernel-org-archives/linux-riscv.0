Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56176ECAAD2
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Aug 2022 13:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LXrDRm+VXRehOJOPRdDc5WeH9pMpOw0KRzf5k/oc6w0=; b=KMgzRtjrIBUynE
	rsfd3X53yEibZvyhqUSIB67MluZH/zodvyegxPE/ifO70/AoCg9S0z13RROZqQlveRKEAOqHHBK02
	zKNyOmS16WPaiTeRCN2QtbFYLwiLv1QUfXi4I6u+Xom3iLH6uhdcU3zh1DjO/ODgbgi3+NZL+BYfK
	mZA1CuF1tw7qEq/WsJeOVH8xbhtZloiPGYeeEA5jO7B108NbwKyqJtO7rNAcxJIKnmcLlu45Ev/pY
	6Pz1q4ovCzQ5kzQhl3ac0H6uni+epfdHbL7MiUOaxiJLAtdzrEJm7r+Sv/JkLmUvKVe2UxAPINffy
	ltzjZZ6jw2oYH6bft/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSIk7-00HGd1-LV; Sun, 28 Aug 2022 13:54:27 +0000
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSIk2-00HGT3-W9
	for linux-riscv@lists.infradead.org; Sun, 28 Aug 2022 13:54:26 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0VNSFve4_1661694851;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VNSFve4_1661694851)
          by smtp.aliyun-inc.com;
          Sun, 28 Aug 2022 21:54:12 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	guoren@kernel.org,
	heiko@sntech.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH] RISC-V: Add STACKLEAK erasing the kernel stack at the end of syscalls
Date: Sun, 28 Aug 2022 21:54:07 +0800
Message-Id: <20220828135407.3897717-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_065423_258398_A1C611A6 
X-CRM114-Status: GOOD (  10.00  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This adds support for the STACKLEAK gcc plugin to RISC-V and disables
the plugin in EFI stub code, which is out of scope for the protection.

For the benefits of STACKLEAK feature, please check the commit
afaef01c0015 ("x86/entry: Add STACKLEAK erasing the kernel stack at the end of syscalls")

Performance impact (tested on qemu env with 1 riscv64 hart, 1GB mem)
    hackbench -s 512 -l 200 -g 15 -f 25 -P
    2.0% slowdown

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 arch/riscv/Kconfig                    | 1 +
 arch/riscv/include/asm/processor.h    | 4 ++++
 arch/riscv/kernel/entry.S             | 3 +++
 drivers/firmware/efi/libstub/Makefile | 2 +-
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..61fd0dad4463 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -85,6 +85,7 @@ config RISCV
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
+	select HAVE_ARCH_STACKLEAK
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 19eedd4af4cd..75620c467d25 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -85,6 +85,10 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
 extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
+#define current_top_of_stack()	((unsigned long)current->stack + THREAD_SIZE)
+#define on_thread_stack()	((unsigned long)((current_top_of_stack() \
+				     - current_stack_pointer) < THREAD_SIZE))
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index b9eda3fcbd6d..5f98660b46d4 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -233,6 +233,9 @@ check_syscall_nr:
 ret_from_syscall:
 	/* Set user a0 to kernel a0 */
 	REG_S a0, PT_A0(sp)
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	call stackleak_erase_on_task_stack
+#endif
 	/*
 	 * We didn't execute the actual syscall.
 	 * Seccomp already set return value for the current task pt_regs.
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index d0537573501e..5e1fc4f82883 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
 				   -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
 cflags-$(CONFIG_RISCV)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
-				   -fpic
+				   -fpic $(DISABLE_STACKLEAK_PLUGIN)
 
 cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
