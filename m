Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D088C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOG6vWzGKGAXcJzQmMW3/CHECju46r+WmXT1vicYguc=; b=SEXDoXnyZQygYx
	5v1a9+7Rhc/dKPlzeX3C2F38jVWh4YxaUSDGl/4UChZKsFDljn0DT1fwwUKPAq47JQTOgx/Gsyg5F
	R3dNr626aBgXhEXLI1iiJYxTzBAvnItg5cSoRAgnaDydWfmhnRmAwwvL4AUoa3NwqKx1a/+Z9BWhE
	2259MMZgg1Hp99zsQZ8akFnBo+HBcxfTqXtZdZNOEZmRMiRpzGLyt2t23a1aYhB20VADHto6HcV37
	bBF2VNBE/mlVDbZ4zJPNg9qaSpjsGYIZVO5H/Nlburw0tdWSclxYWtlqI4r5TIyJnKwNUIAbsv6Qu
	jc4feT9C+VXiEI6bVRIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVBH-00000009nOA-3YxF;
	Wed, 27 Mar 2024 15:27:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV8F-00000009lYb-2MZL
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 15:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ldvmB2LhfsIRddCCGOUltuspZLyBYJ6Ab85tSc3WzTs=; b=LTUyvo0LRlRATRKNWf/qdTPYBR
	j+1uij7Oi2bxqohBLcNyaqO5SY2j6OXYrg81sIlyINYWlj+urM1ktGOA3frUu/jA6fbuD+nUXsPf8
	58oPDgeNxozzjp62ty3AIN/Zsq2R9QI4PwrrKxYji3bBJRFvl5eeMLtyCIk/sVDLfHTyaRMd4GZGQ
	7hwsFQ6qzki6Y1V+KQbzENRLbtrwQvd41SgWoMU0AdtZhZn9Wan0BTYav67/WPJQ5rLMmcbHdcHi+
	0PM2vB0i4Kbyt+kMVZrdHzoqnE1WIDjuvN7leV9Awy6rzNMnj6VfNnaxMiGz1YG2j0PNwGMHTaSti
	XArfWM4Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV8C-00000000L59-1IYa
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldvmB2LhfsIRddCCGOUltuspZLyBYJ6Ab85tSc3WzTs=;
	b=BSGJl9wxcjjAjeAVZsrZtKz/inf8oY4eNgmD7SzvW9j8nX1r6qONCLUACsEcD9j+p6vZx5
	bJf3lXQ1oePSHc+cLgmQW+EBgjyHATvgXsiQO2kQvT0cwBCVyiWVGXTarhhLhQ+bpSKDBA
	hZWmAnR3ci3QXQuYPOW46iUQhgBcBsM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldvmB2LhfsIRddCCGOUltuspZLyBYJ6Ab85tSc3WzTs=;
	b=BSGJl9wxcjjAjeAVZsrZtKz/inf8oY4eNgmD7SzvW9j8nX1r6qONCLUACsEcD9j+p6vZx5
	bJf3lXQ1oePSHc+cLgmQW+EBgjyHATvgXsiQO2kQvT0cwBCVyiWVGXTarhhLhQ+bpSKDBA
	hZWmAnR3ci3QXQuYPOW46iUQhgBcBsM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-WYPQ8UBSPJKRaHBLQjPilg-1; Wed, 27 Mar 2024 11:23:57 -0400
X-MC-Unique: WYPQ8UBSPJKRaHBLQjPilg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-69120b349c9so16215756d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553037; x=1712157837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldvmB2LhfsIRddCCGOUltuspZLyBYJ6Ab85tSc3WzTs=;
        b=qH4GBThApWTikkHESDOE4wOIljrGVMztBPgoVDWjUqfFXE4LT2liIwXhSymIlkV9ce
         D5m9iRCb4ggzh8nJdzKW5vKxNTYkBd0qXsbBeLrl7EM6FmRauaA2sVLmLqq0F8OsStf7
         z0CxG7Viy+fTZd7cUJW5MOUXC0I/NBXNfD8fRPUc++4eGO3tmUHh0uZwkcCISu+uE8Yw
         nVQNC5Hx90YIcPRFoXlvhjLwag4gW7MCzYIIgYmOilVysXe0wxV3XwlQqEVP2oElSpH7
         z5kQPL2Q1dqUx1nlm/vVSGLdGVCPHe2ZlCKtYYP3Cb7sCOIqlWNczY2CJsaXDpSnqsfV
         01ww==
