Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259AAC27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0t4ipjUtJas46xI4lP6v8bcUkNPohA0Gm+/PRoxQOH4=; b=bMED/4YZBhQ1ff
	tv9R8cbVY5hNInn0PG67hFm1uJl6z4ofhlvRuVzvOwoNH8pUMjDTnFWEwgsTxJpTRozUaLGGJcLap
	LQkKjaka8BxSsg5H9y0D1+P2ou0xA6XcC6harKXl2mPFRmafUuTuYVODf1iwgGIQ6qlgwzEqFlx4n
	v9zKgR3BcaVBqZ/BwHIaCb3XHQDsIBV71H9MZwoZONg+Nvh6DMyzGkYNcNealw2wHE7mKTLbcYm09
	aeMfwawK3XnEkFgKRaREb5tAqF7ftxV8WrbYFy6s2yPLSqpaDu8TiGk/LyOd93aHoRhRhTyY2+Hq6
	WzIrg2QEoq0dRXod9v1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBio-0000000Agr7-2JaD;
	Mon, 17 Jun 2024 12:44:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBik-0000000Agq2-3qWj
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 12:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 94DB5CE0ECD;
	Mon, 17 Jun 2024 12:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F878C4AF1C;
	Mon, 17 Jun 2024 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718628263;
	bh=bk3jaCTgEwyFqgeARzSHMxmOvQdgz0Ppwlp60WKOmQw=;
	h=From:To:Cc:Subject:Date:From;
	b=nntBnYVEohFkLJK2lrDYhAJL6Dirglm7fViLEJx1cun+AEuKLjAubktVJcRIVtxox
	 FxovPk10y+7rfn8sOdCoAfU1Mfs771FeOzuAYF1x699ODbPSfY/F4lU0sKGnPK89x/
	 qtNgP8t1NYd2ZWHdB5KjOV6feKx6NVslrchwnFIv0sV/6p7FiJnYZwP0f5BUY0z/F5
	 TvpkzAOHgr+qKuOTmBKS+QzqUgvUpA0E4P4pO1vf4anw+1yliUZA04dQ6ao3PG5H7Z
	 LEbIcA9OrAn3iTpZo+HOYJ/ZoAPalXO0mPCL90aGfvvRf/nPpkTbfBHtY2Nt4XXHPL
	 BsZqgjaoqYmZg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH] riscv: enable HAVE_ARCH_STACKLEAK
Date: Mon, 17 Jun 2024 20:30:29 +0800
Message-ID: <20240617123029.723-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_054427_514329_2C10B98C 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
 arch/riscv/Kconfig                    | 1 +
 arch/riscv/kernel/entry.S             | 4 ++++
 drivers/firmware/efi/libstub/Makefile | 3 ++-
 3 files changed, 7 insertions(+), 1 deletion(-)

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
