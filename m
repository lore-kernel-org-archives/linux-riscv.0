Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A2FC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 07:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsD1FPpC40yfMpSwOtz9dI2/BqkO/6hyX1rJgknTcz4=; b=BEAUcTxgxV25TI
	Df/pEl+UXUo/bFe4kla2QJoQmGk1suBWG4b982dzyVlKzPqa2cOlriYSYQm8L+K38TIIr2cEiPhjI
	O9mU7lEI2Lo0zuMdAC5Jl/OtHsdvfJ+gDtZGXI70VGEMbBaj1DSYc7L94+KULvhoiAPvCKMpa3ufI
	YVS4y+Ny+eewB5uAiSA7u770mPWzbVLe1q/4azSk2WSxYipiqJfUt3c+8QVAnrrCkcqS1W8sA8RhS
	Z6vZmRXeUs9vTCuLuUR9ZYvicUj26xzhggGK0j6+/XPFi34BwineIDo6MquGqbnWuYw0BXLi8Or+R
	GqAryLdrIkAvr/oRi0sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFUzZ-00DCUZ-0K;
	Tue, 19 Dec 2023 07:58:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFUzT-00DCOI-0h
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 07:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702972690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+0dGl/nMUgxPM498YSXtipz9Gb3hgqO7wNjJOzkT+E=;
	b=DjsVNijP2RIyQD2rxMvaygbTFJGyeiJO3zWSbJ9aKYe5t1622tX5WosNXHiE4s+cqGmMwP
	UUufmcEC44biJsD/L1FRj45Nv+XYnzBQRwDJtzofzgkRnNveex1OvtF613Y4eHk7pVEI6I
	dC6gBxOgnnImrGK1rc0zPSeDyfwmcm0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-9aIBjkYHNgawgyAMHjSpHg-1; Tue, 19 Dec 2023 02:58:05 -0500
X-MC-Unique: 9aIBjkYHNgawgyAMHjSpHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82F6C83BA88;
	Tue, 19 Dec 2023 07:58:04 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7CD92026D66;
	Tue, 19 Dec 2023 07:57:53 +0000 (UTC)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	linuxppc-dev@lists.ozlabs.org,
	Rik van Riel <riel@surriel.com>,
	linux-riscv@lists.infradead.org,
	Yang Shi <shy828301@gmail.com>,
	James Houghton <jthoughton@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	peterx@redhat.com,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH 11/13] mm/gup: Handle huge pmd for follow_pmd_mask()
Date: Tue, 19 Dec 2023 15:55:36 +0800
Message-ID: <20231219075538.414708-12-peterx@redhat.com>
In-Reply-To: <20231219075538.414708-1-peterx@redhat.com>
References: <20231219075538.414708-1-peterx@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_235811_435218_A7F4DE41 
X-CRM114-Status: GOOD (  23.91  )
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

From: Peter Xu <peterx@redhat.com>

Replace pmd_trans_huge() with pmd_thp_or_huge() to also cover pmd_huge() as
long as enabled.

FOLL_TOUCH and FOLL_SPLIT_PMD only apply to THP, not yet huge.

Since now follow_trans_huge_pmd() can process hugetlb pages, renaming it
into follow_huge_pmd() to match what it does.  Move it into gup.c so not
depend on CONFIG_THP.

When at it, move the ctx->page_mask setup into follow_huge_pmd(), only set
it when the page is valid.  It was not a bug to set it before even if GUP
failed (page==NULL), because follow_page_mask() callers always ignores
page_mask if so.  But doing so makes the code cleaner.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c         | 107 ++++++++++++++++++++++++++++++++++++++++++++---
 mm/huge_memory.c |  86 +------------------------------------
 mm/internal.h    |   5 +--
 3 files changed, 105 insertions(+), 93 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 5b14f91d2f6b..080dff79b650 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -580,6 +580,93 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
 
 	return page;
 }
