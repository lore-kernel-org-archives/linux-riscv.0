Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A03C3ABC5
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 05:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4s41NdDT0gkUrjsnqHmud6FUY4hdujtJkA0z6oe8cg=; b=CNys+qq+nriO/v
	V2fbJPIUQFC0nNbgQFuM+7ls1EsBEvjGVpNXQ6UyxL2Hh4k7rhSbae8vWSDsXXT3fsXEV8E8OO+fC
	lOtoABOnBEizV1LsF6j8HTaOf+VtivA4aIBvHW3Tgs3R/w2O5GHvDegDaMeME96aR7UMuLJprGSbd
	0ACxqABOVG42cgeMGdCC6qpGxqrdnCtxpVODW8rJ7cvH4iqvEYYIipmyIstz9+rg80UsVg6yN+sW1
	wY26Gx00z+qJ5G02yul0coP6H6e1nbaloxGsWTaWGBix/rV6VjHOHb53DD+6kBQFlozXwemC06y5S
	EXfFBvBdtJP+4hIzCrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF57u-0000000E7Py-2Q46;
	Wed, 14 May 2025 05:57:58 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF57s-0000000E7ON-0nwG
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 05:57:57 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-af908bb32fdso384428a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 22:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747202275; x=1747807075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbiDocnvP7/vIiwuy9W9uCrvaQAnUMotSiyx0gsvykM=;
        b=Tt1jzhpVRRWveq7LzK8jR1rnvdE28KqODW/MkuDyazmiW5E5QMn0PB16tBVgGxcmnG
         qYWskBXAKohO90pYiRMD4BOMWvE13eCfxT5+jGs0lEWCtWgBhjzEjoyqetufpUnDnZ0/
         qCM+p66GLzbJDU8HvzAlyksvBt2sUXY9kmgLD/IM+aQaMS2hoykTug7eC4DEdUgHvfLG
         4kRFr+eGqyA6FMFXx/za7OJYN1FapYAlWedlVEqbYFnUkyHe4PgFMMMxaVjIHMdPJcIT
         D3ocuNocpQiKLjYxGVXX+d2pboW/fGFAOEZoPNv2SSFAZ9hne8m68eKV38ddVpnR6gUz
         MOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747202275; x=1747807075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbiDocnvP7/vIiwuy9W9uCrvaQAnUMotSiyx0gsvykM=;
        b=nBwUAApTQQn1Bo2SscQvVMxSy21jC0PMOctfNttz2WYscvywmEbEDZ9yX2B5Q2XvA+
         kQTPexJbMobeSUWP6AdHtlQ5qLPulRDqZP75wzJJCCABqDIkEq5VA9BbUEt+Lp4j/7G5
         I0iJq3w2faFTMNjYENaDWgp6N7g9Ixy8w2RRdv3sXzLPhR6nCNDQvnTw4TN6+vZHLpCt
         cnYYsXogV4sGgmLY8lv4T8i1+VMF0CB9UrLRqBoOLW6prOjcXwoIoF2tHxyBbGqgYIay
         66naVgiSmO4FYUesoTxTIzkWLyEGVcjUjtvJUoRRbXNyPk/PSnf0RHqJGSs2eYJuz7Tb
         vtwg==
X-Forwarded-Encrypted: i=1; AJvYcCUsFZd3EOTZ2u7xyZoigbKMYxlDuKmxDxUa/aiSGjpKq+Qs0t5d8FVQ7LuMn9Bz5sDk5lya0tJqY54sSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzitHczLatqmDztCAlE6W954kGUqggtCI30FKi9OstaJsPmvk73
	ItL3FvEpIL0XhjaMapVYQfbCUF48/+ylrFBPNdnwkV9fmmF27vU3NzYf66O+kEc=
X-Gm-Gg: ASbGncu3XpvpbvLMADYlYycFFiPBrw8Q8rKwTT5DBhgs19G4dZ9346KNsHiN9L2Ai44
	FvJpr/h43jHfaiBsIlJskvrQKOocthASmi6n9rrS4eFoor56RVhPAYw+xnMTzrG5bR50RGVoSzf
	iqOZF9qyKuLwT0cREjzWHnkEHVHyfBPAKRfQ/f1w1Jb0JzXnfoAPWvYMfcCvgDFujDzzjXGWvkA
	uj4OByBqWmxb+FCGEvcxintJaG2zDyVpFPwvJre/XnJBBBolrHxAYHCpQoc0SJXnbxnNqgVHTXu
	WfpSKjMWk+B1d9G5MesIsmQ4r8AtoQX440/Q2nz+CT1TVD51j8EnS1TWAEXf5w==
