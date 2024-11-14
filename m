Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F56D68B34
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5FDo7tsY5d4ktZISP0JxePvCoDoZFaIY1i8Fe2b6EQ=; b=oOuJYw0dGSx873
	rPCJYJwaGZeOiXwAATIYIC8K+0D69c8IjDVHR+F0mDd9OQTiN8EuwpdQ4Wjww/W8q+zDpYF+YJgw3
	QTQKSFDyV86iO2xsuc715WOnLpJV+R8gd0HvoqRBjrSyjfHgTgFRCXNpbRY3f91iqBTHa5OZu4iPb
	X+zCVflqjlZmJbwW8kY0mTQ6p4KE9ulbRnDUmjkfSj/v0p4JInle1sD6XyhMFqtCRo0tIMMPkkmGF
	wC1FXRG0L+Osfs/ezsux1lyEu+0XFgLW87zeq7JRJUf7l2YyMWHlSVKVB2pQqXfjz66qSgaby45or
	riaW5t2L/cxFuR/dDGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYd-000000004yK-0FCZ;
	Thu, 14 Nov 2024 16:18:59 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYZ-000000004rY-2BMA
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:18:56 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539f84907caso848310e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601134; x=1732205934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro7v641M+HDwWifuZZcr9Q07sHhkgURxU5TLhKMU2Mo=;
        b=BfuCFP3Th8Ck3d+kn44hMGoR2WCgbjeF9S+th9EcT/q1A59nxY6qt1rR5a6VVJ9j+l
         3ihSldpWe9SDfmO6CKAdmRCr8wpOUVU6/laLiwpnsSVu7H2lGtgHuJy47TqKT953YeRN
         5Hw1oqY7y/hUGGFCq3BoU7K3PzE8NPy7lwkOev47j8AjscOpsXlwPEP3ZVtWKjprWeES
         7HeniAUWS47JLzsS2u6P/mDRRtrcS00VjNthb0QllyMKkGaezfHAokB0ZGwn+XmbmrXw
         j7bxsRyECxFKOfXeK8stroBYZGYslKJLAeqjgxRE/UjAWvk+HUs/N1+If67eJ9uARKw9
         EG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601134; x=1732205934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ro7v641M+HDwWifuZZcr9Q07sHhkgURxU5TLhKMU2Mo=;
        b=wBXbInVfZemursp8/LCEZaEE5AQbmCTuQZIqr9xjFoLGpun5E2ioO3bCKbtkAEX+0k
         OzUlHqjzLK/5yeVmdyqqzU9Z28r/kG/TRP+BFI8JALtmwbT3qQ9+oLG9h5fltdWiux1v
         88ru5nEJHvJXDIPn81zJ/atIWwtZ8lasv7n8m7OOpT/svSoIxdPmS+GL87kykVC826JP
         bksQ6Tcih9zLNN0Q0cqsmYMN3ZCIEP54/fLymHZWgJ9AfjzMf2IpWSIWMx5O8ia9qkMo
         JdzMMtMnxH7Wx3DDmUVOc9U5Uw4dXozKn1u8ww2dBBsso0IgqBYLJKVS3KyGsk0918b9
         sCpA==
X-Forwarded-Encrypted: i=1; AJvYcCX0WaxNtrt0GJ0sl+5JRmnDrz5gyLVHYrRiFRQcxNM1m2Ww6x1ijuqzNRrJo+6pXEfFI+O0ovnTDr7Q+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXZN/I4ozK1KU1CE8Kz/gv47DJDRVMzxlaHht9N6W+i/lHWA9c
	1iOvCea893tmhW/YDRtiaJM6hn653TmyVszR6mQgKoEOz0uMA9Ta+SGz0BouIkQ=
X-Google-Smtp-Source: AGHT+IErvh7GZ5g5xv9y/mHNwbC72YxK/U2el7s2R5QBHLBxBaMXMwoD7jtczGtgvCVqx0SU+SjOAw==
X-Received: by 2002:a05:6512:baa:b0:53d:a34d:9faa with SMTP id 2adb3069b0e04-53da34da11emr2749757e87.45.1731601133876;
        Thu, 14 Nov 2024 08:18:53 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da265e16sm28762605e9.12.2024.11.14.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:18:53 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	zong.li@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 05/15] iommu/riscv: use data structure instead of individual values
Date: Thu, 14 Nov 2024 17:18:50 +0100
Message-ID: <20241114161845.502027-22-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081855_623089_A670CE41 
X-CRM114-Status: GOOD (  13.42  )
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

From: Zong Li <zong.li@sifive.com>

The parameter will be increased when we need to set up more
bit fields in the device context. Use a data structure to
wrap them up.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 3fe4ceba8dd3..9d7945dc3c24 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1001,7 +1001,7 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
  * interim translation faults.
  */
 static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
-				     struct device *dev, u64 fsc, u64 ta)
+				     struct device *dev, struct riscv_iommu_dc *new_dc)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct riscv_iommu_dc *dc;
@@ -1035,10 +1035,10 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
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
@@ -1315,20 +1315,20 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
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
 
@@ -1419,9 +1419,12 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
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
 
@@ -1440,8 +1443,12 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
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
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
