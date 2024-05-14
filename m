Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DADAC25B79
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 18:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Edo35nkMLiCVNDFEWDLYgyWB5gaEtASDrZpdKrvySuI=; b=r329K7yLJVUSEp
	9pcF/WymwKqDwTwgUUa5tqHDnaAvbzcfUBoDsHxloD8SDpnhsyBMfZh5a2dd5FxjHmgILktrAq757
	Urr/XICrxx192yHVA7Di3Tr3Rac3lDR7qEMXtrhG9PApjhIAuiQyoHlLwgtdI7xOt5Y/tNh1IseHu
	WR2ofadYlUJP3C9SMUFSgxnGie02F2GS/b9Phf9+4nm70HaLaUVPDQddfJrm+cMYcfGbL8oiLEOhj
	a1gsyKMShgNx0hrKUSoV+PuUZyvPWPuWpXPdoFvs8lxnwmy/V/CZZGYFPSiGAVdBdvgjl6dmQsyGx
	xhw3vDSM1p7MG7xE2TEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wi7-0000000Gnde-01mi;
	Tue, 14 May 2024 18:17:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wi1-0000000Gnb3-1TBs
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 18:17:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ec4dc64c6cso42074925ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 11:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715710624; x=1716315424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ov4N0BiYWMCzHOD82syI7y8HSpVewpJ8aAIenCzP8c=;
        b=QU86D5iesYg9jCJCexcQ/2n2jFq3IBMuUW8PY2UM3ZZ3UQ4n8jr8dqknMXS/36jB6T
         0qGY8UqQOchHE82bQPmDkATtYr1fYfM7uLm6vYRgs+hxcPnnitbmqK7oFZptr74l4EZb
         Xim/Q1C0CAhj7smLIkvx6aTXY0ySvtxCcK2smusFCpbc4sX81xcFFJsrDNdvjfI1eW+a
         p+fNLhFJDRer9UHls0cAAUhOZufMLQTGoskzz9n7YPopUgFXybOe85YauOzGzgvVnYSh
         q4FDiEM13eHpSDqOswicpNnKSKqSujH3FbscS5VPRZinGTJnoj8ZI20R013LJceFOiKa
         ASzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715710624; x=1716315424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ov4N0BiYWMCzHOD82syI7y8HSpVewpJ8aAIenCzP8c=;
        b=LXbMJAO6gpgBJbM9t3vYWuLNaKdrKgA5qR874140Y7oqhakiKNaWuHzXPPJRXALIdd
         k7/2+SVnv1kp9Mx+rNTpAe1JEDinlvDQX3MsiZmkRE6/RLui5EtRALnfSNdA9LvtXm9m
         3VjmKcf1lZxEmSRv8QoYA/Or/jnB/VCRHZg8QHgPA+XOXwIiNGEK2ngiFePIRdG1uXKf
         65yDSf7XZHFxIEensAiSjr9xNzsEHr47Ti34zF7NrLNkDWzMRxS/8jXF56rY38VU+m+5
         QPofyD3NLSeXnVXZ0y0BGc9EgbBfGONcyonrdZ7LBejMb2wCsD+B6opMx/VfiRsMHp/Q
         Y1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIMtBNRuDStHz1tlqlZ8gajooX0fyODf8KAugQyFbgAg38DV/X/VZSnORZvulXE2If9/pSLsrzmi39UHH51OGvzkiZTdFILCCOa3Qj26Zn
X-Gm-Message-State: AOJu0Yx6x+PulA170/a3vn+px+IwXDWnXGzxXNRVj9cUg2HscS0yjzsi
	7tM0u/xcOZGxUhyVxwShuuyGXn8UQAqv0acVPPqKUmlxZ5Osvt/O2KN/2426X94=
X-Google-Smtp-Source: AGHT+IFJNfqQMUbFyTbFk6O7qQproU4On+Ok9bCbTsa1ZgcHcdnvAZUcFLklw8fSte40jza5wuIs+w==
X-Received: by 2002:a17:902:ba8a:b0:1eb:acff:63bf with SMTP id d9443c01a7336-1ef43e26591mr125704035ad.37.1715710624155;
        Tue, 14 May 2024 11:17:04 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad6386sm100993625ad.80.2024.05.14.11.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 11:17:03 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v5 4/7] iommu/riscv: Enable IOMMU registration and device probe.
Date: Tue, 14 May 2024 11:16:16 -0700
Message-Id: <518a4b0bf651707a9508c169fe3868e669ec2c6d.1715708679.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715708679.git.tjeznach@rivosinc.com>
References: <cover.1715708679.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_111705_414172_CBC3C41A 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Advertise IOMMU device and its core API.
Only minimal implementation for single identity domain type, without
per-group domain protection.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 drivers/iommu/riscv/iommu.c | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 3c5a6b49669d..b8e0e4b62585 100644
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
@@ -71,6 +126,7 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 
 void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 {
+	iommu_device_unregister(&iommu->iommu);
 	iommu_device_sysfs_remove(&iommu->iommu);
 }
 
@@ -95,5 +151,15 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
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