X-Google-Smtp-Source: AGHT+IGgGwlhXhb97hz7G/rQ5hnEoBLy0AHEplWytso8kcAajszMRL1hQAHqjtumZAwOWQTJC9TsUw==
X-Received: by 2002:a17:903:32d1:b0:223:807f:7f92 with SMTP id d9443c01a7336-2317cb4f087mr83654885ad.20.1747202275325;
        Tue, 13 May 2025 22:57:55 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c2dsm91721615ad.135.2025.05.13.22.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 22:57:54 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev,
	acpica-devel@lists.linux.dev
Subject: [PATCH 4/4] iommu/riscv: Add ACPI support
Date: Wed, 14 May 2025 11:27:23 +0530
Message-ID: <20250514055723.1328557-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
References: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_225756_229984_872FD077 
X-CRM114-Status: GOOD (  19.19  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V IO Mapping Table (RIMT) provides the information about the IOMMU
to the OS in ACPI. Add support for ACPI in RISC-V IOMMU drivers by using
RIMT data.

The changes at high level are,

a) Register the IOMMU with RIMT data structures.
b) Enable probing of platform IOMMU in ACPI way using the ACPIID defined
   for the RISC-V IOMMU in the BRS spec [1]. Configure the MSI domain if
   the platform IOMMU uses MSIs.

[1] - https://github.com/riscv-non-isa/riscv-brs/blob/main/acpi-id.adoc

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-platform.c | 17 ++++++++++++++++-
 drivers/iommu/riscv/iommu.c          | 10 ++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index 725e919b97ef..83a28c83f991 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -10,6 +10,8 @@
  *	Tomasz Jeznach <tjeznach@rivosinc.com>
  */
 
+#include <linux/acpi.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/kernel.h>
 #include <linux/msi.h>
 #include <linux/of_irq.h>
@@ -46,6 +48,7 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	enum riscv_iommu_igs_settings igs;
 	struct device *dev = &pdev->dev;
 	struct riscv_iommu_device *iommu = NULL;
+	struct irq_domain *msi_domain;
 	struct resource *res = NULL;
 	int vec, ret;
 
@@ -76,8 +79,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	switch (igs) {
 	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
 	case RISCV_IOMMU_CAPABILITIES_IGS_MSI:
-		if (is_of_node(dev->fwnode))
+		if (is_of_node(dev_fwnode(dev))) {
 			of_msi_configure(dev, to_of_node(dev->fwnode));
+		} else {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev)) {
 			dev_warn(dev, "failed to find an MSI domain\n");
@@ -150,6 +158,12 @@ static const struct of_device_id riscv_iommu_of_match[] = {
 	{},
 };
 
+static const struct acpi_device_id riscv_iommu_acpi_match[] = {
+	{ "RSCV0004", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, riscv_iommu_acpi_match);
+
 static struct platform_driver riscv_iommu_platform_driver = {
 	.probe = riscv_iommu_platform_probe,
 	.remove = riscv_iommu_platform_remove,
@@ -158,6 +172,7 @@ static struct platform_driver riscv_iommu_platform_driver = {
 		.name = "riscv,iommu",
 		.of_match_table = riscv_iommu_of_match,
 		.suppress_bind_attrs = true,
+		.acpi_match_table = riscv_iommu_acpi_match,
 	},
 };
 
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8f049d4a0e2c..e51af4ba54a8 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -12,6 +12,8 @@
 
 #define pr_fmt(fmt) "riscv-iommu: " fmt
 
+#include <linux/acpi.h>
+#include <linux/acpi_rimt.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
 #include <linux/init.h>
@@ -1650,6 +1652,14 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_iodir_off;
 	}
 
+	if (!acpi_disabled) {
+		rc = rimt_iommu_register(iommu->dev);
+		if (rc) {
+			dev_err_probe(iommu->dev, rc, "cannot register iommu with RIMT\n");
+			goto err_remove_sysfs;
+		}
+	}
+
 	rc = iommu_device_register(&iommu->iommu, &riscv_iommu_ops, iommu->dev);
 	if (rc) {
 		dev_err_probe(iommu->dev, rc, "cannot register iommu interface\n");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
