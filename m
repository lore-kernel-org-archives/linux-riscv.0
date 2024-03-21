Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8BEC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 22:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKCot220rU0GpIzyX181ihwdu/B8KRmTY6R1sqObL4I=; b=IYeDy12ZRQf7rq
	nC+hn99oMhmsIOe3yfBCFP+c5fZClLoLvh+O/7+g2xylQk9eQQYTjP/dnec+manBIRihqtlHcvhn/
	UWVNoAqHyhlXzdPNsc/axu0eN8uamAILjKhcsPFy2ER/Asj3YWyJswUmV5ULpdt8xmMsMLXDhRC6g
	4S2tlSEC7vZeZ9+3AQH//todNOh1MX5A3pXCsZxD7zkg7kjznzYYEyCh5ALA7Pv5EXgrNKqrL/F6f
	F+TXUq18H1NllLtGfEYV3M9CaGj/7mge9zWoqw7goQD8MI/A0N6mN0GCulVsKJZWyLwzH7h9tHi9h
	LRaC1mktI5QEA9ItgOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQcc-00000004sBZ-40VD;
	Thu, 21 Mar 2024 22:10:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQaV-00000004qdO-0Cfg
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Mar 2024 22:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=o0KbP6b9RlV02LlNjzHhHyMPZ1vhd/KMB6w1UdD4tH4=; b=P070YU9qM/4RTORQpZoLH/LGmt
	nAFGGykgbk3nnytvo/tb9wjjjCVIezQNarGoqxZ5nrUOuvVVe5ANZ2hkeGCGrgGmVHLYgC8IUGsjt
	XHB54iQe3Smg9kCxtjg9JCwpK7voie3IzHOeDr1b0A2iAMOx46vYYKWUlFIFjmEeuO96rU5pIzwH0
	+a/V4ZYtfnwsGBOOljcvANV9Ojg6lWWFZycRj9MKSAEc1W99xoDvtynwoCC2Cyyim/D0nfGZjm3Bk
	wkXGCyvjXU2swDib+2ab4m/i2d6d5ApSRDha4VBJRXOIyGugkJLzidVd3y6dI5aSlJ1ESixQD/mNc
	y2CxYkzw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQaN-0000000EScX-2ZRU
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 22:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o0KbP6b9RlV02LlNjzHhHyMPZ1vhd/KMB6w1UdD4tH4=;
	b=WJk1gJkIocWn8iGjJhbZctKaNdmfMdtg1DczD3yCneMzGNUG4NuKff+JG17EN+n/Ypkarh
	Q/FQeUTM7y5nNOtLVBKDCt6krlSwk8OlI3J8RepdkKkpOnMFSdBlp4pBD9DLTUoSq6nrqJ
	n1FJYgvgdZJChBkVmXXFjixaREk1+bw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o0KbP6b9RlV02LlNjzHhHyMPZ1vhd/KMB6w1UdD4tH4=;
	b=gfW2DZiAYEDL1n0+OxC9iZ/ZLiiZT41o+MizICXgaq7HLOVhTcJYayO4UxEqDdE6p+OoNh
	qpsQHk10vh/Uz4i7A3wU4hmF7Nrqp2rAcd62omd3+6STDr/3i8AMNNLKggrRzyq8zCeWdC
	xYu/Ldf8XeVEyD9KPMGoKRtWxOITPKY=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-o9y883vAORC3awLgkVbcxw-1; Thu, 21 Mar 2024 18:08:27 -0400
X-MC-Unique: o9y883vAORC3awLgkVbcxw-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-222b55202f4so525968fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 15:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058907; x=1711663707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0KbP6b9RlV02LlNjzHhHyMPZ1vhd/KMB6w1UdD4tH4=;
        b=xHSPL42kd2AlnjlWQAS9KJoEMWVhM/2yM/heqYWlfSc5xGjBpOaSI6G7gMcfJRPTk6
         IS7EgZ/hPafwK/fJmCshydP7TqaRNu4wSmM/cV2PJd/ND/4cht78qDtXbg1wy82TPFVs
         fpkBV4tKVvdL8MdCSm3CagTXhdSyUW76ES49zAbhFlEjcYlLeo0h1IF6Nx2AT5hn98ZO
         ESWLCjnr/MH5qeRyC6hObrL01MZ2odjdOcXghhhBwkrtHoXwayggsigK9vcp5SzED9M+
         cSkTWk2A6oDmlqG4f90Q67PBOUt8aJwXvWv6/Qnc0+zK0k+Kp83IYTY0C7NWQw/6md5m
         wPwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiGX4YM9ohd0kgS9uVJbAOCuXbPHG9XtAPYG6zF7dYA5tZaxPHTaUfKQJMrp9zxTMGZXVibj+vecsEMS91l3ROtcmKJGln+UrO6iwPf09t
