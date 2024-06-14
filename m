Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D973EC27C79
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Np9ale3+5QTLZK7phM+nK4maB9gRt126CelRhdo72g8=; b=joEgoKtcG+i1yi
	3c5VPAPLuzSiyqxB338SFvM1+JTPpCgsrm1f0y+v/UeVNpOehbfuoH3jO7hyc2A29RuS+B4s/iz/K
	IB8LMN9TP+Y13zsEXiiuuNnptqwVLI0EZulOybBvbRH1hzipugzO2fxULbT9nL1ZZEhJM0mAFxsyo
	H6Ve6Da01geYQczwVbWPocu8ABreJTVyEQnLMPwhk1s1JCN7oRcdA7ryjvy8L6OzzlZ8pvhf4FPqa
	/9ixoMs1KzgbgVOgpBeVxoYGKSQ5VxqKcJ0dGgdB65sYtBGr0KScek6641MKGN9JK/wxmCSxOxzNV
	WQLdZsn5dxWOQsCjuL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7pB-000000030AV-0H40;
	Fri, 14 Jun 2024 14:22:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7p4-00000003042-1CAB
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 14:22:35 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1f4a5344ec7so16231715ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718374953; x=1718979753; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BxtO7IOLUtPSQ+XdcXJ6pDuSrhddnSGqhgchDX3PwwI=;
        b=fFEOUQorfUhI4K11GibTBzjYKlIOeThF/HWk4updTb2bYIlFNNhiskUF7OoHzJbGK+
         CBmnT16wXZSlSvB2deeCbC0QTPI2NVBcWdflkgainqK7O7P04gVWCKFi9tAni41KPhjm
         Sf7w9UA6YodJ9+ZGU8B4BDDR9oZtIRj8WcyOJAQESsYqBW5PqHWfcW/yI7x8jhTISxQe
         22slRf/vbPcv33n0UdwwJsau2wKmllpI+uXUfR61vL365VgLD0d8he8i8+WO9vce9cPI
         xLZq4zrnH1Mrj1DcoiWuDnrEFjEx22VQXhOduhEN+vRxi2t7PTkKztdk8uByXEyS5iSy
         Qrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718374953; x=1718979753;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BxtO7IOLUtPSQ+XdcXJ6pDuSrhddnSGqhgchDX3PwwI=;
        b=DWgaLF+XUAM6nQNZns3u16PkMlQ3frRV4J/wu/g0qg9kxOp8O2+6qduX+59JcGvQEU
         Gx6IZ6B/vvtsKnlEhS8qNrVUID6vmvmZfUJEpyv6uFfFpLOhys1x0VHyQrvRcNEn5VH4
         JppGPWOxxGhqA3GhncWo/vTzOycCKMiuKZ/TIScqMC9wv7jnEN3VqNcAVpvW2vTOFuvc
         SMaYCa71RqEnGsTowrU2P7TzLTG99vQha3l5Or5vhgdFVYs8Em9l7xn+6sbQHb4131V7
         9oyxAgm3jqszyWdfOgTOAgV3WxBNU02/m2pUiHnece/ND+1dFwsu6GWwhe1m2TEimvJg
         BdmA==
X-Forwarded-Encrypted: i=1; AJvYcCUUe6C6Jt+ETEyv4XoiaxZ0co55MElKc6cMxAr3Cvue4SC+FvxWVNVafi6l5+NqHpJRPhMDXJJVbvPjvHOIolZtfAeFDrF1NOCnd+FJTc+z
X-Gm-Message-State: AOJu0YzZCDHUnvxY9vNkJYtpZx9J75rKeFHxhcMYl0430s3VA8TX3BNF
	0Y42+DdeKL/47krkxwmrk9sv4l6pzCblr6+VvpIOSq0g1eHKy0eoTnCZwtxj6cI=
X-Google-Smtp-Source: AGHT+IG11s4ZHx3p3pdh0/8168TEMxbmtzHZ+b6vnWRUAkFpilwyNQyd4ZLsjbcQgl8XVHvD/vsepw==
X-Received: by 2002:a17:902:cccc:b0:1f7:126:5ba7 with SMTP id d9443c01a7336-1f84e42e7bamr92287235ad.21.1718374952848;
        Fri, 14 Jun 2024 07:22:32 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e559d9sm32522005ad.35.2024.06.14.07.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:22:32 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Nicolin Chen <nicolinc@nvidia.com>
Subject: [RFC PATCH v2 09/10] iommu/dma: Support MSIs through nested domains
Date: Fri, 14 Jun 2024 22:21:55 +0800
Message-Id: <20240614142156.29420-10-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240614142156.29420-1-zong.li@sifive.com>
References: <20240614142156.29420-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_072234_403708_CC7EFA29 
X-CRM114-Status: GOOD (  17.36  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Robin Murphy <robin.murphy@arm.com>

Currently, iommu-dma is the only place outside of IOMMUFD and drivers
which might need to be aware of the stage 2 domain encapsulated within
a nested domain. This would be in the legacy-VFIO-style case where we're
using host-managed MSIs with an identity mapping at stage 1, where it is
the underlying stage 2 domain which owns an MSI cookie and holds the
corresponding dynamic mappings. Hook up the new op to resolve what we
need from a nested domain.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 18 ++++++++++++++++--
 include/linux/iommu.h     |  4 ++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index f731e4b2a417..d4235bb0a427 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1806,6 +1806,20 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	return NULL;
 }
 
+/*
+ * Nested domains may not have an MSI cookie or accept mappings, but they may
+ * be related to a domain which does, so we let them tell us what they need.
+ */
+static struct iommu_domain *iommu_dma_get_msi_mapping_domain(struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+
+	if (domain && domain->type == IOMMU_DOMAIN_NESTED &&
+	    domain->ops->get_msi_mapping_domain)
+		domain = domain->ops->get_msi_mapping_domain(domain);
+	return domain;
+}
+
 /**
  * iommu_dma_prepare_msi() - Map the MSI page in the IOMMU domain
  * @desc: MSI descriptor, will store the MSI page
@@ -1816,7 +1830,7 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 {
 	struct device *dev = msi_desc_to_dev(desc);
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct iommu_domain *domain = iommu_dma_get_msi_mapping_domain(dev);
 	struct iommu_dma_msi_page *msi_page;
 	static DEFINE_MUTEX(msi_prepare_lock); /* see below */
 
@@ -1849,7 +1863,7 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 {
 	struct device *dev = msi_desc_to_dev(desc);
-	const struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	const struct iommu_domain *domain = iommu_dma_get_msi_mapping_domain(dev);
 	const struct iommu_dma_msi_page *msi_page;
 
 	msi_page = msi_desc_get_iommu_cookie(desc);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7bc8dff7cf6d..400df9ae7012 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -629,6 +629,8 @@ struct iommu_ops {
  * @enable_nesting: Enable nesting
  * @set_pgtable_quirks: Set io page table quirks (IO_PGTABLE_QUIRK_*)
  * @free: Release the domain after use.
+ * @get_msi_mapping_domain: Return the related iommu_domain that should hold the
+ *                          MSI cookie and accept mapping(s).
  */
 struct iommu_domain_ops {
 	int (*attach_dev)(struct iommu_domain *domain, struct device *dev);
@@ -659,6 +661,8 @@ struct iommu_domain_ops {
 				  unsigned long quirks);
 
 	void (*free)(struct iommu_domain *domain);
+	struct iommu_domain *
+		(*get_msi_mapping_domain)(struct iommu_domain *domain);
 };
 
 /**
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
