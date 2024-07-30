Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D89C3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 07:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EH0IhAW/MOVNnp0Yegf/tZ5ue4CKPFt0tBfq6JmxT5Y=; b=Uqjc3gue/L+nWq
	Gfp9kdA08031JqcVGAZEyBpwUriiL9SSOi/3aWf6p6vcSJHJ8XC9KsdInQsZ8PvzRfwKOf7hEO6Mo
	6njrz4YHBjYVgRR84EQTjLl/12i6Ja6PCA7oty6fTKMg0QyMKKtLQQZUXVzGkbDxbNzIfRip1Hb/h
	sjNuU/pZpNMAow+yMgA3k3TPWBWwuIfE1YqgtFakyLiuIuGIsFTCdc2VhqdDOP0RT5fzbkWENfG0m
	ax7gnIv+uCU/e5oE0htQrbB92aTNC62/5tAMVI+1wNHrTRIiNVH3yY+GiXm/cnXNJxKkUo57DsJT1
	86nDw8BLahbIVMGuLWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhBn-0000000DziY-1J8k;
	Tue, 30 Jul 2024 07:22:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhBi-0000000Dzgm-0V9I;
	Tue, 30 Jul 2024 07:22:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3321061DAC;
	Tue, 30 Jul 2024 07:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5824C4AF09;
	Tue, 30 Jul 2024 07:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722324144;
	bh=HFILjDyuOkFueGdpeZ+expeCNrW1pem0IxRTIfXPmJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vja3T5454h4Q+VtrSRmXah9kscyuQ0sdUaWF4cc6GQNdR4jZLqcvzt/NApj4QHVhI
	 pqrlzT+GWHsnAid/s7t2kxwJYFUtrUPlxfokjC/Txb/CQVYpaKg0WAWtESCPzRq71x
	 NXeojkPNmEJrPbsYGdO5TaC1GuWCiXQv76PuZ6FU1/c+ZAWYWlluAS+r9mBDcGbOt5
	 1D/+y4VcHKQVl6RBo7gAGoNGP9Euq87+ecG3V1+RQ5tu2ME9dlPBD4ssUxQBUeIFyI
	 uYUT3ZAY3PQJ/mREouQl40/x4dEbUyqiFsmeMNBhlEBFnnYo1M91KLOZ77KIeR/1sW
	 TD6wdpb7tGFTQ==
From: alexs@kernel.org
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Brian Cain <bcain@quicinc.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lance Yang <ioworker0@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-s390@vger.kernel.org
Cc: Guo Ren <guoren@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Hugh Dickins <hughd@google.com>,
	David Hildenbrand <david@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>
Subject: [RFC PATCH 11/18] mm/pgtable: introduce ptdesc_pfn and use ptdesc in free_pte_range()
Date: Tue, 30 Jul 2024 15:27:12 +0800
Message-ID: <20240730072719.3715016-1-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_002226_295796_EFCA8A2F 
X-CRM114-Status: GOOD (  18.65  )
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

From: Alex Shi <alexs@kernel.org>

Replace pgtable_t by ptdesc in free_pte_range and it's callee pte_free_tlb
series functions. And save some converters now. We have to use type
casting for pmd_pgtable() instead of page_ptdesc() helper since
different arch has different type of pgtable_t.

