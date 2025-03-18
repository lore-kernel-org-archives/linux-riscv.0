Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED25AC35FF3
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 04:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOUFkoRSH2JR7fsYgaSWMjgr5hbG+MEV47gD0+Gaca4=; b=xWksSFVxGa4RDg
	QlE5nbr/Drdd51Y4JDWJh1bcfkphPB8XcbogpAkCRYFZVuRfpZjSafMPcoXLL0R+m4O8p3UK7RhkZ
	E4W7uhSrDCop2t3VzW2oZHBAeKuwW4kMAGvrFkYxjgm0BSwtHhoiJwqnKC1OgHEkIOZ6tIxfNx+as
	ORw9OJLpQt5rMHzWjDrMlNr2iKvCRnHVZkN+71vMbETOdYYASZjDS6AiFbI9enB0Ym+ezVMLE8Wjq
	HN1D0I2d7nDGsT+YoW2DEeLzdZcPcpeBPrtOt3HBoeNjiR/+uuNHrj/hR9Q+9oUvpvXwOpZrFFTCo
	ZHnCVpxZQainEXCYefRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuOEc-00000004bWY-2LCb;
	Tue, 18 Mar 2025 04:07:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO7W-00000004afV-0whU
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 04:00:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22580c9ee0aso88891885ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 21:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1742270401; x=1742875201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25EEGwiFn3VnbkwivdTLYPKqZQgF1BeYiMnWI1gQipU=;
        b=bNMQUtY9FnZ1tDaXVfD2HU2qC0jl+9iq4nCz6zUX/0sEeNOB9r6PiThe0Pfue1MMfm
         89xVB7mYtJMFMEFTy5Gdw5wJOi/aOCsxYR4urP3N2BQUrOtb1+8XlMzeIu7FCGj4oQ1q
         I7ZDpl3YPiMo7iZ9LKUqWgzmKgjZwdq0lsmuLix/2Dt2Cq/5JcQH3+TD9MFb0wvZw9ra
         jV7EQ9408a+aGjbnW4I7Nh67n95OuabJqS3JR7oxKnXLeXMmgPwejpHaZd0chhyzWjgG
         nzqkTGcuinukCfN5JJ/5X7IM+sUZsH3zJUw/ENDj246zp8ci/3/0y6XhcRWG+X3duUK8
         xwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742270401; x=1742875201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25EEGwiFn3VnbkwivdTLYPKqZQgF1BeYiMnWI1gQipU=;
        b=mIVYDaWF3gDVZxIqoKRE11H7Lgt0D93py5gcC/y54RyRaguO5pg0nIYE+33/fk+u6g
         kA7UWnsXn5UcDyuDxiKtEmzMzGXDvTHYgT782LIt4VQDryPwyouh8Lvv05pE6d0YbQuJ
         RbKNTzIYXaR/QOKGVL+0sj5/a4X5zBmeAq2hbEZq7TPr0YmNopD5DtlxNwCssvCcZ530
         Dm6TALMc+VXuA1UPN9aVdpqimHGUAJ+piG+thCWMgAA9/cVlpvs5g6j/cLu5mp5mnZMj
         MwGLUD6Ei/7bPYE3+nR7zh2KvZNcHYmJg09D37ZXrMYdtD47Rb0JHdUuLgHQaLmAyyth
         trJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJxTMQviRIOnvxirBVTAyRCpKooOm4lWmBC9zd16C2sguh6WLcmCV7R4j52zFN8zUB5bYFkKioMPDvrA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz96Kf2wPjdw8PTqNfKmOnX/GIz/UIE7CnK22d2oEMgwGnge2yh
	vwXAqDaQ3RMVyRiv9f7HLuLsnrztyoJqD1EMqiV1f6TMmunE/oV3TNTsRMTJ76o=
X-Gm-Gg: ASbGncucYP3sV9DjOgcXgxnMHlRC4bL7355K8KJQqMeDFGC8UMXRyqk13S2t/dNdxzI
	BdZQ9DtE1KZZZysN2Ef48QJU6FWYLp4u4vgkwwVLwcMZVkz9nCHDrCt7vD0YQoZ/TB4Eipw9Wlz
	xlu7clwv4DtPTVMZKg70RapnPPGqrYQH7BH53UuetvYOHtYuu9zeUqTuPOYDrFuc2UVNML93miz
	r7svwQDdLj106wYLox9kPAs2i0qMBdil4pYOcCde6weWDT6aygA/6fBPuIygPHABs6LqPU9ejD2
	eft7ycz7VqsW4JXz3bByn/oSRXxqEP2u/rAEstMd81DY6a9Iqte1QJpveVVhjhT1C6b1sUb2dZx
	VG1AgXb7/gPhgk/t1IPHeuj35thEy/GN+8CyeSg==
X-Google-Smtp-Source: AGHT+IFBc6TvuWKKSrWPTLSErVQ1GkoHiMOoKLD8NwCVFkbU9sjHFxonJru7yaMaEU5aIspYftiubw==
X-Received: by 2002:a17:903:230f:b0:223:5e54:c521 with SMTP id d9443c01a7336-225e0859fafmr199239715ad.0.1742270400974;
        Mon, 17 Mar 2025 21:00:00 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4b30sm83720135ad.235.2025.03.17.20.59.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Mar 2025 20:59:59 -0700 (PDT)
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
Subject: [PATCH RESEND v2 4/4] iommu/riscv: Add support for Svnapot
Date: Tue, 18 Mar 2025 11:59:30 +0800
Message-Id: <20250318035930.11855-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250318035930.11855-1-luxu.kernel@bytedance.com>
References: <20250318035930.11855-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_210002_289783_E2D41997 
X-CRM114-Status: GOOD (  15.57  )
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
