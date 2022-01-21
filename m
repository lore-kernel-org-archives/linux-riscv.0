Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EDEC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 16:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6rs/cCNS7UPoO1YkqOwb6fbuKYG/G5XrVtJM8t3OVY=; b=mud5VIWzvC3SzI
	SucCk0hMOl2s9Ugk7XMl5WGpdHAsUTHO/lydCouZWGf/8qSKEKl1YzvqZjWbLKl6fC3w3hxNXLHLO
	kmklYIWA7X1b2A6i5U7DFji1kVT/QSSnCipEXpF8ifK38PWmIEPRhcaMBUq7YaQjZMeLIKwHzObM1
	dYWt+92Ah4yjCkZU2Yn8yzakF+ddbIo0PAiN0s/nhLPFpE0ez4ugyH0uqzuGnY/MWv8gT2wWMP73l
	83D1X++QBWnvdAYcU3Gb/Am9nKzmUdB12ddq4dFTjZ7RjAn1Ou9YkxviWGtH7MIiImofkUEa8Wq3X
	68BLB78V1A8PtMZJq3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAwue-00FZa7-RV; Fri, 21 Jan 2022 16:37:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAwuV-00FZUC-2P
 for linux-riscv@lists.infradead.org; Fri, 21 Jan 2022 16:37:13 +0000
Received: from p508fcef5.dip0.t-ipconnect.de ([80.143.206.245]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nAwuO-0008GA-21; Fri, 21 Jan 2022 17:37:04 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, dlustig@nvidia.com,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, huffman@cadence.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com,
 samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v5 09/14] riscv: Fix accessing pfn bits in PTEs for non-32bit
 variants
Date: Fri, 21 Jan 2022 17:36:13 +0100
Message-Id: <20220121163618.351934-10-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121163618.351934-1-heiko@sntech.de>
References: <20220121163618.351934-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_083711_160364_9EF02642 
X-CRM114-Status: GOOD (  16.15  )
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

On rv32 the PFN part of PTEs is defined to use bits [xlen-1:10]
while on rv64 it is defined to use bits [53:10], leaving [63:54]
as reserved.

With upcoming optional extensions like svpbmt these previously
reserved bits will get used so simply right-shifting the PTE
to get the PFN won't be enough.

So introduce a _PAGE_PFN_MASK constant to mask the correct bits
for both rv32 and rv64 before shifting.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/pgtable-32.h   |  8 ++++++++
 arch/riscv/include/asm/pgtable-64.h   | 14 +++++++++++---
 arch/riscv/include/asm/pgtable-bits.h |  6 ------
 arch/riscv/include/asm/pgtable.h      |  6 +++---
 4 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 5b2e79e5bfa5..e266a4fe7f43 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_PGTABLE_32_H
 
 #include <asm-generic/pgtable-nopmd.h>
+#include <linux/bits.h>
 #include <linux/const.h>
 
 /* Size of region mapped by a page global directory */
@@ -16,4 +17,11 @@
 
 #define MAX_POSSIBLE_PHYSMEM_BITS 34
 
+/*
+ * rv32 PTE format:
+ * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
+ *       PFN      reserved for SW   D   A   G   U   X   W   R   V
+ */
+#define _PAGE_PFN_MASK  GENMASK(31, 10)
+
 #endif /* _ASM_RISCV_PGTABLE_32_H */
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 228261aa9628..706f0897437d 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -6,6 +6,7 @@
 #ifndef _ASM_RISCV_PGTABLE_64_H
 #define _ASM_RISCV_PGTABLE_64_H
 
+#include <linux/bits.h>
 #include <linux/const.h>
 
 #define PGDIR_SHIFT     30
@@ -28,6 +29,13 @@ typedef struct {
 
 #define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
 
+/*
+ * rv64 PTE format:
+ * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
+ *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X   W   R   V
+ */
+#define _PAGE_PFN_MASK  GENMASK(53, 10)
+
 static inline int pud_present(pud_t pud)
 {
 	return (pud_val(pud) & _PAGE_PRESENT);
@@ -61,12 +69,12 @@ static inline void pud_clear(pud_t *pudp)
 
 static inline pmd_t *pud_pgtable(pud_t pud)
 {
-	return (pmd_t *)pfn_to_virt(pud_val(pud) >> _PAGE_PFN_SHIFT);
+	return (pmd_t *)pfn_to_virt((pud_val(pud) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 static inline struct page *pud_page(pud_t pud)
 {
-	return pfn_to_page(pud_val(pud) >> _PAGE_PFN_SHIFT);
+	return pfn_to_page((pud_val(pud) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
@@ -76,7 +84,7 @@ static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
 
 static inline unsigned long _pmd_pfn(pmd_t pmd)
 {
-	return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
+	return (pmd_val(pmd) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT;
 }
 
 #define mk_pmd(page, prot)    pfn_pmd(page_to_pfn(page), prot)
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index 2ee413912926..4831122d559d 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -6,12 +6,6 @@
 #ifndef _ASM_RISCV_PGTABLE_BITS_H
 #define _ASM_RISCV_PGTABLE_BITS_H
 
-/*
- * PTE format:
- * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
- *       PFN      reserved for SW   D   A   G   U   X   W   R   V
- */
-
 #define _PAGE_ACCESSED_OFFSET 6
 
 #define _PAGE_PRESENT   (1 << 0)
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index bf204e7c1f74..5cf7465a96c5 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -232,12 +232,12 @@ static inline unsigned long _pgd_pfn(pgd_t pgd)
 
 static inline struct page *pmd_page(pmd_t pmd)
 {
-	return pfn_to_page(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
+	return pfn_to_page((pmd_val(pmd) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 {
-	return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
+	return (unsigned long)pfn_to_virt((pmd_val(pmd) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 static inline pte_t pmd_pte(pmd_t pmd)
@@ -253,7 +253,7 @@ static inline pte_t pud_pte(pud_t pud)
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
-	return (pte_val(pte) >> _PAGE_PFN_SHIFT);
+	return ((pte_val(pte) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 #define pte_page(x)     pfn_to_page(pte_pfn(x))
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
