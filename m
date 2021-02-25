Return-Path: <SRS0=t5Vp=H3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B87C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 07:43:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AC2D64E21
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 07:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AC2D64E21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7UZK+Jmk/2yKeX0FAKZdf5K3sO9P8oer9kUIbrLMgKc=; b=s0JaT5VY28lBz7NEAoz6egIdnN
	NThQVyUPRxYEckjEzAfdveTvyxcGcyTR25MXMy/jCP8xyMAYJTMPTa3UzDRYYhyESX0CkqbTSV+6V
	tUZsmDxoLVF67CU74TEgYEr5MzgSU5ijKWjhQQbDNfG0fGu4PKB1UY5FNTDgFK5IEzabekpqx/Fao
	4MjymRAdDXRt2gsbgPJhBwbcmNxTJwxAhQtfrP75g9uovzoJ1yTx3Cn7rOGxMttiqokrsdBVrEJcN
	E8wtnVVV/+DPX+htDeE6PG/oW8cavCxcHfDCUR6CpGO7X623sFRwHVhSnU+YbGX6Cr+dYmnNFvSYV
	4gfxWdxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFBIQ-0004jV-2f; Thu, 25 Feb 2021 07:42:50 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFBIN-0004io-J1
 for linux-riscv@lists.infradead.org; Thu, 25 Feb 2021 07:42:48 +0000
X-Originating-IP: 81.185.161.35
Received: from localhost.localdomain (35.161.185.81.rev.sfr.net
 [81.185.161.35]) (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5FF4F20003;
 Thu, 25 Feb 2021 07:42:39 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nylon Chen <nylon7@andestech.com>, Nick Hu <nickhu@andestech.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: [PATCH] riscv: Add KASAN_VMALLOC support
Date: Thu, 25 Feb 2021 02:42:27 -0500
Message-Id: <20210225074227.3176-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_024247_739834_B9ADD325 
X-CRM114-Status: GOOD (  13.19  )
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

Populate the top-level of the kernel page table to implement KASAN_VMALLOC,
lower levels are filled dynamically upon memory allocation at runtime.

Co-developed-by: Nylon Chen <nylon7@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
Co-developed-by: Nick Hu <nickhu@andestech.com>
Signed-off-by: Nick Hu <nickhu@andestech.com>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/Kconfig         |  1 +
 arch/riscv/mm/kasan_init.c | 35 ++++++++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8eadd1cbd524..3832a537c5d6 100644
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
index 719b6e4d6075..171569df4334 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -142,6 +142,31 @@ static void __init kasan_populate(void *start, void *end)
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
+void __init kasan_shallow_populate(void *start, void *end)
+{
+	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
+	unsigned long vend = PAGE_ALIGN((unsigned long)end);
+
+	kasan_shallow_populate_pgd(vaddr, vend);
+
+	local_flush_tlb_all();
+}
+
 void __init kasan_init(void)
 {
 	phys_addr_t _start, _end;
@@ -149,7 +174,15 @@ void __init kasan_init(void)
 
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
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
