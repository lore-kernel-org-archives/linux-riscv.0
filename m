Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9457FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUoZI1ifjfUqu/kgQ833y/yMza6i/8erUeQYpikfKcg=; b=0AW9oOFVeAl3RM
	3khCbVMMUPYRUamXeDXe7z44R3HrqfK626/+RMk0MN+rnG1DwM07QHrowydU06/lGG6Hal4kiDpHo
	d0XJrhsAqcKB/kRq4Z4O2c+7y/UhmFLfbeCNoSE3c/eLZuTWrDGJ8h77Wab2y3hiKH0YRZgeVM/cJ
	x1zwE1N6ryUg0xMOLvIpLeeg3XfY4zORsrsU65ViaEi/XQ4CTZkTe4g3E+kIAFXtYP3FzT2oVKj+k
	2vxzyi/sPb2DzmAhI1KDCugLh5/XKYEiW8L83zBGdrp3pUydSmj6I5NyKJ/GmtX/q1DJX+aPd+uRT
	1quDA76kOYQ33e3JUtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpqKI-004ZeJ-8x; Wed, 24 Nov 2021 11:20:34 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpqKB-004Zb0-B2
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 11:20:30 +0000
Received: from localhost.localdomain (unknown [124.16.141.242])
 by APP-01 (Coremail) with SMTP id qwCowAAnL_v3H55hpmdRCA--.35989S3;
 Wed, 24 Nov 2021 19:20:24 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v1 1/2] riscv,
 mm: Add Sv57 support based on Sv48 implementation
Date: Wed, 24 Nov 2021 19:20:20 +0800
Message-Id: <20211124112021.788242-2-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211124112021.788242-1-panqinglin2020@iscas.ac.cn>
References: <20211124112021.788242-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAnL_v3H55hpmdRCA--.35989S3
X-Coremail-Antispam: 1UD129KBjvAXoWfuw48Ww15tFyDArW7Jw4kXrb_yoW8uw13Wo
 W8tr43W3WfXr13K397uw1Yqr1UZF1vyrZaqw4Yy3y3tan3X3Wrur40ka1rZa47GFyxKFy3
 u3W0q393XFs3Arn5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUOB7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r18M28IrcIa0x
 kI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
 jcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAa
 c4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
 Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
 6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxw
 AKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4kMxAIw28IcxkI
 7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjqYLJUUUUU==
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_032027_804721_7006FEEC 
X-CRM114-Status: GOOD (  19.90  )
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

This patch adds Sv57 implementation on the top of Alex's Sv48 patchset.
The mmu configuration will be determined on runtime, according to both
mmu HW support and mmu-type field in the dtb. The kernel will try to
set satp mode one by one from the configuration item to Sv39 in 64bit.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
---
 arch/riscv/Kconfig                  |   4 +-
 arch/riscv/include/asm/csr.h        |   1 +
 arch/riscv/include/asm/fixmap.h     |   1 +
 arch/riscv/include/asm/page.h       |   1 +
 arch/riscv/include/asm/pgalloc.h    |  49 ++++++++
 arch/riscv/include/asm/pgtable-64.h | 103 ++++++++++++++++-
 arch/riscv/include/asm/pgtable.h    |   4 +-
 arch/riscv/kernel/cpu.c             |   4 +-
 arch/riscv/mm/init.c                | 169 +++++++++++++++++++++++++---
 9 files changed, 312 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a4cadcd4e785..aac28e96d0e5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -151,7 +151,7 @@ config PAGE_OFFSET
 	hex
 	default 0xC0000000 if 32BIT
 	default 0x80000000 if 64BIT && !MMU
-	default 0xffffc00000000000 if 64BIT
+	default 0xff80000000000000 if 64BIT
 
 config ARCH_FLATMEM_ENABLE
 	def_bool !NUMA
@@ -196,7 +196,7 @@ config FIX_EARLYCON_MEM
 
 config PGTABLE_LEVELS
 	int
-	default 4 if 64BIT
+	default 5 if 64BIT
 	default 2
 
 config LOCKDEP_SUPPORT
diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index ae711692eec9..299abdef0cd6 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -47,6 +47,7 @@
 #define SATP_PPN	_AC(0x00000FFFFFFFFFFF, UL)
 #define SATP_MODE_39	_AC(0x8000000000000000, UL)
 #define SATP_MODE_48	_AC(0x9000000000000000, UL)
