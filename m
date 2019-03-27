Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A34C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7272075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xtt5VAG/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD7272075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cNLS6QLTpPaxSjtgy3+CzYvf3yG475sRbLvuwTryUA=; b=Xtt5VAG/OxAqE/
	8clerxCIQvRE9qXytIpbFmsZ/ka7/kA5yBwzOdsb7W1F5ISIS8lKCsbWbKh6kIuvbF5fKwQ2Z3J8k
	2n4l1Ba3R9okrn4a2GdITPfMVeIaTOUOo1gM8CaijKEs0jdI/+XybpiNXFKMYY9Sua6y6juH18U24
	ebfnuQY/njSKtJZre0JY2E/m/WQezkzyRLQ8ZmdF1M4syzsrcWmdMc1zrhHecoTmp2RfjD6rVp55K
	YjHjRjsWiuNEBSj+EMvw2y3SnCveokY2L84/c8MpglHB0FEAtIvWKvLj2bEgKc/ncilh144AgpMVY
	HSR7MuzM5B00Iel0o56Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9GEQ-0001UM-A4; Wed, 27 Mar 2019 21:37:10 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9GED-0001GV-4c
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 21:37:03 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE3-0006DK-7y; Wed, 27 Mar 2019 15:36:48 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE2-0006Ch-8E; Wed, 27 Mar 2019 15:36:46 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Date: Wed, 27 Mar 2019 15:36:40 -0600
Message-Id: <20190327213643.23789-5-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327213643.23789-1-logang@deltatee.com>
References: <20190327213643.23789-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sbates@raithlin.com, hch@lst.de,
 aou@eecs.berkeley.edu, logang@deltatee.com, anup.patel@wdc.com,
 atish.patra@wdc.com, palmer@sifive.com, paul.walmsley@sifive.com,
 zongbox@gmail.com, rppt@linux.ibm.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH 4/7] RISC-V: Update page tables to cover the whole linear
 mapping
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_143657_538793_70B93EE6 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Zong Li <zongbox@gmail.com>, Stephen Bates <sbates@raithlin.com>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

With the new virtual address changes in an earlier patch, we want the
page tables to cover more of the linear mapping region. Instead of
only mapping from PAGE_OFFSET and up, we instead map starting
from an aligned version of va_pa_offset such that all of the physical
address space will be mapped.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Zong Li <zongbox@gmail.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/riscv/kernel/setup.c |  1 -
 arch/riscv/mm/init.c      | 27 +++++++++++++++------------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index ecb654f6a79e..8286df8be31a 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -59,7 +59,6 @@ EXPORT_SYMBOL(empty_zero_page);
 /* The lucky hart to first increment this variable will boot the other cores */
 atomic_t hart_lottery;
 unsigned long boot_cpu_hartid;
-
 void __init parse_dtb(unsigned int hartid, void *dtb)
 {
 	if (early_init_dt_scan(__va(dtb)))
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b9d50031e78f..315194557c3d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -150,8 +150,8 @@ pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 
 #ifndef __PAGETABLE_PMD_FOLDED
-#define NUM_SWAPPER_PMDS ((uintptr_t)-PAGE_OFFSET >> PGDIR_SHIFT)
-pmd_t swapper_pmd[PTRS_PER_PMD*((-PAGE_OFFSET)/PGDIR_SIZE)] __page_aligned_bss;
+#define NUM_SWAPPER_PMDS ((uintptr_t)-VMALLOC_END >> PGDIR_SHIFT)
+pmd_t swapper_pmd[PTRS_PER_PMD*((-VMALLOC_END)/PGDIR_SIZE)] __page_aligned_bss;
 pmd_t trampoline_pmd[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
 #endif
@@ -180,13 +180,18 @@ asmlinkage void __init setup_vm(void)
 	extern char _start;
 	uintptr_t i;
 	uintptr_t pa = (uintptr_t) &_start;
+	uintptr_t linear_start;
+	uintptr_t off;
 	pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
 
 	va_pa_offset = PAGE_OFFSET - pa;
 	pfn_base = PFN_DOWN(pa);
 
+	linear_start = ALIGN_DOWN(va_pa_offset, PGDIR_SIZE);
+	off = linear_start - va_pa_offset;
+
 	/* Sanity check alignment and size */
-	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
+	BUG_ON(linear_start <= VMALLOC_END);
 	BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
 
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -195,15 +200,14 @@ asmlinkage void __init setup_vm(void)
 			__pgprot(_PAGE_TABLE));
 	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);
 
-	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
-		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
-
+	for (i = 0; i < (-linear_start)/PGDIR_SIZE; ++i) {
+		size_t o = (linear_start >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
 		swapper_pg_dir[o] =
 			pfn_pgd(PFN_DOWN((uintptr_t)swapper_pmd) + i,
 				__pgprot(_PAGE_TABLE));
 	}
 	for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
-		swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);
+		swapper_pmd[i] = pfn_pmd(PFN_DOWN(off + i * PMD_SIZE), prot);
 
 	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
 		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pmd),
@@ -215,11 +219,10 @@ asmlinkage void __init setup_vm(void)
 	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
 		pfn_pgd(PFN_DOWN(pa), prot);
 
-	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
-		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
-
-		swapper_pg_dir[o] =
-			pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
+	for (i = 0; i < (-linear_start)/PGDIR_SIZE; ++i) {
+		size_t o = (linear_start >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
+		swapper_pg_dir[o] = pfn_pgd(PFN_DOWN(off + i * PGDIR_SIZE),
+					    prot);
 	}
 
 	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
