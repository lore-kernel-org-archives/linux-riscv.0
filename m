Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D8DC28B2E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SmjxGscVDcX7xDChu3Asd5VPBIahKIPSFy1bnJRj6o=; b=OQRWVQ9r+ye2s/
	EkpCRWDI2A4bBrNVlDPlydg3xW48Xxrlz2N727DvHKEHVe3J+Fa786HRz51/vmdS1gWiP5M5/uMp1
	49N9BjeDUkhr2vYWsO+sp2sueJBTEOme3ZhCGgmgVcBJKsbO4Z+dWka0MLXsLfG2sdVjCcK8Uko9J
	RMmMC88HuRbLPXO44HYF/0W2PPsJbAn/6OZ46FboR0p2KRQfXZwL3POrbZXkB9ktzmwFiNqJ4SpFr
	Oji1/LDdo6ktALAtc+24sFm+L8rNKFh9ukRFAvqebxcVtPsLPCcthtKAXbxByzc10v84YqTy0VSEt
	ZEZ+gpemVBolyMWy8msQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryvZ-00000005gz9-3U0V;
	Tue, 11 Mar 2025 12:41:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryfn-00000005dBM-24lL
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 12:25:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2235189adaeso90951045ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741695926; x=1742300726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RzuTPLpNm7preMNxFl4olDUAY05FyWZH15sy7wmcR0=;
        b=lMw3NHxvbVSnvvdYvW+eiheDIw5UA17vR+lUgd6/1/1UhvUgc+ZxfmCvpBmxtduLhO
         zko3SitSv1+MqxyL8dBzvlnFiznegC/r//58a2I0W3KXX1zyqBD8SYuKt38P5Aqv2Jfm
         5u3F0v83Ga3bqCL3AqWpZX+tfsbj1XjgFsZ7kfxej8+eY9k4khY6UHVwSGYM7IbW7+7B
         q4G9Z6BOkFMXKGrs+GhnN+vt7Hv74kD6Ew3Gihw5evi3koYgeyWYlc7uEEOsLhmtoo8J
         qdKgHryfnc5mQy4gBhApf1HLgdBGdsJ93XkBAedHl5Dgq8/TJ1awCxdJgfMwUZWr6E/X
         le+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741695926; x=1742300726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RzuTPLpNm7preMNxFl4olDUAY05FyWZH15sy7wmcR0=;
        b=sxzjTqvYV0V43IASbiDgNbR2cJnisewQHf7076cF5BrjR/JCa1TlZkJGyI7JD7BGSj
         9tppTi690T7U8iQGK9omCIrZnjCekNt8vmilZ+y0+RXKFuzXAx1RunrSz1oKSV9CqfgX
         8tN2XtN/Zgjs7gketRWaMAj9WJPJJBl5eq7X8oTcq25WM2dawAUSTMLO3QNjn44o4+Q5
         hR9u4pzC3vXl1II3YZiVaVpws8eM/i5RWd2mataIttSxD8SBcGSQ2hzwlBdCKaASTM+6
         MzEYfz92TnGtCo8ANL9KH+aS1cpjL9u81dPq0F7jUTw0ejNHSSiFyGyDT5YhR/Ag4pGW
         /oIw==
X-Forwarded-Encrypted: i=1; AJvYcCWfY8mav1i9MujI4Onlz36p6n/TYKbopGfkj8j84NXJXXm+gtS6AjixNwP6V8Tok4hgxD5frfTOikl1Ag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6an+nRshoH5IUsGHcmuv1b6AIDTeggMXOyFoWWUfgeb0zUSLN
	RfhU4qH0I/qLIMFbfurKrEDEHCPX388aag1w5nGs73ox8Dnrcv9H3NMm6sVAeDk=
