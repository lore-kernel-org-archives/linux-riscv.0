Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797FAC35FF2
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 12:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOUFkoRSH2JR7fsYgaSWMjgr5hbG+MEV47gD0+Gaca4=; b=LB7hTk9jzapGHr
	NW6SHNRVW3knnCtUbc4T71AWb0OmnlGlUsNwy2atT0i1nz9m45V97NlRI33X5Wl9MkDWZ5t/B1NhY
	8QgEATU7arDd6THAGmEifv23pAT0dgbEFwjRLBQxNXxe7aWUh1NoSnKXBQSnlDHCqtp0yQwGJa2pE
	pPIr7OMkIMf+vwbdaHYsw7v37oQNgAWvJKvIyBTQU4msMUqfHG16KsOaK/UpCFv/D90OPwNZrCqZi
	N3FFxKl7HCL/IJyalrYx3CioJSpMeMxRRHwvvN0+Gfw4pByR2x++TIzJ5udFbErlOYhd/8MztqICv
	0k5NYmlUrEmSMMSiBT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryvc-00000005h2I-0O4k;
	Tue, 11 Mar 2025 12:41:48 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryfv-00000005dFk-0noo
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 12:25:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22359001f1aso127553625ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 05:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741695935; x=1742300735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25EEGwiFn3VnbkwivdTLYPKqZQgF1BeYiMnWI1gQipU=;
        b=JGzbhuHZ/iDEWnqD7gZs2VuwCxPgpFff3dtC6SByWoB1Zj8/PB2CAAo71nPbLqopzC
         gm6Hglj5jLRpxHge0Z7ZBBnwiuhFqh40ePPFPZrYNLtk49CZhc7mcli92xk6t9PwP+CG
         fSZdNPutK1u1HikJSqjL8TalxQCj2hKDGaFMXJmLJR4jEn9RToN9P2JB54lEI7z0hXZO
         rqJvOxHkzkRNXZl1F2DD/bvTQEDVsLQftF1/De5R69rOhVdm70z0uwdMEwbMx9icWNIh
         qJjvBjgL+Lwt/XO+g/MtIzm5qd9UOmn4l+7pV9P7e+8vJbM7ZSKaB/W92x+6hzAjYd10
         jCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741695935; x=1742300735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25EEGwiFn3VnbkwivdTLYPKqZQgF1BeYiMnWI1gQipU=;
        b=aUyr1np1sR+oNg7alYFpFurSAD8Uxj9tHJV3Y8kT31ptvzG9cOFEzeRpf5DqtMuFcu
         kFJrx239D5RIiNUSrrg1zAgNW2Er2fU1T3SdvrcoSJRgM3f2msXC2imu9eg2TQRsSeOr
         dizA1bAOd/8LYlA8mkuZGcuAM3EnqWXrgTwEgtW67TQ9t4pq4P2z5Ol5+UrQeZeLHrbw
         /TRIkY3DW0o55QMzggO8jAvp3snr9CEUa+XCGp1SgUqJPcpu1D3cck4dPXyOqOdBgxA1
         DM/1aO9MQE3ZYs5j8vsj7368XOQXCpntObHDSWx9dZNT2Z043gvttxg+AL/xJlaC3Ik9
         ZGDg==
X-Forwarded-Encrypted: i=1; AJvYcCX4HE5iEZ4fbP9scG9PyVmfeW0gNz9Esp8w+GVZTyg1FCgGfK8GmNx28CldAWDWp5otoOL6EbyevsqQ3w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+8JWZnXzg4yGlX200Dz0fqxJca9NnCNLamDYI495B7TzsmavG
	dVpcwMMbamd7Gm4V/iHBIyHBCyxb9113TvAJ/zQw0i9L5tgdj11jfDTiaaZG80Q=
