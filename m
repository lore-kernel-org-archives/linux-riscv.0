Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD3EC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 18:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NIat/WrJKCsYeG5LCxL3pEHEHSIaxYRA7bk2ykPxMJs=; b=yyjI5Dp/XYdkXz
	9SkhVxB2kdh+Q+SF/Ga2FfuRKd9RGrmpfGUgB2u0KAQrzBTNUZglOvW3NqoQJZM31U8TGmQX/nF3G
	duSX/tWMvb8dQz1svojzKmvirlBy8mL+p6Y1ORuXPMnsImLbNDFFEWTkvk/nhT+Tuv3THLZqrb4VC
	iX+1BpmqkxNJQqIJ/mQvTSKdgUcsDe9mLYbqVt46O7jjnsYJ0PE+wg833t9ER+dBqCXvGMdvh0mCJ
	5j7PwOo7l9zvEQlXFAJOrTGK8EAM/vrhYR1U54W/1d9dKGcD1AE/PWAKTOL/XuLUZ/0EQS+lK2ntF
	TKd3lfnG01WcaFCezKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeRI-00F6x9-0B;
	Tue, 19 Dec 2023 18:03:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeRE-00F6us-2o
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 18:03:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12B3B61472;
	Tue, 19 Dec 2023 18:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F40EC433CB;
	Tue, 19 Dec 2023 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009007;
	bh=DsAEkljb9nELe7pOkNsFuedvY7TlIkqM0TVa9ONTLHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qZeIMWFFttxnxsz70F8UouiwH0y4TqZqUR0au/SLYyPTk1mvMoENsBc4ab890iYVP
	 BLByYZiQvFaJaD70giLF0L/HZSuSnQoA27jZ9O0sTHDMS+CV7k5vLv971aK+ISHT0h
	 Q723BOdVl4693wzHnanJbWjMnp8eMfvvBuZL+MqIdTyv4cvHil7xR5nCM9zK5aZIBl
	 duobbluzAihDUQKnsNK7gbSfhRYl4rIktzJyXgaa/afOM+eBTBTEvSSO+NmqV+Zt0X
	 kyvovCVxXTiaOcuXTRROcZOvZHg5P/fqLv8479zyhTaEDOiXIlorhkYKPkcN5VeNZg
	 uIXfSnq44E5/Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 2/4] riscv: tlb: convert __p*d_free_tlb() to inline functions
Date: Wed, 20 Dec 2023 01:50:44 +0800
Message-Id: <20231219175046.2496-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231219175046.2496-1-jszhang@kernel.org>
References: <20231219175046.2496-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_100328_998892_8BDC24A5 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

This is to prepare for enabling MMU_GATHER_RCU_TABLE_FREE.
No functionality changes.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/pgalloc.h | 54 +++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index a12fb83fa1f5..3c5e3bd15f46 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -95,13 +95,16 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 		__pud_free(mm, pud);
 }
 
-#define __pud_free_tlb(tlb, pud, addr)					\
-do {									\
-	if (pgtable_l4_enabled) {					\
-		pagetable_pud_dtor(virt_to_ptdesc(pud));		\
-		tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pud));	\
-	}								\
-} while (0)
+static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
+				  unsigned long addr)
+{
+	if (pgtable_l4_enabled) {
+		struct ptdesc *ptdesc = virt_to_ptdesc(pud);
+
+		pagetable_pud_dtor(ptdesc);
+		tlb_remove_page_ptdesc(tlb, ptdesc);
+	}
+}
 
 #define p4d_alloc_one p4d_alloc_one
 static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
@@ -130,11 +133,12 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 		__p4d_free(mm, p4d);
 }
 
-#define __p4d_free_tlb(tlb, p4d, addr)					\
-do {									\
-	if (pgtable_l5_enabled)						\
-		tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(p4d));	\
-} while (0)
+static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
+				  unsigned long addr)
+{
+	if (pgtable_l5_enabled)
+		tlb_remove_page_ptdesc(tlb, virt_to_ptdesc(p4d));
+}
 #endif /* __PAGETABLE_PMD_FOLDED */
 
 static inline void sync_kernel_mappings(pgd_t *pgd)
@@ -159,19 +163,25 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #ifndef __PAGETABLE_PMD_FOLDED
 
-#define __pmd_free_tlb(tlb, pmd, addr)				\
-do {								\
-	pagetable_pmd_dtor(virt_to_ptdesc(pmd));		\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
-} while (0)
+static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
+				  unsigned long addr)
+{
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
+
+	pagetable_pmd_dtor(ptdesc);
+	tlb_remove_page_ptdesc(tlb, ptdesc);
+}
 
 #endif /* __PAGETABLE_PMD_FOLDED */
 
-#define __pte_free_tlb(tlb, pte, buf)			\
-do {							\
-	pagetable_pte_dtor(page_ptdesc(pte));		\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));\
-} while (0)
+static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
+				  unsigned long addr)
+{
+	struct ptdesc *ptdesc = page_ptdesc(pte);
+
+	pagetable_pte_dtor(ptdesc);
+	tlb_remove_page_ptdesc(tlb, ptdesc);
+}
 #endif /* CONFIG_MMU */
 
 #endif /* _ASM_RISCV_PGALLOC_H */
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
