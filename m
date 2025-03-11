Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9733FC35FF1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFffb7+EGlzSecglz7jd3VaFH+udym1LMlEAgOOjpMQ=; b=tcynUYPDWlD2jD
	FZcwmZxafNgotUcXDwGlxk7TuWVUHxgkEMWQbgtPPUvailLmczbyDYAacx06a50kOPLyvBttnYdsx
	VV+8Mj7pg0P5RA5OdYPoU/3qPCzeu9HnLM+Zb7JVzIh7s7PDDbDa5epQFdvrmoqWBD4WAHdcKUXbS
	TG7TFhvfaR9qsRRVY7+AR5AxrkNDFrJ+lPZWuWbAgrbFrDkhcWfI9qFdtJZers3tiTR7Vr7DGFBaj
	qYaaGWNz4VcdHXf47xF5/4XzHBu6Nyd2svxk5ecGO1p6a2IbHEiroX6XMIk2qb9U5OEcxXlu3TsJ2
	fCeBPkvEcHlCviUwqOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryva-00000005h0K-2QOa;
	Tue, 11 Mar 2025 12:41:46 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryfr-00000005dE4-3G0m
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 12:25:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-219f8263ae0so100784965ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741695931; x=1742300731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaRB3Z7Zn9kGyUKfUpl8WYZaXTZf5T6vpq1GZf0TWl4=;
        b=VjySV44CVOjO+Vust+dUZdnA/+bQJh2Dq0uq5pRswcR7NBi+RTULXR+wvm4hzCFECY
         cAqN8gljZTEOaUDBhjHlTmrsb0LjaWKFgw+QG4WCiNuSSXx0m71KhrD5LMNoANCx6plQ
         rrvxjCpLHCTsvV8yDGMEAOVUgBndw217296bTMVZ/Lu/MS+ktOobSxorkxJXNdQNW9VW
         NDvP1VaUh9eZNq9vfOLedB5IcjGzb+UyQTXsm8ItxKpy/ZJMemCBB0xMZvdKqu0c+0ZG
         tXHSsdRgqOZH2v/JSoD0hYrVsFc5ZDHrXZeclMSA3H7SVI8JFAiSDTyzEdyEOgk/2knl
         x9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741695931; x=1742300731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaRB3Z7Zn9kGyUKfUpl8WYZaXTZf5T6vpq1GZf0TWl4=;
        b=Z100NZpFDkhlBh7LZRBBDd/fmI/Z5BsYxCMjbbPjk85Ft/NJDXykj6IgdyPCKDQKNR
         N2GaztHM8Rj4/c9UPgv+silhAkwEKKlsMtLbw3fH1W38jQNpqXFGpDpBzNDY/OowXr8J
         r/JWRoKN+CHhlGdtc99/TWBRZEcChVfAG+t5rkbm2TW49Y2bfRYJj/w2Q4l+OrbLaBU4
         SPvVVJ0Kl2tKBMuPPUeecHHRlmlpSpZ7IEXdh0eQMxRUge2QgvG+abfMr45P+8gx72eb
         MkkFtiGccQijmMqnax798No7VBR+BuUMOdhfFRvCjMLzUU9P/j+qnHy2I5ffF1STpB5u
         J/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCX1NTH+n+mGsdaPFCW2uJ98iCSIU89TjUB2qZnEASSuJZRLFqXaydpjx0e1WOO4h8nfj77ZGBrG2kC27w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcEg2md3x/UoI6ZCTP+/AuQkv2fp8hnqJDRBY88IIN7HTby/Is
	soMM5rwU/s6KdjlCk0/kmtkNwFqLPpLzEuAqAOjtKkTWJBHLHVjgYiwgiIg/qjI=
X-Gm-Gg: ASbGnctwpChje1Y3mk4meqZ9+70Z5rCRwM86YCwzqDHE27FbhZnt5DjdTI7gkkHXbmO
	lK9Jiw+mqTieAoETgQgxQycrB24E70DEfqV9juY4PtHGi6MBo0kBRmxyeOxzr5X1/JqnZiI76WW
	zTqQsv4hHFy0I7lf2fiH8xrmyZK041+A0rskhkIn874JE3N8uNTrTBHO8O4TAPf1Emp0t/vhRUI
	lB3r+7BOFVFGxH/W+tDFy43FNmmwIflYRg6S5ZjZoviX1rB85x+AYlwPkh1brJt2yAHkm/1sTy8
	Od6xoV2lIDtdTGaJHIIuOwfRlAA8uMLBdTQSAHDxhNIZHcIypQ4cQ4W45NYa2z69m/AUq7ewbHp
	7TzRAjI4VNwmtCvfTl53Q8vFUaMb1T3oup+IhfQ==
