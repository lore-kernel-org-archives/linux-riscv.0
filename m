Return-Path: <SRS0=IOE3=GT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACBAC433E6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jan 2021 05:59:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5754923A9D
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jan 2021 05:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5754923A9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FFu3F1ImO4Lt/Sk/sHZJCyALTNxQkbMfcMMVBOB4jdw=; b=sMD1lcc68TdrZmevvX529p86f
	mixgTaACIla0IcoWHp8uHvHOcoCKBH3Y5VpGohAkByPlyeCb17P3KzjK6BlE4fsJMaATwOX3xZ2dE
	RRSIakNk4HwjNYGUNvDRHdI5CqKK9vVTUttIIjqCzJgOzS48dvqvuy3S/b9de1DBhWCaVZsKb69Gz
	pCjRbqtL5R+SYN5nm043lmT7zpKN3WGwQmbDMqJNrrzL7jgJwFjQ18A69gBa39PKHGbRg9N5R/q7D
	LPeCFTuu8JmFQwdrYrKRuc+C5oXYNFvLgUWLUHVUZM4rGIhvyAySVtPzIbJjsX3O3wiFpXwJuXTCt
	/78EP0lwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0ecR-00076L-03; Sat, 16 Jan 2021 05:59:27 +0000
Received: from exmail.andestech.com ([60.248.187.195]
 helo=ATCSQR.andestech.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0ecN-00074w-0Q
 for linux-riscv@lists.infradead.org; Sat, 16 Jan 2021 05:59:24 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 10G5tmlX057678;
 Sat, 16 Jan 2021 13:55:48 +0800 (GMT-8)
 (envelope-from nylon7@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0;
 Sat, 16 Jan 2021 13:58:44 +0800
From: Nylon Chen <nylon7@andestech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <kasan-dev@googlegroups.com>
Subject: [PATCH v2 1/1] riscv/kasan: add KASAN_VMALLOC support
Date: Sat, 16 Jan 2021 13:58:35 +0800
Message-ID: <20210116055836.22366-2-nylon7@andestech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210116055836.22366-1-nylon7@andestech.com>
References: <20210116055836.22366-1-nylon7@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 10G5tmlX057678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_005923_480717_EEC3DAF6 
X-CRM114-Status: GOOD (  13.83  )
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
Cc: aou@eecs.berkeley.edu, nickhu@andestech.com, alankao@andestech.com,
 Nylon Chen <nylon7@andestech.com>, nylon7717@gmail.com, glider@google.com,
 paul.walmsley@sifive.com, aryabinin@virtuozzo.com, palmer@dabbelt.com,
 dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

It references to x86/s390 architecture.

So, it doesn't map the early shadow page to cover VMALLOC space.

Prepopulate top level page table for the range that would otherwise be
empty.

lower levels are filled dynamically upon memory allocation while
booting.

Signed-off-by: Nylon Chen <nylon7@andestech.com>
Signed-off-by: Nick Hu <nickhu@andestech.com>
---
 arch/riscv/Kconfig         |  1 +
 arch/riscv/mm/kasan_init.c | 57 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 81b76d44725d..15a2c8088bbe 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -57,6 +57,7 @@ config RISCV
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN if MMU && 64BIT
+	select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_KGDB_QXFER_PKT
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 12ddd1f6bf70..4b9149f963d3 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -9,6 +9,19 @@
 #include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/fixmap.h>
+#include <asm/pgalloc.h>
+
+static __init void *early_alloc(size_t size, int node)
+{
+	void *ptr = memblock_alloc_try_nid(size, size,
+		__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, node);
+
+	if (!ptr)
+		panic("%pS: Failed to allocate %zu bytes align=%zx nid=%d from=%llx\n",
+			__func__, size, size, node, (u64)__pa(MAX_DMA_ADDRESS));
+
+	return ptr;
+}
 
 extern pgd_t early_pg_dir[PTRS_PER_PGD];
 asmlinkage void __init kasan_early_init(void)
@@ -83,6 +96,40 @@ static void __init populate(void *start, void *end)
 	memset(start, 0, end - start);
 }
 
+void __init kasan_shallow_populate(void *start, void *end)
+{
+	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
+	unsigned long vend = PAGE_ALIGN((unsigned long)end);
+	unsigned long pfn;
+	int index;
+	void *p;
+	pud_t *pud_dir, *pud_k;
+	pgd_t *pgd_dir, *pgd_k;
+	p4d_t *p4d_dir, *p4d_k;
+
+	while (vaddr < vend) {
+		index = pgd_index(vaddr);
+		pfn = csr_read(CSR_SATP) & SATP_PPN;
+		pgd_dir = (pgd_t *)pfn_to_virt(pfn) + index;
+		pgd_k = init_mm.pgd + index;
+		pgd_dir = pgd_offset_k(vaddr);
+		set_pgd(pgd_dir, *pgd_k);
+
+		p4d_dir = p4d_offset(pgd_dir, vaddr);
+		p4d_k  = p4d_offset(pgd_k, vaddr);
+
+		vaddr = (vaddr + PUD_SIZE) & PUD_MASK;
+		pud_dir = pud_offset(p4d_dir, vaddr);
+		pud_k = pud_offset(p4d_k, vaddr);
+
+		if (pud_present(*pud_dir)) {
+			p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
+			pud_populate(&init_mm, pud_dir, p);
+		}
+		vaddr += PAGE_SIZE;
+	}
+}
+
 void __init kasan_init(void)
 {
 	phys_addr_t _start, _end;
@@ -90,7 +137,15 @@ void __init kasan_init(void)
 
 	kasan_populate_early_shadow((void *)KASAN_SHADOW_START,
 				    (void *)kasan_mem_to_shadow((void *)
-								VMALLOC_END));
+								VMEMMAP_END));
+	if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
+		kasan_shallow_populate(
+			(void *)kasan_mem_to_shadow((void *)VMALLOC_START),
+			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
+	else
+		kasan_populate_early_shadow(
+			(void *)kasan_mem_to_shadow((void *)VMALLOC_START),
+			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
 
 	for_each_mem_range(i, &_start, &_end) {
 		void *start = (void *)_start;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
