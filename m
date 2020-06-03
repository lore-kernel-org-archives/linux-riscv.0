Return-Path: <SRS0=DbTu=7Q=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A938FC433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2020 15:37:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 811FE20679
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2020 15:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AvxDhrSH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 811FE20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tETO9ars3qx4Orm0RFV7MLueBBFZKPD2GEgabqzYEKU=; b=AvxDhrSHV87O/M
	JaQswoHj6TOZEKoW9tNlpPJ485wxstBfLDpfdDh/mcMpy/cacwmtvrvjBv/eKsn2OnK8KZvo5iQxG
	zZvG4Vw0VwEfyLRmQ7G91R4jvHmLDyPoGZ/Y47waHz5JtMQtuZEC7ksWGmnzsEtct0yL3Ox7WQQDD
	h9o6Qul5HL8zCb++e1YNtGWBaXFI1QKg5nA7//prGr+8eLLgGXV23Vw46k2opMb7Y+QQVWWVDyYE5
	mP4ZffeSQDPPIxmFnOlJEJJPbaWBpfMJ15Vf2NrmYPdjfV5vkI/NkvWq9ZqzATwLW5y5E59WESc0t
	0fvWdTsLKR2tumlmGOfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgVSG-0002Vh-RP; Wed, 03 Jun 2020 15:37:24 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgVSD-0002Kc-B4
 for linux-riscv@lists.infradead.org; Wed, 03 Jun 2020 15:37:22 +0000
X-Originating-IP: 90.112.45.105
Received: from debian.home (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BB59E2000F;
 Wed,  3 Jun 2020 15:37:16 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: Get memory below load_pa while ensuring linear
 mapping is PMD aligned
Date: Wed,  3 Jun 2020 11:36:07 -0400
Message-Id: <20200603153608.30056-2-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200603153608.30056-1-alex@ghiti.fr>
References: <20200603153608.30056-1-alex@ghiti.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_083721_515606_AA789F95 
X-CRM114-Status: GOOD (  15.86  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Early page table uses the kernel load address as mapping for PAGE_OFFSET:
that makes memblock remove any memory below the kernel which results in
using only PMD entries for the linear mapping.

By setting MIN_MEMBLOCK_ADDR to 0, we allow this memory to be present
when creating the kernel page table: that potentially allows to use
PUD/PGDIR entries for the linear mapping.

But as the firmware might ask the kernel to remove some part of this
memory, we need to ensure that the physical address targeted by
PAGE_OFFSET is at least aligned on PMD size since otherwise the linear
mapping would use only PTE entries.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/include/asm/page.h |  8 ++++++++
 arch/riscv/mm/init.c          | 24 +++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 5e77fe7f0d6d..b416396fc357 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -100,6 +100,14 @@ typedef struct page *pgtable_t;
 #define PTE_FMT "%08lx"
 #endif
 
+/*
+ * Early page table maps PAGE_OFFSET to load_pa, which may not be the memory
+ * base address and by default MIN_MEMBLOCK_ADDR is equal to __pa(PAGE_OFFSET)
+ * then memblock ignores memory below load_pa: we want this memory to get mapped
+ * as it may allow to use hugepages for linear mapping.
+ */
+#define MIN_MEMBLOCK_ADDR	0
+
 #ifdef CONFIG_MMU
 extern unsigned long va_pa_offset;
 extern unsigned long va_kernel_pa_offset;
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4064639b24e4..9a5c97e091c1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -664,7 +664,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 static void __init setup_vm_final(void)
 {
 	uintptr_t va, map_size;
-	phys_addr_t pa, start, end;
+	phys_addr_t pa, start, end, dram_start;
 	struct memblock_region *reg;
 	static struct vm_struct vm_kernel = { 0 };
 
@@ -676,6 +676,28 @@ static void __init setup_vm_final(void)
 			   __pa_symbol(fixmap_pgd_next),
 			   PGDIR_SIZE, PAGE_TABLE);
 
+	/*
+	 * Make sure that virtual and physical addresses are at least aligned
+	 * on PMD_SIZE, even if we have to lose some memory (< PMD_SIZE)
+	 * otherwise the linear mapping would get mapped using PTE entries.
+	 */
+	dram_start = memblock_start_of_DRAM();
+	if (dram_start & (PMD_SIZE - 1)) {
+		uintptr_t next_dram_start;
+
+		next_dram_start	= (dram_start + PMD_SIZE - 1) & ~(PMD_SIZE - 1);
+		memblock_remove(dram_start, next_dram_start - dram_start);
+		dram_start = next_dram_start;
+	}
+
+	/*
+	 * We started considering PAGE_OFFSET would start at load_pa because
+	 * it was the only piece of information we had, but now make PAGE_OFFSET
+	 * point to the real beginning of the memory area.
+	 */
+	va_pa_offset = PAGE_OFFSET - dram_start;
+	pfn_base = PFN_DOWN(dram_start);
+
 	/* Map all memory banks */
 	for_each_memblock(memory, reg) {
 		start = reg->base;
-- 
2.20.1


