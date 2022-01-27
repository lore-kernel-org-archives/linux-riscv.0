Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C75BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 02:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+RVMCeW7xcHYt6zvku51D5BZOocI8kw1FZV277g2vs=; b=L6d8fRZJ/sKWzZ
	/KpoK0BMxGLivxAMXPbMkW/Zr4Ph1Utx7EZEmESGJ86vBvyPujbxaox0rNAhhnUWI/HVTbdIn05jk
	lOJEXtHkADQm2BRtUNPO/ToCJfNoEt4q7e8oRSfWaIp8RLkcz2fsinfzWKz8b6zsPPrzoj0oxbuqR
	BICZnx2tAV8NSxoR6EaE8YoMYcc1zowKVs+AMWKj85JzmMKz/At9JpOYoB3DVbak2h18WZYFBEW4i
	0T0u7Ga5I/PBdTzJ2+HcNmqHnpizeu/qoWbofyK6EiL1xZs1EUfQ8rDvAacdLBfP/JEWe6Ply5e2m
	Vgja8jj9naAj6UyUlYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCuqQ-00E7zB-6i; Thu, 27 Jan 2022 02:49:06 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCuqL-00E7xh-Lo
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 02:49:04 +0000
Received: from localhost.localdomain (unknown [124.16.141.242])
 by APP-01 (Coremail) with SMTP id qwCowADHz8cOCPJhFmwLAA--.8245S3;
 Thu, 27 Jan 2022 10:48:52 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v2 1/4] riscv: mm: Control p4d's folding by pgtable_l5_enabled
Date: Thu, 27 Jan 2022 10:48:41 +0800
Message-Id: <20220127024844.2413385-2-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127024844.2413385-1-panqinglin2020@iscas.ac.cn>
References: <20220127024844.2413385-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHz8cOCPJhFmwLAA--.8245S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKF1xZFy5XF1kWw4rtF4Utwb_yoW3Zr4xpF
 s7JFy0v3y5JF97Kay7trykXr13X39xWa45Kr9Fga4vvay5trWkJF1vvrWUtF18Xr9YvFyr
 KFsIg3W5C397X37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
 nxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
 1lw4CEc2x0rVAKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
 3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
 WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
 cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z280aV
 AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
 Xa7VUjNJ57UUUUU==
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_184902_154641_B5728A2C 
X-CRM114-Status: GOOD (  11.50  )
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

To determine pgtable level at boot time, we can not use helper functions
in include/asm-generic/pgtable-nop4d.h and must implement these
functions. This patch uses pgtable_l5_enabled variable instead of
including pgtable-nop4d.h to controle p4d's folding, and implements
corresponding helper functions.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 11823004b87a..947f23d7b6af 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -59,6 +59,26 @@ static inline void p4d_populate_safe(struct mm_struct *mm, p4d_t *p4d,
 	}
 }
 
+static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
+{
+	if (pgtable_l5_enabled) {
+		unsigned long pfn = virt_to_pfn(p4d);
+
+		set_pgd(pgd, __pgd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
+	}
+}
+
+static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
+				     p4d_t *p4d)
+{
+	if (pgtable_l5_enabled) {
+		unsigned long pfn = virt_to_pfn(p4d);
+
+		set_pgd_safe(pgd,
+			     __pgd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
+	}
+}
+
 #define pud_alloc_one pud_alloc_one
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
@@ -76,6 +96,35 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 }
 
 #define __pud_free_tlb(tlb, pud, addr)  pud_free((tlb)->mm, pud)
+
+#define p4d_alloc_one p4d_alloc_one
+static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
+{
+	if (pgtable_l5_enabled) {
+		gfp_t gfp = GFP_PGTABLE_USER;
+
+		if (mm == &init_mm)
+			gfp = GFP_PGTABLE_KERNEL;
+		return (p4d_t *)get_zeroed_page(gfp);
+	}
+
+	return NULL;
+}
+
+static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
+{
+	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
+	free_page((unsigned long)p4d);
+}
+
+#define p4d_free p4d_free
+static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
+{
+	if (pgtable_l5_enabled)
+		__p4d_free(mm, p4d);
+}
+
+#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
 #endif /* __PAGETABLE_PMD_FOLDED */
 
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index bbbdd66e5e2f..7e246e9f8d70 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -9,16 +9,24 @@
 #include <linux/const.h>
 
 extern bool pgtable_l4_enabled;
+extern bool pgtable_l5_enabled;
 
 #define PGDIR_SHIFT_L3  30
 #define PGDIR_SHIFT_L4  39
+#define PGDIR_SHIFT_L5  48
 #define PGDIR_SIZE_L3   (_AC(1, UL) << PGDIR_SHIFT_L3)
 
-#define PGDIR_SHIFT     (pgtable_l4_enabled ? PGDIR_SHIFT_L4 : PGDIR_SHIFT_L3)
+#define PGDIR_SHIFT     (pgtable_l5_enabled ? PGDIR_SHIFT_L5 : \
+		(pgtable_l4_enabled ? PGDIR_SHIFT_L4 : PGDIR_SHIFT_L3))
 /* Size of region mapped by a page global directory */
 #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
 #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
 
+/* p4d is folded into pgd in case of 4-level page table */
+#define P4D_SHIFT      39
+#define P4D_SIZE       (_AC(1, UL) << P4D_SHIFT)
+#define P4D_MASK       (~(P4D_SIZE - 1))
+
 /* pud is folded into pgd in case of 3-level page table */
 #define PUD_SHIFT      30
 #define PUD_SIZE       (_AC(1, UL) << PUD_SHIFT)
