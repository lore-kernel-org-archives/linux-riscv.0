Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A3AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 02:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TX8hRdktelLq9QsyxZPDTrM9q6oob98/cX1iLyY64f4=; b=VHVSosjIgXJgzC
	sawJ+mIK+3ZfSaRH76JhsiHfVMNeDDF2ffZ4ATsy1qYDfQqZA7GeDnq99BgzFsFEqP9h8R+4I35QE
	LHgdLTAAdnloJ2v6J5Kcx1JER9tdouGL8N7M13xPfoLXixhmOeNqgdItJeZr1J+isDr5UeUd5dKfw
	A+oYx11I2Ys5Zi3B4+kXHVAzByiQVfN+AQMZMdy6Fv2CyCjI/vnp4D8umsGruOiTzd4GKrAW6R1dW
	nXoLBGmRmzcIjHnwSbpuLmmDFmuy4fn7i23WqF2gU2n/rxpvZcD6OoxHY7OeW4evTOfz1QVDF0JoB
	SStwPTjlzutE6uMxgoyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCuqX-00E82A-2q; Thu, 27 Jan 2022 02:49:13 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCuqN-00E7yQ-Ka
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 02:49:06 +0000
Received: from localhost.localdomain (unknown [124.16.141.242])
 by APP-01 (Coremail) with SMTP id qwCowADHz8cOCPJhFmwLAA--.8245S6;
 Thu, 27 Jan 2022 10:48:58 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v2 4/4] riscv: mm: Support kasan for sv57
Date: Thu, 27 Jan 2022 10:48:44 +0800
Message-Id: <20220127024844.2413385-5-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127024844.2413385-1-panqinglin2020@iscas.ac.cn>
References: <20220127024844.2413385-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHz8cOCPJhFmwLAA--.8245S6
X-Coremail-Antispam: 1UD129KBjvJXoWxtF1kWr1rur1DXr4xtr4xZwb_yoW3GF4fpa
 47GayvyF4Ykr1qqF4rGryUAr1DJwn3ZFWUKry7KF4S9Fy7Jrykur4kurZIyr4xWrn7CFWF
 ywnYqas8Aws5Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_
 GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I64
 8v4I1lw4CEc2x0rVAKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
 MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
 AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
 80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
 43ZEXa7VUbxR67UUUUU==
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_184904_098506_85C92F1F 
X-CRM114-Status: GOOD (  15.40  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

This patchset add kasan_populate and kasan_shallow_populate for sv57,
and is tested on both qemu and unmatched with CONFIG_KASAN and
CONFIG_KASAN_VMALLOC on.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index f61f7ca6fe0f..3c99b24c9adf 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -111,6 +111,8 @@ static void __init kasan_populate_pud(pgd_t *pgd,
 		 * pt_ops facility.
 		 */
 		base_pud = pt_ops.get_pud_virt(pfn_to_phys(_pgd_pfn(*pgd)));
+	} else if (pgd_none(*pgd)) {
+		base_pud = memblock_alloc(PTRS_PER_PUD * sizeof(pud_t), PAGE_SIZE);
 	} else {
 		base_pud = (pud_t *)pgd_page_vaddr(*pgd);
 		if (base_pud == lm_alias(kasan_early_shadow_pud))
@@ -149,13 +151,72 @@ static void __init kasan_populate_pud(pgd_t *pgd,
 		set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(base_pud)), PAGE_TABLE));
 }
 
