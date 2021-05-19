Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB411C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:06:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41DCD6139A
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41DCD6139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gVq0s52jUxF7siyB7fz0RZsPfMG4pQBZs2yyxL9Fvc=; b=Je+DC8qGiq0pqADF8qle41rowx
	k29srtlXc7MEJAGIWpCcC7Q2KNpTsF6oMmn6RGtwhUqUazsnMjfWP+CjCM0QaPbTIt/G9aWB3XQer
	D/paTahjwrK7ItHQSoPeXhZarZ6KJpnlaoP4QPxijrYaqJU8uhEf3M3uxXLexVqEWuqEvvgwc3Bk/
	cuFcU/QxrCT7SQ3rJzAhMqSiCTdyealWk6myZ3EcyJC9GnKbfzkO6elzR+CNYzno4HoAMN8rh6CPg
	Rym6uPu1xbyy8R2LaXbYahQAcY/S9eGNMKOQKuOez2aRkbpYKpIdFVAXSoXgX+6AFdDz4HjkhpbaA
	vAv7yZpQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljEOu-002o8B-IZ; Wed, 19 May 2021 05:05:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEOs-002o73-7s
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 05:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aOxrqqh1fqeTDrlebr4hzu6OPebfH8leRWx3Fw3r6wg=; b=MvQoIBZB9ekv93ZEUYXn0AXibR
 cB9pyOl0OJQq/cEfLHUA/fN20kTYGHzA9H0dCJva05IMeeoztCKsr1CxEPqKLtifsAHbt5O7VAI8n
 kWtRmm5MEk6JklMLby9yLyyRspBc3oZ60lw6G8YoynrDwEx2wd8SeCuSq0S/2j/PUi0UmSKEW6FEj
 mBsL6kv3gPz0EpUb0ZmtqEO167zOKP8nllakVZi4ygzCcicWVFbugrIt43oOFgNYSiAuUN1Z6iNJq
 OItZ4DH5qJ9Ti/WNV9zL/Fd8B/8R1M4DO3DNx/7+pKbrFx0m2xC/dJhZtpoty6T3snA4UOC+kku1X
 TRMkzQEw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEOp-00F8aL-EH
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 05:05:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A0A1613AF;
 Wed, 19 May 2021 05:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621400739;
 bh=O5me3KriTfnRrUMwzojIEzCyeiCkU9kaY8kiucTa9NQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I5JmJoIiGQY8iSyyH7ddcMiyrYAG37qi6GSZeU5ddzUPwSNM1fOtxwLep1V9NuF3r
 GBksLSBytYT0i/4UoNDZR3AnHUNvl2S/nmnhVd5VG6xRCEaLo4Gjs+sOa2Ied8iphy
 80Xk4dFmGJO6m0RWEWzcg1bbvhPZa0kWCD36HqwDzV/OJ8CD5Rw1yyDcSNHbTC7tOk
 Lv89PbAcDdhsP1tnzTUQCeYlbtHJ05qzDwxoUMPYp8FDdHIC0ln7WXQrv6+VWc3PBk
 UBNuCdHzUzbUURDl6nRa8NSFAucyx+BtEK5bwpoyQsDuPneD9hxO2L646lCEONh59m
 qlDp2dtgYSJvg==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 drew@beagleboard.org, hch@lst.de, wefu@redhat.com, lazyparser@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH RFC 3/3] riscv: Add SYNC_DMA_FOR_CPU/DEVICE for DMA_COHERENT
Date: Wed, 19 May 2021 05:04:16 +0000
Message-Id: <1621400656-25678-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621400656-25678-1-git-send-email-guoren@kernel.org>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_220539_547384_94F55021 
X-CRM114-Status: GOOD (  19.92  )
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

From: Guo Ren <guoren@linux.alibaba.com>

To support DMA device in a non-coherent interconnect SOC system,
we need the below facilities:
 - Change a memory region attributes from cacheable to strong.
   It would be used in DMA descriptors.
 - Sync the cache with memory before DMA start and after DMA end.
   It would be used for DMA data transfer buffers.

This patch enables kernel dma/direct.c coherent infrastructure and
a new sbi_ecall API for dma_sync.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Drew Fustini <drew@beagleboard.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Wei Fu <wefu@redhat.com>
Cc: Wei Wu <lazyparser@gmail.com>
---
 arch/riscv/Kconfig               |  4 ++++
 arch/riscv/include/asm/pgtable.h | 13 +++++++++++++
 arch/riscv/include/asm/sbi.h     | 16 ++++++++++++++++
 arch/riscv/kernel/sbi.c          | 19 +++++++++++++++++++
 arch/riscv/mm/Makefile           |  4 ++++
 arch/riscv/mm/dma-mapping.c      | 41 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 97 insertions(+)
 create mode 100644 arch/riscv/mm/dma-mapping.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 632fac5..94a736a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -20,6 +20,9 @@ config RISCV
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_WX
+	select ARCH_HAS_DMA_PREP_COHERENT if RISCV_DMA_COHERENT
+	select ARCH_HAS_SYNC_DMA_FOR_CPU if RISCV_DMA_COHERENT
+	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if RISCV_DMA_COHERENT
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
@@ -41,6 +44,7 @@ config RISCV
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
 	select COMMON_CLK
