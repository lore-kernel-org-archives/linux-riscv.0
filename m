Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF83EC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 22:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0r/O7papj+oui8wyVXtigDiLfbSDFjB/plndC0hIfmI=; b=zKf2fzDry86+S8
	q6cGShZrCpZVnJ3hEIHZR6RlzlTM9aYlpshoP1lDPAIwiFxtyRD7g8y6IuQvc+mXtFo4bcjA0UY/6
	TTN8S9pwIEXSg+9Y0I/YA96GnnpukHvcc9AuAcTEg9/m6e5jB6h+IG9dNiiiFdiGoeX3wi8RF5X7A
	EURs37HGBNd75l1e4MxyR6uswsYrPbBGhw2wFmZC92QX1JTajH+FU1fidpLHWeyurCc1wmuAjyMvm
	WHsGnePTuTnqDZSkIFc2RKCwDnbkuWan6bpjBUR1BRerMIlXAyQrG0xhWJCJBQuSSrSYnp7rgGft7
	qksi2VKVMB6Tvhzn+D6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQcg-00000004sFP-4487;
	Thu, 21 Mar 2024 22:10:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQaU-00000004qac-0Dqt
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 22:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKAkS039JEm9eSlNjnxGInSB8mOTV3IHPzDUFjGHTVk=;
	b=fKM4VqYAhMay1/b4NGyU6dSXL/rrOm2sU1lH2xiw8x5BjFUKE7kpClPgNf8K1RMEsgeP95
	0x0lmTu+mQNBLKRflDVJnz9GjVxn5yCzjBcsFr1WuwGCJQyxqJEMIlehapF07wKLdKIUAR
	Tm8lU6Nyz+Q5OSk+4S4GH2BS38x71Oo=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-uUz_8c9zNW2IZi-rs-s0Tw-1; Thu, 21 Mar 2024 18:08:30 -0400
X-MC-Unique: uUz_8c9zNW2IZi-rs-s0Tw-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6e691df3cd6so567557a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 15:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058909; x=1711663709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKAkS039JEm9eSlNjnxGInSB8mOTV3IHPzDUFjGHTVk=;
        b=OBJWYkbNsTxk4oM4smaX9heOcj7hhxZJypJbDO9mty5RbRf78H81NsaUf3Fa9UXc4E
         eJ920eBKMiTVTwxhz52IE6rbe9CH4Pf6B611yK1vSTWUbG2AwdEMLMoKnUUiZJ7+QsAT
         zIjkc5aWLmiGurLwmvA0xlNyDzWVGfc0JzfQqXEVKca5nksUMgl1F4wjEaiCp2YxI7Q3
         g+y2UoBf/+bjppDzpx7S643Hz/ISl3vPefdqh5lIt3PjXpbsepg066TgwcN7YhSFWEs6
         UmV+9VpJJgY1wa7iZyqOn/SfGGg4K4YEPVjJkg0/37ju9lN6w9ULzimjfnbbHbDzSjxR
         wIfw==
X-Forwarded-Encrypted: i=1; AJvYcCWJa6SuuyDINyBSCTNqCsJt+T/wqKbqoEULHHLZe7ovrR8Owa14QdD+7vToQVW1Qbsj93SLzrEbJHaocGjqxmQV3Fb7pLoJE2wOL1BqK5FZ
X-Gm-Message-State: AOJu0YyKLr/TaWOOP1u5nA0ZML7k1JyoFlmOl/fpuN9MjlRd6K8IgOEj
	BrluBut+8bZxn/IlKsn2HmTOFVNfwtMSlBt5PnE2UQs3YIxHFy83Um3bwosnW7eoiZCEG5jJQE6
	zHJZwbc5rE9qs8MoWPmbnSqZTj0mbcpfDtd6+133LyNRbQIAvOlBPicBmx3TC1o/ieQ==
X-Received: by 2002:a4a:d5ce:0:b0:5a2:26c7:397b with SMTP id a14-20020a4ad5ce000000b005a226c7397bmr912009oot.0.1711058909577;
        Thu, 21 Mar 2024 15:08:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7bJa0sTEC4z3o8Ei9oO8UNdi6+GHr5ekBXamqtFS26QUeqg4nthASLLtCNNWPAVCCH5AJXA==
X-Received: by 2002:a4a:d5ce:0:b0:5a2:26c7:397b with SMTP id a14-20020a4ad5ce000000b005a226c7397bmr911987oot.0.1711058909121;
        Thu, 21 Mar 2024 15:08:29 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:28 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	peterx@redhat.com,
	Yang Shi <shy828301@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andrew Jones <andrew.jones@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Christoph Hellwig <hch@infradead.org>,
	linux-riscv@lists.infradead.org,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
Subject: [PATCH v3 12/12] mm/gup: Handle hugetlb in the generic follow_page_mask code
Date: Thu, 21 Mar 2024 18:08:02 -0400
Message-ID: <20240321220802.679544-13-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_150838_915304_16480EE5 
X-CRM114-Status: GOOD (  23.06  )
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
index 52d9efcf1edf..85e1c9931ae5 100644
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
index 43a2e0a203cd..2eb5911ba849 100644
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
index abec04575c89..2e320757501b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6883,77 +6883,6 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
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