+#define SATP_MODE_57	_AC(0xa000000000000000, UL)
 #define SATP_ASID_BITS	16
 #define SATP_ASID_SHIFT	44
 #define SATP_ASID_MASK	_AC(0xFFFF, UL)
diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 58a718573ad6..3cfece8b6568 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -25,6 +25,7 @@ enum fixed_addresses {
 	FIX_PTE,
 	FIX_PMD,
 	FIX_PUD,
+	FIX_P4D,
 	FIX_TEXT_POKE1,
 	FIX_TEXT_POKE0,
 	FIX_EARLYCON_MEM_BASE,
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 63334568a10e..41e0d88234d5 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -37,6 +37,7 @@
  * By default, CONFIG_PAGE_OFFSET value corresponds to SV48 address space so
  * define the PAGE_OFFSET value for SV39.
  */
+#define PAGE_OFFSET_L4		_AC(0xffffc00000000000, UL)
 #define PAGE_OFFSET_L3		_AC(0xffffffe000000000, UL)
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
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
index bbbdd66e5e2f..a01386d4094f 100644
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
@@ -190,4 +229,66 @@ static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
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
+
+static inline struct page *pgd_page(pgd_t pgd)
+{
+	return pfn_to_page(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
+}
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
index 152fc5454c02..922cc436b36b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -49,7 +49,8 @@
  * position vmemmap directly below the VMALLOC region.
  */
 #ifdef CONFIG_64BIT
-#define VA_BITS		(pgtable_l4_enabled ? 48 : 39)
+#define VA_BITS		(pgtable_l5_enabled ? \
+				57 : (pgtable_l4_enabled ? 48 : 39))
 #else
 #define VA_BITS		32
 #endif
@@ -89,7 +90,6 @@
 
 #ifndef __ASSEMBLY__
 
-#include <asm-generic/pgtable-nop4d.h>
 #include <asm/page.h>
 #include <asm/tlbflush.h>
 #include <linux/mm_types.h>
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index dea9b1c31889..e190bd205376 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -78,7 +78,9 @@ static void print_mmu(struct seq_file *f)
 #if defined(CONFIG_32BIT)
 	strncpy(sv_type, "sv32", 5);
 #elif defined(CONFIG_64BIT)
-	if (pgtable_l4_enabled)
+	if (pgtable_l5_enabled)
+		strncpy(sv_type, "sv57", 5);
+	else if (pgtable_l4_enabled)
 		strncpy(sv_type, "sv48", 5);
 	else
 		strncpy(sv_type, "sv39", 5);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0945ac9ed682..81822db8dd10 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -38,12 +38,15 @@ EXPORT_SYMBOL(kernel_map);
 #endif
 
 #ifdef CONFIG_64BIT
-u64 satp_mode = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_48 : SATP_MODE_39;
+u64 satp_mode = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_57 : SATP_MODE_39;
 #else
 u64 satp_mode = SATP_MODE_32;
 #endif
 EXPORT_SYMBOL(satp_mode);
 
+bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL) ?
+				true : false;
+EXPORT_SYMBOL(pgtable_l5_enabled);
 bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL) ?
 				true : false;
 EXPORT_SYMBOL(pgtable_l4_enabled);
@@ -72,6 +75,8 @@ struct pt_alloc_ops {
 	phys_addr_t (*alloc_pmd)(uintptr_t va);
 	pud_t *(*get_pud_virt)(phys_addr_t pa);
 	phys_addr_t (*alloc_pud)(uintptr_t va);
+	p4d_t *(*get_p4d_virt)(phys_addr_t pa);
+	phys_addr_t (*alloc_p4d)(uintptr_t va);
 #endif
 };
 
@@ -285,6 +290,7 @@ pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
 
 pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
+static p4d_t __maybe_unused early_dtb_p4d[PTRS_PER_P4D] __initdata __aligned(PAGE_SIZE);
 static pud_t __maybe_unused early_dtb_pud[PTRS_PER_PUD] __initdata __aligned(PAGE_SIZE);
 static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 
@@ -374,6 +380,16 @@ static pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 #define early_pmd      ((pmd_t *)XIP_FIXUP(early_pmd))
 #endif /* CONFIG_XIP_KERNEL */
 