+
+/* FOLL_FORCE can write to even unwritable PMDs in COW mappings. */
+static inline bool can_follow_write_pmd(pmd_t pmd, struct page *page,
+					struct vm_area_struct *vma,
+					unsigned int flags)
+{
+	/* If the pmd is writable, we can write to the page. */
+	if (pmd_write(pmd))
+		return true;
+
+	/* Maybe FOLL_FORCE is set to override it? */
+	if (!(flags & FOLL_FORCE))
+		return false;
+
+	/* But FOLL_FORCE has no effect on shared mappings */
+	if (vma->vm_flags & (VM_MAYSHARE | VM_SHARED))
+		return false;
+
+	/* ... or read-only private ones */
+	if (!(vma->vm_flags & VM_MAYWRITE))
+		return false;
+
+	/* ... or already writable ones that just need to take a write fault */
+	if (vma->vm_flags & VM_WRITE)
+		return false;
+
+	/*
+	 * See can_change_pte_writable(): we broke COW and could map the page
+	 * writable if we have an exclusive anonymous page ...
+	 */
+	if (!page || !PageAnon(page) || !PageAnonExclusive(page))
+		return false;
+
+	/* ... and a write-fault isn't required for other reasons. */
+	if (vma_soft_dirty_enabled(vma) && !pmd_soft_dirty(pmd))
+		return false;
+	return !userfaultfd_huge_pmd_wp(vma, pmd);
+}
+
+static struct page *follow_huge_pmd(struct vm_area_struct *vma,
+				    unsigned long addr, pmd_t *pmd,
+				    unsigned int flags,
+				    struct follow_page_context *ctx)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	pmd_t pmdval = *pmd;
+	struct page *page;
+	int ret;
+
+	assert_spin_locked(pmd_lockptr(mm, pmd));
+
+	page = pmd_page(pmdval);
+	VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
+
+	if ((flags & FOLL_WRITE) &&
+	    !can_follow_write_pmd(pmdval, page, vma, flags))
+		return NULL;
+
+	/* Avoid dumping huge zero page */
+	if ((flags & FOLL_DUMP) && is_huge_zero_pmd(pmdval))
+		return ERR_PTR(-EFAULT);
+
+	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(vma, flags))
+		return NULL;
+
+	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
+		return ERR_PTR(-EMLINK);
+
+	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
+			!PageAnonExclusive(page), page);
+
+	ret = try_grab_page(page, flags);
+	if (ret)
+		return ERR_PTR(ret);
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	if (pmd_trans_huge(pmdval) && (flags & FOLL_TOUCH))
+		touch_pmd(vma, addr, pmd, flags & FOLL_WRITE);
+#endif	/* CONFIG_TRANSPARENT_HUGEPAGE */
+
+	page += (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
+	ctx->page_mask = HPAGE_PMD_NR - 1;
+	VM_BUG_ON_PAGE(!PageCompound(page) && !is_zone_device_page(page), page);
+
+	return page;
+}
+
 #else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
 static struct page *follow_huge_pud(struct vm_area_struct *vma,
 				    unsigned long addr, pud_t *pudp,
@@ -587,6 +674,14 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
 {
 	return NULL;
 }
+
+static struct page *follow_huge_pmd(struct vm_area_struct *vma,
+				    unsigned long addr, pmd_t *pmd,
+				    unsigned int flags,
+				    struct follow_page_context *ctx)
+{
+	return NULL;
+}
 #endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
 
 static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
@@ -784,31 +879,31 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 			return page;
 		return no_page_table(vma, flags, address);
 	}
-	if (likely(!pmd_trans_huge(pmdval)))
+	if (likely(!pmd_thp_or_huge(pmdval)))
 		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
 
 	if (pmd_protnone(pmdval) && !gup_can_follow_protnone(vma, flags))
 		return no_page_table(vma, flags, address);
 
 	ptl = pmd_lock(mm, pmd);
