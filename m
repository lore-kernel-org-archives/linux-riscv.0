Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1247C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RU+8tYpKOsF9hLgzDMwKMx31qhE8vLOVvO/GmzL2EhQ=; b=v0c9NLWsC2tlvG
	PnOJd57VeAtXjEvb5d6bb4Iv3gx2re0xcGngFdxeWo6gVQ65RGAezdKK2xRuF55q6KtlRhXlFR4ZV
	2QPPBfzkWDNNQYXW4oWRk2wZp9AITTIN90cSDkxbh41XdCtcYmQq+XRbzjo8+645JrjDA07LqSUj1
	KYV7JwBb3RbVKIpwhh3LiA+p/a6jh4K9xSoT10vGxB7KezQfPWZVve+vhstvPGs4bk6wqoHx0BTrR
	wrZyMKUCQIZFYl3i3z2cbS8yJUcqi3KV1oEAvzoHwYbhgkmH42ejTXJSu+YQO5IGZb7X1DmF8vHe4
	8vgq40dvKmdEoOP45FTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treRG-000000030Kg-2HBg;
	Mon, 10 Mar 2025 14:49:06 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trd5Z-00000002mOK-0cXK
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 13:22:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-223594b3c6dso72874195ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 06:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741612953; x=1742217753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FE1/PtV/9zmh+GtmYcbFmUleMVWqQrw0bsQW718u9NM=;
        b=IP0eXj04F/OPYyk1TIiruHrLV3qMCy/CjQtEXKt5RUbOi9x1EAShqe6m+78gtwC70n
         /10T76/Kj3Ei+UzWbzH7lXCS9srNJQdzJ/+D6j5OWtiREK5nVuQTRuBWLla8hPFutcQX
         n+xLRPK331HKKgj6v3m5aj8bJ9ud0V0kUgqhi+4kczrmzFsRWI3eoTxbTblvnSawfjFe
         mwcF7l8I4VJI341M1eCOxV8LFUZVzvDOVE3MK9vMPtkUDqZ/3jbGZlAMaLy0pER2qytT
         GE2bDX2b7oPUX9s5dC5ixsCIUQz3czSy0/lwZV96n0qkC2vhA20Gsm9zZ/iMqcuLNOjt
         dcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612953; x=1742217753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FE1/PtV/9zmh+GtmYcbFmUleMVWqQrw0bsQW718u9NM=;
        b=GwJaoVBBgADU0CwUnHGuTyBanCkoQvPQKRZbmsYch0JxmbGJxLwKPgwbHLN0UCDNvW
         UCJPqNCNzKYSncGDLYfEiixEvfXd3n0UMzFp8VZJy4voxemJ9udT+adkTWjaCsbMC0/C
         EFhH1INxNho9HqW282vo6rhaidLy4XFVV6lYoeLHuUu6+HB/WImAlWCdOuGqDJj53Atx
         PdlJzGwNSwQn82yBtfzXbExUte2QnPO8x/XCzJMhhrYIcsLbiXwtBQbmfdW3RIPyKWbQ
         FtXYin2J3Xfwf8jIJhX17u9Pa6/xMdO4tzlXeORbSHP1MRxm13CH9Y6CVbnfhmBpFd4Q
         jFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWADIsrSBCCp4ritAQKJxzuvK43WbiF1K0fvqBd8+j/WAh5Hzc9Aqlowk3JwVguvZ2ZlvboZfVx2OBThg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Gg8LHKKBswbMWiomgq5NgLrANSLME2alxasNqyO1j1KyuNEq
	al7VAusHZc1Kv2hEgB5bdkZKsBqN6JXpbRxB4STZ4fz9jBFDXv7vGIbnaS2SU4/peOoYIxlUyNN
	SJQQ=
X-Gm-Gg: ASbGncuwHJfhS1OnEzQaPhzBUq61jbbvQUhRUKZVIa7Q+zCCclAoxqJQwv/eOm7fT7r
	NcBXgB94inmHasF0ISJN1p/nooajodW5rCp9289vfTI5ie3iqnPdU/DBFhBOAdP0oYSgisXAFL/
	9OEB6qNmkZF09MFHrBPsnbd2fO7tYQ5gNgyvRd0NGte8SQgNDHkUnTvL/78FHzDl2iJo6dK/3IQ
	tt0QE25ANuYGG00OAh2n3tpm7TNEO9jRxBtb7AzUK+7YSogpjmcG5xz4Rtwa7ZTeXvnSdGhvaFU
	txCmggl2JRAUir8FSESbreZH8xSM5tWdT9keUo3Mk7twGnT2V7H4dxs1t5pYY+Q7ZQztB9lXQ8/
	MvfzN4RR/MfqlqxMhJ+prR5e8Juw=
X-Google-Smtp-Source: AGHT+IFOJcXfNCpatjHpLLH+KqUeCMuEXwNM6dMHRsGOsPG3x+GF1UVPkseaFy0PQweH89Hz1NMnYg==
X-Received: by 2002:a17:902:cccf:b0:224:194c:694c with SMTP id d9443c01a7336-22428aaeb6dmr273817455ad.28.1741612953507;
        Mon, 10 Mar 2025 06:22:33 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e8617sm77318785ad.61.2025.03.10.06.22.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Mar 2025 06:22:33 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: akpm@linux-foundation.org,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 1/4] mm/gup: Handle huge pte for follow_page_pte()
Date: Mon, 10 Mar 2025 21:22:19 +0800
Message-Id: <20250310132222.58378-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250310132222.58378-1-luxu.kernel@bytedance.com>
References: <20250310132222.58378-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_062237_190021_C8E53945 
X-CRM114-Status: GOOD (  13.34  )
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
RISC-V SVNAPOT is enabled. Handle this scenario in follow_page_pte.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h |  6 ++++++
 include/linux/pgtable.h          |  8 ++++++++
 mm/gup.c                         | 22 ++++++++++++++++------
 3 files changed, 30 insertions(+), 6 deletions(-)

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
index 3883b307780ea..84710896f42eb 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -838,11 +838,12 @@ static inline bool can_follow_write_pte(pte_t pte, struct page *page,
 
 static struct page *follow_page_pte(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmd, unsigned int flags,
-		struct dev_pagemap **pgmap)
+		struct follow_page_context *ctx)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct folio *folio;
 	struct page *page;
+	struct hstate *h;
 	spinlock_t *ptl;
 	pte_t *ptep, pte;
 	int ret;
@@ -879,8 +880,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
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
@@ -940,6 +941,15 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 		 */
 		folio_mark_accessed(folio);
 	}
+	if (is_vm_hugetlb_page(vma)) {
+		h = hstate_vma(vma);
+		WARN_ON_ONCE(page_size(page) != huge_page_size(h));
+		page += (address & (huge_page_size(h) - 1)) >> PAGE_SHIFT;
+		ctx->page_mask = (1 << huge_page_order(h)) - 1;
+	} else if (pte_trans_huge(pte)) {
+		page += (address & (page_size(page) - 1)) >> PAGE_SHIFT;
+		ctx->page_mask = (page_size(page) >> PAGE_SHIFT) - 1;
+	}
 out:
 	pte_unmap_unlock(ptep, ptl);
 	return page;
@@ -975,7 +985,7 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 		return no_page_table(vma, flags, address);
 	}
 	if (likely(!pmd_leaf(pmdval)))
-		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
+		return follow_page_pte(vma, address, pmd, flags, ctx);
 
 	if (pmd_protnone(pmdval) && !gup_can_follow_protnone(vma, flags))
 		return no_page_table(vma, flags, address);
@@ -988,14 +998,14 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
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
