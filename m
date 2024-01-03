Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F3CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 09:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=loLDoczb37hqKpLf4yXmw9JzXfy/NcTaUlBKzDEl9GM=; b=uwh3Zmu4iPIk2D
	2lfoL0CIZrTH8Uc3JJUUWF3qFcRcKZYKhvypN2OjkhxVghUWS5myGvfAz/DDqAZbQtiyDzU76EaG3
	PiSHNbr3ZsNoux+hX2MOWejqaefobKZO4TxTw5N6RmA8xasquQulBtAxlAALnEnKnWr5h2V9oF9M5
	urHylNmdeT5oanW8EKMotwEu7h4lxqXInwap14emkpIidv//+Bt1m7RrXDyeVM19UxKx1vv7eumnZ
	hbqpQe077tl0zyqudkB0hGQhp5S7jHqpASFr/D/vJmdE6AN+TiwghQsX053HrN5j71RmMdHXnigqO
	ZhxOO/cLtg/E5vUu/kIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxNS-00ACv0-28;
	Wed, 03 Jan 2024 09:17:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxNN-00ACoZ-11
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 09:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704273444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1p2LWjy53LBaoBTc753xtp3ZFESBZSj8dXlH3kmoDms=;
	b=h2Elp76JoB00YEnBfZeweVMHl90lbHL7lhvSrUnozAwFAPUmQuJ54NJQgMBuFF16K42WTG
	Y6T3JTO3Dlq0shUEZyBHPUr3jMJLioIJov9QIBJ6Q0vMZQ+x2VsACwmwPXLQoQh4PRWqz4
	h0pZgYRUMb0/EpM0ksKxzNlq8mQvsiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-K7snBKXGMluKlA4u3ja1Zg-1; Wed, 03 Jan 2024 04:17:19 -0500
X-MC-Unique: K7snBKXGMluKlA4u3ja1Zg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26F8783B86A;
	Wed,  3 Jan 2024 09:17:18 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4404B492BE6;
	Wed,  3 Jan 2024 09:17:05 +0000 (UTC)
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
Subject: [PATCH v2 13/13] mm/gup: Handle hugetlb in the generic follow_page_mask code
Date: Wed,  3 Jan 2024 17:14:23 +0800
Message-ID: <20240103091423.400294-14-peterx@redhat.com>
In-Reply-To: <20240103091423.400294-1-peterx@redhat.com>
References: <20240103091423.400294-1-peterx@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_011725_429174_073197E8 
X-CRM114-Status: GOOD (  23.57  )
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

Now follow_page() is ready to handle hugetlb pages in whatever form, and
over all architectures.  Switch to the generic code path.

Time to retire hugetlb_follow_page_mask(), following the previous
retirement of follow_hugetlb_page() in 4849807114b8.

There may be a slight difference of how the loops run when processing slow
GUP over a large hugetlb range on cont_pte/cont_pmd supported archs: each
loop of __get_user_pages() will resolve one pgtable entry with the patch
applied, rather than relying on the size of hugetlb hstate, the latter may
cover multiple entries in one loop.

A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
a tight loop of slow gup after the path switched.  That shouldn't be a
problem because slow-gup should not be a hot path for GUP in general: when
page is commonly present, fast-gup will already succeed, while when the
page is indeed missing and require a follow up page fault, the slow gup
degrade will probably buried in the fault paths anyway.  It also explains
why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
accelerate thp gup even for "pages != NULL"") lands, the latter not part of
a performance analysis but a side benefit.  If the performance will be a
concern, we can consider handle CONT_PTE in follow_page().

