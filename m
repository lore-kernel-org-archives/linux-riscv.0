Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18582C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sB22PLReH5Q+mGjutKpL9R93iOe/l4kfuwHuvsxRQLI=; b=WG3sFCysepPxa3
	ypaTEwEizpHkyUNY2weyG/h0tVz/GjpVK4H9qzDv/1xiS+BkrYXWCABViRzgjfgbLIOdlctLrQSHy
	OvnAUf2dGV1umEpBZ360VQ7EuPjpc5vjL9+Vqo70gcJ1vWvmZZIC63+O21XJfBDJvL3AQVFX7CYrw
	m1Co1WzMbPq2mlxnRv1dhcsfsxhTrTaBkzXjz9a0gIsYikavlBDYn5uAbQVa0EGPETs90PrRiupWe
	5Mp53FfHFfnlRCw+nKrapNC7xYScwXeGCrNgrLz95GL/IWCbvVc5fhW9Q8om+n7BN1GBYPK0iduap
	FudvxW07iXuK3PS1pa1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqV22-00GWT3-LG; Thu, 03 Nov 2022 07:52:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqV1x-00GWOL-Q7
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 07:52:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4CC8DB8269B;
	Thu,  3 Nov 2022 07:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B27CC43470;
	Thu,  3 Nov 2022 07:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667461972;
	bh=ZDyU4TTOJsyVKdnctf0t8XpryX5dMXPuOjIV8A9Fjb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lHwWGJ32MEfn/HxtpH/oyGBGkmuOydDXPkdjQLiZwUJhQVGv/uRpnmN37LRlHhTHH
	 bf3Ls5mQrc2jDd7/7yP3P7p6pZmbQKCoFPIapY9hN6ObQVd3zDTQgiTjKFffPhh/qt
	 Q7EtSqVLgYrm8wzI1iCy9Phe+MFQtffWqqereuefI0SyuLFUAuVMpoJzx3QN2zt+OZ
	 TFGVB/v5zSigrp/gWSWN+5ZGCI7nKNZ8ncxRnlPXzne8uKIP886ghp8ah0ks++wtN1
	 Bf0MXrBnAG0SSDG5MT/wcRydBLiE/R569rcPBuAtTo7ou3MOzs/Re0Bpbi/BmEUfpD
	 DWd3ahTl0sviQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dao Lu <daolu@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Conor Dooley <Conor.Dooley@microchip.com>
Subject: [PATCH -next V8 11/14] riscv: Add support for STACKLEAK gcc plugin
Date: Thu,  3 Nov 2022 03:50:44 -0400
Message-Id: <20221103075047.1634923-12-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221103075047.1634923-1-guoren@kernel.org>
References: <20221103075047.1634923-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_005254_182692_05872A3D 
X-CRM114-Status: GOOD (  14.76  )
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

From: Dao Lu <daolu@rivosinc.com>

Add support for STACKLEAK gcc plugin to riscv based heavily on the arm64
version, and modifying the entry.S. Additionally, this disables the
plugin for EFI stub code for riscv. All modifications base on
generic_entry.

The stackleak_erase_on_task_stack() is called in irq disabled context
before return to user space.

Here is the test result with LKDTM:
echo STACKLEAK_ERASING > /sys/kernel/debug/provoke-crash/DIRECT
[   53.110405] lkdtm: Performing direct entry STACKLEAK_ERASING
[   53.111630] lkdtm: stackleak stack usage:
[   53.111630]   high offset: 288 bytes
[   53.111630]   current:     592 bytes
[   53.111630]   lowest:      1136 bytes
[   53.111630]   tracked:     1136 bytes
[   53.111630]   untracked:   576 bytes
[   53.111630]   poisoned:    14376 bytes
[   53.111630]   low offset:  8 bytes
[   53.115078] lkdtm: OK: the rest of the thread stack is properly
erased

Performance impact (tested on qemu env with 1 riscv64 hart, 1GB mem)
    hackbench -s 512 -l 200 -g 15 -f 25 -P
    2.0% slowdown

Signed-off-by: Dao Lu <daolu@rivosinc.com>
Co-developed-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Co-developed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Conor Dooley <Conor.Dooley@microchip.com>
---
Dao Lu gave the first patch at [1], and Xianting missed the previous
patch and gave the second one [2]. Guo Ren tried to move
stackleak into common generic entry codes [3], but Mark Rutland pointed
out the problem. Combine the Dao Lu's patch with the GENEIRC_ENTRY
patchset series, with some modifications (fit GENEIRC_ENTRY, directly
using stackleak_erase_on_task_stack).

[1] https://lore.kernel.org/linux-riscv/20220615213834.3116135-1-daolu@rivosinc.com/
[2] https://lore.kernel.org/linux-riscv/20220828135407.3897717-1-xianting.tian@linux.alibaba.com/
[3] https://lore.kernel.org/lkml/20220907014809.919979-1-guoren@kernel.org/
---
 arch/riscv/Kconfig                    | 1 +
 arch/riscv/kernel/entry.S             | 3 +++
 drivers/firmware/efi/libstub/Makefile | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index df067b225757..b15df48d9d31 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -85,6 +85,7 @@ config RISCV
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
 	select HAVE_ARCH_SECCOMP_FILTER
+	select HAVE_ARCH_STACKLEAK
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 03655577e26f..b1babad5f829 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -145,6 +145,9 @@ ENTRY(ret_from_exception)
 	andi s0, s0, SR_SPP
 #endif
 	bnez s0, 1f
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	call stackleak_erase_on_task_stack
+#endif
 
 	/* Save unwound kernel stack pointer in thread_info */
 	addi s0, sp, PT_SIZE_ON_STACK
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index b1601aad7e1a..28170707fa6f 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
 				   -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
 cflags-$(CONFIG_RISCV)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
-				   -fpic
+				   -fpic $(DISABLE_STACKLEAK_PLUGIN)
 cflags-$(CONFIG_LOONGARCH)	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
 				   -fpie
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
