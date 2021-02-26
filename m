Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DE8C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 13:00:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7565F64D9F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 13:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7565F64D9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iKhqn8GoPQVijI+HNfaFwpptTzKs9DX8inB0+HaGuxM=; b=ja1OKjFfXy+nQb6tGK2n2Mro4d
	aCfv/ClMiTompnTuZEvTf15PraETjazt6dvdor09ADcPvrfFihq+0Ik9XrwZW+5rrFdnsAp6eJndU
	MoRlq0VXUrQZVAXcTqid3AkWVNkBH60j5DhURf0M39kUXY4jdU2ZbjLRyOi4mn6ONct8wngOfviI7
	7iKILFp73ruDAhHVFAu2ztey68ySxcbYuXM0Vz9TYuhPUNZi/QpppnBdPyT814mnWuYcNXJbbrxOY
	FiP8t7QOyh0wCRkZ+amBV1LT8sSaimm0J+CvUx6sll/rWIK7TYENB8qVnaylkL10Q5gFlDfGPmjoN
	fg4iyWhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFcj1-0007Up-Cv; Fri, 26 Feb 2021 13:00:07 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFciv-0007Sr-C5
 for linux-riscv@lists.infradead.org; Fri, 26 Feb 2021 13:00:02 +0000
X-Originating-IP: 81.185.174.212
Received: from localhost.localdomain (212.174.185.81.rev.sfr.net
 [81.185.174.212]) (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4FAAF1C000A;
 Fri, 26 Feb 2021 12:59:49 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nylon Chen <nylon7@andestech.com>, Nick Hu <nickhu@andestech.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: [PATCH] riscv: Improve KASAN_VMALLOC support
Date: Fri, 26 Feb 2021 07:59:33 -0500
Message-Id: <20210226125933.32023-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_080001_572186_3941AF8D 
X-CRM114-Status: GOOD (  13.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When KASAN vmalloc region is populated, there is no userspace process and
the page table in use is swapper_pg_dir, so there is no need to read
SATP. Then we can use the same scheme used by kasan_populate_p*d
functions to go through the page table, which harmonizes the code.

In addition, make use of set_pgd that goes through all unused page table
levels, contrary to p*d_populate functions, which makes this function work
whatever the number of page table levels.

And finally, make sure the writes to swapper_pg_dir are visible using
an sfence.vma.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/kasan_init.c | 59 ++++++++++++--------------------------
 1 file changed, 19 insertions(+), 40 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index e3d91f334b57..b0cee8d35938 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -11,18 +11,6 @@
 #include <asm/fixmap.h>
 #include <asm/pgalloc.h>
 
-static __init void *early_alloc(size_t size, int node)
-{
-	void *ptr = memblock_alloc_try_nid(size, size,
-		__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, node);
-
-	if (!ptr)
-		panic("%pS: Failed to allocate %zu bytes align=%zx nid=%d from=%llx\n",
-			__func__, size, size, node, (u64)__pa(MAX_DMA_ADDRESS));
-
-	return ptr;
-}
-
 extern pgd_t early_pg_dir[PTRS_PER_PGD];
 asmlinkage void __init kasan_early_init(void)
 {
@@ -155,38 +143,29 @@ static void __init kasan_populate(void *start, void *end)
 	memset(start, KASAN_SHADOW_INIT, end - start);
 }
 
+void __init kasan_shallow_populate_pgd(unsigned long vaddr, unsigned long end)
+{
+	unsigned long next;
+	void *p;
+	pgd_t *pgd_k = pgd_offset_k(vaddr);
+
+	do {
+		next = pgd_addr_end(vaddr, end);
+		if (pgd_page_vaddr(*pgd_k) == (unsigned long)lm_alias(kasan_early_shadow_pmd)) {
+			p = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+			set_pgd(pgd_k, pfn_pgd(PFN_DOWN(__pa(p)), PAGE_TABLE));
+		}
+	} while (pgd_k++, vaddr = next, vaddr != end);
+}
+
 void __init kasan_shallow_populate(void *start, void *end)
 {
 	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
 	unsigned long vend = PAGE_ALIGN((unsigned long)end);
-	unsigned long pfn;
-	int index;
-	void *p;
-	pud_t *pud_dir, *pud_k;
-	pgd_t *pgd_dir, *pgd_k;
-	p4d_t *p4d_dir, *p4d_k;
-
-	while (vaddr < vend) {
-		index = pgd_index(vaddr);
-		pfn = csr_read(CSR_SATP) & SATP_PPN;
-		pgd_dir = (pgd_t *)pfn_to_virt(pfn) + index;
-		pgd_k = init_mm.pgd + index;
-		pgd_dir = pgd_offset_k(vaddr);
-		set_pgd(pgd_dir, *pgd_k);
-
-		p4d_dir = p4d_offset(pgd_dir, vaddr);
-		p4d_k  = p4d_offset(pgd_k, vaddr);
-
-		vaddr = (vaddr + PUD_SIZE) & PUD_MASK;
-		pud_dir = pud_offset(p4d_dir, vaddr);
-		pud_k = pud_offset(p4d_k, vaddr);
-
-		if (pud_present(*pud_dir)) {
-			p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
-			pud_populate(&init_mm, pud_dir, p);
-		}
-		vaddr += PAGE_SIZE;
-	}
+
+	kasan_shallow_populate_pgd(vaddr, vend);
+
+	local_flush_tlb_all();
 }
 
 void __init kasan_init(void)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