+static p4d_t trampoline_p4d[PTRS_PER_P4D] __page_aligned_bss;
+static p4d_t fixmap_p4d[PTRS_PER_P4D] __page_aligned_bss;
+static p4d_t early_p4d[PTRS_PER_P4D] __initdata __aligned(PAGE_SIZE);
+
+#ifdef CONFIG_XIP_KERNEL
+#define trampoline_p4d ((p4d_t *)XIP_FIXUP(trampoline_p4d))
+#define fixmap_p4d     ((p4d_t *)XIP_FIXUP(fixmap_p4d))
+#define early_p4d      ((p4d_t *)XIP_FIXUP(early_p4d))
+#endif /* CONFIG_XIP_KERNEL */
+
 static pud_t trampoline_pud[PTRS_PER_PUD] __page_aligned_bss;
 static pud_t fixmap_pud[PTRS_PER_PUD] __page_aligned_bss;
 static pud_t early_pud[PTRS_PER_PUD] __initdata __aligned(PAGE_SIZE);
@@ -487,6 +503,44 @@ static phys_addr_t alloc_pud_late(uintptr_t va)
 	return __pa(vaddr);
 }
 
+static p4d_t *__init get_p4d_virt_early(phys_addr_t pa)
+{
+	return (p4d_t *)((uintptr_t)pa);
+}
+
+static p4d_t *__init get_p4d_virt_fixmap(phys_addr_t pa)
+{
+	clear_fixmap(FIX_P4D);
+	return (p4d_t *)set_fixmap_offset(FIX_P4D, pa);
+}
+
+static p4d_t *__init get_p4d_virt_late(phys_addr_t pa)
+{
+	return (p4d_t *)__va(pa);
+}
+
+static phys_addr_t __init alloc_p4d_early(uintptr_t va)
+{
+	/* Only one P4D is available for early mapping */
+	BUG_ON((va - kernel_map.virt_addr) >> PGDIR_SHIFT);
+
+	return (uintptr_t)early_p4d;
+}
+
+static phys_addr_t __init alloc_p4d_fixmap(uintptr_t va)
+{
+	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
+}
+
+static phys_addr_t alloc_p4d_late(uintptr_t va)
+{
+	unsigned long vaddr;
+
+	vaddr = __get_free_page(GFP_KERNEL);
+	BUG_ON(!vaddr);
+	return __pa(vaddr);
+}
+
 static void __init create_pud_mapping(pud_t *pudp,
 				      uintptr_t va, phys_addr_t pa,
 				      phys_addr_t sz, pgprot_t prot)
@@ -514,21 +568,55 @@ static void __init create_pud_mapping(pud_t *pudp,
 	create_pmd_mapping(nextp, va, pa, sz, prot);
 }
 
-#define pgd_next_t		pud_t
-#define alloc_pgd_next(__va)	(pgtable_l4_enabled ?			\
-		pt_ops.alloc_pud(__va) : pt_ops.alloc_pmd(__va))
-#define get_pgd_next_virt(__pa)	(pgtable_l4_enabled ?			\
-		pt_ops.get_pud_virt(__pa) : (pgd_next_t *)pt_ops.get_pmd_virt(__pa))
+static void __init create_p4d_mapping(p4d_t *p4dp,
+				      uintptr_t va, phys_addr_t pa,
+				      phys_addr_t sz, pgprot_t prot)
+{
+	pud_t *nextp;
+	phys_addr_t next_phys;
+	uintptr_t p4d_index = p4d_index(va);
+
+	if (sz == P4D_SIZE) {
+		if (p4d_val(p4dp[p4d_index]) == 0)
+			p4dp[p4d_index] = pfn_p4d(PFN_DOWN(pa), prot);
+		return;
+	}
+
+	if (p4d_val(p4dp[p4d_index]) == 0) {
+		next_phys = pt_ops.alloc_pud(va);
+		p4dp[p4d_index] = pfn_p4d(PFN_DOWN(next_phys), PAGE_TABLE);
+		nextp = pt_ops.get_pud_virt(next_phys);
+		memset(nextp, 0, PAGE_SIZE);
+	} else {
+		next_phys = PFN_PHYS(_p4d_pfn(p4dp[p4d_index]));
+		nextp = pt_ops.get_pud_virt(next_phys);
+	}
+
+	create_pud_mapping(nextp, va, pa, sz, prot);
+}
+
+#define pgd_next_t		p4d_t
+#define alloc_pgd_next(__va)	(pgtable_l5_enabled ?			\
+		pt_ops.alloc_p4d(__va) : (pgtable_l4_enabled ?		\
+		pt_ops.alloc_pud(__va) : pt_ops.alloc_pmd(__va)))
+#define get_pgd_next_virt(__pa)	(pgtable_l5_enabled ?			\
+		pt_ops.get_p4d_virt(__pa) : (pgd_next_t *)(pgtable_l4_enabled ?	\
+		pt_ops.get_pud_virt(__pa) : (pud_t *)pt_ops.get_pmd_virt(__pa)))
 #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
