Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8D4606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1u12EeGD;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MN/0h1wr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JVilF6htzLvNiQkt5+jyPta4ospixkIF3KR3nSs6vSY=; b=1u12EeGDpt6qht09qjxI3NQK1p
	L+BGoMHtBFl5+wl/WycIHBWl4ZHbK8PgX4y2k5iUEw1sDXk4VwTyP8E66udCgXH5Zul0FNyED6fw0
	ZlCA24UEUirK7HjSfB4uf7GLKWsXTVv8KHoktjYXZwWC8PADswTAy5ot0PhVX1oYJhjcY88pCshuu
	imyjbAcqN/CwQfpGwqcPgd7Yoa2DqXmE4EZtHpgmp4GxZSsJM+u1MzV3sBcts0xy01tYTPJvAAf5x
	KuSEhq0CZbg77jKXDm6Zf6ODrr88YThq1JnGQurJTNTSt9k9h/2nnVXoYpZjiMy9U7q83BBnPGqVH
	kicj9cPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuzn-0000000EQml-1fpt;
	Thu, 22 Oct 2026 15:46:23 +0000
Received: from out-89.mta1.migadu.com ([2001:41d0:203:375::59] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuzj-0000000EQkl-0GDd
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 15:46:22 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+Zvwp7hLV/ADvXBOoul5gX9Gn2k4qOEGVrRqgWa9+gc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792683977; v=1; x=1793288777;
 b=MN/0h1wrhfPzbrIvz4ys54KKaKEQt2MVwyzomN0P7fCWpjn4gfWRB0GEfy6HOXm0v5WqvjO6
 v5BUwoHkqNEOlhMDalV/BzNOn+7KOV/3Yw/jpg3DT5rCDn8bGfby+IJ8eAPWac/AFkuz7Pre4bU
 Nlnk2MLZPaLhVzcUdgcXEdZI=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ae35e2396c30716c;
	Thu, 22 Oct 2026 15:46:17 +0000
X-Mizu-Trace-ID: ae35e2396c30716c
X-Migadu-Flow: FLOW_OUT
From: Andrew Jones <andrew.jones@linux.dev>
To: linux-riscv@lists.infradead.org,
	iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	tomasz.jeznach@linux.dev,
	jgg@ziepe.ca,
	jgg@nvidia.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	tglx@kernel.org,
	kevin.tian@intel.com,
	fangyu.yu@linux.alibaba.com,
	nutty.liu@hotmail.com
Subject: [PATCH v7 1/5] iommu/dma: Prepare MSI physical address lists
Date: Thu, 22 Oct 2026 17:45:59 +0200
Message-ID: <20261022154603.1374754-2-andrew.jones@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022154603.1374754-1-andrew.jones@linux.dev>
References: <20261022154603.1374754-1-andrew.jones@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_084621_256424_02AAD681 
X-CRM114-Status: GOOD (  18.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

IMSIC affinity changes need every possible target mapped. Introduce
iommu_dma_sw_msi_list() to cache one contiguous IOVA range base for
a list of targets.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 drivers/iommu/dma-iommu.c | 77 +++++++++++++++++++++++++++++++++++----
 drivers/iommu/dma-iommu.h | 10 +++++
 2 files changed, 80 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 1f624f241ac1..1046b19be584 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -59,6 +59,8 @@ struct iommu_dma_options {
 struct iommu_dma_cookie {
 	struct iova_domain iovad;
 	struct list_head msi_page_list;
+	/* Base IOVA of the complete MSI target list */
+	dma_addr_t msi_list_iova;
 	/* Flush queue */
 	union {
 		struct iova_fq *single_fq;
@@ -2204,13 +2206,42 @@ static struct list_head *cookie_msi_pages(const struct iommu_domain *domain)
 	}
 }
 
+static dma_addr_t iommu_dma_alloc_msi_iova(struct device *dev, struct iommu_domain *domain,
+					   const phys_addr_t *phys_addrs,
+					   unsigned int nr_addrs, size_t granule)
+{
+	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
+	size_t size = nr_addrs * granule;
+	dma_addr_t iova;
+	unsigned int i;
+
+	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
+	if (!iova)
+		return 0;
+
+	for (i = 0; i < nr_addrs; i++) {
+		if (iommu_map(domain, iova + i * granule, phys_addrs[i], granule,
+			      prot, GFP_KERNEL))
+			goto out_unmap;
+	}
+	return iova;
+
+out_unmap:
+	if (i) {
+		size_t mapped = i * granule;
+
+		WARN_ON_ONCE(iommu_unmap(domain, iova, mapped) != mapped);
+	}
+	iommu_dma_free_iova(domain, iova, size, NULL);
+	return 0;
+}
+
 static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 		phys_addr_t msi_addr, struct iommu_domain *domain)
 {
 	struct list_head *msi_page_list = cookie_msi_pages(domain);
 	struct iommu_dma_msi_page *msi_page;
 	dma_addr_t iova;
-	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 	size_t size = cookie_msi_granule(domain);
 	static DEFINE_MUTEX(msi_prepare_lock);
 
@@ -2235,21 +2266,16 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	if (!msi_page)
 		return NULL;
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
+	iova = iommu_dma_alloc_msi_iova(dev, domain, &msi_addr, 1, size);
 	if (!iova)
 		goto out_free_page;
 
-	if (iommu_map(domain, iova, msi_addr, size, prot, GFP_KERNEL))
-		goto out_free_iova;
-
 	INIT_LIST_HEAD(&msi_page->list);
 	msi_page->phys = msi_addr;
 	msi_page->iova = iova;
 	list_add(&msi_page->list, msi_page_list);
 	return msi_page;
 
-out_free_iova:
-	iommu_dma_free_iova(domain, iova, size, NULL);
 out_free_page:
 	kfree(msi_page);
 	return NULL;
@@ -2271,6 +2297,43 @@ int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	return 0;
 }
 
+/*
+ * All calls for a DMA domain must supply the same complete target list.
+ * The group mutex serializes creation and reuse of the cached mapping.
+ */
+int iommu_dma_sw_msi_list(struct iommu_domain *domain, struct msi_desc *desc,
+			  const phys_addr_t *phys_addrs, unsigned int nr_addrs,
+			  size_t granule)
+{
+	struct device *dev = msi_desc_to_dev(desc);
+	struct iommu_dma_cookie *cookie;
+	unsigned int i;
+
+	iommu_group_mutex_assert(dev);
+	if (domain->cookie_type != IOMMU_COOKIE_DMA_IOVA)
+		return -EOPNOTSUPP;
+
+	cookie = domain->iova_cookie;
+	if (granule < PAGE_SIZE || granule != cookie->iovad.granule)
+		return -EOPNOTSUPP;
+	if (!nr_addrs || nr_addrs > SIZE_MAX / granule)
+		return -EINVAL;
+
+	if (!cookie->msi_list_iova) {
+		for (i = 0; i < nr_addrs; i++)
+			if (!IS_ALIGNED(phys_addrs[i], granule))
+				return -EINVAL;
+
+		cookie->msi_list_iova = iommu_dma_alloc_msi_iova(dev, domain, phys_addrs,
+								 nr_addrs, granule);
+		if (!cookie->msi_list_iova)
+			return -ENOMEM;
+	}
+
+	msi_desc_set_iommu_msi_iova(desc, cookie->msi_list_iova, ilog2(granule));
+	return 0;
+}
+
 static int iommu_dma_init(void)
 {
 	if (is_kdump_kernel())
diff --git a/drivers/iommu/dma-iommu.h b/drivers/iommu/dma-iommu.h
index 040d00252563..2a36ed736910 100644
--- a/drivers/iommu/dma-iommu.h
+++ b/drivers/iommu/dma-iommu.h
@@ -21,6 +21,9 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
 
 int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 		     phys_addr_t msi_addr);
+int iommu_dma_sw_msi_list(struct iommu_domain *domain, struct msi_desc *desc,
+			  const phys_addr_t *phys_addrs, unsigned int nr_addrs,
+			  size_t granule);
 
 extern bool iommu_dma_forcedac;
 
@@ -59,5 +62,12 @@ static inline int iommu_dma_sw_msi(struct iommu_domain *domain,
 	return -ENODEV;
 }
 
+static inline int iommu_dma_sw_msi_list(struct iommu_domain *domain, struct msi_desc *desc,
+					const phys_addr_t *phys_addrs, unsigned int nr_addrs,
+					size_t granule)
+{
+	return -ENODEV;
+}
+
 #endif	/* CONFIG_IOMMU_DMA */
 #endif	/* __DMA_IOMMU_H */
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
