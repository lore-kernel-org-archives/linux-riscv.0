Return-Path: <SRS0=GwCz=SY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D830C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2019 15:45:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3DC920674
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2019 15:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HiVwAy9T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A24WqcY2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3DC920674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=CZFtZOV2ey62D76G0PT9tFKhqL/yGpE3Db3cckg3yXY=; b=HiV
	wAy9T+9vE4foFzxZWy+9M2s0wc8mZAoBLmAqczZ2YMenlc8WX76zhxFU5bMKobv/CdjWWr/Gu5lSp
	KGWsVFnrcfMvvnh9astt54p9OvFkg9ui0vqluMmt2h+vL3f4Tqc8xZ/BVysJ3cWp7PY6jTTqaAsWf
	i4LzYs/4fHmNqS/lZXdU0Wd/ccC6jOrU3G+qK6wL/YWIm6ZSrOafbE2RsmAhW3XXuBlYqfL/4sKE2
	1OhYAB8s1U24ZF7QKK8e/fivMSQXekGDiejcsUbIS+zrBhkGR0/qm0PPAeY+ECpkPK1T7STey3C59
	YVYNis+/6atJgXU63mWqzdSQLEif0ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIb8E-0004qh-79; Mon, 22 Apr 2019 15:45:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIb8A-0004pv-6o
 for linux-riscv@lists.infradead.org; Mon, 22 Apr 2019 15:45:20 +0000