-#define kasan_early_shadow_pgd_next			(pgtable_l4_enabled ?	\
+static void __init kasan_populate_p4d(pgd_t *pgd,
+				      unsigned long vaddr, unsigned long end,
+				      bool early)
+{
+	phys_addr_t phys_addr;
+	p4d_t *p4dp, *base_p4d;
+	unsigned long next;
+
+	if (early) {
+		/*
+		 * We can't use pgd_page_vaddr here as it would return a linear
+		 * mapping address but it is not mapped yet, but when populating
+		 * early_pg_dir, we need the physical address and when populating
+		 * swapper_pg_dir, we need the kernel virtual address so use
+		 * pt_ops facility.
+		 */
+		base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(_pgd_pfn(*pgd)));
+	} else {
+		base_p4d = (p4d_t *)pgd_page_vaddr(*pgd);
+		if (base_p4d == lm_alias(kasan_early_shadow_p4d))
+			base_p4d = memblock_alloc(PTRS_PER_PUD * sizeof(p4d_t), PAGE_SIZE);
+	}
+
+	p4dp = base_p4d + p4d_index(vaddr);
+
+	do {
+		next = p4d_addr_end(vaddr, end);
+
+		if (p4d_none(*p4dp) && IS_ALIGNED(vaddr, P4D_SIZE) && (next - vaddr) >= P4D_SIZE) {
+			if (early) {
+				phys_addr = __pa(((uintptr_t)kasan_early_shadow_pud));
+				set_p4d(p4dp, pfn_p4d(PFN_DOWN(phys_addr), PAGE_TABLE));
+				continue;
+			} else {
+				phys_addr = memblock_phys_alloc(P4D_SIZE, P4D_SIZE);
+				if (phys_addr) {
+					set_p4d(p4dp, pfn_p4d(PFN_DOWN(phys_addr), PAGE_KERNEL));
+					continue;
+				}
+			}
+		}
+
+		kasan_populate_pud((pgd_t *)p4dp, vaddr, next, early);
+	} while (p4dp++, vaddr = next, vaddr != end);
+
+	/*
+	 * Wait for the whole P4D to be populated before setting the P4D in
+	 * the page table, otherwise, if we did set the P4D before populating
+	 * it entirely, memblock could allocate a page at a physical address
+	 * where KASAN is not populated yet and then we'd get a page fault.
+	 */
+	if (!early)
+		set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(base_p4d)), PAGE_TABLE));
+}
+
+#define kasan_early_shadow_pgd_next			(pgtable_l5_enabled ?	\
+				(uintptr_t)kasan_early_shadow_p4d :		\
+							(pgtable_l4_enabled ?	\
 				(uintptr_t)kasan_early_shadow_pud :		\
-				(uintptr_t)kasan_early_shadow_pmd)
+				(uintptr_t)kasan_early_shadow_pmd))
 #define kasan_populate_pgd_next(pgdp, vaddr, next, early)			\
+		(pgtable_l5_enabled ?						\
+		kasan_populate_p4d(pgdp, vaddr, next, early) :			\
 		(pgtable_l4_enabled ?						\
 			kasan_populate_pud(pgdp, vaddr, next, early) :		\
-			kasan_populate_pmd((pud_t *)pgdp, vaddr, next))
+			kasan_populate_pmd((pud_t *)pgdp, vaddr, next)))
 
 static void __init kasan_populate_pgd(pgd_t *pgdp,
 				      unsigned long vaddr, unsigned long end,
@@ -219,6 +280,14 @@ asmlinkage void __init kasan_early_init(void)
 					PAGE_TABLE));
 	}
 
+	if (pgtable_l5_enabled) {
+		for (i = 0; i < PTRS_PER_P4D; ++i)
+			set_p4d(kasan_early_shadow_p4d + i,
+				pfn_p4d(PFN_DOWN
+					(__pa(((uintptr_t)kasan_early_shadow_pud))),
+					PAGE_TABLE));
+	}
+
 	kasan_populate_pgd(early_pg_dir + pgd_index(KASAN_SHADOW_START),
 			   KASAN_SHADOW_START, KASAN_SHADOW_END, true);
 
@@ -244,9 +313,27 @@ static void __init kasan_populate(void *start, void *end)
 	memset(start, KASAN_SHADOW_INIT, end - start);
 }
 