+	select DMA_DIRECT_REMAP if RISCV_DMA_COHERENT
 	select EDAC_SUPPORT
 	select GENERIC_ARCH_TOPOLOGY if SMP
 	select GENERIC_ATOMIC64 if !64BIT
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f822f22..8994d58 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -465,6 +465,19 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	return ptep_test_and_clear_young(vma, address, ptep);
 }
 
+#ifdef CONFIG_RISCV_DMA_COHERENT
+#define pgprot_noncached pgprot_noncached
+static inline pgprot_t pgprot_noncached(pgprot_t _prot)
+{
+	unsigned long prot = pgprot_val(_prot);
+
+	prot &= ~_PAGE_DMA_MASK;
+	prot |= _PAGE_DMA_NONCACHE;
+
+	return __pgprot(prot);
+}
+#endif
+
 /*
  * Encode and decode a swap entry
  *
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0d42693..08b4244 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -27,6 +27,7 @@ enum sbi_ext_id {
 	SBI_EXT_IPI = 0x735049,
 	SBI_EXT_RFENCE = 0x52464E43,
 	SBI_EXT_HSM = 0x48534D,
+	SBI_EXT_DMA = 0xAB150401,
 };
 
 enum sbi_ext_base_fid {
@@ -37,6 +38,7 @@ enum sbi_ext_base_fid {
 	SBI_EXT_BASE_GET_MVENDORID,
 	SBI_EXT_BASE_GET_MARCHID,
 	SBI_EXT_BASE_GET_MIMPID,
+	SBI_EXT_RFENCE_REMOTE_DMA_SYNC,
 };
 
 enum sbi_ext_time_fid {
@@ -63,6 +65,17 @@ enum sbi_ext_hsm_fid {
 	SBI_EXT_HSM_HART_STATUS,
 };
 
+enum sbi_ext_dma_fid {
+	SBI_DMA_SYNC = 0,
+};
+
+enum sbi_dma_sync_data_direction {
+	SBI_DMA_BIDIRECTIONAL = 0,
+	SBI_DMA_TO_DEVICE = 1,
+	SBI_DMA_FROM_DEVICE = 2,
+	SBI_DMA_NONE = 3,
+};
+
 enum sbi_hsm_hart_status {
 	SBI_HSM_HART_STATUS_STARTED = 0,
 	SBI_HSM_HART_STATUS_STOPPED,
@@ -128,6 +141,9 @@ int sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
 				unsigned long size,
 				unsigned long asid);
 int sbi_probe_extension(int ext);
+void sbi_dma_sync(unsigned long start,
+		  unsigned long size,
+		  enum sbi_dma_sync_data_direction dir);
 
 /* Check if current SBI specification version is 0.1 or not */
 static inline int sbi_spec_is_0_1(void)
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 7402a41..ff8e18b 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -521,6 +521,25 @@ int sbi_probe_extension(int extid)
 }
 EXPORT_SYMBOL(sbi_probe_extension);
 
+void sbi_dma_sync(unsigned long start,
+		  unsigned long size,
+		  enum sbi_dma_sync_data_direction dir)
+{
+#if 0
+	sbi_ecall(SBI_EXT_DMA, SBI_DMA_SYNC, start, size, dir,
+		  0, 0, 0);
+#else
+	/* Just for try, it should be in sbi ecall and will be removed before merged */
+	register unsigned long i asm("a0") = start & ~(L1_CACHE_BYTES - 1);
+
+	for (; i < (start + size); i += L1_CACHE_BYTES)
+		__asm__ __volatile__(".long 0x02b5000b");
+
+	__asm__ __volatile__(".long 0x01b0000b");
+#endif
+}
+EXPORT_SYMBOL(sbi_dma_sync);
+
 static long __sbi_base_ecall(int fid)
 {
 	struct sbiret ret;
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 7ebaef1..b67d956 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -14,6 +14,10 @@ obj-$(CONFIG_MMU) += fault.o pageattr.o
 obj-y += cacheflush.o
 obj-y += context.o
 
+ifeq ($(CONFIG_RISCV_DMA_COHERENT), y)
+obj-y += dma-mapping.o
+endif
+
 ifeq ($(CONFIG_MMU),y)
 obj-$(CONFIG_SMP) += tlbflush.o
 endif
diff --git a/arch/riscv/mm/dma-mapping.c b/arch/riscv/mm/dma-mapping.c
new file mode 100644
index 00000000..f5db60b
--- /dev/null
+++ b/arch/riscv/mm/dma-mapping.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-map-ops.h>
+#include <asm/sbi.h>
+
+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+	void *ptr = page_address(page);
+
+	memset(ptr, 0, size);
+	sbi_dma_sync(page_to_phys(page), size, SBI_DMA_BIDIRECTIONAL);
+}
+
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		sbi_dma_sync(paddr, size, dir);
+		break;
+	default:
+		BUG();
+	}
+}
+
+void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		return;
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		sbi_dma_sync(paddr, size, dir);
+		break;
+	default:
+		BUG();
+	}
+}
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
