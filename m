Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D221C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 12:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ke0fTkZ3V0vWgv4w//PTnCcvOBf1dVU3B0puwV4WJT4=; b=KrTOjcPrHWu4el
	uIR+2bzQJOgl9ll09k0Bk0rEkuw+wTQqhVf14cU3hMhg3hcozJZTxD/19MxVTc75kqwJsEMgwA9Qn
	3LRNKw5GsLE21LAY04vPzqDaKWf26lv2L94GqXtS0MEigvu2AcFGpc6ZOB3EjfhqopWmboRPeoBkV
	EoTYqvpCdx1H685jFaeoZi+rMw7Txb24kJsUWUolMoTwq1CntltrURDBpXGhQinRlN26vdHH1TIXN
	3PjEIEHHwo08L0ZyRwuuFkhlMiaC+OBTkhuXgROfr9hIILVzT80EfuzdPkOuU89y3N+rrjvib2w4N
	K+Ki/Bi4VeUJfyJnWDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryvX-00000005gwv-3toi;
	Tue, 11 Mar 2025 12:41:43 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryfj-00000005d6j-1Wa3
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 12:25:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22359001f1aso127549345ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 05:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741695922; x=1742300722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OMb2TInCE9Qb7KUVvNgWIsY4Uxx9EaJDiVCyGMWyMw=;
        b=fHi/f5ie5g+Raron2UT8ctucRsTpWdXbh5bc78KgqgOZeoH3xy3CojPxpdDKWCNIgO
         G8DkRn71T1IJlSWckodvIrm2EIGNV2hNQPuIejIW01GnueNgv0mBcMFlla3DR0A9L7Db
         aDN7g2F+IbNPw3JIZNImY6ZwUI3H9Tz418bX6ZTO0yejSS4ZQyTM2fat9fr7iQOo9dr4
         RyjSqLWdWxaQjNbZqLHCO4Tm6NGZLFIVYD0DP7GuGqqCoAKmg1jZEwIqaB3EAR19Mrdk
         zJlC01ZSGIn7je9gZqgR35OOTwjcLA51CojNC94J6SXnC9I8ijxpWRdbfOseW3fft9rX
         QPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741695922; x=1742300722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OMb2TInCE9Qb7KUVvNgWIsY4Uxx9EaJDiVCyGMWyMw=;
        b=L8fGAmz6H3ZzogJ1K5DibUlk3wmjGdbzCBvsdezjdInyHexVfNSuO7nwUCsEhy8dLt
         Wna7ixqr074NDq6Lfx+PkrIurJgk4kQW4VAVzlGk1CqCyhFdybY0U7X/GBec3iyNbB3p
         GHcr6ODhdY07dQEpQyN/i427LMdqfcGEjUpo/00zXC7wZi3XMx4qwwbuZPOdzAchglGf
         Elu/TsmMS2KZdmcl5rrKIlL6PKGsIpF58rWPSGgKVc4fzrwS9/6NFfFGRX4LWIrpmXGm
         ODfTjHevEHmefJHLemTrO82FRAhcxbKYrRm0ZIQzDrSvxZRQqxjIJHgPt0dohY+uX9iz
         bcKg==
X-Forwarded-Encrypted: i=1; AJvYcCUH259Tzytq4XKRHe1bxrtBE03ldhg+0TNehWPth4YO6v3Fdj2tpS9y4wkqkn/Z1pi05A0lpe2V7qssnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwUQg2/SKkGtZmvSs17hXRKzusw6MgiTyO6mO3rTqX5LaivGNI
	lPzRkc35UgUFpkYZ/HeBkZIxZ3mBHO0O3RtkebZKxBDpb9Y8vYm6GxCPWe9n1JI=
X-Gm-Gg: ASbGncumZ8BDZyJIsGVGOaAAQYSH2SSHlAtos/mxB4/4T7n6iEHuvVLhq8hTRuYKOnJ
	yHpiCY+EnZtMcvj6IZNqDWqPigxtX3G77n3FS0AecMB6CGXdkjYR8M3IUR1D3QidrKs3bIXzWf3
	yfea/Y47ce8TKfAUPfYrOtyJ9ozeEGx2StY+w8p2KMR87Y6WfcrSkP1BOaPKnXw64F5Rfa27Nlv
	TKcTI1nMVj1eIxEpiCLVQHKnyaVcNB4JHiXB/VeZY14eMol3wSvPRRS1N/IOAgGTU617zD3PiqU
	Ng6zNd8oiaSCUv9RetjwJRZcQ9GRaEtrhPgdGw1nZhygMqdAjzo7P9HgRdI9bVZP2qDA/UIvgmV
	HgQiNYZzXVGxhF7eFxzIxrO88ajc=
X-Google-Smtp-Source: AGHT+IF+AKaM7+LGh1MSeSzuaMnYSTp9Pfd35y7XVQv+2e9hDZ72MVIWeURa7iA/fxUl+/8M2l45Ow==
X-Received: by 2002:a05:6a20:c891:b0:1f5:59e5:8ada with SMTP id adf61e73a8af0-1f559e58e8dmr18738163637.4.1741695922464;
        Tue, 11 Mar 2025 05:25:22 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698450244sm10226621b3a.80.2025.03.11.05.25.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Mar 2025 05:25:22 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: akpm@linux-foundation.org,
	jhubbard@nvidia.com,
	kirill.shutemov@linux.intel.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2 1/4] mm/gup: Add huge pte handling logic in follow_page_pte()