X-Gm-Message-State: AOJu0YzBSSFOkwZLpOLafS8fr149sH4uCkb/+n4IjSYQJ0IcjaJyr1CP
	gAmVp1OmqjYnwTQfn6iKhmgm9jlfWYaBjTfnQaegCE5GEy83SMgRjwCmzMAG7nZOmL8+yylpmxf
	2qF4pAmzkcrcRKLFuR8fdMTq7K2wBPApTQxlh3+yFaBaGpCrpLE4+zogGMYUJqGDJsw==
X-Received: by 2002:a05:6870:4189:b0:229:8575:875b with SMTP id y9-20020a056870418900b002298575875bmr520315oac.5.1711058906675;
        Thu, 21 Mar 2024 15:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyRVGIH/+XEvquuQvEBSJicroe5v4UAFWGp7nk+sM4AQMJKL66g328LmVlireG12paxfzEyQ==
X-Received: by 2002:a05:6870:4189:b0:229:8575:875b with SMTP id y9-20020a056870418900b002298575875bmr520279oac.5.1711058906111;
        Thu, 21 Mar 2024 15:08:26 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:25 -0700 (PDT)
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
Subject: [PATCH v3 11/12] mm/gup: Handle hugepd for follow_page()
Date: Thu, 21 Mar 2024 18:08:01 -0400
Message-ID: <20240321220802.679544-12-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_220832_149179_9B63D685 
X-CRM114-Status: GOOD (  21.31  )
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

Hugepd is only used in PowerPC so far on 4K page size kernels where hash
mmu is used.  follow_page_mask() used to leverage hugetlb APIs to access
hugepd entries.  Teach follow_page_mask() itself on hugepd.

With previous refactors on fast-gup gup_huge_pd(), most of the code can be
easily leveraged.  There's something not needed for follow page, for
example, gup_hugepte() tries to detect pgtable entry change which will
never happen with slow gup (which has the pgtable lock held), but that's
not a problem to check.

Since follow_page() always only fetch one page, set the end to "address +
PAGE_SIZE" should suffice.  We will still do the pgtable walk once for each
hugetlb page by setting ctx->page_mask properly.

One thing worth mentioning is that some level of pgtable's _bad() helper
will report is_hugepd() entries as TRUE on Power8 hash MMUs.  I think it at
least applies to PUD on Power8 with 4K pgsize.  It means feeding a hugepd
entry to pud_bad() will report a false positive. Let's leave that for now
because it can be arch-specific where I am a bit declined to touch.  In
this patch it's not a problem as long as hugepd is detected before any bad
pgtable entries.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 66 insertions(+), 7 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 00cdf4cb0cd4..43a2e0a203cd 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -30,6 +30,11 @@ struct follow_page_context {
 	unsigned int page_mask;
 };
 
