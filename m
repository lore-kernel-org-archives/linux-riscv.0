Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C222FC282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 14:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFhqJe6ergqeJHZMtefl0R0y8JXhU9FEg+SDnoHruRg=; b=UHw0rxq+apnS2A
	Z58TbYk0oILEkM9z+dCphHXCAPIQXpcQh3kSQ8DxXmkmlSBKr/tRE5a34pjuyjjJ7ImCMOqwZRcIP
	+G1df+kgae5qe+lbgTckbCxpGQdwedHvTw2+qZIGe4AbKxZpwxcKQENYeSBYXpzXVCHuSGWOv5bki
	xVXSmINMUOKNHGiHw37ilqps4OvQfhikA2wnsVzZ5b0CO05bastZL9CaoEN6aryIz5FGe5EUp2YF0
	3TqwJc6XF4y7fKopTbuL5YSnYs33zFwmpFiHPsjrxfAoZWskyT5zR34xa/7XjFEDXN4U5ydK3HUhy
	gyVjSZ0dZPxDHjc3hqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treRI-000000030MP-3SSP;
	Mon, 10 Mar 2025 14:49:08 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trd5h-00000002mTK-0zWu
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 13:22:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22185cddbffso91521435ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741612964; x=1742217764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxeP0cya+7a8WL+U/abw2KfwIo+gie7J/iF7xNJEC1g=;
        b=ghlhvPOh9lIQw8pOwJhUf776c0JyWUYWxWCDlgVMrbLX3Laz1tiuHeds7QzTnhidKv
         nlfA8QZdbo/wbGD3G1h5N0SiIK4N8mCZc/tBnWN6xBr+KxFfrS8thtkir6u0wZEJkq9W
         64RysXU75AOplpy73yUqEjy0pngGu+WMNCD9UB6ptOYf32Io0tDxd/OUNH3gdIae0QPk
         OkTT4UcKZflqVkxk0LAFsDS51b8fkBcgxz8oJwreDJJczLfB+ZpYTPT9vcKzvWdE/Yjz
         nnEl1evIhNPtsHGrqawH0XWusB1FMJp0qUsc7Br0UO8IS1efQxoknOwfpDLM/BEOdohP
         2bVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612964; x=1742217764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxeP0cya+7a8WL+U/abw2KfwIo+gie7J/iF7xNJEC1g=;
        b=o1WqjmosNK2YNodnksQnDdDVOQs3/nzUsE4aFvkhqwRZqJnxn88yLAPJA98ifpZ6/P
         kShEstBMM3L+G/zGx8CoAH2uZJ1jvreroLCXPblMaXQ+kPeFtA+uHLZ81E5zM4LD6Rsi
         QcAxnC0egL2wWSWRGpSU0tuDfJCu2dwhbF7QVH9dYPxlTPIx4uA86ux4ruVkJI4i62xY
         Gkhf3F91BfpG2dtketZmbf09I+ILoAd6ILdV4c52K4tFMNtyxpARGid92z2s3AwXkpIB
         gRlwIuP2vE4ecPCfyZ9lBkp+L8T9LSeJJVXoS/5J8zrQ8G6d3+ddNA40HzD0xCYgifTv
         ufAg==
X-Forwarded-Encrypted: i=1; AJvYcCUXMwGqvcA6W8C/Z5u8XpekKrXA2TymxVMkGWm/qZ5B0GQKXEJPchC5us2KgnRW4q7l2OpQKjyjZRaqwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbO8ZlVEi++qP8VKfHqHLWmEOtAI8XIzvsz40UC/MJm6chF4fB
	nhdLkeVSRgnJ6EwIr8tWqEXeFHxg6HlRLuUAxO/cqGo/gEnrOadV0LgA2PpllSA=
X-Gm-Gg: ASbGncvbVtt3y+uAk+hFbtAuCWLumV5F8RyeF+qlPrxjRyCESOTuP8srE2U6zB7K8mF
	3NRF1Y1q117Mw92MBEkKOXg5z0gFyFxUzDhWJoXuV6ew/tJGRAGZePVXsoOe3kCykmXGBRc0BcM
	He8PMedoLOBJphkNKmFwU9NE684lkUPyk6BU777WXjzcwsm4eEM3XuiEGa6OVdOYU+4DIQg5Yr8
	fwrLOcN0eaCLSVq0eMsUJ3ehC+RlkU5ht6PUzFwxhXCgFmMZmwAuPy6AV+Lu4rbzpSJ1Hk6hRfl
	0ykZk0N9tVLHMAYnmqlilUb7rwudh3xrDhy0Ns4HwmXGmCuWPNYQBKTiYUihVV5/doyJ9VNAYh+
	dnXnR84n5Yjxw5H+rIoXOaozZaB8=
X-Google-Smtp-Source: AGHT+IFGZvCmpJb7xpAqLXMSe32HiKjux3YzHuqmj20G2NlKQjkFcfFgUFq3QXpqyV1ePvUpOlmI/Q==
X-Received: by 2002:a17:902:ce04:b0:215:6c5f:d142 with SMTP id d9443c01a7336-22464532f5emr148863585ad.20.1741612964286;
        Mon, 10 Mar 2025 06:22:44 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e8617sm77318785ad.61.2025.03.10.06.22.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Mar 2025 06:22:44 -0700 (PDT)
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
Subject: [PATCH 4/4] iommu/riscv: Add support for Svnapot
Date: Mon, 10 Mar 2025 21:22:22 +0800
Message-Id: <20250310132222.58378-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250310132222.58378-1-luxu.kernel@bytedance.com>
References: <20250310132222.58378-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_062245_272371_5F43C90D 
X-CRM114-Status: GOOD (  16.07  )
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
 drivers/iommu/riscv/iommu.c | 85 +++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index ffc474987a075..379875d637901 100644
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
 	spinlock_t *ptl;
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
 	spinlock_t *ptl;
+	unsigned long pte_num;
+	pte_t pte;
+	int i;
 
 	while (unmapped < size) {
 		ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
@@ -1347,7 +1397,20 @@ static size_t riscv_iommu_unmap_pages(struct iommu_domain *iommu_domain,
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
+		} else
+			set_pte(ptr, __pte(0));
 		spin_unlock(ptl);
 
 		iommu_iotlb_gather_add_page(&domain->domain, gather, iova,
@@ -1447,6 +1510,7 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	unsigned int pgd_mode;
 	dma_addr_t va_mask;
 	int va_bits, level;
+	size_t order;
 
 	iommu = dev_to_iommu(dev);
 	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
@@ -1506,6 +1570,9 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
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
