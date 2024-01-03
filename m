Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E3EC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 09:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5h3lEsB6cRStJH4FnAaJnedgmqcV6mH1AbYi/xiAuPs=; b=NA/aGO8UqSETkq
	/Uj+rarV4CDyaXHRsYj2OhcAJJKdI9ncGc+D5JG6fXa/AgLU9BAnaZ+ByUfXhYyUfJ7cPir7KBXi6
	pbNsr4NFDltBlvCZqHP/wNZYqpgrzT5e8T062XyWJSUoY2REl+Xxqu1H6a5umduGetPOtCAxrAJXe
	sU08+hGP36sbEu9sYRY14WZ9TRlsycKsFmN/+3uNvdq3fYOvaHvTtrBIepJTe0QpsqIQjXPH1s0r8
	TmjTCh6yey46W9rnErfNfHceIYxfB5i71a5H735QMI5WOyCkTiZtjxgb7YZOvf7Q8HfbAsMlztBD/
	hGyp8LV2e1D9LL375zvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxMR-00ABxI-23;
	Wed, 03 Jan 2024 09:16:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxMN-00ABtY-2T
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 09:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704273382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e2/9/uEWavAhcbGvkqENWO1xIuQmr8G4qpstfk2UpBk=;
	b=idHQtjv+Lj8GNAESrCB93cRt6q+/nmz28JnTPKphlygU1o5W3xhgXU6uLR1PlJAAjqDmKn
	WIdWFy9LO8MGOdHtictxPbA5hhlxuDGOgBaX6GwQdtdGgjcXk7i7dSeGs/oceHwgtLy4jW
	nAwSiSfr6zHSjmj6HllP3CCtMhho+CY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-bfNmJltGNpCYZPt_-QXM8w-1; Wed, 03 Jan 2024 04:16:16 -0500
X-MC-Unique: bfNmJltGNpCYZPt_-QXM8w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 633D085CBA5;
	Wed,  3 Jan 2024 09:16:15 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E9FD492BE6;
	Wed,  3 Jan 2024 09:16:05 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Yang Shi <shy828301@gmail.com>,
	peterx@redhat.com,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Jones <andrew.jones@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 08/13] mm/gup: Handle hugetlb for no_page_table()
Date: Wed,  3 Jan 2024 17:14:18 +0800
Message-ID: <20240103091423.400294-9-peterx@redhat.com>
In-Reply-To: <20240103091423.400294-1-peterx@redhat.com>
References: <20240103091423.400294-1-peterx@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_011623_893639_6D5FBF01 
X-CRM114-Status: GOOD (  14.93  )
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

no_page_table() is not yet used for hugetlb code paths. Make it prepared.

The major difference here is hugetlb will return -EFAULT as long as page
cache does not exist, even if VM_SHARED.  See hugetlb_follow_page_mask().

Pass "address" into no_page_table() too, as hugetlb will need it.

Reviewed-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 44 ++++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 3813aad79c4a..b8a80e2bfe08 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -501,19 +501,27 @@ static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
 
 #ifdef CONFIG_MMU
 static struct page *no_page_table(struct vm_area_struct *vma,
-		unsigned int flags)
+				  unsigned int flags, unsigned long address)
 {
+	if (!(flags & FOLL_DUMP))
+		return NULL;
+
 	/*
-	 * When core dumping an enormous anonymous area that nobody
-	 * has touched so far, we don't want to allocate unnecessary pages or
+	 * When core dumping, we don't want to allocate unnecessary pages or
 	 * page tables.  Return error instead of NULL to skip handle_mm_fault,
 	 * then get_dump_page() will return NULL to leave a hole in the dump.
 	 * But we can only make this optimization where a hole would surely
 	 * be zero-filled if handle_mm_fault() actually did handle it.
 	 */
-	if ((flags & FOLL_DUMP) &&
-			(vma_is_anonymous(vma) || !vma->vm_ops->fault))
+	if (is_vm_hugetlb_page(vma)) {
+		struct hstate *h = hstate_vma(vma);
+
+		if (!hugetlbfs_pagecache_present(h, vma, address))
+			return ERR_PTR(-EFAULT);
+	} else if ((vma_is_anonymous(vma) || !vma->vm_ops->fault)) {
 		return ERR_PTR(-EFAULT);
+	}
+
 	return NULL;
 }
 
@@ -593,7 +601,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 
 	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
 	if (!ptep)
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 	pte = ptep_get(ptep);
 	if (!pte_present(pte))
 		goto no_page;
@@ -685,7 +693,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	pte_unmap_unlock(ptep, ptl);
 	if (!pte_none(pte))
 		return NULL;
-	return no_page_table(vma, flags);
+	return no_page_table(vma, flags, address);
 }
 
 static struct page *follow_pmd_mask(struct vm_area_struct *vma,
@@ -701,27 +709,27 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 	pmd = pmd_offset(pudp, address);
 	pmdval = pmdp_get_lockless(pmd);
 	if (pmd_none(pmdval))
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 	if (!pmd_present(pmdval))
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 	if (pmd_devmap(pmdval)) {
 		ptl = pmd_lock(mm, pmd);
 		page = follow_devmap_pmd(vma, address, pmd, flags, &ctx->pgmap);
 		spin_unlock(ptl);
 		if (page)
 			return page;
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 	}
 	if (likely(!pmd_trans_huge(pmdval)))
 		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
 
 	if (pmd_protnone(pmdval) && !gup_can_follow_protnone(vma, flags))
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 
 	ptl = pmd_lock(mm, pmd);
 	if (unlikely(!pmd_present(*pmd))) {
 		spin_unlock(ptl);
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 	}
 	if (unlikely(!pmd_trans_huge(*pmd))) {
 		spin_unlock(ptl);
@@ -752,17 +760,17 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 
 	pud = pud_offset(p4dp, address);
 	if (pud_none(*pud))
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 	if (pud_devmap(*pud)) {
 		ptl = pud_lock(mm, pud);
 		page = follow_devmap_pud(vma, address, pud, flags, &ctx->pgmap);
 		spin_unlock(ptl);
 		if (page)
 			return page;
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 	}
 	if (unlikely(pud_bad(*pud)))
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 
 	return follow_pmd_mask(vma, address, pud, flags, ctx);
 }
@@ -776,10 +784,10 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 
 	p4d = p4d_offset(pgdp, address);
 	if (p4d_none(*p4d))
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 	BUILD_BUG_ON(p4d_huge(*p4d));
 	if (unlikely(p4d_bad(*p4d)))
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 
 	return follow_pud_mask(vma, address, p4d, flags, ctx);
 }
@@ -829,7 +837,7 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 	pgd = pgd_offset(mm, address);
 
 	if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
-		return no_page_table(vma, flags);
+		return no_page_table(vma, flags, address);
 
 	return follow_p4d_mask(vma, address, pgd, flags, ctx);
 }
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