+static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
+				  unsigned long addr, unsigned int pdshift,
+				  unsigned int flags,
+				  struct follow_page_context *ctx);
+
 static inline void sanity_check_pinned_pages(struct page **pages,
 					     unsigned long npages)
 {
@@ -871,6 +876,9 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 		return no_page_table(vma, flags, address);
 	if (!pmd_present(pmdval))
 		return no_page_table(vma, flags, address);
+	if (unlikely(is_hugepd(__hugepd(pmd_val(pmdval)))))
+		return follow_hugepd(vma, __hugepd(pmd_val(pmdval)),
+				     address, PMD_SHIFT, flags, ctx);
 	if (pmd_devmap(pmdval)) {
 		ptl = pmd_lock(mm, pmd);
 		page = follow_devmap_pmd(vma, address, pmd, flags, &ctx->pgmap);
@@ -921,6 +929,9 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 	pud = READ_ONCE(*pudp);
 	if (!pud_present(pud))
 		return no_page_table(vma, flags, address);
+	if (unlikely(is_hugepd(__hugepd(pud_val(pud)))))
+		return follow_hugepd(vma, __hugepd(pud_val(pud)),
+				     address, PUD_SHIFT, flags, ctx);
 	if (pud_leaf(pud)) {
 		ptl = pud_lock(mm, pudp);
 		page = follow_huge_pud(vma, address, pudp, flags, ctx);
@@ -944,10 +955,13 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 
 	p4dp = p4d_offset(pgdp, address);
 	p4d = READ_ONCE(*p4dp);
-	if (!p4d_present(p4d))
-		return no_page_table(vma, flags, address);
 	BUILD_BUG_ON(p4d_leaf(p4d));
-	if (unlikely(p4d_bad(p4d)))
+
+	if (unlikely(is_hugepd(__hugepd(p4d_val(p4d)))))
+		return follow_hugepd(vma, __hugepd(p4d_val(p4d)),
+				     address, P4D_SHIFT, flags, ctx);
+
+	if (!p4d_present(p4d) || p4d_bad(p4d))
 		return no_page_table(vma, flags, address);
 
 	return follow_pud_mask(vma, address, p4dp, flags, ctx);
@@ -981,7 +995,7 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 			      unsigned long address, unsigned int flags,
 			      struct follow_page_context *ctx)
 {
-	pgd_t *pgd;
+	pgd_t *pgd, pgdval;
 	struct mm_struct *mm = vma->vm_mm;
 
 	ctx->page_mask = 0;
@@ -996,11 +1010,17 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 						&ctx->page_mask);
 
 	pgd = pgd_offset(mm, address);
+	pgdval = *pgd;
 
-	if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
-		return no_page_table(vma, flags, address);
+	if (unlikely(is_hugepd(__hugepd(pgd_val(pgdval)))))
+		page = follow_hugepd(vma, __hugepd(pgd_val(pgdval)),
+				     address, PGDIR_SHIFT, flags, ctx);
+	else if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
+		page = no_page_table(vma, flags, address);
+	else
+		page = follow_p4d_mask(vma, address, pgd, flags, ctx);
 
-	return follow_p4d_mask(vma, address, pgd, flags, ctx);
+	return page;
 }
 
 struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
@@ -3037,6 +3057,37 @@ static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
 
 	return 1;
 }
+
+static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
+				  unsigned long addr, unsigned int pdshift,
+				  unsigned int flags,
+				  struct follow_page_context *ctx)
+{
+	struct page *page;
+	struct hstate *h;
+	spinlock_t *ptl;
+	int nr = 0, ret;
+	pte_t *ptep;
+
+	/* Only hugetlb supports hugepd */
+	if (WARN_ON_ONCE(!is_vm_hugetlb_page(vma)))
+		return ERR_PTR(-EFAULT);
+
+	h = hstate_vma(vma);
+	ptep = hugepte_offset(hugepd, addr, pdshift);
+	ptl = huge_pte_lock(h, vma->vm_mm, ptep);
+	ret = gup_huge_pd(hugepd, addr, pdshift, addr + PAGE_SIZE,
+			  flags, &page, &nr);
+	spin_unlock(ptl);
+
+	if (ret) {
+		WARN_ON_ONCE(nr != 1);
+		ctx->page_mask = (1U << huge_page_order(h)) - 1;
+		return page;
+	}
+
+	return NULL;
+}
 #else
 static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
 		unsigned int pdshift, unsigned long end, unsigned int flags,
@@ -3044,6 +3095,14 @@ static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
 {
 	return 0;
 }
+
+static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
+				  unsigned long addr, unsigned int pdshift,
+				  unsigned int flags,
+				  struct follow_page_context *ctx)
+{
+	return NULL;
+}
 #endif /* CONFIG_ARCH_HAS_HUGEPD */
 
 static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
