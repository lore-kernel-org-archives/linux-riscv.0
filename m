Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66638C3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 07:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=grEuHdIoGAPr6HqxUDUqLxCEqRTU4wtdgdZrZVVa/KY=; b=C8bf/rkPRpLokq
	wU1+taRjlomgzMmDrLZ0MnbadyGA+s/FySjAm7SjG/F6BmwHMeHNfnIUk7g03N13aJXLgBzUcbEaq
	r20Whdz3IvztG9dkwVljRufYO8aGMG4L0AGQsFrRNAtYCTM2fId3GjZ6pRt+bPhCjzI7iTjJ1FcEo
	vJaWpBuLqlJ/f3OPw9To8UcYSUbKDXpEaqEtZBD3QJXkRWUgu/nWK3MMgKWUnUctbt25urqe9Ke9Q
	pY2pylZNdEtVua4rpTR6lOv3lygWjT1kXdqd6VkIYP56zuoGb0RnaCDmQv50K65HepXuQkUkJjeL4
	qW9r7Uc6AGeWiIM1tigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhDZ-0000000E0gn-2OZe;
	Tue, 30 Jul 2024 07:24:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhDT-0000000E0bM-3sYo;
	Tue, 30 Jul 2024 07:24:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4986CE0EA6;
	Tue, 30 Jul 2024 07:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD3FC32782;
	Tue, 30 Jul 2024 07:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722324253;
	bh=8w3GasCTOtDHhV15ERLHRdppxCj5vRL742PIV75jwC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BNah1I2e6F1QoAnt7xUUiWCMNufC/iZmg+WwLGUeKSjh/ezvW81r2QzGBGhopUnZw
	 T833FXdR7zygKEdg2G+quC5GtOt4OQTzugQai+O+6TupWTHCwZY5BlwYKwXw56TSdq
	 vY34shLfDNHoPzuLCy400CbGOeFlukSJvU0eGFABH99AvKOdaFwdjgHm29H1euM8gA
	 WlrNy3SLd5dfkQ/+cLJx9pG7QYiKRwVC5MJSSW/9dJiRv1LpUoJHsX2N7UJqj6fgKK
	 IO9qGAvc0jLl3AJAX7InSokEu+On5T61pO/8BtUoFF4W/zuaN+246bWmc18jRq3Ct9
	 h3HFRijs52IOw==
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
Subject: [RFC PATCH 18/18] mm/pgtable: pass ptdesc in pte_free_defer
Date: Tue, 30 Jul 2024 15:27:19 +0800
Message-ID: <20240730072719.3715016-8-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730072719.3715016-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
 <20240730072719.3715016-1-alexs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_002416_345405_190B5A4D 
X-CRM114-Status: GOOD (  16.11  )
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

pass ptdesc in pte_free_defer() and use ptdesc in collapse_huge_page().

This patch is immature, there is a issue from pmd_pgtable() conversion
in few archs. The problem need a fix.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-s390@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Mike Rapoport  <rppt@kernel.org>
Cc: Barry Song <baohua@kernel.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>
Cc: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Matthew Wilcox  <willy@infradead.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Vishal Moola  <vishal.moola@gmail.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/pgalloc.h |  2 +-
 arch/s390/include/asm/pgalloc.h    |  2 +-
 arch/s390/mm/pgalloc.c             |  2 +-
 include/linux/pgtable.h            |  2 +-
 mm/khugepaged.c                    | 10 +++++-----
 mm/pgtable-generic.c               |  4 +---
 6 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/pgalloc.h b/arch/powerpc/include/asm/pgalloc.h
index 12520521163e..ca21b67c593f 100644
--- a/arch/powerpc/include/asm/pgalloc.h
+++ b/arch/powerpc/include/asm/pgalloc.h
@@ -47,7 +47,7 @@ static inline void pte_free(struct mm_struct *mm, struct ptdesc *ptepage)
 
 /* arch use pte_free_defer() implementation in arch/powerpc/mm/pgtable-frag.c */
 #define pte_free_defer pte_free_defer