X-Forwarded-Encrypted: i=1; AJvYcCX/2D0nVovx0ke2p2P42f8fhKl40nkn2pIPwKFEnOd9qzyMGk38FRvKnCms5iuc8cu+ywq+6/4sV9uuv77pLjzwA37rvHWKxKGPtT4CWxfu
X-Gm-Message-State: AOJu0YySxOb6OgqQvnh1jEahhEmvg9VbZc02atGx2FByX6/MnjrHgGK8
	w95CeS0zSGUF6Z6fOJEBuRc14M2r0vOWrmiUnHqfOMhEnUXoYzOvTxfCtebkjKVdy6TdqtbfwGZ
	hhnUiLlOxz/9sKVcDsR8bAj2UOQHEsSDbFEqtvJamv53eVChIuNliSDNzJgwkli3X2g==
X-Received: by 2002:a05:6214:3d8c:b0:696:6f95:4421 with SMTP id om12-20020a0562143d8c00b006966f954421mr14385997qvb.1.1711553036999;
        Wed, 27 Mar 2024 08:23:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnSeTu/B6EMntVMOCEyhcTmSAZJByvhuxAj5BPZo0z5woD7z6vaVN6Kd8/ZBw0a5bsOP9d6g==
X-Received: by 2002:a05:6214:3d8c:b0:696:6f95:4421 with SMTP id om12-20020a0562143d8c00b006966f954421mr14385952qvb.1.1711553036462;
        Wed, 27 Mar 2024 08:23:56 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:56 -0700 (PDT)
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
Subject: [PATCH v4 10/13] mm/gup: Handle huge pud for follow_pud_mask()
Date: Wed, 27 Mar 2024 11:23:29 -0400
Message-ID: <20240327152332.950956-11-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_152400_601912_71F258DE 
X-CRM114-Status: GOOD (  24.12  )
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

Teach follow_pud_mask() to be able to handle normal PUD pages like hugetlb.

Rename follow_devmap_pud() to follow_huge_pud() so that it can process
either huge devmap or hugetlb. Move it out of TRANSPARENT_HUGEPAGE_PUD and
and huge_memory.c (which relies on CONFIG_THP).  Switch to pud_leaf() to
detect both cases in the slow gup.

In the new follow_huge_pud(), taking care of possible CoR for hugetlb if
necessary.  touch_pud() needs to be moved out of huge_memory.c to be
accessable from gup.c even if !THP.

Since at it, optimize the non-present check by adding a pud_present() early
check before taking the pgtable lock, failing the follow_page() early if
PUD is not present: that is required by both devmap or hugetlb.  Use
pud_huge() to also cover the pud_devmap() case.

One more trivial thing to mention is, introduce "pud_t pud" in the code
paths along the way, so the code doesn't dereference *pudp multiple time.
Not only because that looks less straightforward, but also because if the
dereference really happened, it's not clear whether there can be race to
see different *pudp values when it's being modified at the same time.

Setting ctx->page_mask properly for a PUD entry.  As a side effect, this
patch should also be able to optimize devmap GUP on PUD to be able to jump
over the whole PUD range, but not yet verified.  Hugetlb already can do so
prior to this patch.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h |  8 -----
 mm/gup.c                | 70 +++++++++++++++++++++++++++++++++++++++--
 mm/huge_memory.c        | 47 ++-------------------------
 mm/internal.h           |  2 ++
 4 files changed, 71 insertions(+), 56 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index d3bb25c39482..3f36511bdc02 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -351,8 +351,6 @@ static inline bool folio_test_pmd_mappable(struct folio *folio)
 
 struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, int flags, struct dev_pagemap **pgmap);
-struct page *follow_devmap_pud(struct vm_area_struct *vma, unsigned long addr,
-		pud_t *pud, int flags, struct dev_pagemap **pgmap);
 
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
 
@@ -507,12 +505,6 @@ static inline struct page *follow_devmap_pmd(struct vm_area_struct *vma,
 	return NULL;
 }
 
