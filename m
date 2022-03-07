Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C32C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 22:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vb1/4N6ZXbs6YYjLiWUjVQqSIckBzW/t6Yq2Y4xxVAo=; b=FvwweLni4bmGaH
	gw0rvkhnzCt8L6KlCenxSt/9xyVwhLNyijU3SgAlbQMBIpgAdCizPdk9adNqArNx9UFuVjdA+rmH2
	+yqKOWZOREAdg0rbNsZzOOxBkm10LH9TucEFzkpBbcTlT6PbXU3RtlLeRtNoQLCE3w7aA9plZDx/T
	lgwl5ClcoljrFGFFPfJf5wn+QbsMs+TPP7avpSu/U1xbpQT2sxM2lql36Ai1lF6NYP7WFuaOhwBeL
	1cXQDEst1Zei3hvouzGN5lD16VB7MLm0BLIv0khJ55d3BpHU3nunC4MGGioJms8K4atQ3u5C01A66
	7OW9VYwgzlrhTOnTrPBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRM7c-001r9w-7n; Mon, 07 Mar 2022 22:46:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRM7W-001r7i-BJ
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 22:46:29 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nRM7T-00032M-MD; Mon, 07 Mar 2022 23:46:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, mick@ics.forth.gr, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>, Christoph Hellwig <hch@lst.de>,
 Atish Patra <atish.patra@wdc.com>
Subject: [PATCH 1/2] riscv: Implement Zicbom-based cache management operations
Date: Mon,  7 Mar 2022 23:46:19 +0100
Message-Id: <20220307224620.1933061-2-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220307224620.1933061-1-heiko@sntech.de>
References: <20220307224620.1933061-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_144626_555739_DA630BD7 
X-CRM114-Status: GOOD (  21.91  )
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

The Zicbom ISA-extension was ratified in november 2021
and introduces instructions for dcache invalidate, clean
and flush operations.

Implement cache management operations based on them.

Of course not all cores will support this, so implement an
alternative-based mechanism that replaces empty instructions
with ones done around Zicbom instructions.

We're using prebuild instructions for the Zicbom instructions
for now, to not require a bleeding-edge compiler (gcc-12)
for these somewhat simple instructions.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig                   |  8 ++++
 arch/riscv/include/asm/errata_list.h | 37 ++++++++++++++++-
 arch/riscv/include/asm/hwcap.h       |  1 +
 arch/riscv/kernel/cpu.c              |  1 +
 arch/riscv/kernel/cpufeature.c       | 17 ++++++++
 arch/riscv/mm/Makefile               |  1 +
 arch/riscv/mm/dma-noncoherent.c      | 61 ++++++++++++++++++++++++++++
 7 files changed, 125 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/mm/dma-noncoherent.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..d3a1cd41c203 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -208,6 +208,14 @@ config PGTABLE_LEVELS
 config LOCKDEP_SUPPORT
 	def_bool y
 
+config RISCV_DMA_NONCOHERENT
+	bool "Support non-coherent dma operation"
+	select ARCH_HAS_DMA_PREP_COHERENT
+	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_SYNC_DMA_FOR_CPU
+	select ARCH_HAS_SETUP_DMA_OPS
+	select DMA_DIRECT_REMAP
+
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.erratas"
 
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 4fac46b82c16..7a2dd61af24d 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -20,7 +20,8 @@
 #endif
 
 #define	CPUFEATURE_SVPBMT 0
-#define	CPUFEATURE_NUMBER 1
+#define	CPUFEATURE_CMO 1
+#define	CPUFEATURE_NUMBER 2
 
 #ifdef __ASSEMBLY__
 