+				(pgtable_l5_enabled ?			\
+		create_p4d_mapping(__nextp, __va, __pa, __sz, __prot) : \
 				(pgtable_l4_enabled ?			\
-		create_pud_mapping(__nextp, __va, __pa, __sz, __prot) :	\
-		create_pmd_mapping((pmd_t *)__nextp, __va, __pa, __sz, __prot))
-#define fixmap_pgd_next		(pgtable_l4_enabled ?			\
-		(uintptr_t)fixmap_pud : (uintptr_t)fixmap_pmd)
-#define trampoline_pgd_next	(pgtable_l4_enabled ?			\
-		(uintptr_t)trampoline_pud : (uintptr_t)trampoline_pmd)
-#define early_dtb_pgd_next	(pgtable_l4_enabled ?			\
-		(uintptr_t)early_dtb_pud : (uintptr_t)early_dtb_pmd)
+		create_pud_mapping((pud_t *)__nextp, __va, __pa, __sz, __prot) :	\
+		create_pmd_mapping((pmd_t *)__nextp, __va, __pa, __sz, __prot)))
+#define fixmap_pgd_next		(pgtable_l5_enabled ?			\
+		(uintptr_t)fixmap_p4d : (pgtable_l4_enabled ?		\
+		(uintptr_t)fixmap_pud : (uintptr_t)fixmap_pmd))
+#define trampoline_pgd_next	(pgtable_l5_enabled ?			\
+		(uintptr_t)trampoline_p4d : (pgtable_l4_enabled ?	\
+		(uintptr_t)trampoline_pud : (uintptr_t)trampoline_pmd))
+#define early_dtb_pgd_next	(pgtable_l5_enabled ?			\
+		(uintptr_t)early_dtb_p4d : (pgtable_l4_enabled ?	\
+		(uintptr_t)early_dtb_pud : (uintptr_t)early_dtb_pmd))
 #else
 #define pgd_next_t		pte_t
 #define alloc_pgd_next(__va)	pt_ops.alloc_pte(__va)
@@ -537,6 +625,7 @@ static void __init create_pud_mapping(pud_t *pudp,
 	create_pte_mapping(__nextp, __va, __pa, __sz, __prot)
 #define fixmap_pgd_next		((uintptr_t)fixmap_pte)
 #define early_dtb_pgd_next	((uintptr_t)early_dtb_pmd)
+#define create_p4d_mapping(__pmdp, __va, __pa, __sz, __prot)
 #define create_pud_mapping(__pmdp, __va, __pa, __sz, __prot)
 #define create_pmd_mapping(__pmdp, __va, __pa, __sz, __prot)
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -627,6 +716,13 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
 #ifdef CONFIG_64BIT
+static void __init disable_pgtable_l5(void)
+{
+	pgtable_l5_enabled = false;
+	kernel_map.page_offset = PAGE_OFFSET_L4;
+	satp_mode = SATP_MODE_48;
+}
+
 static void __init disable_pgtable_l4(void)
 {
 	pgtable_l4_enabled = false;
@@ -643,8 +739,9 @@ static void __init disable_pgtable_l4(void)
 static __init void set_satp_mode(uintptr_t dtb_pa)
 {
 	u64 identity_satp, hw_satp;
-	uintptr_t set_satp_mode_pmd;
+	uintptr_t set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
 	int cpus_node;
+	bool check_l4 = false;
 
 	/* Check if the user asked for sv39 explicitly in the device tree */
 	cpus_node = fdt_path_offset((void *)dtb_pa, "/cpus");
@@ -658,18 +755,31 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 				continue;
 
 			if (!strcmp(mmu_type, "riscv,sv39")) {
+				disable_pgtable_l5();
 				disable_pgtable_l4();
 				return;
 			}
 
+			if (!strcmp(mmu_type, "riscv,sv48")) {
+				check_l4 = true;
+			}
+
 			break;
 		}
 	}
 
-	set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
+retry:
+	if (check_l4)
+		disable_pgtable_l5();
+
 	create_pgd_mapping(early_pg_dir,
-			   set_satp_mode_pmd, (uintptr_t)early_pud,
+			   set_satp_mode_pmd,
+			   check_l4 ? (uintptr_t)early_pud : (uintptr_t)early_p4d,
 			   PGDIR_SIZE, PAGE_TABLE);
+	if (!check_l4)
+		create_p4d_mapping(early_p4d,
+				set_satp_mode_pmd, (uintptr_t)early_pud,
+				P4D_SIZE, PAGE_TABLE);
 	create_pud_mapping(early_pud,
 			   set_satp_mode_pmd, (uintptr_t)early_pmd,
 			   PUD_SIZE, PAGE_TABLE);
@@ -689,10 +799,16 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 	hw_satp = csr_swap(CSR_SATP, 0ULL);
 	local_flush_tlb_all();
 
-	if (hw_satp != identity_satp)
+	if (hw_satp != identity_satp) {
+		if (!check_l4) {
+			check_l4 = true;
+			goto retry;
+		}
 		disable_pgtable_l4();
+	}
 
 	memset(early_pg_dir, 0, PAGE_SIZE);
+	memset(early_p4d, 0, PAGE_SIZE);
 	memset(early_pud, 0, PAGE_SIZE);
 	memset(early_pmd, 0, PAGE_SIZE);
 }