Date: Tue, 11 Mar 2025 20:25:07 +0800
Message-Id: <20250311122510.72934-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250311122510.72934-1-luxu.kernel@bytedance.com>
References: <20250311122510.72934-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_052523_414238_D4D68E71 
X-CRM114-Status: GOOD (  14.78  )
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

Page mapped at pte level can also be huge page when ARM CONT_PTE or
RISC-V SVNAPOT is applied. Lack of huge pte handling logic in
follow_page_pte() may lead to both performance and correctness issues.

For example, on RISC-V platform, pages in the same 64K huge page have
the same pte value, which means follow_page_pte() will get the same page
for all of them using pte_pfn(). Then __get_user_pages() will return an
array of pages with the same pfn. Mapping these pages causes memory
confusion. This error can be triggered by the following code:

  void *addr = mmap(NULL, 0x10000, PROT_READ | PROT_WRITE, MAP_ANONYMOUS |
		  MAP_PRIVATE | MAP_HUGETLB | MAP_HUGE_64KB, -1, 0);
  struct vfio_iommu_type1_dma_map dmap_map = {
	  .argsz = sizeof(dma_map),
	  .flags = VFIO_DMA_MAP_FLAG_READ | VFIO_DMA_MAP_FLAG_WRITE,
	  .vaddr = (uint64_t)addr,
	  .size = 0x10000,
  };

  ioctl(vfio_container_fd, VFIO_IOMMU_MAP_DMA, &dma_map);

This commit supplies huge pte handling logic in follow_page_pte() to
avoid such problems.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h |  6 ++++++
 include/linux/pgtable.h          |  8 ++++++++
 mm/gup.c                         | 17 +++++++++++------
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 050fdc49b5ad7..40ae5979dd82c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -800,6 +800,12 @@ static inline bool pud_user_accessible_page(pud_t pud)
 #endif
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#define pte_trans_huge	pte_trans_huge
+static inline int pte_trans_huge(pte_t pte)
+{
+	return pte_huge(pte) && pte_napot(pte);
+}
+
 static inline int pmd_trans_huge(pmd_t pmd)
 {
 	return pmd_leaf(pmd);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 94d267d02372e..3f57ee6dcf017 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1584,6 +1584,14 @@ static inline unsigned long my_zero_pfn(unsigned long addr)
 
 #ifdef CONFIG_MMU
 
+#if (defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(pte_trans_huge)) || \
+	(!defined(CONFIG_TRANSPARENT_HUGEPAGE))
+static inline int pte_trans_huge(pte_t pte)
+{
+	return 0;
+}
+#endif
+
 #ifndef CONFIG_TRANSPARENT_HUGEPAGE
 static inline int pmd_trans_huge(pmd_t pmd)
 {
diff --git a/mm/gup.c b/mm/gup.c
index 3883b307780ea..67981ee28df86 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -838,7 +838,7 @@ static inline bool can_follow_write_pte(pte_t pte, struct page *page,
 
 static struct page *follow_page_pte(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmd, unsigned int flags,
-		struct dev_pagemap **pgmap)
+		struct follow_page_context *ctx)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct folio *folio;
@@ -879,8 +879,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 		 * case since they are only valid while holding the pgmap
 		 * reference.
 		 */
-		*pgmap = get_dev_pagemap(pte_pfn(pte), *pgmap);
-		if (*pgmap)
+		ctx->pgmap = get_dev_pagemap(pte_pfn(pte), ctx->pgmap);
+		if (ctx->pgmap)
 			page = pte_page(pte);
 		else
 			goto no_page;
@@ -940,6 +940,11 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 		 */
 		folio_mark_accessed(folio);
 	}
+	if (is_vm_hugetlb_page(vma) || pte_trans_huge(pte)) {
+		ctx->page_mask = (1 << folio_order(folio)) - 1;
+		page = folio_page(folio, 0) +
+		       ((address & (folio_size(folio) - 1)) >> PAGE_SHIFT);
+	}
 out:
 	pte_unmap_unlock(ptep, ptl);
 	return page;
@@ -975,7 +980,7 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 		return no_page_table(vma, flags, address);
 	}
 	if (likely(!pmd_leaf(pmdval)))
-		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
+		return follow_page_pte(vma, address, pmd, flags, ctx);
 
 	if (pmd_protnone(pmdval) && !gup_can_follow_protnone(vma, flags))
 		return no_page_table(vma, flags, address);
@@ -988,14 +993,14 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 	}
 	if (unlikely(!pmd_leaf(pmdval))) {
 		spin_unlock(ptl);
-		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
+		return follow_page_pte(vma, address, pmd, flags, ctx);
 	}
 	if (pmd_trans_huge(pmdval) && (flags & FOLL_SPLIT_PMD)) {
 		spin_unlock(ptl);
 		split_huge_pmd(vma, pmd, address);
 		/* If pmd was left empty, stuff a page table in there quickly */
 		return pte_alloc(mm, pmd) ? ERR_PTR(-ENOMEM) :
-			follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
+			follow_page_pte(vma, address, pmd, flags, ctx);
 	}
 	page = follow_huge_pmd(vma, address, pmd, flags, ctx);
 	spin_unlock(ptl);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
