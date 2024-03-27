Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AF7C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZ5JsVqtviKD0LHRfODZaLLnPLzV9KAiT0/SCtQpyFA=; b=iLfV6+t6nU5942
	rzGsybCzwO0bJUChv2lkM3U5UQqCVNxDeBP5w34W3E9woG9lTMZ8+pWaskdam2uPsiSIJzQA37WqT
	YgTsttB/UPI94cEZV4xybIlXNZmNeG2qyZzz55yORWR8yD9q7OEpo+P+18GpzGaqeyTcmh2J0yrhL
	6fVxZ8o+gn2iwFTxVsTQNiroka45PV31EeStEDdyakXLVpazEjcV0YozSCnlZKpzqCUv2sakL0xh/
	X77ABeWSIHvqwVnQOhx+CFyYSeB7arb3WPXhEGj+jzDw0hEUuSHB+L0ujv4de+WydZoMwCzjgsaq6
	AuODcr9nP6S2loZIiiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVAs-00000009n49-1LNL;
	Wed, 27 Mar 2024 15:26:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV8P-00000009lea-22ey
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 15:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eqT6FBXOR6azzagmtpaiz+BS8+Dy8n2ikly9Wvyy/LU=; b=adrM10GxlP7eZvmXAd/KIx5V2X
	CHXkFM5M2IFHcaODE/mtfUE5KrSaIfou4YG5QPqpHYVoZ6BAPjAgYndPKWf+L4qhLEiuBmreLl/W2
	r+Kc79bLMwS5wCaujGu0tDBgekTGSpb86ms00MgXSXH3WrIXVM3F65yZQDgo3yudN6OghekFRx+sx
	e5CLgfVv50T9Ci2pPoan5OEaMpbS9oofMbI6KRqITYRBrA5aHXgv92QmtNgE73Y6h0xQjMb5Jjhli
	uff78FQUbYgnTu7yyr5R+cCE8YiDcq23262AsXvRydsgkUAQP2qk8xyY0BhSt/nDYh3WYqnC99zZs
	w+kmpKag==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV8M-00000000L9D-0l32
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqT6FBXOR6azzagmtpaiz+BS8+Dy8n2ikly9Wvyy/LU=;
	b=RsLSW90As0nEILGr2wKa+3XD95vBW+Z7kfZAD9fUfUl90vSAlWfJbsdPW94qOSRFVtO8HO
	1UO1yTxihBsQW2Z/FleXzc+jCZ4YGqveaevgPA5DVXFgTTkH5GyQhMEXFjX7w3ScTTLPOl
	/fbQEhFZiEbVfwg5yyhtZUiwzNhqlfU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqT6FBXOR6azzagmtpaiz+BS8+Dy8n2ikly9Wvyy/LU=;
	b=YVWCjPvMoiZDvUCPbINAdB7H2Bjd6l7zNgRiy/STea0848DAJOdPSwJMAonICQhB8Lm6el
	oj74nYEEMToERHq50TEkildKCWcMsATcnehWoxCaNDAaz6XINsZ3GvFNCeENDimDNYOiNY
	HAzBPCN3RdvaP6YhEAOe2L5nd45cs0U=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-bZZr7CrbMqeCnpAUqJvj3w-1; Wed, 27 Mar 2024 11:24:06 -0400
X-MC-Unique: bZZr7CrbMqeCnpAUqJvj3w-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6dde25ac92fso3181987a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553043; x=1712157843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqT6FBXOR6azzagmtpaiz+BS8+Dy8n2ikly9Wvyy/LU=;
        b=PyfxOzg/Q3B664W7rRz0QhUpXr2mDkly3dahntsiVrDJmLW+NdK7krsl524deJLVQY
         w3jJxiOPkLjclKoZQIensRmlymFjpNatWvO8n1nsIzsoIniXKnlwTsBYqaWhjPAfAt21
         rMwqt7dDfxNUPuhLbSoegmeEuYELIFMt745xoNJs5cL4IJ4CBeVLXJu5aVN4Sz+uOiU9
         4HXwLisjDQzNDoFTnv15vDw/bPIrzu88+12N5H8yXgKPjxl0IdxbhQW7Zw6QgJd9ng9j
         SiP07kefks1XRORPI7VdVeEspoDfpkyP7v9+1MgPPiuHLBxXbw0hr/e47z7dMtMl6sl4
         52Ig==
X-Forwarded-Encrypted: i=1; AJvYcCU0jsZVyPbyCPQPVUrKi79A8JjEPN4y08fN4PJ8VIbkTVvIBhGeZDrWL4oSb+Bcj3BjAT4Bblj2u0+Oxhfsjr3ak1IhlGHY9mmFLi7TXBwO
X-Gm-Message-State: AOJu0Yyxae7vloMqQQ2x9cCtdDFJGFLj0jgF6p3/cA7Usht/rUUY8Vwr
	2KFXxebBwTDftlaOmNTzDBoumGd01jwFYtC9gSu+XIU30kWPL7SLomnEACAqigGyuF3RsLDlyW7
	H1tuQ0qD9VnpcZZZQKtGBW//P6oa0P1iiYgs+reCL3cHeiw4uRcFPkvWIbiXy1rzF3Q==
X-Received: by 2002:a05:6808:1381:b0:3c3:d815:b670 with SMTP id c1-20020a056808138100b003c3d815b670mr278645oiw.2.1711553043435;
        Wed, 27 Mar 2024 08:24:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2f7pSTtNK/4lDxloQcNJtvLkvUR42Ph4fHUFnW1nCtEkqTm3cUEoT3r9uMsOerfq/WsXhuA==
X-Received: by 2002:a05:6808:1381:b0:3c3:d815:b670 with SMTP id c1-20020a056808138100b003c3d815b670mr278609oiw.2.1711553042809;
        Wed, 27 Mar 2024 08:24:02 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:24:02 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	peterx@redhat.com,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	James Houghton <jthoughton@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH v4 13/13] mm/gup: Handle hugetlb in the generic follow_page_mask code
Date: Wed, 27 Mar 2024 11:23:32 -0400
Message-ID: <20240327152332.950956-14-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_152410_615444_EC207309 
X-CRM114-Status: GOOD (  22.86  )
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/hugetlb.h |  7 ----
 mm/gup.c                | 15 +++------
 mm/hugetlb.c            | 71 -----------------------------------------
 3 files changed, 5 insertions(+), 88 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 294c78b3549f..a546140f89cd 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -328,13 +328,6 @@ static inline void hugetlb_zap_end(
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
index a02463c9420e..c803d0b0f358 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1135,18 +1135,11 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 {
 	pgd_t *pgd;
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
 
 	if (unlikely(is_hugepd(__hugepd(pgd_val(*pgd)))))
@@ -1157,6 +1150,8 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 	else
 		page = follow_p4d_mask(vma, address, pgd, flags, ctx);
 
+	vma_pgtable_walk_end(vma);
+
 	return page;
 }
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 65b9c9a48fd2..cc79891a3597 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6870,77 +6870,6 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
