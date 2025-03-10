Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC34FC28B2E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 14:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6yhRVPOCQqm/jMcAU0esxZMMbqUTl+RlzVzdTfWWcU=; b=zTloH2lJ5Q9bmp
	MHXeArQUlISt0iU9v9MmO3obtjQhXVllDv5r3t4QettQMhxoF91TokKNCWfr2seGNeM7QHnKJhCH4
	xmN6wHXYDFYNCWHVbumlX8WtFyTqWngbnO4blJ3r2s0RuLzNNs7w4GD9XSJtcs5rbZKzD9JuAjTyu
	ACD82TSfChBECAc3K9LY5yk05AJJfeuPqnDQr1msb/cLUXxmBa18NEbg5bvMimpdywlpHp3lidqVe
	V48Mfz3Iy+9ly1wRmOj2kSqwE88b0No+GEfWzx42afy5F9tN7OK406sEcRi1wTcbw2zygA+1E4R/M
	6yMwawAaexWLXlkFIceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treRH-000000030L3-0iN0;
	Mon, 10 Mar 2025 14:49:07 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trd5a-00000002mQt-0awq
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 13:22:39 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-224100e9a5cso75918315ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741612957; x=1742217757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZMOD/Qf6hHTG0QsYxy12Mjhes8Th3228e4iu7j8c1w=;
        b=XKsg78TKLB+Ryh3yIzTWhVgSaFkIANgqkvm5Fgq0wmeGDstK8Wczp8hhWvbe7PaX17
         0ns4WGRI1iryBAl95b98R9JtZzqOFoHvXlJg4APq8dWpYuO4dn/zxvPvJqKogZTiBR0L
         AVnHYuWMnkui6lIiX7oP0u4lzr4pZ9vs2tEA/AGV43ZK8ptSOphPW2mFytoVSdlj77wO
         d12tjDOe/pqNB3v9Unwvq3z2jqYEnmmWtYVF5ZIo60bK4QjONdTxoHf2L/jnoj2V6p0u
         GEf+mrG6R8OJfAcGd5n7/g0QUmVn3LKNyDA4iSQQzNM7M6oCfxlb4m/icrCNlTBuA4BB
         iMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612957; x=1742217757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZMOD/Qf6hHTG0QsYxy12Mjhes8Th3228e4iu7j8c1w=;
        b=pa5avcSCxjZqi+3ekVJjRScVU20Q1Lv5GRPOCYYMhVXCQ7/SpOGWUaRNjA9ojV3W5C
         pnJ9sfyb+w5g1b2oAVDvPSeFZD4M/l/cFindwn66VSWOhikuHaDxWX3eFM8JU5qf1Dst
         CyQmd734xnGfNbP1rWP60au4ZwLvmgsNtoSMmhmU1mauwkgLAyTOZpocq9K2u5KQ+r/s
         GVu4FMQni4Yzx5KbNJDxCs+zA7TIpwN3U6ZHP2+Yf+ci7iw3mCCGX7sSGz00Sl6sg2Kf
         s0IwvfIgM4IQkwurwzEEnq0PjHDZolVGw6BO5Fk9ykp1qwr0SlFZzzT0th1zNWSyIA9y
         N+bg==
X-Forwarded-Encrypted: i=1; AJvYcCXkB5Opt199ojvCg20tHPnKmExaMZlMHzqqfbtQyDLUEvDJPIlJN7KnZBS3s9HotpEru4LU4qdFxA3w0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2m92yx1yNryg5U/H0otdq4phwyRnLOyA0t7H5+sO8r+GDqj4q
	vrwDWdV2uVkO9210NqqLrhnvVNYJLH0znfqdP22NDtRTc76ZdL4DPZyjp/HDz1I=
X-Gm-Gg: ASbGncsrY7/NFuCa4GjZkTMCsQCV9eawrY/lYg/6ksBiDXdAWe3XaytxVnjBjIVPdDH
	pXH6hHKKZXUVIM9wezTY4qaaMBHLbhuPIAZRI+lgKt2tD7wbNc+ROIxSKDObKSx+4c1oTVvKo51
	cvB3Eouk9JhGsn00/XNsRV9sTzpgS0pAsYJkkFzy+tpQ/ow/O4smjHPbZK4XUpG6NpVW9u5vbwd
	CvXg1SuilaK8Afao50u/P2fElG+wjtAJ7ifurEd6GGd8psR6MAVwuAxx3ggKKt5OA/J98oUTVZo
	pHK0DGw8hof5x3JqaVCaN78k2x0E/UPSjL5VR68OZjv5+CyF/mEIrZfiedG5phVyHLSKTxalhVj
	yhxIHFZp6Qq78UGaNt/IXK7Eng0Q=
