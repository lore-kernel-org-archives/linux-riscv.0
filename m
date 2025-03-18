Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5355C35FFA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 04:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFffb7+EGlzSecglz7jd3VaFH+udym1LMlEAgOOjpMQ=; b=np5V7L9ignc6wH
	JsBpReyBpZ06vkeqIxDzyJYwMiXj9TJCR+bEy8TfOzqky5Whn5quTYfhiPucaRBbTshyZeZ5x7Awi
	2m6sCuT9zOB+WM1slC+5IMqWF6/0eSKaMzpdrPin87Mtw9K8IEAR3RhHj9UhWR41bX9V8gt4ZYrRh
	8CjuqG+ADUUyxKPtewBswZ84lIPP/ZGZj4hZYSYOd8PVZe2R93VVHg+XnDbmhrh/AnCaOL3kfmZTj
	6ZGietbmn3yYNHn0toetYQ77kTV6hcQFeU9IF4abou4G26FrpS6TzawNO/P9x+NRQnPNIfksHTPST
	jXNcJ+wzMD71xMpXceIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuOEb-00000004bWA-3UgK;
	Tue, 18 Mar 2025 04:07:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO7U-00000004af2-0x3M
	for linux-riscv@bombadil.infradead.org;
	Tue, 18 Mar 2025 04:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xaRB3Z7Zn9kGyUKfUpl8WYZaXTZf5T6vpq1GZf0TWl4=; b=DCnUwvcMobG3MkmHWPGenb7igw
	cHr5LS5b77TrCDe0iRTZqbPhPcKtDcxZS5jAgRDidFQvhSctNodH6RX+6iCLDHy/kVIQySHj9aN8/
	Jdf8wQrObnOxuIvvYjLrpOq3UFIMFriz0wHodEX4rXEABkIv6AW2WPpetR9LpACvFsYI5AbaW9Mds
	gWFtop1nVKrXGEbtf7pDp17AAkqjzGcYWVh7fQiMFzty3dTS5rwcEGBQaWYZ7crOvaehJzXLxnwDL
	OAMGZPraSyP9F725fa154VrT+VzQOw3hYNhHPNDxrezFLv596dPpt8Grxj3IzGZl6ioPd4d5B5i5T
	Bjn1ZNFw==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO7R-00000003eXJ-1jJD
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 03:59:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-223a7065ff8so62366745ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 20:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1742270396; x=1742875196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaRB3Z7Zn9kGyUKfUpl8WYZaXTZf5T6vpq1GZf0TWl4=;
        b=f5LHS71y8pikhrG72hkdHUiLJMvDmrJ1X8dUKbAb9g+xtD2ODPoIwJ1V0jqwrIiOH7
         rDq5CbvoWFybdaTegz4gC+hpT3XKp+9l0VBdAqMhHnBSrl9aQLEVLf2w0EU0ejraNTOr
         jMTEywU/rwKbtWifupb268Dw2jyclo8AMrwO7Nq5A4iY6aUYTUgCzC5VPS9mc01u02l/
         PT5opk35NHyQOkowtcIgfuj0sy2kiXyBQa8l2UBlq6I6b4T7Elw47uJn0DTgDgQE5GlP
         joqSSQJ+qtEcUowKinzlahdxqQliitnSXbXaPAg0jTUeNPa0SijMY9ywU2sygvB+ifFr
         g43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742270396; x=1742875196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaRB3Z7Zn9kGyUKfUpl8WYZaXTZf5T6vpq1GZf0TWl4=;
        b=sW3pSPAvf40F3dhW3VgOnjXduRCwgOCeg6U4f9KzIPgIFhlXuxV4y3VNkakRt9eE+P
         mJ/iDtrPvppQ09v8+ymG8jHkNo0kJoEx9dh6ocmSukGx3QjYEZjS38LEoSM79CkP4Mym
         Y0FWPXY1N7QyaxY9wGOkwvvvxcl8T2IwvRYEB/mzftbwwAjIIZFtXJs3RvoblVHPhRoh
         JUCMRDOlA8vSTzFv30R5kJ6x1PvjLISK1tXYoMiYoc46yXM+9W4FzBk9gWgiCiKlwrUs
         /G5+nJ6YdOPV3GRmpqrs/ig9FScwR4YSEnSxk3HGyfYlzfUHUX72T2Aj/D9MZ+d1TKBn
         Zjtw==
X-Forwarded-Encrypted: i=1; AJvYcCXiR54hVJy+yFnIE7wnbEh7CoW/xYpBZ1nhSg9aMWk4wGgicZ5azylZbSvV6ZIpZMaGiR7/5sNOyycG5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAZeww5dMBbIPYIngNq9U4ca8ns1lLg8YXbsacKxv3kT3SaY3Z
	DYGO73Q0YPYVkgUsDG5LX5gvhycaPO1eGTV3uZaxL0NacXC+EsGxt8SlfxLEQ6g=
X-Gm-Gg: ASbGncsrys07QdObSikaLYuvMjrdQI5VETR6smQ+VzA7NrhVAMUyaeYhUPtlY0BSB+0
	f+NZrjUnl25Z9+eRUfgj2oXrcCgNaZYoWYUbmlzBN2CM6yj4FnhKeRqejXRVGggZ8w3xoFQSKI5
	vfXcVdvJJ/qa/BY3zPNwzfkoGrNRJDM9zSVd8BonzuT/dJme4oRCocPO6GgB0YMf685/gYR7Zc7
	nJy+OuVmZhJ2iZf2CrV+yysbIEr0gfDny8toT7+v8/UcqVbl1KAi4eYCk5l7IPmt3Tuk3WZaL/5
	jeS9NJZSn2tNNB7p4wmBnul5Od3QXM/kRjAQYsQo6CJJYozEyal7Wqp7pdZFlcAjkSvmSRULdew
	glev16USYCST88tUnh3YuZiHmbDE=
X-Google-Smtp-Source: AGHT+IExX+iDrDCGHA8Aq12SWZuDNNckGnu8pihoRkyjLOg0HP1RuQ216rkdL14FWV3g+VDeX680Yg==
X-Received: by 2002:a17:903:238b:b0:223:6180:1bf7 with SMTP id d9443c01a7336-225e0b2fba7mr186404745ad.42.1742270395708;
        Mon, 17 Mar 2025 20:59:55 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4b30sm83720135ad.235.2025.03.17.20.59.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Mar 2025 20:59:54 -0700 (PDT)
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
Subject: [PATCH RESEND v2 3/4] iommu/riscv: Introduce IOMMU page table lock
Date: Tue, 18 Mar 2025 11:59:29 +0800
Message-Id: <20250318035930.11855-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250318035930.11855-1-luxu.kernel@bytedance.com>
References: <20250318035930.11855-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_035957_581661_9FBB44AF 
X-CRM114-Status: GOOD (  16.14  )
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
