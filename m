Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DE8C27C77
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5Pd+VYwUHqtIGgWnciynplvt40otSnBWl0ioqYC2iw=; b=luxuD/+m16UuAF
	aGpNWdj33SbiQHVuD9vkUvg5QuBTgDJCiuIKAojs3vecUBdZH03DaxcnMBjKmqvF+/9+P8ncVnDvL
	9kVNoQUD+sbZD3jGMjmZ16AoQPDhMtmaYuliofsJZDdK2aNuet+X4QYiBAPy2rSZGzSnCVcdICdpH
	VyXJMdHbPRJaj6rV/z0OldSGQo39ys5SnHOwHSw3BPnDUJ/cK1L6yJQhHuvWXEu9rI8MVI4fcBQXV
	IoZ4wEi/3HMPjWW+wJU+77Wf2nEqNkZCT4aopi9jVp0iHsQDiiBR10Y25oZLU6s/B0w2hBjTcPL3o
	gTzK9EpkJMEvFA5zfqZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7ot-00000002zwr-1SOM;
	Fri, 14 Jun 2024 14:22:23 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7oo-00000002zuS-3cbF
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 14:22:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f480624d10so18632785ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 07:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718374937; x=1718979737; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KYeKWdSVxdzca9c5AXktAohba5fPqz4T3QpSza6gBEI=;
        b=aa2HuoRfGVqd4u3iC+7G22qab56+RWPAkl1m274IRsNN3DSr0Jww8fyE9yOif32EJ6
         sXdnoUAJWRah+brrlelZWjtsgEhopdGjKSIo6mY6dHN+9bK7spYkbZ8i8rHfwAszjx6z
         IEH7fEDhVt4vGRGD6qoAzriQg7GcMFwbyM9Q6GlA49mzhWKMvj3jLWAJICtLDOyRpNEg
         HbQRIBYOoJJxddoFvQZ+KMr0CSfQqMCpr+n12RRyyNGWUOFNB9t7jAGSD71O7sjq7GUn
         wdspY3UYHoFQH9BhDhlmngdbRTrN6Uv0+2Y9adEDXfH3dJHs97aDUun/mVHxSwKO8VJN
         xtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718374937; x=1718979737;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYeKWdSVxdzca9c5AXktAohba5fPqz4T3QpSza6gBEI=;
        b=wrbW0LuavpIKHL00eZCD2GOZK1jXUqvO5O/C3AYXXAE4tFQv9o/+8X9I3XTS/FfXxX
         V5sVQ4/nvXo2vL1nZ75A01FlB9OZ5RCBoGozLg/7PY0JXqAMVZN0lytGAI/l4EpARwlO
         uJEiaYZu/uimdd2M2aDR5EuwgeRnp30xcrPXKtyy+ZX/fF8rqgO0sDU1DMbJvrB5Bcpi
         nC/V07+kAimmQBHbMgdmwdtNP9YyKYMYLSZymCxy38x+IeWgBGDyoXx4bunfikM0EzEP
         38QGKJPMevIIqchVRBcVuFyJ01oJf0yVIQaAhh6oWbDwrOrkXVhsDxNvbRV8/KyihQoR
         HwNw==
X-Forwarded-Encrypted: i=1; AJvYcCUEqzQjbizuwOONw9mTZp0EsV0Kkp+WEwFZR14Z/2Gaw01A1jNBqKPS4CNQsjrt7DcOPp0GDgC/punOEhkreecbDYNA874HjujzvHTNJKEc
X-Gm-Message-State: AOJu0YwFcilUfnhT2jWP8oRutx4EK8BQSKac2ITdTRCpq/XEQCXkuv6P
	TjYP42AhdzqYHJiEAXeX8kxSaxferFn9KFXnv/gswYX2i7Uz1CFBKXyLhlSIs5E=
X-Google-Smtp-Source: AGHT+IEaapuErqClzYkwdWIAoziKliaNOF4tmsWVaA2CtvzOJToxjwlNEcROXRtWO3Y8fdwM3JdA+g==
X-Received: by 2002:a17:903:1250:b0:1f7:2050:9a76 with SMTP id d9443c01a7336-1f8625c0d68mr33773445ad.8.1718374937555;
        Fri, 14 Jun 2024 07:22:17 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e559d9sm32522005ad.35.2024.06.14.07.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:22:17 -0700 (PDT)
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
Cc: Zong Li <zong.li@sifive.com>
Subject: [RFC PATCH v2 03/10] iommu/riscv: use data structure instead of individual values
Date: Fri, 14 Jun 2024 22:21:49 +0800
Message-Id: <20240614142156.29420-4-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240614142156.29420-1-zong.li@sifive.com>
References: <20240614142156.29420-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_072218_989351_855CD009 
X-CRM114-Status: GOOD (  12.29  )
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

The parameter will be increased when we need to set up more
bit fields in the device context. Use a data structure to
wrap them up.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/iommu.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 1716b2251f38..9aeb4b20c145 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1045,7 +1045,7 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
  * interim translation faults.
  */
 static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
-				     struct device *dev, u64 fsc, u64 ta)
+				     struct device *dev, struct riscv_iommu_dc *new_dc)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct riscv_iommu_dc *dc;
@@ -1079,10 +1079,10 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 	for (i = 0; i < fwspec->num_ids; i++) {
 		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
 		tc = READ_ONCE(dc->tc);
-		tc |= ta & RISCV_IOMMU_DC_TC_V;
+		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
 
-		WRITE_ONCE(dc->fsc, fsc);
-		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
+		WRITE_ONCE(dc->fsc, new_dc->fsc);
+		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
 		/* Update device context, write TC.V as the last step. */
 		dma_wmb();
 		WRITE_ONCE(dc->tc, tc);
@@ -1369,20 +1369,20 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
-	u64 fsc, ta;
+	struct riscv_iommu_dc dc = {0};
 
 	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
 		return -ENODEV;
 
-	fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
-	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
-	ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
-	     RISCV_IOMMU_PC_TA_V;
+	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
+		 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
+	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
+			   RISCV_IOMMU_PC_TA_V;
 
 	if (riscv_iommu_bond_link(domain, dev))
 		return -ENOMEM;
 
-	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
+	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
 
@@ -1484,9 +1484,12 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct riscv_iommu_dc dc = {0};
+
+	dc.fsc = RISCV_IOMMU_FSC_BARE;
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
-	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
+	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 
@@ -1505,8 +1508,12 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct riscv_iommu_dc dc = {0};
+
+	dc.fsc = RISCV_IOMMU_FSC_BARE;
+	dc.ta = RISCV_IOMMU_PC_TA_V;
 
-	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
+	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