@@ -29,6 +37,15 @@ extern bool pgtable_l4_enabled;
 #define PMD_SIZE        (_AC(1, UL) << PMD_SHIFT)
 #define PMD_MASK        (~(PMD_SIZE - 1))
 
+/* Page 4th Directory entry */
+typedef struct {
+	unsigned long p4d;
+} p4d_t;
+
+#define p4d_val(x)	((x).p4d)
+#define __p4d(x)	((p4d_t) { (x) })
+#define PTRS_PER_P4D	(PAGE_SIZE / sizeof(p4d_t))
+
 /* Page Upper Directory entry */
 typedef struct {
 	unsigned long pud;
@@ -99,6 +116,15 @@ static inline struct page *pud_page(pud_t pud)
 	return pfn_to_page(pud_val(pud) >> _PAGE_PFN_SHIFT);
 }
 
+#define mm_p4d_folded  mm_p4d_folded
+static inline bool mm_p4d_folded(struct mm_struct *mm)
+{
+	if (pgtable_l5_enabled)
+		return false;
+
+	return true;
+}
+
 #define mm_pud_folded  mm_pud_folded
 static inline bool mm_pud_folded(struct mm_struct *mm)
 {
@@ -128,6 +154,9 @@ static inline unsigned long _pmd_pfn(pmd_t pmd)
 #define pud_ERROR(e)   \
 	pr_err("%s:%d: bad pud %016lx.\n", __FILE__, __LINE__, pud_val(e))
 
+#define p4d_ERROR(e)   \
+	pr_err("%s:%d: bad p4d %016lx.\n", __FILE__, __LINE__, p4d_val(e))
+
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
 	if (pgtable_l4_enabled)
@@ -166,6 +195,16 @@ static inline void p4d_clear(p4d_t *p4d)
 		set_p4d(p4d, __p4d(0));
 }
 
+static inline p4d_t pfn_p4d(unsigned long pfn, pgprot_t prot)
+{
+	return __p4d((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
+}
+
+static inline unsigned long _p4d_pfn(p4d_t p4d)
+{
+	return p4d_val(p4d) >> _PAGE_PFN_SHIFT;
+}
+
 static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
 	if (pgtable_l4_enabled)
@@ -173,6 +212,7 @@ static inline pud_t *p4d_pgtable(p4d_t p4d)
 
 	return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
 }
+#define p4d_page_vaddr(p4d)	((unsigned long)p4d_pgtable(p4d))
 
 static inline struct page *p4d_page(p4d_t p4d)
 {
@@ -190,4 +230,68 @@ static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 	return (pud_t *)p4d;
 }
 
+static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
+{
+	if (pgtable_l5_enabled)
+		*pgdp = pgd;
+	else
+		set_p4d((p4d_t *)pgdp, (p4d_t){ pgd_val(pgd) });
+}
+
+static inline int pgd_none(pgd_t pgd)
+{
+	if (pgtable_l5_enabled)
+		return (pgd_val(pgd) == 0);
+
+	return 0;
+}
+
+static inline int pgd_present(pgd_t pgd)
+{
+	if (pgtable_l5_enabled)
+		return (pgd_val(pgd) & _PAGE_PRESENT);
+
+	return 1;
+}
+
+static inline int pgd_bad(pgd_t pgd)
+{
+	if (pgtable_l5_enabled)
+		return !pgd_present(pgd);
+
+	return 0;
+}
+
+static inline void pgd_clear(pgd_t *pgd)
+{
+	if (pgtable_l5_enabled)
+		set_pgd(pgd, __pgd(0));
+}
+
+static inline p4d_t *pgd_pgtable(pgd_t pgd)
+{
+	if (pgtable_l5_enabled)
+		return (p4d_t *)pfn_to_virt(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
+
+	return (p4d_t *)p4d_pgtable((p4d_t) { pgd_val(pgd) });
+}
+#define pgd_page_vaddr(pgd)	((unsigned long)pgd_pgtable(pgd))
+
+static inline struct page *pgd_page(pgd_t pgd)
+{
+	return pfn_to_page(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
+}
+#define pgd_page(pgd)	pgd_page(pgd)
+
+#define p4d_index(addr) (((addr) >> P4D_SHIFT) & (PTRS_PER_P4D - 1))
+
+#define p4d_offset p4d_offset
+static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
+{
+	if (pgtable_l5_enabled)
+		return pgd_pgtable(*pgd) + p4d_index(address);
+
+	return (p4d_t *)pgd;
+}
+
 #endif /* _ASM_RISCV_PGTABLE_64_H */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7e949f25c933..58fece3133e9 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -62,7 +62,8 @@
  * position vmemmap directly below the VMALLOC region.
  */
 #ifdef CONFIG_64BIT
-#define VA_BITS		(pgtable_l4_enabled ? 48 : 39)
+#define VA_BITS		(pgtable_l5_enabled ? \
+				57 : (pgtable_l4_enabled ? 48 : 39))
 #else
 #define VA_BITS		32
 #endif
@@ -102,7 +103,6 @@
 
 #ifndef __ASSEMBLY__
 
-#include <asm-generic/pgtable-nop4d.h>
 #include <asm/page.h>
 #include <asm/tlbflush.h>
 #include <linux/mm_types.h>
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index cf4d018b7d66..9e4ed02e3d56 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -45,7 +45,9 @@ u64 satp_mode = SATP_MODE_32;
 EXPORT_SYMBOL(satp_mode);
 
 bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
+bool pgtable_l5_enabled = false;
 EXPORT_SYMBOL(pgtable_l4_enabled);
+EXPORT_SYMBOL(pgtable_l5_enabled);
 
 phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
