Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8260C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 06:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgj9+tbAyjYUa0UkBXlhHOQkbZoSPIGKNIYk7iXCSWM=; b=UEmjt/RQ91P48r
	8nnBkXqUS2fbif9xPi6M6WTsvoClpdbeUGR/4+wLEkm5OXR+Pxa3kcLEVXkLX9LBGp+hohmHS749+
	XONhD1D+LWzz9TPdQXAXiPoJ0UVYv2ltwOLbAs/uEM77kYCivyVSYxdwfQ9fLTgnMryyY5L5Sqx1e
	pKmYeguzlmc7ZUKtim3wKV9EmTsNFXG2X/kSxm3rMCpUfuZj4z63BfxjARvPdd6OmpHsgoMULZfav
	Mh3GTsbHoeujmM8GVFLDzBnWnHdjBUCnK0RsetzRDyLe3LT9/7uxjdjeYSGQT8zyaesd1WD2YXJy+
	eLlBaTnjaFBxAvMOGb2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYgZt-0000000Ds9P-2wGH;
	Tue, 30 Jul 2024 06:43:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYgZp-0000000Ds5M-0Jfl;
	Tue, 30 Jul 2024 06:43:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B8E46CE0EA6;
	Tue, 30 Jul 2024 06:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469FBC32782;
	Tue, 30 Jul 2024 06:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321793;
	bh=9NZb0rrKQqKYXT4j44hct+A4v/K9XblH1QcI1NJ86wY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uXb4byD4QEB/pykGQSUxfRgInQG2nhMHKXm5xZNegBtn3rrGWMaLewVYiqUNRYDtJ
	 aQ+opzP1rC4aJUxCXkL2wAnqAIW3nIQYdRxHYnksJ0PJsaNlzE/MV3jYxsY7CWC6i6
	 A55O5dfE29WFwTXyQHh6asj1EX4qez2hBgWChYq1nW9wZhzPJt7adzM3dujj4fTqjW
	 GPMlZQsWyciJ/EykTgqqAmIjcZelbGlK8I8ok7QSAhrcTaitTlPHXoD4wXFz71j46R
	 BpZv8MZ6nqA/BUfQ66+uiCN6lG0xAGpqKsFp7FzaM7qSm50/Hdt7uFpAhZjkPrnNQ4
	 JZOzjdQ+jlf0A==
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
	sparclinux@vger.kernel.org,
	Andreas Larsson <andreas@gaisler.com>,
	"David S . Miller" <davem@davemloft.net>,
	Zi Yan <ziy@nvidia.com>
Subject: [RFC PATCH 02/18] mm/pgtable: convert ptdesc.pmd_huge_pte to ptdesc pointer
Date: Tue, 30 Jul 2024 14:46:56 +0800
Message-ID: <20240730064712.3714387-3-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_234317_527504_A48D3703 
X-CRM114-Status: GOOD (  16.00  )
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

folio/page.pmd_huge_pte is a pointer to pagetable descriptor: pgtable_t.
In most arch, it is a typedef of 'struct page *'. But we have ptdesc now,
tt's better to convert it to right one: struct ptdesc pointer.

Different from others, s390/sparc use typedef 'pte_t *' as pgtable_t, so
they need different cost in their arch.

Thanks for lkp found the build issue for s390/sparc, it fixed now.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-mm@kvack.org
Cc: sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox  <willy@infradead.org>
Cc: Mike Rapoport  <rppt@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
---
 arch/s390/mm/pgtable.c   |  6 +++---
 arch/sparc/mm/tlb.c      |  6 +++---
 include/linux/mm_types.h |  4 ++--
 mm/pgtable-generic.c     | 16 ++++++++--------
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index 2c944bafb030..201d350abd1e 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -574,7 +574,7 @@ void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 		INIT_LIST_HEAD(lh);
 	else
 		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
