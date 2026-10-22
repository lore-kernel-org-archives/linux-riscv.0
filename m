Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48A5606A338
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eluIY0Yt;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lxBBVpbF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aV37LxGK31cy/ifekFz83G9KiynHGK/goAy6hh/Vnwk=; b=eluIY0YthO1SVhKB8fVfKYq0yv
	umhSKYcX86hwoX6zvWJqT27nHLmFCGaMowBH/plCOBnck5FOjV0jBHOW6HmRwTHr3uyahJ1ksPqWg
	9Z5ISetXU7Ks7xcuWnbUyJ0oyVLu0IYXqW8UvmsFFn78gtJh2ziH3HMWejAfFQ0xtIlDQvPdlv/Kb
	rsbz0M0NWYvjF3t/7qNaeZydWrZhGe4iA4lJjHiD7dEDEFKW5ammlYOKE736hZQBEn2WF6pc5B+kI
	DaETg0hBLD6XxtybzGiYCuhgZDqemRoZeRhvsmuR7gNH3PxtkVEdQkdTowAbmpbYGn6FWR4jwO7MB
	tLNJ5kPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuzn-0000000EQmd-1DGT;
	Thu, 22 Oct 2026 15:46:23 +0000
Received: from out-94.mta1.migadu.com ([2001:41d0:203:375::5e] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuzk-0000000EQkv-0pUN
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 15:46:22 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=b9aN3UoXeOF4eAVozHhQBDfnYXVjdCGwCFhe2u2yLGQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792683978; v=1; x=1793288778;
 b=lxBBVpbFUM6j/QvZQMW4notzewuwIabFr7/AIsutSlYHjabP5CYz0TWA6XIjUuQ3oysIgolr
 X2cZKFyYVLH38E7ORtYPCPFzQVvS6Cw/aLP4/Ii90PQmLyfLOhdJ2jFItjCZTPAedR1PQ3dkB9o
 26ct4ypGSoIIyVPv/wv/QXe4=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b707346131377bb7;
	Thu, 22 Oct 2026 15:46:18 +0000
X-Mizu-Trace-ID: b707346131377bb7
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
Subject: [PATCH v7 2/5] iommu/dma: Introduce iommu_dma_prepare_msi_list()
Date: Thu, 22 Oct 2026 17:46:00 +0200
Message-ID: <20261022154603.1374754-3-andrew.jones@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022154603.1374754-1-andrew.jones@linux.dev>
References: <20261022154603.1374754-1-andrew.jones@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_084620_941810_5A2342B5 
X-CRM114-Status: GOOD (  13.35  )
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

IMSIC needs an interface to prepare all MSI targets before an IRQ
affinity change can select one in atomic context.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 drivers/iommu/iommu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/iommu.h |  9 +++++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b486b8bbd1fc..b8d4d601efd4 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -4266,4 +4266,47 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 	mutex_unlock(&group->mutex);
 	return ret;
 }
+
+/**
+ * iommu_dma_prepare_msi_list() - Map the complete list of MSI targets
+ * @desc: MSI descriptor to receive the base IOVA and granule shift
+ * @phys_addrs: Ordered array of target physical addresses
+ * @nr_addrs: Number of targets in the array
+ * @granule: Size and alignment of each target mapping
+ *
+ * Every call for a DMA domain must supply the same complete list, order and
+ * granule. The first call maps the targets into one contiguous IOVA range;
+ * subsequent calls use the cached base. The array is consumed synchronously
+ * and is not retained.
+ *
+ * Each target must be aligned to @granule, which must match the DMA domain's
+ * granule and be at least PAGE_SIZE.
+ *
+ * Without a translated domain, @desc is left unchanged. Only DMA-IOMMU
+ * domains currently support translated MSI target lists.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int iommu_dma_prepare_msi_list(struct msi_desc *desc, const phys_addr_t *phys_addrs,
+			       unsigned int nr_addrs, size_t granule)
+{
+	struct device *dev = msi_desc_to_dev(desc);
+	struct iommu_group *group = dev->iommu_group;
+	struct iommu_domain *domain;
+	int ret;
+
+	if (!group)
+		return 0;
+
+	ret = iommu_deferred_attach(dev, iommu_get_domain_for_dev(dev));
+	if (ret)
+		return ret;
+
+	guard(mutex)(&group->mutex);
+	domain = group->domain;
+	if (!domain || domain->type == IOMMU_DOMAIN_IDENTITY)
+		return 0;
+
+	return iommu_dma_sw_msi_list(domain, desc, phys_addrs, nr_addrs, granule);
+}
 #endif /* CONFIG_IRQ_MSI_IOMMU */
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 95e32c78dcb7..cf33169ec3e3 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1560,12 +1560,21 @@ static inline void pci_dev_reset_iommu_done(struct pci_dev *pdev)
 #ifdef CONFIG_IRQ_MSI_IOMMU
 #ifdef CONFIG_IOMMU_API
 int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr);
+int iommu_dma_prepare_msi_list(struct msi_desc *desc, const phys_addr_t *phys_addrs,
+			       unsigned int nr_addrs, size_t granule);
 #else
 static inline int iommu_dma_prepare_msi(struct msi_desc *desc,
 					phys_addr_t msi_addr)
 {
 	return 0;
 }
+
+static inline int iommu_dma_prepare_msi_list(struct msi_desc *desc,
+					     const phys_addr_t *phys_addrs,
+					     unsigned int nr_addrs, size_t granule)
+{
+	return 0;
+}
 #endif /* CONFIG_IOMMU_API */
 #endif /* CONFIG_IRQ_MSI_IOMMU */
 
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