-static inline struct page *follow_devmap_pud(struct vm_area_struct *vma,
-	unsigned long addr, pud_t *pud, int flags, struct dev_pagemap **pgmap)
-{
-	return NULL;
-}
-
 static inline bool thp_migration_supported(void)
 {
 	return false;
diff --git a/mm/gup.c b/mm/gup.c
index 26b8cca24077..1e5d42211bb4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -525,6 +525,70 @@ static struct page *no_page_table(struct vm_area_struct *vma,
 	return NULL;
 }
 
+#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
+static struct page *follow_huge_pud(struct vm_area_struct *vma,
+				    unsigned long addr, pud_t *pudp,
+				    int flags, struct follow_page_context *ctx)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct page *page;
+	pud_t pud = *pudp;
+	unsigned long pfn = pud_pfn(pud);
+	int ret;
+
+	assert_spin_locked(pud_lockptr(mm, pudp));
+
+	if ((flags & FOLL_WRITE) && !pud_write(pud))
+		return NULL;
+
+	if (!pud_present(pud))
+		return NULL;
+
+	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
+
+	if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
+	    pud_devmap(pud)) {
+		/*
+		 * device mapped pages can only be returned if the caller
+		 * will manage the page reference count.
+		 *
+		 * At least one of FOLL_GET | FOLL_PIN must be set, so
+		 * assert that here:
+		 */
+		if (!(flags & (FOLL_GET | FOLL_PIN)))
+			return ERR_PTR(-EEXIST);
+
+		if (flags & FOLL_TOUCH)
+			touch_pud(vma, addr, pudp, flags & FOLL_WRITE);
+
+		ctx->pgmap = get_dev_pagemap(pfn, ctx->pgmap);
+		if (!ctx->pgmap)
+			return ERR_PTR(-EFAULT);
+	}
+
+	page = pfn_to_page(pfn);
+
+	if (!pud_devmap(pud) && !pud_write(pud) &&
+	    gup_must_unshare(vma, flags, page))
+		return ERR_PTR(-EMLINK);
+
+	ret = try_grab_page(page, flags);
+	if (ret)
+		page = ERR_PTR(ret);
+	else
+		ctx->page_mask = HPAGE_PUD_NR - 1;
+
+	return page;
+}
+#else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
+static struct page *follow_huge_pud(struct vm_area_struct *vma,
+				    unsigned long addr, pud_t *pudp,
+				    int flags, struct follow_page_context *ctx)
+{
+	return NULL;
+}
+#endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
+
 static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
 		pte_t *pte, unsigned int flags)
 {
@@ -760,11 +824,11 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 
 	pudp = pud_offset(p4dp, address);
 	pud = READ_ONCE(*pudp);
-	if (pud_none(pud))
+	if (!pud_present(pud))
 		return no_page_table(vma, flags, address);
-	if (pud_devmap(pud)) {
+	if (pud_leaf(pud)) {
 		ptl = pud_lock(mm, pudp);
-		page = follow_devmap_pud(vma, address, pudp, flags, &ctx->pgmap);
+		page = follow_huge_pud(vma, address, pudp, flags, ctx);
 		spin_unlock(ptl);
 		if (page)
 			return page;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bc6fa82d9815..2979198d7b71 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1377,8 +1377,8 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 }
 
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-static void touch_pud(struct vm_area_struct *vma, unsigned long addr,
-		      pud_t *pud, bool write)
+void touch_pud(struct vm_area_struct *vma, unsigned long addr,
+	       pud_t *pud, bool write)
 {
 	pud_t _pud;
 
@@ -1390,49 +1390,6 @@ static void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 		update_mmu_cache_pud(vma, addr, pud);
 }
 
-struct page *follow_devmap_pud(struct vm_area_struct *vma, unsigned long addr,
-		pud_t *pud, int flags, struct dev_pagemap **pgmap)
-{
-	unsigned long pfn = pud_pfn(*pud);
-	struct mm_struct *mm = vma->vm_mm;
-	struct page *page;
-	int ret;
-
-	assert_spin_locked(pud_lockptr(mm, pud));
-
-	if (flags & FOLL_WRITE && !pud_write(*pud))
-		return NULL;
-
-	if (pud_present(*pud) && pud_devmap(*pud))
-		/* pass */;
-	else
-		return NULL;
-
-	if (flags & FOLL_TOUCH)
-		touch_pud(vma, addr, pud, flags & FOLL_WRITE);
-
-	/*
-	 * device mapped pages can only be returned if the
-	 * caller will manage the page reference count.
-	 *
-	 * At least one of FOLL_GET | FOLL_PIN must be set, so assert that here:
-	 */
-	if (!(flags & (FOLL_GET | FOLL_PIN)))
-		return ERR_PTR(-EEXIST);
-
-	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
-	*pgmap = get_dev_pagemap(pfn, *pgmap);
-	if (!*pgmap)
-		return ERR_PTR(-EFAULT);
-	page = pfn_to_page(pfn);
-
-	ret = try_grab_page(page, flags);
-	if (ret)
-		page = ERR_PTR(ret);
-
-	return page;
-}
-
 int copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
 		  struct vm_area_struct *vma)
diff --git a/mm/internal.h b/mm/internal.h
index 6c8d3844b6a3..eee8c82740b5 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1111,6 +1111,8 @@ int __must_check try_grab_page(struct page *page, unsigned int flags);
 /*
  * mm/huge_memory.c
  */
+void touch_pud(struct vm_area_struct *vma, unsigned long addr,
+	       pud_t *pud, bool write);
 struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
 				   unsigned long addr, pmd_t *pmd,
 				   unsigned int flags);
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
