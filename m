Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B054C04A94
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 10:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oB9o/TIMKA2oq5DSAb5zdnmW3ZPosLPJRNynmbVy0hs=; b=KGod5whbvIUBQE
	bqbGhbjXbEsKncOrPWZHmN5Sp/Sj6Z4cb4FcWl5uNPsqhSoaY5T/AUOAlq183sI5rswZqcRAXBOfT
	nh3JNL6zQ/c4qv5CT6IOWQv2QBD26Ijosgt5rUZuT5Ttaw4RphXh6rS014BZ9FV/3zrLvrUT6A4qB
	lZGhtFyx54oEOh9AB4AUotE4gVtRL+8wNovi0CHU+O4/2ntmVAo4NIMm0KLK/UcCtZWUrwAsGnL4S
	6JDOyxZI/jKnMqJ9pMEmbT4SdER99Jp6ux91KxO5UC/dzBU+c+htqbcPLgLaG4VHYDUi5p0z+dtxr
	Ktpz7g9F/W7YXh40Ri0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQmsV-001z5O-2C;
	Tue, 01 Aug 2023 10:45:23 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQlj6-001S5E-1e
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 09:31:39 +0000
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 3719FXbd068899
	for <linux-riscv@lists.infradead.org>; Tue, 1 Aug 2023 17:15:33 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 37199auJ066580;
	Tue, 1 Aug 2023 17:09:36 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 1 Aug 2023
 17:09:32 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <wangkefeng.wang@huawei.com>, <tongtiangen@huawei.com>,
        <guoren@kernel.org>, <sergey.matyukevich@syntacore.com>,
        <gregkh@linuxfoundation.org>, <ajones@ventanamicro.com>,
        <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <conor.dooley@microchip.com>
CC: <x5710999x@gmail.com>, <tim609@andestech.com>, <cl634@andestech.com>,
        <ycliang@andestech.com>, Dylan Jhong <dylan@andestech.com>
Subject: [PATCH] riscv: Flush stale TLB entry with VMAP_STACK enabled
Date: Tue, 1 Aug 2023 17:09:27 +0800
Message-ID: <20230801090927.2018653-1-dylan@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3719FXbd068899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_023136_999835_A5209C06 
X-CRM114-Status: GOOD (  16.60  )
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

When VMAP_STACK is enabled, the kernel stack will be obtained through
vmalloc(). Normally, we rely on the logic in vmalloc_fault() to update stale
P*D entries covering the vmalloc space in a task's page tables when it first
accesses the problematic region. Unfortunately, this is not sufficient when
the kernel stack resides in the vmalloc region, because vmalloc_fault() is a
C function that needs a stack to run. So we need to ensure that these P*D
entries are up to date *before* the MM switch.

Here's our symptom:
core 0: A speculative load lead the kernel stack load to the TLB before the
        corresponding kernel stack's page table is created.
core 1: Create page table mapping of that kernel stack.
core 0: After a context switch, the kernel attempts to use the stack region.
        However, even if the page table is correct, the stack address mapping
        in the TLB is invalid, leading to subsequent nested exceptions.

This fix is inspired by ARM's approach[*1], commit a1c510d0adc6 ("ARM:
implement support for vmap'ed stacks"), it also performs a TLB flush after
setting up the page tables in vmalloc().

Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
Signed-off-by: Dylan Jhong <dylan@andestech.com>
---
 arch/riscv/include/asm/page.h |  4 ++++
 arch/riscv/mm/tlbflush.c      | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 349fad5e35de..c9b080a72855 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -21,6 +21,10 @@
 #define HPAGE_MASK              (~(HPAGE_SIZE - 1))
 #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
 
+#ifdef CONFIG_VMAP_STACK
+#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PTE_MODIFIED
+#endif
+
 /*
  * PAGE_OFFSET -- the first address of the first page of memory.
  * When not using MMU this corresponds to the first free page in
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index ef701fa83f36..0799978913ee 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -86,3 +86,19 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 	__sbi_tlb_flush_range(vma->vm_mm, start, end - start, PMD_SIZE);
 }
 #endif
+
+#ifdef CONFIG_VMAP_STACK
+/*
+ * Normally, we rely on the logic in vmalloc_fault() to update stale P*D
+ * entries covering the vmalloc space in a task's page tables when it first
+ * accesses the problematic region. Unfortunately, this is not sufficient when
+ * the kernel stack resides in the vmalloc region, because vmalloc_fault() is a
+ * C function that needs a stack to run. So we need to ensure that these P*D
+ * entries are up to date *before* the MM switch.
+ */
+void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
+{
+	if (start < VMALLOC_END && end > VMALLOC_START)
+		flush_tlb_all();
+}
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