Received: from localhost.localdomain (unknown [115.206.242.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6966A20674;
 Mon, 22 Apr 2019 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555947917;
 bh=uj+/QzvTttbkYwOMwn5rElh4LUjLb7E6ZM0UCAxr4iY=;
 h=From:To:Cc:Subject:Date:From;
 b=A24WqcY2ZzklMWh/c4aRZiqg9Qc1WRyGxUs+5niYvqvUAQ8s/pv//fULdt2wxZnee
 XfqxCvaeNYZf7sksImuYBJJiUe5hNGsn0Tk3bcfAihZFaHA2HYBSpE7WH0mchWpJcS
 QtObWCvD2TbytTN89n1rJkHBK/w2/A0kT2yhMEvs=
From: guoren@kernel.org
To: ren_guo@c-sky.com,
	guoren@kernel.org
Subject: [PATCH] riscv: Support non-coherency memory model
Date: Mon, 22 Apr 2019 23:44:30 +0800
Message-Id: <1555947870-23014-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_084518_338232_09D41DA2 
X-CRM114-Status: GOOD (  22.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 Andrew Waterman <andrew@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, Xiang Xiaoyan <xiaoyan_xiang@c-sky.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Vincent Chen <vincentc@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Scott Wood <swood@redhat.com>, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 tech-privileged@lists.riscv.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <ren_guo@c-sky.com>

The current riscv linux implementation requires SOC system to support
memory coherence between all I/O devices and CPUs. But some SOC systems
cannot maintain the coherence and they need support cache clean/invalid
operations to synchronize data.

Current implementation is no problem with SiFive FU540, because FU540
keeps all IO devices and DMA master devices coherence with CPU. But to a
traditional SOC vendor, it may already have a stable non-coherency SOC
system, the need is simply to replace the CPU with RV CPU and rebuild
the whole system with IO-coherency is very expensive.

So we should make riscv linux also support non-coherency memory model.
Here are the two points that riscv linux needs to be modified:

 - Add _PAGE_COHERENCY bit in current page table entry attributes. The bit
   designates a coherence for this page mapping. Software set the bit to
   tell the hardware that the region of the page's memory area must be
   coherent with IOs devices in SOC system by PMA settings.
   If IOs and CPU are already coherent in SOC system, CPU just ignore
   this bit.

   PTE format:
   | XLEN-1  10 | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
         PFN      C  RSW  D   A   G   U   X   W   R   V
                  ^
   BIT(9): Coherence attribute bit
          0: hardware needn't keep the page coherenct and software will
             maintain the coherence with cache clear/invalid operations.
          1: hardware must keep the page coherenct and software needn't
             maintain the coherence.
   BIT(8): Reserved for software and now it's _PAGE_SPECIAL in linux

   Add a new hardware bit in PTE also need to modify Privileged
   Architecture Supervisor-Level ISA:
   https://github.com/riscv/riscv-isa-manual/pull/374

 - Add SBI_FENCE_DMA 9 in riscv-sbi.
   sbi_fence_dma(start, size, dir) could synchronize CPU cache data with
   DMA device in non-coherency memory model. The third param's definition
   is the same with linux's in include/linux/dma-direction.h:

   enum dma_data_direction {
	DMA_BIDIRECTIONAL = 0,
	DMA_TO_DEVICE = 1,
	DMA_FROM_DEVICE = 2,
	DMA_NONE = 3,
   };

   The first param:start must be physical address which could be handled
   in M-state.

   Here is a pull request to the riscv-sbi-doc:
   https://github.com/riscv/riscv-sbi-doc/pull/15

We have tested the patch on our fpga SOC system which network controller
connected to a non-cache-coherency interconnect in and it couldn't work
without the patch.

There is no side effect for FU540 whose CPU don't care _PAGE_COHERENCY
in PTE, but FU540's bbl also need to implement a simple sbi_fence_dma
by directly return. In fact, if you give a correct configuration for
dev_is_dma_conherent(), linux dma framework wouldn't call sbi_fence_dma
any more.

Changelog:
 - Use coherency instead of consistency for all to maintain term
   consistency. (Xiang Xiaoyan)
 - Add riscv-isa-manual modification pull request link.
 - Correct grammatical errors.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Andrew Waterman <andrew@sifive.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Greentime Hu <green.hu@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Scott Wood <swood@redhat.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Xiang Xiaoyan <xiaoyan_xiang@c-sky.com>
---
 arch/riscv/Kconfig                    |  4 ++++
 arch/riscv/include/asm/pgtable-bits.h |  1 +
 arch/riscv/include/asm/pgtable.h      | 11 +++++++++
 arch/riscv/include/asm/sbi.h          | 10 ++++++++
 arch/riscv/mm/Makefile                |  1 +
 arch/riscv/mm/dma-mapping.c           | 44 +++++++++++++++++++++++++++++++++++
 arch/riscv/mm/ioremap.c               |  2 +-
 7 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/mm/dma-mapping.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb56c82..f0fc503 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -16,9 +16,12 @@ config RISCV
 	select OF
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
+	select ARCH_HAS_SYNC_DMA_FOR_CPU
+	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_WANT_FRAME_POINTERS
 	select CLONE_BACKWARDS
 	select COMMON_CLK
+	select DMA_DIRECT_REMAP
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IRQ_SHOW
@@ -27,6 +30,7 @@ config RISCV
 	select GENERIC_STRNCPY_FROM_USER
 	select GENERIC_STRNLEN_USER
 	select GENERIC_SMP_IDLE_THREAD
+	select GENERIC_ALLOCATOR
 	select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_MEMBLOCK_NODE_MAP
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index 470755c..104f8c0 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -31,6 +31,7 @@
 #define _PAGE_ACCESSED  (1 << 6)    /* Set by hardware on any access */
 #define _PAGE_DIRTY     (1 << 7)    /* Set by hardware on any write */
 #define _PAGE_SOFT      (1 << 8)    /* Reserved for software */
+#define _PAGE_COHERENCY (1 << 9)    /* Coherency */
 
 #define _PAGE_SPECIAL   _PAGE_SOFT
 #define _PAGE_TABLE     _PAGE_PRESENT
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1141364..26debb4 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -66,6 +66,7 @@
 
 #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
 #define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL | _PAGE_EXEC)
+#define PAGE_KERNEL_COHERENCY	__pgprot(_PAGE_KERNEL | _PAGE_COHERENCY)
 
 extern pgd_t swapper_pg_dir[];
 
@@ -375,6 +376,16 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	return ptep_test_and_clear_young(vma, address, ptep);
 }
 
+#define pgprot_noncached pgprot_noncached
+static inline pgprot_t pgprot_noncached(pgprot_t _prot)
+{
+	unsigned long prot = pgprot_val(_prot);
+
+	prot |= _PAGE_COHERENCY;
+
+	return __pgprot(prot);
+}
+
 /*
  * Encode and decode a swap entry
  *
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index b6bb10b..b945e50 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -25,6 +25,7 @@
 #define SBI_REMOTE_SFENCE_VMA 6
 #define SBI_REMOTE_SFENCE_VMA_ASID 7
 #define SBI_SHUTDOWN 8
+#define SBI_FENCE_DMA 9
 
 #define SBI_CALL(which, arg0, arg1, arg2) ({			\
 	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);	\
@@ -42,6 +43,8 @@
 #define SBI_CALL_0(which) SBI_CALL(which, 0, 0, 0)
 #define SBI_CALL_1(which, arg0) SBI_CALL(which, arg0, 0, 0)
 #define SBI_CALL_2(which, arg0, arg1) SBI_CALL(which, arg0, arg1, 0)
+#define SBI_CALL_3(which, arg0, arg1, arg2) \
+			SBI_CALL(which, arg0, arg1, arg2)
 
 static inline void sbi_console_putchar(int ch)
 {
@@ -82,6 +85,13 @@ static inline void sbi_remote_fence_i(const unsigned long *hart_mask)
 	SBI_CALL_1(SBI_REMOTE_FENCE_I, hart_mask);
 }
 
+static inline void sbi_fence_dma(unsigned long start,
+			       unsigned long size,
+			       unsigned long dir)
+{
+	SBI_CALL_3(SBI_FENCE_DMA, start, size, dir);
+}
+
 static inline void sbi_remote_sfence_vma(const unsigned long *hart_mask,
 					 unsigned long start,
 					 unsigned long size)
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index b68aac7..adc563a 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -9,3 +9,4 @@ obj-y += fault.o
 obj-y += extable.o
 obj-y += ioremap.o
 obj-y += cacheflush.o
+obj-y += dma-mapping.o
diff --git a/arch/riscv/mm/dma-mapping.c b/arch/riscv/mm/dma-mapping.c
new file mode 100644
index 0000000..5e1d179
--- /dev/null
+++ b/arch/riscv/mm/dma-mapping.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-mapping.h>
+
+static int __init atomic_pool_init(void)
+{
+	return dma_atomic_pool_init(GFP_KERNEL, pgprot_noncached(PAGE_KERNEL));
+}
+postcore_initcall(atomic_pool_init);
+
+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+	memset(page_address(page), 0, size);
+
+	sbi_fence_dma(page_to_phys(page), size, DMA_BIDIRECTIONAL);
+}
+
+void arch_sync_dma_for_device(struct device *dev, phys_addr_t paddr,
+			      size_t size, enum dma_data_direction dir)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		sbi_fence_dma(paddr, size, dir);
+		break;
+	default:
+		BUG();
+	}
+}
+
+void arch_sync_dma_for_cpu(struct device *dev, phys_addr_t paddr,
+			   size_t size, enum dma_data_direction dir)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		sbi_fence_dma(paddr, size, dir);
+		break;
+	default:
+		BUG();
+	}
+}
diff --git a/arch/riscv/mm/ioremap.c b/arch/riscv/mm/ioremap.c
index bd2f2db..f6aaf1e 100644
--- a/arch/riscv/mm/ioremap.c
+++ b/arch/riscv/mm/ioremap.c
@@ -73,7 +73,7 @@ static void __iomem *__ioremap_caller(phys_addr_t addr, size_t size,
  */
 void __iomem *ioremap(phys_addr_t offset, unsigned long size)
 {
-	return __ioremap_caller(offset, size, PAGE_KERNEL,
+	return __ioremap_caller(offset, size, PAGE_KERNEL_COHERENCY,
 		__builtin_return_address(0));
 }
 EXPORT_SYMBOL(ioremap);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