@@ -86,6 +87,40 @@ asm volatile(ALTERNATIVE(								\
 #define ALT_THEAD_PMA(_val)
 #endif
 
+/*
+ * cbo.clean rs1
+ * | 31 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *    0...01     rs1       010      00000  0001111
+ *
+ * cbo.flush rs1
+ * | 31 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *    0...10     rs1       010      00000  0001111
+ *
+ * cbo.inval rs1
+ * | 31 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *    0...00     rs1       010      00000  0001111
+ */
+#define CBO_INVAL_A0	".long 0x15200F"
+#define CBO_CLEAN_A0	".long 0x25200F"
+#define CBO_FLUSH_A0	".long 0x05200F"
+
+#define ALT_CMO_OP(_op, _start, _size)							\
+asm volatile(ALTERNATIVE(								\
+	"nop\n\t"									\
+	"nop\n\t"									\
+	"nop\n\t"									\
+	"nop\n\t"									\
+	"nop",										\
+	"mv a0, %1\n\t"									\
+	"j 2f\n\t"									\
+	"3:\n\t"									\
+	CBO_##_op##_A0 "\n\t"								\
+	"addi a0, a0, %0\n\t"								\
+	"2:\n\t"									\
+	"bltu a0, %2, 3b\n\t", 0, CPUFEATURE_CMO, CONFIG_RISCV_DMA_NONCOHERENT)		\
+	: : "I"(L1_CACHE_BYTES), "r"((_start) & ~(L1_CACHE_BYTES - 1)),			\
+	    "r"(ALIGN((_start) + (_size), L1_CACHE_BYTES)))
+
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 656cd626eb1a..5943d5125a51 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -52,6 +52,7 @@ extern unsigned long elf_hwcap;
  */
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SVPBMT = RISCV_ISA_EXT_BASE,
+	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index c582d557e555..dfcf592273a7 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -72,6 +72,7 @@ int riscv_of_parent_hartid(struct device_node *node)
 
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA("svpbmt", RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA("zicbom", RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5c5e6e7488ce..0e997fa5524a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -200,6 +200,7 @@ void __init riscv_fill_hwcap(void)
 				set_bit(*ext - 'a', this_isa);
 			} else {
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
+				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 			}
 #undef SET_ISA_EXT_MAP
 		}
@@ -267,11 +268,27 @@ static bool __init_or_module cpufeature_svpbmt_check_func(unsigned int stage)
 	return ret;
 }
 
+static bool cpufeature_cmo_check_func(unsigned int stage)
+{
+	switch (stage) {
+	case RISCV_ALTERNATIVES_EARLY_BOOT:
+		return false;
+	default:
+		return riscv_isa_extension_available(NULL, ZICBOM);
+	}
+
+	return false;
+}
+
 static const struct cpufeature_info __initdata_or_module cpufeature_list[CPUFEATURE_NUMBER] = {
 	{
 		.name = "svpbmt",
 		.check_func = cpufeature_svpbmt_check_func
 	},
+	{
+		.name = "cmo",
+		.check_func = cpufeature_cmo_check_func
+	},
 };
 
 static u32 __init_or_module cpufeature_probe(unsigned int stage)
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index ac7a25298a04..d76aabf4b94d 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -30,3 +30,4 @@ endif
 endif
 
 obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
+obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
new file mode 100644
index 000000000000..2c124bcc1932
--- /dev/null
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RISC-V specific functions to support DMA for non-coherent devices
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ */
+
+#include <linux/dma-direct.h>
+#include <linux/dma-map-ops.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/libfdt.h>
+#include <linux/mm.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		ALT_CMO_OP(CLEAN, (unsigned long)phys_to_virt(paddr), size);
+		break;
+	case DMA_FROM_DEVICE:
+		ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr), size);
+		break;
+	case DMA_BIDIRECTIONAL:
+		ALT_CMO_OP(FLUSH, (unsigned long)phys_to_virt(paddr), size);
+		break;
+	default:
+		break;
+	}
+}
+
+void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		break;
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr), size);
+		break;
+	default:
+		break;
+	}
+}
+
+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+	void *flush_addr = page_address(page);
+
+	memset(flush_addr, 0, size);
+	ALT_CMO_OP(FLUSH, (unsigned long)flush_addr, size);
+}
+
+void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
+		const struct iommu_ops *iommu, bool coherent)
+{
+	/* If a specific device is dma-coherent, set it here */
+	dev->dma_coherent = coherent;
+}
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