btw, we can not simplify pmd_ptdesc() via replace pmd_pgtable_page by
pmd_page, since some arch may have no pmd_page yet.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: Anup Patel <anup@brainfault.org>
Cc: Samuel Holland <samuel.holland@sifive.com>
Cc: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-openrisc@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org
Cc: linux-arch@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: x86@kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Nick Piggin <npiggin@gmail.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Breno Leitao <leitao@debian.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Vishal Moola  <vishal.moola@gmail.com>
Cc: Mike Rapoport  <rppt@kernel.org>
---
 arch/arm/include/asm/tlb.h                   |  4 +---
 arch/arm64/include/asm/tlb.h                 |  4 +---
 arch/csky/include/asm/pgalloc.h              |  4 ++--
 arch/hexagon/include/asm/pgalloc.h           |  4 ++--
 arch/loongarch/include/asm/pgalloc.h         |  4 ++--
 arch/m68k/include/asm/motorola_pgalloc.h     |  4 ++--
 arch/openrisc/include/asm/pgalloc.h          |  4 ++--
 arch/powerpc/include/asm/book3s/32/pgalloc.h |  2 +-
 arch/powerpc/include/asm/book3s/64/pgalloc.h |  2 +-
 arch/riscv/include/asm/pgalloc.h             |  8 +++-----
 arch/x86/include/asm/pgalloc.h               |  4 ++--
 arch/x86/mm/pgtable.c                        |  6 +++---
 include/linux/mm.h                           | 14 ++++++++++++++
 mm/memory.c                                  |  3 ++-
 14 files changed, 38 insertions(+), 29 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index f40d06ad5d2a..ed6aa4255518 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -37,10 +37,8 @@ static inline void __tlb_remove_table(void *_table)
 #include <asm-generic/tlb.h>
 
 static inline void
-__pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
+__pte_free_tlb(struct mmu_gather *tlb, struct ptdesc *ptdesc, unsigned long addr)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte);
-
 	pagetable_pte_dtor(ptdesc);
 
 #ifndef CONFIG_ARM_LPAE
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index a947c6e784ed..cee7234af6e7 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -77,11 +77,9 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 			  last_level, tlb_level);
 }
 
-static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
+static inline void __pte_free_tlb(struct mmu_gather *tlb, struct ptdesc *ptdesc,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte);
-
 	pagetable_pte_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 9c84c9012e53..b24b4611436e 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pagetable_pte_dtor(page_ptdesc(pte));		\
-	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
+	pagetable_pte_dtor(pte);			\
+	tlb_remove_page_ptdesc(tlb, pte);		\
 } while (0)
 
 extern void pagetable_init(void);
diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index 55988625e6fb..a3e082e54b74 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -89,8 +89,8 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_pte_dtor((page_ptdesc(pte)));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	pagetable_pte_dtor((pte));				\
+	tlb_remove_page_ptdesc((tlb), (pte));			\
 } while (0)
 
 #endif
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 4e2d6b7ca2ee..c96d7160babc 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -46,8 +46,8 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
-	pagetable_pte_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	pagetable_pte_dtor(pte);				\
+	tlb_remove_page_ptdesc((tlb), pte);			\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/arch/m68k/include/asm/motorola_pgalloc.h b/arch/m68k/include/asm/motorola_pgalloc.h
index f6bb375971dc..f9ee5ec4574d 100644
--- a/arch/m68k/include/asm/motorola_pgalloc.h
+++ b/arch/m68k/include/asm/motorola_pgalloc.h
@@ -44,10 +44,10 @@ static inline void pte_free(struct mm_struct *mm, struct ptdesc *ptdesc)
 	free_pointer_table(ptdesc_page(ptdesc), TABLE_PTE);
 }
 
-static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pgtable,
+static inline void __pte_free_tlb(struct mmu_gather *tlb, struct ptdesc *ptdesc,
 				  unsigned long address)
 {
-	free_pointer_table(pgtable, TABLE_PTE);
+	free_pointer_table(ptdesc_page(ptdesc), TABLE_PTE);
 }
 
 
diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index c6a73772a546..2251d940c3d8 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -68,8 +68,8 @@ extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
-	pagetable_pte_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	pagetable_pte_dtor(pte);			\
+	tlb_remove_page_ptdesc((tlb), (pte));	\
 } while (0)
 
 #endif
diff --git a/arch/powerpc/include/asm/book3s/32/pgalloc.h b/arch/powerpc/include/asm/book3s/32/pgalloc.h
index dd4eb3063175..a435c84d1f9a 100644
--- a/arch/powerpc/include/asm/book3s/32/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/32/pgalloc.h
@@ -64,7 +64,7 @@ static inline void __tlb_remove_table(void *_table)
 	pgtable_free(table, shift);
 }
 