X-Gm-Gg: ASbGnct2Ljb/8JcyNzreWZnbSi6rI9CF/IBb7VxAVXdFxYhDUY/u7R5WWe2SXYPwFAI
	UuAOtCg1fd06cYX4r29O0uRPlcABqc1KJXUXDh3EkUhNkmflhVNB0pH0seEcYxUtvILzqvC8zQw
	OQwXP7UYlNhL2r/wzwxTIW7mtgtLToxj6JQoadlC8CnxAubT1kKpfIF30T25EUxxPGi1J1aPu+2
	gH1Xpy198sDD6q3Fpw8GfY3Uxm+lAkdAdjpJG2qnuSCChlu3TWoJgYYbqU5hbjJ9IIcsg9mw0mV
	2Wa1hhk9Plk+WnA6HItxG8sgWKkjxho9IOH0qkdPy0ub74bR1MmuQmXVUDQOkpWB7oNhCZEhC1Y
	Lnj5+09QvfpbfAL2309ssbhlfdhI=
X-Google-Smtp-Source: AGHT+IHHairhRley3Z0YtWmhECEN1QFgthVXv+QZN2Jlw6i0j1evvIpG3tBXLE7daxMtzzOJIpUjxQ==
X-Received: by 2002:a17:902:cf0f:b0:220:ff82:1c60 with SMTP id d9443c01a7336-22593d78a97mr51960105ad.14.1741695926535;
        Tue, 11 Mar 2025 05:25:26 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698450244sm10226621b3a.80.2025.03.11.05.25.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Mar 2025 05:25:26 -0700 (PDT)
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
Subject: [PATCH v2 2/4] iommu/riscv: Use pte_t to represent page table entry
Date: Tue, 11 Mar 2025 20:25:08 +0800
Message-Id: <20250311122510.72934-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250311122510.72934-1-luxu.kernel@bytedance.com>
References: <20250311122510.72934-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_052527_564339_0AA693B4 
X-CRM114-Status: GOOD (  15.76  )
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
 drivers/iommu/riscv/iommu.c | 79 ++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 40 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8f049d4a0e2cb..3b0c934decd08 100644
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
-					    unsigned long iova, size_t pgsize,
-					    gfp_t gfp)
+static pte_t *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
+				    unsigned long iova, size_t pgsize,
+				    gfp_t gfp)
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
@@ -1147,38 +1149,37 @@ static unsigned long *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
 			addr = iommu_alloc_page_node(domain->numa_node, gfp);
 			if (!addr)
 				return NULL;
-			old = pte;
-			pte = _io_pte_entry(virt_to_pfn(addr), _PAGE_TABLE);
-			if (cmpxchg_relaxed(ptr, old, pte) != old) {
-				iommu_free_page(addr);
+			old = ptep_get(ptr);
+			if (!_io_pte_none(old))
 				goto pte_retry;
-			}
+			pte = _io_pte_entry(virt_to_pfn(addr), _PAGE_TABLE);
+			set_pte(ptr, pte);
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
@@ -1191,8 +1192,9 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
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
 
@@ -1210,10 +1212,9 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
 			break;
 		}
 
-		old = READ_ONCE(*ptr);
+		old = ptep_get(ptr);
 		pte = _io_pte_entry(phys_to_pfn(phys), pte_prot);
-		if (cmpxchg_relaxed(ptr, old, pte) != old)
-			continue;
+		set_pte(ptr, pte);
 
 		riscv_iommu_pte_free(domain, old, &freelist);
 
@@ -1247,7 +1248,7 @@ static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	size_t size = pgcount << __ffs(pgsize);
-	unsigned long *ptr, old;
+	pte_t *ptr;
 	size_t unmapped = 0;
 	size_t pte_size;
 
@@ -1260,9 +1261,7 @@ static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
 		if (iova & (pte_size - 1))
 			return unmapped;
 
-		old = READ_ONCE(*ptr);
-		if (cmpxchg_relaxed(ptr, old, 0) != old)
-			continue;
+		set_pte(ptr, __pte(0));
 
 		iommu_iotlb_gather_add_page(&domain->domain, gather, iova,
 					    pte_size);
@@ -1279,13 +1278,13 @@ static phys_addr_t riscv_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
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