@@ -766,6 +882,10 @@ static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
 			   PGDIR_SIZE,
 			   IS_ENABLED(CONFIG_64BIT) ? PAGE_TABLE : PAGE_KERNEL);
 
+	if (pgtable_l5_enabled)
+		create_p4d_mapping(early_dtb_p4d, DTB_EARLY_BASE_VA,
+				   (uintptr_t)early_dtb_pud, P4D_SIZE, PAGE_TABLE);
+
 	if (pgtable_l4_enabled)
 		create_pud_mapping(early_dtb_pud, DTB_EARLY_BASE_VA,
 				   (uintptr_t)early_dtb_pmd, PUD_SIZE, PAGE_TABLE);
@@ -802,6 +922,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	pt_ops.get_pmd_virt = get_pmd_virt_early;
 	pt_ops.alloc_pud = alloc_pud_early;
 	pt_ops.get_pud_virt = get_pud_virt_early;
+	pt_ops.alloc_p4d = alloc_p4d_early;
+	pt_ops.get_p4d_virt = get_p4d_virt_early;
 #endif
 
 	kernel_map.virt_addr = KERNEL_LINK_ADDR;
@@ -855,6 +977,10 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 			   fixmap_pgd_next, PGDIR_SIZE, PAGE_TABLE);
 
 #ifndef __PAGETABLE_PMD_FOLDED
+	/* Setup fixmap P4D and PUD */
+	if (pgtable_l5_enabled)
+		create_p4d_mapping(fixmap_p4d, FIXADDR_START,
+				   (uintptr_t)fixmap_pud, P4D_SIZE, PAGE_TABLE);
 	/* Setup fixmap PUD and PMD */
 	if (pgtable_l4_enabled)
 		create_pud_mapping(fixmap_pud, FIXADDR_START,
@@ -864,6 +990,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	/* Setup trampoline PGD and PMD */
 	create_pgd_mapping(trampoline_pg_dir, kernel_map.virt_addr,
 			   trampoline_pgd_next, PGDIR_SIZE, PAGE_TABLE);
+	if (pgtable_l5_enabled)
+		create_p4d_mapping(trampoline_p4d, kernel_map.virt_addr,
+				   (uintptr_t)trampoline_pud, P4D_SIZE, PAGE_TABLE);
 	if (pgtable_l4_enabled)
 		create_pud_mapping(trampoline_pud, kernel_map.virt_addr,
 				   (uintptr_t)trampoline_pmd, PUD_SIZE, PAGE_TABLE);
@@ -938,6 +1067,8 @@ static void __init setup_vm_final(void)
 	pt_ops.get_pmd_virt = get_pmd_virt_fixmap;
 	pt_ops.alloc_pud = alloc_pud_fixmap;
 	pt_ops.get_pud_virt = get_pud_virt_fixmap;
+	pt_ops.alloc_p4d = alloc_p4d_fixmap;
+	pt_ops.get_p4d_virt = get_p4d_virt_fixmap;
 #endif
 	/* Setup swapper PGD for fixmap */
 	create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
@@ -985,6 +1116,8 @@ static void __init setup_vm_final(void)
 	pt_ops.get_pmd_virt = get_pmd_virt_late;
 	pt_ops.alloc_pud = alloc_pud_late;
 	pt_ops.get_pud_virt = get_pud_virt_late;
+	pt_ops.alloc_p4d = alloc_p4d_late;
+	pt_ops.get_p4d_virt = get_p4d_virt_late;
 #endif
 }
 #else
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