X-Gm-Gg: ASbGncucASDIbv69iZXJ7oUeT1q96TP7y9H52qrQOKiASYj1yHMyTMXj3f5YCQn2h6k
	zDimp5VqMMVrO6Bq0UYFtD0XX4BVTeqEznVoas5LHGon6nVQ+cXCUD77VKcUuTyq+jTlJC8Li2M
	5QxryuzvRh8CQKNWmg1dPfPma7T/KOnDN29FLnixu680whERe7R2BHl50CJu9R+TTa3AM1lBuH+
	VoA90frz+kFrogVOiHhEOXnEgfU+izFXEHvUX3tMrHerKbyA2Vo9aoNikIoOo2ele+yhgBlgXP3
	3IVTcxYP2zgYZUHGCcjBS8aBUQRM2W5jUJlEvKdXoW+e9QSDCTvHVIP7FwALGxxEYj15fnliBKq
	RYW9NbTsxU60zXfKM9DXAb0hFjJ8=
X-Google-Smtp-Source: AGHT+IHy0qPijH5qvnCVrXw7QQ1MI4RxDeaXxBgMZ4OfxRl/g9KDvFkXIYQvqU0hi4IEIQad7sl9DA==
X-Received: by 2002:a17:902:f650:b0:224:1609:a747 with SMTP id d9443c01a7336-22428a9c09fmr326665675ad.31.1741695934635;
        Tue, 11 Mar 2025 05:25:34 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698450244sm10226621b3a.80.2025.03.11.05.25.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Mar 2025 05:25:34 -0700 (PDT)
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
Subject: [PATCH v2 4/4] iommu/riscv: Add support for Svnapot
Date: Tue, 11 Mar 2025 20:25:10 +0800
Message-Id: <20250311122510.72934-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250311122510.72934-1-luxu.kernel@bytedance.com>
References: <20250311122510.72934-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_052535_236109_BB8801E0 
X-CRM114-Status: GOOD (  16.03  )
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

Add Svnapot size as supported page size and apply Svnapot when it is
possible.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/iommu/riscv/iommu.c | 86 +++++++++++++++++++++++++++++++++----
 1 file changed, 77 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index ce4cf6569ffb4..7cc736abd2a61 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1158,6 +1158,26 @@ static int pgsize_to_level(size_t pgsize)
 	return level;
 }
 
+static unsigned long napot_size_to_order(unsigned long size)
+{
+	unsigned long order;
+
+	if (!has_svnapot())
+		return 0;
+
+	for_each_napot_order(order) {
+		if (size == napot_cont_size(order))
+			return order;
+	}
+
+	return 0;
+}
+
+static bool is_napot_size(unsigned long size)
+{
+	return napot_size_to_order(size) != 0;
+}
+
 static void riscv_iommu_pte_free(struct riscv_iommu_domain *domain,
 				 pte_t pte, int level,
 				 struct list_head *freelist)
