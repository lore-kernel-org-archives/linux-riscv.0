Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315A4C83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 11:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5au8zvy07atrc+hrVoEIwt5yD+U8klL7PfEHujlPb80=; b=i3KLfPsh/YsQGG
	9KPBtb8BFDMY9SX0HsYRSXwijnnx15Htx8hOhaK9oGVPPLkfX9QkjVxIx8+gOdbqytikYjnqQuzZx
	kIlnS08ldQXvkMfc1rZrjB1YZ/Cps19vcCtSZ6djfEGzyfQbv2jnBeAc2LIP00eXuH25T0FgmmLqE
	Favzfy7nJoM8UzhCljblkhZ7vVUQPD/BVYLrW+UH9ynitD22/ITeh52hpfggy24PeUsyzhWx960bw
	ORlxYS20kJV9H5oMY5WpSY148nr51yFfX+x1rFmZ79SVWQkhIJWq067U+VE/CkvhFHSC1r522QYk+
	+49sFnlkVqCJUtrEgF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzzF-00000007VEW-0q0i;
	Wed, 16 Jul 2025 11:07:45 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzZn-00000007S7s-3jD9
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 10:41:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so747544b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 03:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752662487; x=1753267287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZUWpBwM0eiM3bQczAhHsGr1w4CoIgRijBa2HvAnStE=;
        b=DAZ8/WpNvHx9WNWXXG8oO6BvGZNhTW8OjOiCP8CQk3SW09ITPl2TyiTvO/UHFdiMEX
         ckC641EQp2TXZZbP2p63rtK2ogcFLy041IQ7+YT0s3fpOdALIKVgaWi9ZZ1vi7gWmjo6
         XYg1lg9jPV4ykOy+1LTpB5/QK+MWLGwofqDW359dn5CyojHq4LPjQA47OD/gAiIrxFQf
         3vKPsZueWTRkK5J0ivDYLGUyVR6cE4kKnGcIuA0d7VIKDeLMjusgKqOslIOQop1/lPud
         7zSZ7ncas0HJHunkS9UJP9VPFkMh5aSa4JtMawV/U/Ppr4efw+eLfT0TVEfBk7lQN1Eb
         hyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662487; x=1753267287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZUWpBwM0eiM3bQczAhHsGr1w4CoIgRijBa2HvAnStE=;
        b=SFWNdhfjtOW5Mi4KfFwF6wDCQEqUdVx94vohx8M0cPCD5U6OGajsV8G150kFF9AMJU
         05D8CoqNh+MdJJPgbl3e/m8dsaq1fCrUDGynYEdokHFOxlVXxO6RnLNCx8r8+wf/tcaG
         Gq/h/E91aIhOCauHouHCL0JRoLhIVbMu4MKfGe1zH238KtdPwadLUFW/JRxFVSpNwZ+v
         2OgWiSjY3yQ2d66Tb5qZtuT2u+rgT/xw3BKNmc38Z9w1D4fB91v4uG34dYrfOJepk//c
         mzQttEct+vsXKqpAbAJnDwnVrSd3B0tPjQtBfbbUDx4d/y59Kj01+QOYYEAE8o8lHrvO
         bsEA==
X-Forwarded-Encrypted: i=1; AJvYcCXmzvs4PqQDMbUuYX9QUvw2EQ/+4Fe7+KMucgQHxA9GbKO9OWCpdRqSkIhv4A54xNHUtgEuomxz3c4Ejw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPfRuC3GHtIwxjQhertDOiWHwW4jLGSzxa91P/Ov33NP9h9loS
	rQXwnWzFS0VocMtuU6ZEFioBe52o5J9chEIHZpXWw6L7dZ8k3D+XwcALuLAma01vshM=
X-Gm-Gg: ASbGncsq2sCyxqlb2+OgVks7GIwpnsOSB7yWMimtYutXINZixtmLMjSqCloFKO26vUy
	xuz7f2W3twru0tjhjgGg87hKMVXsUItlTZprssVVl6h9h/E77aKxljap3LD3ZrRtADfrNnEWNss
	Sbi2ipHECI2zhR4hd6xB8F7rqnYa3DwMm5hR8ag1fo3yqNrPebiAddVsZBSH5aNYQio1FqIbyUs
	rdvr+LE3dM8KjsMWjiPk09DLXvXe8x5ziCmkoPDB0dWbF/J09FssUVP0a7gghWKz37x9MdoHogx
	H9eEZLbtGKtOBvcJGlGFc4TKhqwkCTO0qltP0opCV3EWXM7n1Ulqtn9tg9wYFPXb4VcB2e02o9w
	tRX84LdDHcmNz+QjEiNbXJTPd3hBaeYpA
X-Google-Smtp-Source: AGHT+IH/Lk91h2N/FwA9EAOD0yJlQtTfyDy3TLsMiePhmK16NWxXzdzTp0ubA0n3RaF6EsVZf8LtAg==
X-Received: by 2002:a05:6a00:ad0:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-75584eb932emr9392926b3a.10.1752662487002;
        Wed, 16 Jul 2025 03:41:27 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1af40sm13946709b3a.72.2025.07.16.03.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 03:41:26 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v5 3/3] iommu/riscv: Add ACPI support
Date: Wed, 16 Jul 2025 16:10:59 +0530
Message-ID: <20250716104059.3539482-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716104059.3539482-1-sunilvl@ventanamicro.com>
References: <20250716104059.3539482-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_034127_926007_1EA10785 
X-CRM114-Status: GOOD (  18.99  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Will Deacon <will@kernel.org>
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
index bb57092ca901..45a263c9e0d5 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -12,6 +12,8 @@
 
 #define pr_fmt(fmt) "riscv-iommu: " fmt
 
+#include <linux/acpi.h>
+#include <linux/acpi_rimt.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
 #include <linux/init.h>
@@ -1651,6 +1653,14 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
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
