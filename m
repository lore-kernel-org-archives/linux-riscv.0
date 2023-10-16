Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60006CDB483
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dpjlx49oAtt9+zBqBwPCYGDrNRpRjdIhqCXUnQrbu5w=; b=LoJVvI997Rd9Oo
	9oKXBzsKdMlLLBMQiX5dAeNb5B+5n4T9A3siPRhsW/THyQKNsor3iUWkZxU0RrnMB9nVkyHRyxkfl
	0IFalhQEWWteWrROgNDP/sHL20jZyCm29fo8QF1RZsGrFSyuX5wUccIdpqE3ent6tjaWkl72IoHsD
	OmhxSL96rVAKx5RcEeNDflcNaVMTQRyMR2ZFfaqh2MIsnMLkQLqtyY7CY2COWbQ44II9mX0jRgq/H
	GrA1z67gWq5+ek/IvAxEqyqVi3Syqr6pO946inafEF6c2Fl7EQRaPO/X3TirkqSJObs0wZCwjM717
	6qUkkyA4ErQH+48L8jdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSl-008QxS-0r;
	Mon, 16 Oct 2023 05:48:23 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSj-008Qua-13;
	Mon, 16 Oct 2023 05:48:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Greg Ungerer <gerg@linux-m68k.org>,
	iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-m68k@lists.linux-m68k.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>
Subject: [PATCH 09/12] m68k: use the coherent DMA code for coldfire without data cache
Date: Mon, 16 Oct 2023 07:47:51 +0200
Message-Id: <20231016054755.915155-10-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016054755.915155-1-hch@lst.de>
References: <20231016054755.915155-1-hch@lst.de>
MIME-Version: 1.0
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

Coldfire cores configured without a data cache are DMA coherent and
should thus simply use the simple coherent version of dma-direct.

Introduce a new COLDFIRE_COHERENT_DMA Kconfig symbol as a convenient
short hand for such configurations, and a M68K_NONCOHERENT_DMA symbol
for all cases where we need to build non-coherent DMA infrastructure
to simplify the Kconfig and code conditionals.

Not building the non-coherent DMA code slightly reduces the code
size for such configurations.

Numers for m5249evb_defconfig below:

  text	   data	    bss	    dec	    hex	filename
2896158	 401052	  65392	3362602	 334f2a	vmlinux.before
2895166	 400988	  65392	3361546	 334b0a	vmlinux.after

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/Kconfig         |  8 ++++----
 arch/m68k/Kconfig.cpu     | 12 ++++++++++++
 arch/m68k/kernel/Makefile |  2 +-
 arch/m68k/kernel/dma.c    |  2 +-
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 0430b8ba6b5cc6..6c585eae89f4dc 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -3,19 +3,19 @@ config M68K
 	bool
 	default y
 	select ARCH_32BIT_OFF_T
-	select ARCH_DMA_ALLOC if !MMU || COLDFIRE
+	select ARCH_DMA_ALLOC if M68K_NONCOHERENT_DMA && COLDFIRE
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
-	select ARCH_HAS_DMA_PREP_COHERENT if HAS_DMA && MMU && !COLDFIRE
-	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if HAS_DMA
+	select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
+	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
 	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
 	select ARCH_NO_PREEMPT if !COLDFIRE
 	select ARCH_USE_MEMTEST if MMU_MOTOROLA
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
-	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
+	select DMA_DIRECT_REMAP if M68K_NONCOHERENT_DMA && !COLDFIRE
 	select GENERIC_ATOMIC64
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IOMAP
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index b826e9c677b2ae..e8905d38c714c4 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -535,3 +535,15 @@ config CACHE_COPYBACK
 	  The ColdFire CPU cache is set into Copy-back mode.
 endchoice
 endif # HAVE_CACHE_CB
+
+# Coldfire cores that do not have a data cache configured can do coherent DMA.
+config COLDFIRE_COHERENT_DMA
+	bool
+	default y
+	depends on COLDFIRE
+	depends on !HAVE_CACHE_CB && !CONFIG_CACHE_D && !CONFIG_CACHE_BOTH
+
+config M68K_NONCOHERENT_DMA
+	bool
+	default y
+	depends on HAS_DMA && !COLDFIRE_COHERENT_DMA
diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index af015447dfb4c1..01fb69a5095f43 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -23,7 +23,7 @@ obj-$(CONFIG_MMU_MOTOROLA) += ints.o vectors.o
 obj-$(CONFIG_MMU_SUN3) += ints.o vectors.o
 obj-$(CONFIG_PCI) += pcibios.o
 
-obj-$(CONFIG_HAS_DMA)	+= dma.o
+obj-$(CONFIG_M68K_NONCOHERENT_DMA) += dma.o
 
 obj-$(CONFIG_KEXEC)		+= machine_kexec.o relocate_kernel.o
 obj-$(CONFIG_BOOTINFO_PROC)	+= bootinfo_proc.o
diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index 2e192a5df949bb..f83870cfa79b37 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -17,7 +17,7 @@
 
 #include <asm/cacheflush.h>
 
-#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
+#ifndef CONFIG_COLDFIRE
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	cache_push(page_to_phys(page), size);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
