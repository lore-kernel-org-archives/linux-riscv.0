Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0215AC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 04:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ke0fTkZ3V0vWgv4w//PTnCcvOBf1dVU3B0puwV4WJT4=; b=QlvHmAkIlEiZXn
	Ex/U6s/qetWSeeYnaqGNOtYYl9MYH+cUw4ow5dsRJ45aKEosoNWF20QY4FbfYQ29CWX9FrzfOO5kP
	1zp/femacjF9s2uZQQ/42ZMPgejJE5iv+6265C1U8zyHTfnYuP7SctOWEA8IXWVKqqe/uuALBkhxR
	yPCsF7ZZuV9BKjUOy8eN1spO91cdrOTNo4IIeGUacSN/YjFD4bkIL5blbZIlb5QufnagkL3hDuy9d
	l9izGp4r/zCZx/56ppP0g/GFQmB9g70yn0P3kW1zyrgp/58Zu7g+MU+HvRD+FZln5mqlKhK0AaMOK
	zh5Ah82P95UWo4jmLiFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuOEa-00000004bUp-1z61;
	Tue, 18 Mar 2025 04:07:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO7K-00000004adt-3yud
	for linux-riscv@bombadil.infradead.org;
	Tue, 18 Mar 2025 03:59:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8OMb2TInCE9Qb7KUVvNgWIsY4Uxx9EaJDiVCyGMWyMw=; b=IR+YwRVWHoMI8L4pC/IV0VhApe
	yH+yzks68WWVs6peM4ZC+OvizgLwkauwOktBIWatYiYwN9DzTRW9CZAbBWoW3ZYQlszNOOeSipOon
	PhtzPEPmFurDeIATaWfAKcfK0jQDl6swOYDvTiJFwiBlnJuHbYvRbTWh1h77IoOa4MnfgtOfGMNat
	wGh9sTtX9iWSAR/wOSZ/9Ipr1f1q4wjyRvdLh2a8ru/U2oSDUt65Z2MY2lM0mu0pbstucwcLmGm66
	Jj40qgmk1Q+ec03HInZpZSO3j0oiLxKl2cQPvkcp0tgtGmq1hOJJkZMQ/GYZan/o/Yq3T6cSyUM+Q
	gJjke5Zg==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO7H-00000003eW1-3opP
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 03:59:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22622ddcc35so28790175ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 20:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1742270385; x=1742875185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OMb2TInCE9Qb7KUVvNgWIsY4Uxx9EaJDiVCyGMWyMw=;
        b=P+UXjf/RitKr/XpJhGoBj2JiM/K+O4OEp/Y0E3KV9RCE9nFxY/ky2D0zv62/nhUXe6
         ylR/mVFpMqWTnd+g+b6MVOx6cAPeTRAAMQzpm+kTpafeNXKsJVjxH8IUkvugKw9L8B/l
         QKi/qNhPB4/4oG8GHM8Zl0abbmBOd0RiE2/ZwsT0dwu1PmQBjhRp+2HFzzT8GQNk5XMk
         V9NsVJ3IDN1foSzgDtXaDTOMr54EUXdJli0tiG+lZoJ4F2ocEw2POhkBGXxybWRpPbRG
         b0t1L0IhKII0ziRGzd4QSVbEK+MfRYJPoOhLVUngSfQhroWJK79XvE8FfsA7gCEQIJDZ
         lnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742270385; x=1742875185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OMb2TInCE9Qb7KUVvNgWIsY4Uxx9EaJDiVCyGMWyMw=;
        b=qxHvcD1FyEyp5vAIhnnK9IaLVtNj0ZRJyQeQEHs0Bo/i3UWrMz4RGuXbpSDaqcs8u3
         3Nk4TFcknPQ+Niki3ef+uN+qzDY5ugQTyxLKixOR9UpBYIt5yhHyuPbyKEAMYIlU/FYE
         ikxGAhzI5DkPVdU4fL8s9YE7UPTfYKEJimM5a+d/PhXK2czVk5iN4JpvsNtDLTMolyDW
         3o2x4ZEVtc70LWDRsPVYkxZDyQpP1LFL+d76J9QK5jQjnNc97TpjskFGx/ncsR109THH
         UqVLobERm0MjCNjWQhozUFH9048jWrqSL+JAXlT0X4wZjqrhoCW44l8NmIwTp39Vpk7P
         nODA==
X-Forwarded-Encrypted: i=1; AJvYcCV8WWDikxiCB0R6nC3tUP/YP7LpSok4zhN6wPtlGjZptm3tglW03kE7CnXOgQYvVHtzP9bU7Q47V/GVIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY1jzUqs691JECPB2x2RT+5oVAJOXd0D/BdxwUwzOlcdizm5YM
	C5o3rfyz59AyLTWcR720puXLwBwy8ZuaD76F1Bh7TU8EhgfLLQ1VlGP7f3ceFlI=
X-Gm-Gg: ASbGnct6wwy5zvIAnhPz7UGtzNSN72oMqMSMJUcDrCszMyUPHfd4g7ayLGFQhCwS/KV
	0fWYyS9meNVG677BSldePgV09a9fhw/WSFosmHon+qURpUNZCEVbMR2OXdsZcrKIAW/o/Wmsz0G
	0dO6Lou/XdyqY2IM1/uzqAqVGqQO+ECBQ/KNfVJmTLfKUtyEtn6MkCv/G/EQPtBCXsQdsqlGUbQ
	Obq9REVaEysLfcN3Cs3UfSQTteDkpNodjrGesIPLEUulsNrKxj8ls+tJ7CE60BjS4geZ3sARO/u
	11dPCMyAS0PHrbL5A6rm62VZA40ImMxOyX/AJs4Kmm1I2UDDBRs5v5x2tEDE1F0ca5Cbc5jlZfG
	0w2o3XyOUya8NwTSRoQRyO91r9/4=
X-Google-Smtp-Source: AGHT+IGHO8cx8ckfDIHxWMgqvQhdq4sCCYAYAML9a+Udl9ONIKirtb2WHArjW9djfVtwLHqHp3jjYg==
X-Received: by 2002:a17:903:1ca:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-2262c555e78mr19060495ad.20.1742270385373;
        Mon, 17 Mar 2025 20:59:45 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4b30sm83720135ad.235.2025.03.17.20.59.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Mar 2025 20:59:44 -0700 (PDT)
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
	linux-mm@kvack.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH RESEND v2 1/4] mm/gup: Add huge pte handling logic in follow_page_pte()
Date: Tue, 18 Mar 2025 11:59:27 +0800
Message-Id: <20250318035930.11855-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250318035930.11855-1-luxu.kernel@bytedance.com>
References: <20250318035930.11855-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_035948_068494_0F103D9D 
X-CRM114-Status: GOOD (  14.26  )
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