X-Google-Smtp-Source: AGHT+IFwyZ7/tPtBqU0g9RIHfp+iyK4Go8JH9gtSnoe0FV3ZnIyO4IbhPZG1IS3E7YfaXc51VxACFw==
X-Received: by 2002:a17:903:1790:b0:224:2a6d:55ae with SMTP id d9443c01a7336-2242a6d585emr214130785ad.48.1741612957112;
        Mon, 10 Mar 2025 06:22:37 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e8617sm77318785ad.61.2025.03.10.06.22.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Mar 2025 06:22:36 -0700 (PDT)
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
Subject: [PATCH 2/4] iommu/riscv: Use pte_t to represent page table entry
Date: Mon, 10 Mar 2025 21:22:20 +0800
Message-Id: <20250310132222.58378-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250310132222.58378-1-luxu.kernel@bytedance.com>
References: <20250310132222.58378-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_062238_178231_2F583BBA 
X-CRM114-Status: GOOD (  15.34  )
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

Since RISC-V IOMMU has the same pte format and translation process with
MMU as is specified in RISC-V Privileged specification, we use pte_t to
represent IOMMU pte too to reuse existing pte operation functions.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/iommu/riscv/iommu.c | 66 ++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8f049d4a0e2cb..f752096989a79 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -812,7 +812,7 @@ struct riscv_iommu_domain {
 	bool amo_enabled;
 	int numa_node;
 	unsigned int pgd_mode;
-	unsigned long *pgd_root;
+	pte_t *pgd_root;
 };
 
 #define iommu_domain_to_riscv(iommu_domain) \