Before that is justified to be necessary, keep everything clean and simple.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/hugetlb.h |  7 ----
 mm/gup.c                | 15 +++------
 mm/hugetlb.c            | 71 -----------------------------------------
 3 files changed, 5 insertions(+), 88 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index e8eddd51fc17..cdbb53407722 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -332,13 +332,6 @@ static inline void hugetlb_zap_end(
 {
 }
 
-static inline struct page *hugetlb_follow_page_mask(
-    struct vm_area_struct *vma, unsigned long address, unsigned int flags,
-    unsigned int *page_mask)
-{
-	BUILD_BUG(); /* should never be compiled in if !CONFIG_HUGETLB_PAGE*/
-}
-
 static inline int copy_hugetlb_page_range(struct mm_struct *dst,
 					  struct mm_struct *src,
 					  struct vm_area_struct *dst_vma,
diff --git a/mm/gup.c b/mm/gup.c
index 245214b64108..4f8a3dc287c9 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -997,18 +997,11 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 {
 	pgd_t *pgd, pgdval;
 	struct mm_struct *mm = vma->vm_mm;
+	struct page *page;
 
-	ctx->page_mask = 0;
-
-	/*
-	 * Call hugetlb_follow_page_mask for hugetlb vmas as it will use
-	 * special hugetlb page table walking code.  This eliminates the
-	 * need to check for hugetlb entries in the general walking code.
-	 */
-	if (is_vm_hugetlb_page(vma))
-		return hugetlb_follow_page_mask(vma, address, flags,
-						&ctx->page_mask);
+	vma_pgtable_walk_begin(vma);
 
+	ctx->page_mask = 0;
 	pgd = pgd_offset(mm, address);
 	pgdval = *pgd;
 
@@ -1020,6 +1013,8 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 	else
 		page = follow_p4d_mask(vma, address, pgd, flags, ctx);
 
+	vma_pgtable_walk_end(vma);
+
 	return page;
 }
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index bfb52bb8b943..e13b4e038c2c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6782,77 +6782,6 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 }
 #endif /* CONFIG_USERFAULTFD */
 
-struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
-				      unsigned long address, unsigned int flags,
-				      unsigned int *page_mask)
-{
-	struct hstate *h = hstate_vma(vma);
-	struct mm_struct *mm = vma->vm_mm;
-	unsigned long haddr = address & huge_page_mask(h);
-	struct page *page = NULL;
-	spinlock_t *ptl;
-	pte_t *pte, entry;
-	int ret;
-
-	hugetlb_vma_lock_read(vma);
-	pte = hugetlb_walk(vma, haddr, huge_page_size(h));
-	if (!pte)
-		goto out_unlock;
-
-	ptl = huge_pte_lock(h, mm, pte);
-	entry = huge_ptep_get(pte);
-	if (pte_present(entry)) {
-		page = pte_page(entry);
-
-		if (!huge_pte_write(entry)) {
-			if (flags & FOLL_WRITE) {
-				page = NULL;
-				goto out;
-			}
-
-			if (gup_must_unshare(vma, flags, page)) {
-				/* Tell the caller to do unsharing */
-				page = ERR_PTR(-EMLINK);
-				goto out;
-			}
-		}
-
-		page = nth_page(page, ((address & ~huge_page_mask(h)) >> PAGE_SHIFT));
-
-		/*
-		 * Note that page may be a sub-page, and with vmemmap
-		 * optimizations the page struct may be read only.
-		 * try_grab_page() will increase the ref count on the
-		 * head page, so this will be OK.
-		 *
-		 * try_grab_page() should always be able to get the page here,
-		 * because we hold the ptl lock and have verified pte_present().
-		 */
-		ret = try_grab_page(page, flags);
-
-		if (WARN_ON_ONCE(ret)) {
-			page = ERR_PTR(ret);
-			goto out;
-		}
-
-		*page_mask = (1U << huge_page_order(h)) - 1;
-	}
-out:
-	spin_unlock(ptl);
-out_unlock:
-	hugetlb_vma_unlock_read(vma);
-
-	/*
-	 * Fixup retval for dump requests: if pagecache doesn't exist,
-	 * don't try to allocate a new page but just skip it.
-	 */
-	if (!page && (flags & FOLL_DUMP) &&
-	    !hugetlbfs_pagecache_present(h, vma, address))
-		page = ERR_PTR(-EFAULT);
-
-	return page;
-}
-
 long hugetlb_change_protection(struct vm_area_struct *vma,
 		unsigned long address, unsigned long end,
 		pgprot_t newprot, unsigned long cp_flags)
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
