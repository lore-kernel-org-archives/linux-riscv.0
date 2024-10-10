Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA957D24456
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIOmcPVkHvLU47sU7+AqfdCZwLR+FC58znGPP2c2OiI=; b=NMNHGwtfWAb6fW
	d5CEnVbRWM/IWF+wva2CvVwSeTi6z2LKyFSVxFPz+A35PaBtF6aqcloQOEa9+pHryWlg7nPJ9jSBO
	6KXEG04iwFkZ9s01yy4CpayjyApwulGoxXvkHApUDFaYBGnxDgFJgaICQ9smPEuakxsOADbMR44Qv
	JpSWzykT2AMfJfkR30ARwgK5o5raroQzIDV5behP4rnOAwQ39vMe2ZLqnlt/ez3o/ksfTYGriXg4Y
	iNIlCjfMpqkqzq5mm2rx61XzBSA0G7jjAFwXgH1k2gl6Y5GGQ6Tj+b1/ukOq7H5XOUe13dZJHAQHB
	f3kqxD5bhPBOMysHb6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzxg-0000000EINv-0ZyQ;
	Thu, 10 Oct 2024 20:40:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syz9O-0000000EBjC-1Vlf
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Oct 2024 19:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=z4qXMlGpKFmKsrTG7a5LCbQMsXJowMadHB0xL9z/+TE=; b=LZiYVGnTNCWBZje7OhHBIH2B8C
	m2bP1nuK/T7xi/icA3j0rV+iuVrDqJtPfmY4hyat7TAFo0Td5opFSmgDwciLAbuS8GEDd8VHywYu4
	Ug9zP9UwE5Bix7n7OCfiX9/efGgICOpUNwEcF29WY01qZCHSFe1A5NqXgajBOsYrXWi7Z9F/hvX0M
	kWxTt/Dhxc5QiljKujcym6wMVFSFvI8ADrjn7jZ4DRnLgcc9Cb0qMJA/15hCw7TotNcmKYr9gtZVv
	9SDbfHmW+h0B3fyt1KGRhOJ/eMnDOGMi4U7fW0FMBGa54znltops2Nkry1Nbs9PAHK3Z7og0R6xnQ
	wDMK4Lug==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syz9K-00000005atz-2gdR
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 19:48:40 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e2dc61bc41so667893a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 12:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728589715; x=1729194515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4qXMlGpKFmKsrTG7a5LCbQMsXJowMadHB0xL9z/+TE=;
        b=HvDVsSksjthn8Msb8VinmIybfeVybDk6h80rpUoqz2MK6vjVKysqbMjmTTYlJb0JHE
         7NQiYIuQCPbNtJqqWrBiyfyjaBFWGx4i7B7xOmA/xMilKVw+URmnkEhVRLttIg/5pWw0
         thjpAlOtpZKIB9gCShox8Fg53yQ7uUAgyiIeVe3QkqTAxYU9AioIbLhB6I35n7wTDhJ+
         /YcjzaxojPTxGbteap22YEbBPomS0DuUYK8EEtPBpV+QLxateUjRLjGKB4pM+BYu8L7a
         zRh+LGz6ZGTLchd6ee5CoTNuNAntIwdNkl/2Glky7x0XCex7002BHr978eZKQt0pO7Rt
         nerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589715; x=1729194515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4qXMlGpKFmKsrTG7a5LCbQMsXJowMadHB0xL9z/+TE=;
        b=FGIedTtG087POTvYqJTplRtMXEcQoi2OvLHXgYvW1o1uh6AnVLy59WhCEHO3GMx4gS
         uSf8MJ00FPksbnrPHDabbxbmkdrFlYEcFOyp86fE0EWSQ7ky7E00c7SEfs/o6Mu0+TYB
         ZsGhPFBLYOsI92D9Y4MlTIXe+x7wBUk2EXPvkUFGoUbtBtwstB5IFupx7b+QrYzuJYlZ
         h5wdhmMp3Qp80LuCnFHQnVMzlV5HEXdSFvG0TVQJ7w1WBvTLEaeYTYTrf8JGxqT58rJ2
         UW/gOLOpZNhUSjWPHaB73k60yiecjMPJRW8Y6zZAUkE8bCNvICRqRVZiUSQFCMWXMC6p
         6+dw==