@@ -1081,27 +1081,29 @@ static void riscv_iommu_iotlb_sync(struct iommu_domain *iommu_domain,
 
 #define PT_SHIFT (PAGE_SHIFT - ilog2(sizeof(pte_t)))
 
-#define _io_pte_present(pte)	((pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE))
-#define _io_pte_leaf(pte)	((pte) & _PAGE_LEAF)
-#define _io_pte_none(pte)	((pte) == 0)
-#define _io_pte_entry(pn, prot)	((_PAGE_PFN_MASK & ((pn) << _PAGE_PFN_SHIFT)) | (prot))
+#define _io_pte_present(pte)	(pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE))
+#define _io_pte_leaf(pte)	(pte_val(pte) & _PAGE_LEAF)
+#define _io_pte_none(pte)	(pte_val(pte) == 0)
+#define _io_pte_entry(pn, prot)	(__pte((_PAGE_PFN_MASK & ((pn) << _PAGE_PFN_SHIFT)) | (prot)))
 
 static void riscv_iommu_pte_free(struct riscv_iommu_domain *domain,
-				 unsigned long pte, struct list_head *freelist)
+				 pte_t pte, struct list_head *freelist)
 {
-	unsigned long *ptr;
+	pte_t *ptr;
 	int i;
 
 	if (!_io_pte_present(pte) || _io_pte_leaf(pte))
 		return;
 
-	ptr = (unsigned long *)pfn_to_virt(__page_val_to_pfn(pte));
+	ptr = (pte_t *)pfn_to_virt(pte_pfn(pte));
 
 	/* Recursively free all sub page table pages */
 	for (i = 0; i < PTRS_PER_PTE; i++) {
-		pte = READ_ONCE(ptr[i]);
-		if (!_io_pte_none(pte) && cmpxchg_relaxed(ptr + i, pte, 0) == pte)
+		pte = ptr[i];
+		if (!_io_pte_none(pte)) {
+			ptr[i] = __pte(0);
 			riscv_iommu_pte_free(domain, pte, freelist);
+		}
 	}
 
 	if (freelist)
@@ -1110,12 +1112,12 @@ static void riscv_iommu_pte_free(struct riscv_iommu_domain *domain,
 		iommu_free_page(ptr);
 }
 
-static unsigned long *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
+static pte_t *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
 					    unsigned long iova, size_t pgsize,
 					    gfp_t gfp)
 {
-	unsigned long *ptr = domain->pgd_root;
-	unsigned long pte, old;
+	pte_t *ptr = domain->pgd_root;
+	pte_t pte, old;
 	int level = domain->pgd_mode - RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39 + 2;
 	void *addr;
 
@@ -1131,7 +1133,7 @@ static unsigned long *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
 		if (((size_t)1 << shift) == pgsize)
 			return ptr;
 pte_retry:
-		pte = READ_ONCE(*ptr);
+		pte = ptep_get(ptr);
 		/*
 		 * This is very likely incorrect as we should not be adding
 		 * new mapping with smaller granularity on top
@@ -1154,31 +1156,31 @@ static unsigned long *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
 				goto pte_retry;
 			}
 		}
-		ptr = (unsigned long *)pfn_to_virt(__page_val_to_pfn(pte));
+		ptr = (pte_t *)pfn_to_virt(pte_pfn(pte));
 	} while (level-- > 0);
 
 	return NULL;
 }
 
-static unsigned long *riscv_iommu_pte_fetch(struct riscv_iommu_domain *domain,
-					    unsigned long iova, size_t *pte_pgsize)
+static pte_t *riscv_iommu_pte_fetch(struct riscv_iommu_domain *domain,
+				    unsigned long iova, size_t *pte_pgsize)
 {
-	unsigned long *ptr = domain->pgd_root;
-	unsigned long pte;
+	pte_t *ptr = domain->pgd_root;
+	pte_t pte;
 	int level = domain->pgd_mode - RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39 + 2;
 
 	do {
 		const int shift = PAGE_SHIFT + PT_SHIFT * level;
 
 		ptr += ((iova >> shift) & (PTRS_PER_PTE - 1));
-		pte = READ_ONCE(*ptr);
+		pte = ptep_get(ptr);
 		if (_io_pte_present(pte) && _io_pte_leaf(pte)) {
 			*pte_pgsize = (size_t)1 << shift;
 			return ptr;
 		}
 		if (_io_pte_none(pte))
 			return NULL;
-		ptr = (unsigned long *)pfn_to_virt(__page_val_to_pfn(pte));
+		ptr = (pte_t *)pfn_to_virt(pte_pfn(pte));
 	} while (level-- > 0);
 
 	return NULL;
@@ -1191,8 +1193,9 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	size_t size = 0;
-	unsigned long *ptr;
-	unsigned long pte, old, pte_prot;
+	pte_t *ptr;
+	pte_t pte, old;
+	unsigned long pte_prot;
 	int rc = 0;
 	LIST_HEAD(freelist);
 
@@ -1210,10 +1213,9 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
 			break;
 		}
 
-		old = READ_ONCE(*ptr);
+		old = ptep_get(ptr);
 		pte = _io_pte_entry(phys_to_pfn(phys), pte_prot);
-		if (cmpxchg_relaxed(ptr, old, pte) != old)
-			continue;
+		set_pte(ptr, pte);
 
 		riscv_iommu_pte_free(domain, old, &freelist);
 
@@ -1247,7 +1249,7 @@ static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	size_t size = pgcount << __ffs(pgsize);
-	unsigned long *ptr, old;
+	pte_t *ptr;
 	size_t unmapped = 0;
 	size_t pte_size;
 
@@ -1260,9 +1262,7 @@ static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
 		if (iova & (pte_size - 1))
 			return unmapped;
 
-		old = READ_ONCE(*ptr);
-		if (cmpxchg_relaxed(ptr, old, 0) != old)
-			continue;
+		set_pte(ptr, __pte(0));
 
 		iommu_iotlb_gather_add_page(&domain->domain, gather, iova,
 					    pte_size);
@@ -1279,13 +1279,13 @@ static phys_addr_t riscv_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	size_t pte_size;
-	unsigned long *ptr;
+	pte_t *ptr;
 
 	ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
-	if (_io_pte_none(*ptr) || !_io_pte_present(*ptr))
+	if (_io_pte_none(ptep_get(ptr)) || !_io_pte_present(ptep_get(ptr)))
 		return 0;
 
-	return pfn_to_phys(__page_val_to_pfn(*ptr)) | (iova & (pte_size - 1));
+	return pfn_to_phys(pte_pfn(ptep_get(ptr))) | (iova & (pte_size - 1));
 }
 
 static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
