Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CEFC001DE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 08:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4IBxQO9KSJsVMXZEd4kfIOP5liFzzF6y4dSDTn3E0I=; b=4t6GIrfXa217A+
	yHGedDwZecrAFKyJa0hqdGZX9lv9P74/5QSQ+ZvQbqIVV3GO0+erqDMZOeNBCThjg2K1p+2PtAFDV
	NDaIz8WTrrB2NhB+aTDRUocoAhyfD8VvtLrdAkQAQeon7dQQjB3DePzHTTGjn2g/pdQJYBR5JCp9I
	7qrjxYg67+BjCZ6+mKUfLRPcfkRkxSxcZwJHMewP2geetbHWZjnDX3gpIqGQzITG1gfTL1UsiQ+TA
	XHwcu7MJJ1qEb2u/uY0FdJcECx9VjNY+9Uwjk8umi4pJlKGAF6K8WBRUE3iS6b1DjA94veTgnAPCj
	oXA9ZYMv3Tw5JUBxMU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSvWk-00GRDa-0V;
	Mon, 07 Aug 2023 08:23:46 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSvWh-00GRBr-0V
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 08:23:45 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3778NDqf098860;
	Mon, 7 Aug 2023 16:23:13 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 7 Aug 2023
 16:23:10 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <ajones@ventanamicro.com>, <alexghiti@rivosinc.com>,
        <anup@brainfault.org>, <rppt@kernel.org>, <samuel@sholland.org>,
        <panqinglin2020@iscas.ac.cn>, <sergey.matyukevich@syntacore.com>,
        <maz@kernel.org>, <linux-riscv@lists.infradead.org>,
        <conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>
CC: <ycliang@andestech.com>, <x5710999x@gmail.com>, <tim609@andestech.com>,
        Dylan Jhong <dylan@andestech.com>
Subject: [PATCH 1/1] riscv: Implement arch_sync_kernel_mappings() for "preventive" TLB flush
Date: Mon, 7 Aug 2023 16:23:05 +0800
Message-ID: <20230807082305.198784-2-dylan@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807082305.198784-1-dylan@andestech.com>
References: <20230807082305.198784-1-dylan@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3778NDqf098860
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_012343_663300_C5B099C3 
X-CRM114-Status: GOOD (  11.37  )
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

Since RISC-V is a microarchitecture that allows caching invalid entries in the TLB,
it is necessary to issue a "preventive" SFENCE.VMA to ensure that each core obtains
the correct kernel mapping.

The patch implements TLB flushing in arch_sync_kernel_mappings(), ensuring that kernel
page table mappings created via vmap/vmalloc() are updated before switching MM.

Signed-off-by: Dylan Jhong <dylan@andestech.com>
---
 arch/riscv/include/asm/page.h |  2 ++
 arch/riscv/mm/tlbflush.c      | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index b55ba20903ec..6c86ab69687e 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -21,6 +21,8 @@
 #define HPAGE_MASK              (~(HPAGE_SIZE - 1))
 #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
 
+#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PTE_MODIFIED
+
 /*
  * PAGE_OFFSET -- the first address of the first page of memory.
  * When not using MMU this corresponds to the first free page in
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 77be59aadc73..d63364948c85 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -149,3 +149,15 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 	__flush_tlb_range(vma->vm_mm, start, end - start, PMD_SIZE);
 }
 #endif
+
+/*
+ * Since RISC-V is a microarchitecture that allows caching invalid entries in the TLB,
+ * it is necessary to issue a "preventive" SFENCE.VMA to ensure that each core obtains
+ * the correct kernel mapping. arch_sync_kernel_mappings() will ensure that kernel
+ * page table mappings created via vmap/vmalloc() are updated before switching MM.
+ */
+void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
+{
+	if (start < VMALLOC_END && end > VMALLOC_START)
+		flush_tlb_all();
+}
\ No newline at end of file
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