-static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t table,
+static inline void __pte_free_tlb(struct mmu_gather *tlb, struct ptdesc *table,
 				  unsigned long address)
 {
 	pgtable_free_tlb(tlb, table, 0);
diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/include/asm/book3s/64/pgalloc.h
index eb7d2ca59f62..675eca34fe40 100644
--- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
@@ -167,7 +167,7 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	*pmd = __pmd(__pgtable_ptr_val(pte_page) | PMD_VAL_BITS);
 }
 
-static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t table,
+static inline void __pte_free_tlb(struct mmu_gather *tlb, struct ptdesc *table,
 				  unsigned long address)
 {
 	pgtable_free_tlb(tlb, table, PTE_INDEX);
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index f52264304f77..63596efcd528 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -183,13 +183,11 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 
 #endif /* __PAGETABLE_PMD_FOLDED */
 
-static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
+static inline void __pte_free_tlb(struct mmu_gather *tlb, struct ptdesc *pte,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte);
-
-	pagetable_pte_dtor(ptdesc);
-	riscv_tlb_remove_ptdesc(tlb, ptdesc);
+	pagetable_pte_dtor(pte);
+	riscv_tlb_remove_ptdesc(tlb, pte);
 }
 #endif /* CONFIG_MMU */
 
diff --git a/arch/x86/include/asm/pgalloc.h b/arch/x86/include/asm/pgalloc.h
index 497c757b5b98..06a9a5867a86 100644
--- a/arch/x86/include/asm/pgalloc.h
+++ b/arch/x86/include/asm/pgalloc.h
@@ -53,9 +53,9 @@ extern void pgd_free(struct mm_struct *mm, pgd_t *pgd);
 
 extern struct ptdesc *pte_alloc_one(struct mm_struct *);
 
-extern void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte);
+extern void ___pte_free_tlb(struct mmu_gather *tlb, struct ptdesc *pte);
 
-static inline void __pte_free_tlb(struct mmu_gather *tlb, struct page *pte,
+static inline void __pte_free_tlb(struct mmu_gather *tlb, struct ptdesc *pte,
 				  unsigned long address)
 {
 	___pte_free_tlb(tlb, pte);
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index c27d15cd01b9..3cf9c0d25dbd 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -50,10 +50,10 @@ static int __init setup_userpte(char *arg)
 }
 early_param("userpte", setup_userpte);
 
-void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
+void ___pte_free_tlb(struct mmu_gather *tlb, struct ptdesc *pte)
 {
-	pagetable_pte_dtor(page_ptdesc(pte));
-	paravirt_release_pte(page_to_pfn(pte));
+	pagetable_pte_dtor(pte);
+	paravirt_release_pte(ptdesc_pfn(pte));
 	paravirt_tlb_remove_table(tlb, pte);
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 381750f41767..7424f964dff3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2859,6 +2859,20 @@ static inline bool pagetable_is_reserved(struct ptdesc *pt)
 	return folio_test_reserved(ptdesc_folio(pt));
 }
 
+/**
+ * ptdesc_pfn - Return the Page Frame Number of a ptdesc.
+ * @ptdesc: The ptdesc.
+ *
+ * A ptdesc may contain multiple pages.  The pages have consecutive
+ * Page Frame Numbers.
+ *
+ * Return: The Page Frame Number of the first page in the ptdesc.
+ */
+static inline unsigned long ptdesc_pfn(struct ptdesc *ptdesc)
+{
+	return page_to_pfn(ptdesc_page(ptdesc));
+}
+
 /**
  * pagetable_alloc - Allocate pagetables
  * @gfp:    GFP flags
diff --git a/mm/memory.c b/mm/memory.c
index 3014168e7296..27c2f63b7487 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -189,7 +189,8 @@ void mm_trace_rss_stat(struct mm_struct *mm, int member)
 static void free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
 			   unsigned long addr)
 {
-	pgtable_t token = pmd_pgtable(*pmd);
+	struct ptdesc *token = (struct ptdesc *)pmd_pgtable(*pmd);
+
 	pmd_clear(pmd);
 	pte_free_tlb(tlb, token, addr);
 	mm_dec_nr_ptes(tlb->mm);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