@@ -1205,7 +1225,8 @@ static pte_t *riscv_iommu_pte_alloc(struct riscv_iommu_domain *domain,
 		 * existing mapping with smaller granularity. Up to the caller
 		 * to replace and invalidate.
 		 */
-		if (((size_t)1 << shift) == pgsize)
+		if ((((size_t)1 << shift) == pgsize) ||
+		    (is_napot_size(pgsize) && pgsize_to_level(pgsize) == level))
 			return ptr;
 pte_retry:
 		pte = ptep_get(ptr);
@@ -1256,7 +1277,10 @@ static pte_t *riscv_iommu_pte_fetch(struct riscv_iommu_domain *domain,
 		ptr += ((iova >> shift) & (PTRS_PER_PTE - 1));
 		pte = ptep_get(ptr);
 		if (_io_pte_present(pte) && _io_pte_leaf(pte)) {
-			*pte_pgsize = (size_t)1 << shift;
+			if (pte_napot(pte))
+				*pte_pgsize = napot_cont_size(napot_cont_order(pte));
+			else
+				*pte_pgsize = (size_t)1 << shift;
 			return ptr;
 		}
 		if (_io_pte_none(pte))
@@ -1274,13 +1298,18 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	size_t size = 0;
-	pte_t *ptr;
-	pte_t pte;
-	unsigned long pte_prot;
-	int rc = 0, level;
+	pte_t *ptr, old, pte;
+	unsigned long pte_prot, order = 0;
+	int rc = 0, level, i;
 	spinlock_t *ptl; /* page table page lock */
 	LIST_HEAD(freelist);
 
+	if (iova & (pgsize - 1))
+		return -EINVAL;
+
+	if (is_napot_size(pgsize))
+		order = napot_size_to_order(pgsize);
+
 	if (!(prot & IOMMU_WRITE))
 		pte_prot = _PAGE_BASE | _PAGE_READ;
 	else if (domain->amo_enabled)
@@ -1297,9 +1326,27 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
 
 		level = pgsize_to_level(pgsize);
 		ptl = riscv_iommu_ptlock(domain, ptr, level);
-		riscv_iommu_pte_free(domain, ptep_get(ptr), level, &freelist);
+
+		old = ptep_get(ptr);
+		if (pte_napot(old) && napot_cont_size(napot_cont_order(old)) > pgsize) {
+			spin_unlock(ptl);
+			rc = -EFAULT;
+			break;
+		}
+
 		pte = _io_pte_entry(phys_to_pfn(phys), pte_prot);
-		set_pte(ptr, pte);
+		if (order) {
+			pte = pte_mknapot(pte, order);
+			for (i = 0; i < napot_pte_num(order); i++, ptr++) {
+				old = ptep_get(ptr);
+				riscv_iommu_pte_free(domain, old, level, &freelist);
+				set_pte(ptr, pte);
+			}
+		} else {
+			riscv_iommu_pte_free(domain, old, level, &freelist);
+			set_pte(ptr, pte);
+		}
+
 		spin_unlock(ptl);
 
 		size += pgsize;
@@ -1336,6 +1383,9 @@ static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
 	size_t unmapped = 0;
 	size_t pte_size;
 	spinlock_t *ptl; /* page table page lock */
+	unsigned long pte_num;
+	pte_t pte;
+	int i;
 
 	while (unmapped < size) {
 		ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
@@ -1347,7 +1397,21 @@ static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
 			return unmapped;
 
 		ptl = riscv_iommu_ptlock(domain, ptr, pgsize_to_level(pte_size));
-		set_pte(ptr, __pte(0));
+		if (is_napot_size(pte_size)) {
+			pte = ptep_get(ptr);
+
+			if (!pte_napot(pte) ||
+			    napot_cont_size(napot_cont_order(pte)) != pte_size) {
+				spin_unlock(ptl);
+				return unmapped;
+			}
+
+			pte_num = napot_pte_num(napot_cont_order(pte));
+			for (i = 0; i < pte_num; i++, ptr++)
+				set_pte(ptr, __pte(0));
+		} else {
+			set_pte(ptr, __pte(0));
+		}
 		spin_unlock(ptl);
 
 		iommu_iotlb_gather_add_page(&domain->domain, gather, iova,
@@ -1447,6 +1511,7 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	unsigned int pgd_mode;
 	dma_addr_t va_mask;
 	int va_bits, level;
+	size_t order;
 
 	iommu = dev_to_iommu(dev);
 	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
@@ -1506,6 +1571,9 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	domain->domain.geometry.aperture_end = va_mask;
 	domain->domain.geometry.force_aperture = true;
 	domain->domain.pgsize_bitmap = va_mask & (SZ_4K | SZ_2M | SZ_1G | SZ_512G);
+	if (has_svnapot())
+		for_each_napot_order(order)
+			domain->domain.pgsize_bitmap |= napot_cont_size(order) & va_mask;
 
 	domain->domain.ops = &riscv_iommu_paging_domain_ops;
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