-	pmd_huge_pte(mm, pmdp) = pgtable;
+	pmd_huge_pte(mm, pmdp) = (struct ptdesc *)pgtable;
 }
 
 pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
@@ -586,12 +586,12 @@ pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 
 	/* FIFO */
-	pgtable = pmd_huge_pte(mm, pmdp);
+	pgtable = (pte_t *)pmd_huge_pte(mm, pmdp);
 	lh = (struct list_head *) pgtable;
 	if (list_empty(lh))
 		pmd_huge_pte(mm, pmdp) = NULL;
 	else {
-		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
+		pmd_huge_pte(mm, pmdp) = (struct ptdesc *) lh->next;
 		list_del(lh);
 	}
 	ptep = (pte_t *) pgtable;
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index 8648a50afe88..903825b4c997 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -278,7 +278,7 @@ void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 		INIT_LIST_HEAD(lh);
 	else
 		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
-	pmd_huge_pte(mm, pmdp) = pgtable;
+	pmd_huge_pte(mm, pmdp) = (struct ptdesc *)pgtable;
 }
 
 pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
@@ -289,12 +289,12 @@ pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
 	assert_spin_locked(&mm->page_table_lock);
 
 	/* FIFO */
-	pgtable = pmd_huge_pte(mm, pmdp);
+	pgtable = (pte_t *)pmd_huge_pte(mm, pmdp);
 	lh = (struct list_head *) pgtable;
 	if (list_empty(lh))
 		pmd_huge_pte(mm, pmdp) = NULL;
 	else {
-		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
+		pmd_huge_pte(mm, pmdp) = (struct ptdesc *) lh->next;
 		list_del(lh);
 	}
 	pte_val(pgtable[0]) = 0;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 485424979254..2e3eddf6edc9 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -462,7 +462,7 @@ struct ptdesc {
 		struct list_head pt_list;
 		struct {
 			unsigned long _pt_pad_1;
-			pgtable_t pmd_huge_pte;
+			struct ptdesc *pmd_huge_pte;
 		};
 	};
 	unsigned long __page_mapping;
@@ -948,7 +948,7 @@ struct mm_struct {
 		struct mmu_notifier_subscriptions *notifier_subscriptions;
 #endif
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
-		pgtable_t pmd_huge_pte; /* protected by page_table_lock */
+		struct ptdesc *pmd_huge_pte; /* protected by page_table_lock */
 #endif
 #ifdef CONFIG_NUMA_BALANCING
 		/*
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 2ce714f1dd15..f34a8d115f5b 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -171,8 +171,8 @@ void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 	if (!pmd_huge_pte(mm, pmdp))
 		INIT_LIST_HEAD(&pgtable->lru);
 	else
-		list_add(&pgtable->lru, &pmd_huge_pte(mm, pmdp)->lru);
-	pmd_huge_pte(mm, pmdp) = pgtable;
+		list_add(&pgtable->lru, &pmd_huge_pte(mm, pmdp)->pt_list);
+	pmd_huge_pte(mm, pmdp) = page_ptdesc(pgtable);
 }
 #endif
 
@@ -180,17 +180,17 @@ void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 /* no "address" argument so destroys page coloring of some arch */
 pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
 {
-	pgtable_t pgtable;
+	struct ptdesc *ptdesc;
 
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 
 	/* FIFO */
-	pgtable = pmd_huge_pte(mm, pmdp);
-	pmd_huge_pte(mm, pmdp) = list_first_entry_or_null(&pgtable->lru,
-							  struct page, lru);
+	ptdesc = pmd_huge_pte(mm, pmdp);
+	pmd_huge_pte(mm, pmdp) = list_first_entry_or_null(&ptdesc->pt_list,
+							  struct ptdesc, pt_list);
 	if (pmd_huge_pte(mm, pmdp))
-		list_del(&pgtable->lru);
-	return pgtable;
+		list_del(&ptdesc->pt_list);
+	return ptdesc_page(ptdesc);
 }
 #endif
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