X-Forwarded-Encrypted: i=1; AJvYcCW3gJTyE1nnx4nSdxilBZHIiYxHNN33XGY2/uHg9XP8vd5rWWKqE5h4IMx9ZTHO8jik3wlJzUbOSSFNgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEw+XzfrkeSTZTbMgNfip3w+ltp2EEBzEZ2Z9l07Ot7ajvXrPP
	cM13GcQGulKpxMAsr9c6rytayDeyN6IZmMdu6CVLsbTK4fFI1o/R4yLGCh+JK5c=
X-Google-Smtp-Source: AGHT+IEj2/u7FZghPaHL/5IsGO3x2HI0qsFfKZzSP1hLJLyUDJRIVNLcwKObyPH44KTPhNFh55uSHQ==
X-Received: by 2002:a17:90a:f683:b0:2e2:e2f8:104 with SMTP id 98e67ed59e1d1-2e2f0a1736emr355701a91.8.1728589715386;
        Thu, 10 Oct 2024 12:48:35 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2e6ef1ad0sm749135a91.49.2024.10.10.12.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 12:48:34 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v9 4/7] iommu/riscv: Enable IOMMU registration and device probe.
Date: Thu, 10 Oct 2024 12:48:07 -0700
Message-Id: <79d1846e13a99b27b24a988126b528291a6766be.1728579958.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728579958.git.tjeznach@rivosinc.com>
References: <cover.1728579958.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_204838_965239_C2BFCD40 
X-CRM114-Status: GOOD (  14.36  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Advertise IOMMU device and its core API.
Only minimal implementation for single identity domain type, without
per-group domain protection.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 drivers/iommu/riscv/iommu.c | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 223314f7ed0a..c54088bf138f 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -17,6 +17,7 @@
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/kernel.h>
+#include <linux/pci.h>
 
 #include "iommu-bits.h"
 #include "iommu.h"
@@ -36,6 +37,60 @@ static void riscv_iommu_disable(struct riscv_iommu_device *iommu)
 	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_PQCSR, 0);
 }
 
+static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
+					      struct device *dev)
+{
+	/* Global pass-through already enabled, do nothing for now. */
+	return 0;
+}
+
+static struct iommu_domain riscv_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &(const struct iommu_domain_ops) {
+		.attach_dev = riscv_iommu_attach_identity_domain,
+	}
+};
+
+static int riscv_iommu_device_domain_type(struct device *dev)
+{
+	return IOMMU_DOMAIN_IDENTITY;
+}
+
+static struct iommu_group *riscv_iommu_device_group(struct device *dev)
+{
+	if (dev_is_pci(dev))
+		return pci_device_group(dev);
+	return generic_device_group(dev);
+}
+
+static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
+{
+	return iommu_fwspec_add_ids(dev, args->args, 1);
+}
+
+static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct riscv_iommu_device *iommu;
+
+	if (!fwspec || !fwspec->iommu_fwnode->dev || !fwspec->num_ids)
+		return ERR_PTR(-ENODEV);
+
+	iommu = dev_get_drvdata(fwspec->iommu_fwnode->dev);
+	if (!iommu)
+		return ERR_PTR(-ENODEV);
+
+	return &iommu->iommu;
+}
+
+static const struct iommu_ops riscv_iommu_ops = {
+	.of_xlate = riscv_iommu_of_xlate,
+	.identity_domain = &riscv_iommu_identity_domain,
+	.def_domain_type = riscv_iommu_device_domain_type,
+	.device_group = riscv_iommu_device_group,
+	.probe_device = riscv_iommu_probe_device,
+};
+
 static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 {
 	u64 ddtp;
@@ -74,6 +129,7 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 
 void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 {
+	iommu_device_unregister(&iommu->iommu);
 	iommu_device_sysfs_remove(&iommu->iommu);
 }
 
@@ -99,5 +155,15 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		return dev_err_probe(iommu->dev, rc,
 				     "cannot register sysfs interface\n");
 
+	rc = iommu_device_register(&iommu->iommu, &riscv_iommu_ops, iommu->dev);
+	if (rc) {
+		dev_err_probe(iommu->dev, rc, "cannot register iommu interface\n");
+		goto err_remove_sysfs;
+	}
+
 	return 0;
+
+err_remove_sysfs:
+	iommu_device_sysfs_remove(&iommu->iommu);
+	return rc;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