+static void __init kasan_shallow_populate_pmd(pgd_t *pgdp,
+					      unsigned long vaddr, unsigned long end)
+{
+	unsigned long next;
+	pmd_t *pmdp, *base_pmd;
+	bool is_kasan_pte;
+
+	base_pmd = (pmd_t *)pgd_page_vaddr(*pgdp);
+	pmdp = base_pmd + pmd_index(vaddr);
+
+	do {
+		next = pmd_addr_end(vaddr, end);
+		is_kasan_pte = (pmd_pgtable(*pmdp) == lm_alias(kasan_early_shadow_pte));
+
+		if (is_kasan_pte)
+			pmd_clear(pmdp);
+	} while (pmdp++, vaddr = next, vaddr != end);
+}
+
 static void __init kasan_shallow_populate_pud(pgd_t *pgdp,
-					      unsigned long vaddr, unsigned long end,
-					      bool kasan_populate)
+					      unsigned long vaddr, unsigned long end)
 {
 	unsigned long next;
 	pud_t *pudp, *base_pud;
@@ -256,21 +343,60 @@ static void __init kasan_shallow_populate_pud(pgd_t *pgdp,
 	base_pud = (pud_t *)pgd_page_vaddr(*pgdp);
 	pudp = base_pud + pud_index(vaddr);
 
-	if (kasan_populate)
-		memcpy(base_pud, (void *)kasan_early_shadow_pgd_next,
-		       sizeof(pud_t) * PTRS_PER_PUD);
-
 	do {
 		next = pud_addr_end(vaddr, end);
 		is_kasan_pmd = (pud_pgtable(*pudp) == lm_alias(kasan_early_shadow_pmd));
 
-		if (is_kasan_pmd) {
-			base_pmd = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-			set_pud(pudp, pfn_pud(PFN_DOWN(__pa(base_pmd)), PAGE_TABLE));
-		}
+		if (!is_kasan_pmd)
+			continue;
+
+		base_pmd = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+		set_pud(pudp, pfn_pud(PFN_DOWN(__pa(base_pmd)), PAGE_TABLE));
+
+		if (IS_ALIGNED(vaddr, PUD_SIZE) && (next - vaddr) >= PUD_SIZE)
+			continue;
+
+		memcpy(base_pmd, (void *)kasan_early_shadow_pmd, PAGE_SIZE);
+		kasan_shallow_populate_pmd((pgd_t *)pudp, vaddr, next);
 	} while (pudp++, vaddr = next, vaddr != end);
 }
 
+static void __init kasan_shallow_populate_p4d(pgd_t *pgdp,
+					      unsigned long vaddr, unsigned long end)
+{
+	unsigned long next;
+	p4d_t *p4dp, *base_p4d;
+	pud_t *base_pud;
+	bool is_kasan_pud;
+
+	base_p4d = (p4d_t *)pgd_page_vaddr(*pgdp);
+	p4dp = base_p4d + p4d_index(vaddr);
+
+	do {
+		next = p4d_addr_end(vaddr, end);
+		is_kasan_pud = (p4d_pgtable(*p4dp) == lm_alias(kasan_early_shadow_pud));
+
+		if (!is_kasan_pud)
+			continue;
+
+		base_pud = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+		set_p4d(p4dp, pfn_p4d(PFN_DOWN(__pa(base_pud)), PAGE_TABLE));
+
+		if (IS_ALIGNED(vaddr, P4D_SIZE) && (next - vaddr) >= P4D_SIZE)
+			continue;
+
+		memcpy(base_pud, (void *)kasan_early_shadow_pud, PAGE_SIZE);
+		kasan_shallow_populate_pud((pgd_t *)p4dp, vaddr, next);
+	} while (p4dp++, vaddr = next, vaddr != end);
+}
+
+#define kasan_shallow_populate_pgd_next(pgdp, vaddr, next)			\
+		(pgtable_l5_enabled ?						\
+		kasan_shallow_populate_p4d(pgdp, vaddr, next) :			\
+		(pgtable_l4_enabled ?						\
+		kasan_shallow_populate_pud(pgdp, vaddr, next) :			\
+		kasan_shallow_populate_pmd(pgdp, vaddr, next)))
+
 static void __init kasan_shallow_populate_pgd(unsigned long vaddr, unsigned long end)
 {
 	unsigned long next;
@@ -291,7 +417,8 @@ static void __init kasan_shallow_populate_pgd(unsigned long vaddr, unsigned long
 		if (IS_ALIGNED(vaddr, PGDIR_SIZE) && (next - vaddr) >= PGDIR_SIZE)
 			continue;
 
-		kasan_shallow_populate_pud(pgd_k, vaddr, next, is_kasan_pgd_next);
+		memcpy(p, (void *)kasan_early_shadow_pgd_next, PAGE_SIZE);
+		kasan_shallow_populate_pgd_next(pgd_k, vaddr, next);
 	} while (pgd_k++, vaddr = next, vaddr != end);
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