-	if (unlikely(!pmd_present(*pmd))) {
+	pmdval = *pmd;
+	if (unlikely(!pmd_present(pmdval))) {
 		spin_unlock(ptl);
 		return no_page_table(vma, flags, address);
 	}
-	if (unlikely(!pmd_trans_huge(*pmd))) {
+	if (unlikely(!pmd_thp_or_huge(pmdval))) {
 		spin_unlock(ptl);
 		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
 	}
-	if (flags & FOLL_SPLIT_PMD) {
+	if (pmd_trans_huge(pmdval) && (flags & FOLL_SPLIT_PMD)) {
 		spin_unlock(ptl);
 		split_huge_pmd(vma, pmd, address);
 		/* If pmd was left empty, stuff a page table in there quickly */
 		return pte_alloc(mm, pmd) ? ERR_PTR(-ENOMEM) :
 			follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
 	}
-	page = follow_trans_huge_pmd(vma, address, pmd, flags);
+	page = follow_huge_pmd(vma, address, pmd, flags, ctx);
 	spin_unlock(ptl);
-	ctx->page_mask = HPAGE_PMD_NR - 1;
 	return page;
 }
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index def1dbe0d7e8..930c59d7ceab 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1216,8 +1216,8 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pud);
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
-static void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
-		      pmd_t *pmd, bool write)
+void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	       pmd_t *pmd, bool write)
 {
 	pmd_t _pmd;
 
@@ -1570,88 +1570,6 @@ static inline bool can_change_pmd_writable(struct vm_area_struct *vma,
 	return pmd_dirty(pmd);
 }
 
-/* FOLL_FORCE can write to even unwritable PMDs in COW mappings. */
-static inline bool can_follow_write_pmd(pmd_t pmd, struct page *page,
-					struct vm_area_struct *vma,
-					unsigned int flags)
-{
-	/* If the pmd is writable, we can write to the page. */
-	if (pmd_write(pmd))
-		return true;
-
-	/* Maybe FOLL_FORCE is set to override it? */
-	if (!(flags & FOLL_FORCE))
-		return false;
-
-	/* But FOLL_FORCE has no effect on shared mappings */
-	if (vma->vm_flags & (VM_MAYSHARE | VM_SHARED))
-		return false;
-
-	/* ... or read-only private ones */
-	if (!(vma->vm_flags & VM_MAYWRITE))
-		return false;
-
-	/* ... or already writable ones that just need to take a write fault */
-	if (vma->vm_flags & VM_WRITE)
-		return false;
-
-	/*
-	 * See can_change_pte_writable(): we broke COW and could map the page
-	 * writable if we have an exclusive anonymous page ...
-	 */
-	if (!page || !PageAnon(page) || !PageAnonExclusive(page))
-		return false;
-
-	/* ... and a write-fault isn't required for other reasons. */
-	if (vma_soft_dirty_enabled(vma) && !pmd_soft_dirty(pmd))
-		return false;
-	return !userfaultfd_huge_pmd_wp(vma, pmd);
-}
-
-struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
-				   unsigned long addr,
-				   pmd_t *pmd,
-				   unsigned int flags)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	struct page *page;
-	int ret;
-
-	assert_spin_locked(pmd_lockptr(mm, pmd));
-
-	page = pmd_page(*pmd);
-	VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
-
-	if ((flags & FOLL_WRITE) &&
-	    !can_follow_write_pmd(*pmd, page, vma, flags))
-		return NULL;
-
-	/* Avoid dumping huge zero page */
-	if ((flags & FOLL_DUMP) && is_huge_zero_pmd(*pmd))
-		return ERR_PTR(-EFAULT);
-
-	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(vma, flags))
-		return NULL;
-
-	if (!pmd_write(*pmd) && gup_must_unshare(vma, flags, page))
-		return ERR_PTR(-EMLINK);
-
-	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
-			!PageAnonExclusive(page), page);
-
-	ret = try_grab_page(page, flags);
-	if (ret)
-		return ERR_PTR(ret);
-
-	if (flags & FOLL_TOUCH)
-		touch_pmd(vma, addr, pmd, flags & FOLL_WRITE);
-
-	page += (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
-	VM_BUG_ON_PAGE(!PageCompound(page) && !is_zone_device_page(page), page);
-
-	return page;
-}
-
 /* NUMA hinting page fault entry point for trans huge pmds */
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 {
diff --git a/mm/internal.h b/mm/internal.h
index 2fca14553d0f..c0e953a1eb62 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1009,9 +1009,8 @@ int __must_check try_grab_page(struct page *page, unsigned int flags);
  */
 void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 	       pud_t *pud, bool write);
-struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
-				   unsigned long addr, pmd_t *pmd,
-				   unsigned int flags);
+void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	       pmd_t *pmd, bool write);
 
 /*
  * mm/mmap.c
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