X-Google-Smtp-Source: AGHT+IHyZHInMD5SykYccWKdstIzjRz05MOYhFQPfcCcFj0ULoo9WguYAXrHgJpVCASbofOODWBviA==
X-Received: by 2002:a05:6a00:10d5:b0:736:47a5:e268 with SMTP id d2e1a72fcca58-736eb7b363bmr4610912b3a.1.1741695930617;
        Tue, 11 Mar 2025 05:25:30 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698450244sm10226621b3a.80.2025.03.11.05.25.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Mar 2025 05:25:30 -0700 (PDT)
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
Subject: [PATCH v2 3/4] iommu/riscv: Introduce IOMMU page table lock
Date: Tue, 11 Mar 2025 20:25:09 +0800
Message-Id: <20250311122510.72934-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250311122510.72934-1-luxu.kernel@bytedance.com>
References: <20250311122510.72934-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_052531_826581_11013CEE 
X-CRM114-Status: GOOD (  16.46  )
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

Introduce page table lock to address competition issues when modifying
multiple PTEs, for example, when applying Svnapot. We use fine-grained
page table locks to minimize lock contention.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/iommu/riscv/iommu.c | 123 +++++++++++++++++++++++++++++++-----
 1 file changed, 107 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 3b0c934decd08..ce4cf6569ffb4 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -808,6 +808,7 @@ struct riscv_iommu_domain {
 	struct iommu_domain domain;
 	struct list_head bonds;
 	spinlock_t lock;		/* protect bonds list updates. */
+	spinlock_t page_table_lock;	/* protect page table updates. */
 	int pscid;
 	bool amo_enabled;
 	int numa_node;
@@ -1086,8 +1087,80 @@ static void riscv_iommu_iotlb_sync(struct iommu_domain *iommu_domain,
 #define _io_pte_none(pte)	(pte_val(pte) == 0)
 #define _io_pte_entry(pn, prot)	(__pte((_PAGE_PFN_MASK & ((pn) << _PAGE_PFN_SHIFT)) | (prot)))
 
+#define RISCV_IOMMU_PMD_LEVEL		1
+
+static bool riscv_iommu_ptlock_init(struct ptdesc *ptdesc, int level)
+{
+	if (level <= RISCV_IOMMU_PMD_LEVEL)
+		return ptlock_init(ptdesc);
+	return true;
+}
+
+static void riscv_iommu_ptlock_free(struct ptdesc *ptdesc, int level)
+{
+	if (level <= RISCV_IOMMU_PMD_LEVEL)
+		ptlock_free(ptdesc);
+}
+
+static spinlock_t *riscv_iommu_ptlock(struct riscv_iommu_domain *domain,
+				      pte_t *pte, int level)
+{
+	spinlock_t *ptl; /* page table page lock */
+
+#ifdef CONFIG_SPLIT_PTE_PTLOCKS
+	if (level <= RISCV_IOMMU_PMD_LEVEL)
+		ptl = ptlock_ptr(page_ptdesc(virt_to_page(pte)));
+	else
+#endif
+		ptl = &domain->page_table_lock;
+	spin_lock(ptl);
+
+	return ptl;
+}
+
+static void *riscv_iommu_alloc_pagetable_node(int numa_node, gfp_t gfp, int level)
+{
+	struct ptdesc *ptdesc;
+	void *addr;
+
+	addr = iommu_alloc_page_node(numa_node, gfp);
+	if (!addr)
+		return NULL;
+
+	ptdesc = page_ptdesc(virt_to_page(addr));
+	if (!riscv_iommu_ptlock_init(ptdesc, level)) {
+		iommu_free_page(addr);
+		addr = NULL;
+	}
+
+	return addr;
+}
+
+static void riscv_iommu_free_pagetable(void *addr, int level)
+{
+	struct ptdesc *ptdesc = page_ptdesc(virt_to_page(addr));
+
+	riscv_iommu_ptlock_free(ptdesc, level);
+	iommu_free_page(addr);
+}
+
+static int pgsize_to_level(size_t pgsize)
+{
+	int level = RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV57 -
+			RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39 + 2;
+	int shift = PAGE_SHIFT + PT_SHIFT * level;
+
+	while (pgsize < ((size_t)1 << shift)) {
+		shift -= PT_SHIFT;
+		level--;
+	}
+
+	return level;
+}
+
 static void riscv_iommu_pte_free(struct riscv_iommu_domain *domain,
-				 pte_t pte, struct list_head *freelist)
+				 pte_t pte, int level,
+				 struct list_head *freelist)
 {
 	pte_t *ptr;
 	int i;
@@ -1102,10 +1175,11 @@ static void riscv_iommu_pte_free(struct riscv_iommu_domain *domain,
 		pte = ptr[i];
 		if (!_io_pte_none(pte)) {
 			ptr[i] = __pte(0);
-			riscv_iommu_pte_free(domain, pte, freelist);
+			riscv_iommu_pte_free(domain, pte, level - 1, freelist);
 		}
 	}
 
+	riscv_iommu_ptlock_free(page_ptdesc(virt_to_page(ptr)), level);
 	if (freelist)
 		list_add_tail(&virt_to_page(ptr)->lru, freelist);
 	else
@@ -1117,8 +1191,9 @@ static pte_t *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
 				    gfp_t gfp)
 {
 	pte_t *ptr = domain->pgd_root;
-	pte_t pte, old;
+	pte_t pte;
 	int level = domain->pgd_mode - RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39 + 2;
+	spinlock_t *ptl; /* page table page lock */
 	void *addr;
 
 	do {
@@ -1146,14 +1221,21 @@ static pte_t *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
 		 * page table. This might race with other mappings, retry.
 		 */
 		if (_io_pte_none(pte)) {
-			addr = iommu_alloc_page_node(domain->numa_node, gfp);
+			addr = riscv_iommu_alloc_pagetable_node(domain->numa_node, gfp,
+								level - 1);
 			if (!addr)
 				return NULL;
-			old = ptep_get(ptr);
-			if (!_io_pte_none(old))
+
+			ptl = riscv_iommu_ptlock(domain, ptr, level);
+			pte = ptep_get(ptr);
+			if (!_io_pte_none(pte)) {
+				spin_unlock(ptl);
+				riscv_iommu_free_pagetable(addr, level - 1);
 				goto pte_retry;
+			}
 			pte = _io_pte_entry(virt_to_pfn(addr), _PAGE_TABLE);
 			set_pte(ptr, pte);
+			spin_unlock(ptl);
 		}
 		ptr = (pte_t *)pfn_to_virt(pte_pfn(pte));
 	} while (level-- > 0);
@@ -1193,9 +1275,10 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	size_t size = 0;
 	pte_t *ptr;
-	pte_t pte, old;
+	pte_t pte;
 	unsigned long pte_prot;
-	int rc = 0;
+	int rc = 0, level;
+	spinlock_t *ptl; /* page table page lock */
 	LIST_HEAD(freelist);
 
 	if (!(prot & IOMMU_WRITE))
@@ -1212,11 +1295,12 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
 			break;
 		}
 
-		old = ptep_get(ptr);
+		level = pgsize_to_level(pgsize);
+		ptl = riscv_iommu_ptlock(domain, ptr, level);
+		riscv_iommu_pte_free(domain, ptep_get(ptr), level, &freelist);
 		pte = _io_pte_entry(phys_to_pfn(phys), pte_prot);
 		set_pte(ptr, pte);
-
-		riscv_iommu_pte_free(domain, old, &freelist);
+		spin_unlock(ptl);
 
 		size += pgsize;
 		iova += pgsize;
@@ -1251,6 +1335,7 @@ static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
 	pte_t *ptr;
 	size_t unmapped = 0;
 	size_t pte_size;
+	spinlock_t *ptl; /* page table page lock */
 
 	while (unmapped < size) {
 		ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
@@ -1261,7 +1346,9 @@ static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
 		if (iova & (pte_size - 1))
 			return unmapped;
 
+		ptl = riscv_iommu_ptlock(domain, ptr, pgsize_to_level(pte_size));
 		set_pte(ptr, __pte(0));
+		spin_unlock(ptl);
 
 		iommu_iotlb_gather_add_page(&domain->domain, gather, iova,
 					    pte_size);
@@ -1291,13 +1378,14 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	const unsigned long pfn = virt_to_pfn(domain->pgd_root);
+	int level = domain->pgd_mode - RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39 + 2;
 
 	WARN_ON(!list_empty(&domain->bonds));
 
 	if ((int)domain->pscid > 0)
 		ida_free(&riscv_iommu_pscids, domain->pscid);
 
-	riscv_iommu_pte_free(domain, _io_pte_entry(pfn, _PAGE_TABLE), NULL);
+	riscv_iommu_pte_free(domain, _io_pte_entry(pfn, _PAGE_TABLE), level, NULL);
 	kfree(domain);
 }
 
@@ -1358,7 +1446,7 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	struct riscv_iommu_device *iommu;
 	unsigned int pgd_mode;
 	dma_addr_t va_mask;
-	int va_bits;
+	int va_bits, level;
 
 	iommu = dev_to_iommu(dev);
 	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
@@ -1381,11 +1469,14 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	spin_lock_init(&domain->lock);
+	spin_lock_init(&domain->page_table_lock);
 	domain->numa_node = dev_to_node(iommu->dev);
 	domain->amo_enabled = !!(iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD);
 	domain->pgd_mode = pgd_mode;
-	domain->pgd_root = iommu_alloc_page_node(domain->numa_node,
-						 GFP_KERNEL_ACCOUNT);
+	level = domain->pgd_mode - RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39 + 2;
+	domain->pgd_root = riscv_iommu_alloc_pagetable_node(domain->numa_node,
+							    GFP_KERNEL_ACCOUNT,
+							    level);
 	if (!domain->pgd_root) {
 		kfree(domain);
 		return ERR_PTR(-ENOMEM);
@@ -1394,7 +1485,7 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	domain->pscid = ida_alloc_range(&riscv_iommu_pscids, 1,
 					RISCV_IOMMU_MAX_PSCID, GFP_KERNEL);
 	if (domain->pscid < 0) {
-		iommu_free_page(domain->pgd_root);
+		riscv_iommu_free_pagetable(domain->pgd_root, level);
 		kfree(domain);
 		return ERR_PTR(-ENOMEM);
 	}
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