-void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
+void pte_free_defer(struct mm_struct *mm, struct ptdesc *pgtable);
 
 /*
  * Functions that deal with pagetables that could be at any level of
diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index 771494526f6e..a229cee11bbd 100644
--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -144,7 +144,7 @@ static inline void pmd_populate(struct mm_struct *mm,
 
 /* arch use pte_free_defer() implementation in arch/s390/mm/pgalloc.c */
 #define pte_free_defer pte_free_defer
-void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
+void pte_free_defer(struct mm_struct *mm, struct ptdesc *pgtable);
 
 void vmem_map_init(void);
 void *vmem_crst_alloc(unsigned long val);
diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index f691e0fb66a2..c7bb38d85d81 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -214,7 +214,7 @@ static void pte_free_now(struct rcu_head *head)
 	pagetable_pte_dtor_free(ptdesc);
 }
 
-void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
+void pte_free_defer(struct mm_struct *mm, struct ptdesc *pgtable)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 9d256c548f5e..e7b018de1d0f 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -116,7 +116,7 @@ static inline void pte_unmap(pte_t *pte)
 }
 #endif
 
-void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
+void pte_free_defer(struct mm_struct *mm, struct ptdesc *ptdesc);
 
 /* Find an entry in the second-level page table.. */
 #ifndef pmd_offset
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 5b466a1c2136..30cf61d02c1c 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1094,7 +1094,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	LIST_HEAD(compound_pagelist);
 	pmd_t *pmd, _pmd;
 	pte_t *pte;
-	pgtable_t pgtable;
+	struct ptdesc *ptdesc;
 	struct folio *folio;
 	spinlock_t *pmd_ptl, *pte_ptl;
 	int result = SCAN_FAIL;
@@ -1223,7 +1223,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	 * write.
 	 */
 	__folio_mark_uptodate(folio);
-	pgtable = pmd_pgtable(_pmd);
+	ptdesc = pmd_ptdesc(&_pmd);
 
 	_pmd = mk_huge_pmd(&folio->page, vma->vm_page_prot);
 	_pmd = maybe_pmd_mkwrite(pmd_mkdirty(_pmd), vma);
@@ -1232,7 +1232,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	BUG_ON(!pmd_none(*pmd));
 	folio_add_new_anon_rmap(folio, vma, address, RMAP_EXCLUSIVE);
 	folio_add_lru_vma(folio, vma);
-	pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
+	pgtable_trans_huge_deposit(mm, pmd, ptdesc);
 	set_pmd_at(mm, address, pmd, _pmd);
 	update_mmu_cache_pmd(vma, address, pmd);
 	spin_unlock(pmd_ptl);
@@ -1664,7 +1664,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 
 	mm_dec_nr_ptes(mm);
 	page_table_check_pte_clear_range(mm, haddr, pgt_pmd);
-	pte_free_defer(mm, pmd_pgtable(pgt_pmd));
+	pte_free_defer(mm, pmd_ptdesc(&pgt_pmd));
 
 maybe_install_pmd:
 	/* step 5: install pmd entry */
@@ -1777,7 +1777,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 		if (retracted) {
 			mm_dec_nr_ptes(mm);
 			page_table_check_pte_clear_range(mm, addr, pgt_pmd);
-			pte_free_defer(mm, pmd_pgtable(pgt_pmd));
+			pte_free_defer(mm, pmd_ptdesc(&pgt_pmd));
 		}
 	}
 	i_mmap_unlock_read(mapping);
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 5e763682941d..f3bc2b17893a 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -244,10 +244,8 @@ static void pte_free_now(struct rcu_head *head)
 	pte_free(NULL /* mm not passed and not used */, ptdesc);
 }
 
-void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
+void pte_free_defer(struct mm_struct *mm, struct ptdesc *ptdesc)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pgtable);
-
 	call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
 }
 #endif /* pte_free_defer */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
