Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87939C27C4F
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 00:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sx9DCZAM9WYLj64Qnd9Po9c77f0bYEQHFV6NQSLZd7Y=; b=uhwksCYa4vvgL8
	oHR7U3P0rSAFlcc1HC7HwspAWxVB2sQY5a/o5a0Ipax+gt8FSwYeZzqopI2vrZV+GG2ivSxP6F4LW
	UjxHcF9OM6o83wimPjE7Irq+ehxp0LB30xjusxrM6L2Z1U16qRZPotwLyCQVfANLxeMHDdR47H9Sg
	LAA2kIpvLAePRSlSo2w8fb6ztuqA8H0dMkGn7DbCxW1NBVM3vxLAEaprvDsyUuVn35CVS8fZB9FDk
	bNO467uat/0Mmy+yJNiS6LEcRw18xyYAWbIpJsHd4vNxYXuIXULWjr/iKMCnbQ6kUprs32CvNc8rF
	yXBGuXQb7igJmeagU0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLXEz-0000000F4M8-00y5;
	Mon, 24 Jun 2024 00:07:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLXEv-0000000F4L4-08pq
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 00:07:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1C3F60908;
	Mon, 24 Jun 2024 00:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC35FC2BD10;
	Mon, 24 Jun 2024 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719187639;
	bh=M/D8vlWXoM1yHQ0w1T9PpEu39JoCCs6wgGXVYV5gxxU=;
	h=From:To:Cc:Subject:Date:From;
	b=NSPiRWKfmTUtXs4C//mdABIyTHMbRalsw432APe5BvfvvroLA5UWpqDzkKv3Zy054
	 htlq/TfMZtkCbC7EdG7ejn7GycpxNxsXc9ayYCUi1FT1D2gGgzNy7tF/ME9hVNl1XC
	 bgkwdsaXs8b9OUAjMzWFlelCsd7KVABfwV1fUiAA80aSJDzGVUlyxbQtzuSFMDnmpE
	 Scdhc3LwCT9egp25g3xV79dY/0OK5VRrepy3VumGe1POUDE7CMg5bQtNOBkEHEx8VI
	 ePSmWrKdfahfSiMchNn9HgKbLnQqWGBiFkbrAVoHYzXEvN6039+ttfH6uD7S2OsSOh
	 r0IYfJfZ5C/cQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v2] riscv: enable HAVE_ARCH_STACKLEAK
Date: Mon, 24 Jun 2024 07:53:16 +0800
Message-ID: <20240623235316.2010-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_170721_373291_EB989AAD 
X-CRM114-Status: GOOD (  10.76  )
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

Add support for the stackleak feature. Whenever the kernel returns to user
space the kernel stack is filled with a poison value.

At the same time, disables the plugin in EFI stub code because EFI stub
is out of scope for the protection.

Tested on qemu and milkv duo:
/ # echo STACKLEAK_ERASING > /sys/kernel/debug/provoke-crash/DIRECT
[   38.675575] lkdtm: Performing direct entry STACKLEAK_ERASING
[   38.678448] lkdtm: stackleak stack usage:
[   38.678448]   high offset: 288 bytes
[   38.678448]   current:     496 bytes
[   38.678448]   lowest:      1328 bytes
[   38.678448]   tracked:     1328 bytes
[   38.678448]   untracked:   448 bytes
[   38.678448]   poisoned:    14312 bytes
[   38.678448]   low offset:  8 bytes
[   38.689887] lkdtm: OK: the rest of the thread stack is properly erased

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

since v2:
 - add #include <linux/sizes.h> to fixing compiler error found by
   Charlie

 arch/riscv/Kconfig                    | 1 +
 arch/riscv/include/asm/thread_info.h  | 1 +
 arch/riscv/kernel/entry.S             | 4 ++++
 drivers/firmware/efi/libstub/Makefile | 3 ++-
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0525ee2d63c7..9cbfdffec96c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -118,6 +118,7 @@ config RISCV
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
 	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
 	select HAVE_ARCH_SECCOMP_FILTER
+	select HAVE_ARCH_STACKLEAK
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 5d473343634b..fca5c6be2b81 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -10,6 +10,7 @@
 
 #include <asm/page.h>
 #include <linux/const.h>
+#include <linux/sizes.h>
 
 /* thread information allocation */
 #define THREAD_SIZE_ORDER	CONFIG_THREAD_SIZE_ORDER
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 68a24cf9481a..80ff55a26d13 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -130,6 +130,10 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 #endif
 	bnez s0, 1f
 
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	call	stackleak_erase_on_task_stack
+#endif
+
 	/* Save unwound kernel stack pointer in thread_info */
 	addi s0, sp, PT_SIZE_ON_STACK
 	REG_S s0, TASK_TI_KERNEL_SP(tp)
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 06f0428a723c..3a9521c57641 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -28,7 +28,8 @@ cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
 				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
 				   -DEFI_HAVE_STRCMP -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
-cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax
+cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax \
+				   $(DISABLE_STACKLEAK_PLUGIN)
 cflags-$(CONFIG_LOONGARCH)	+= -fpie
 
 cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
