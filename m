Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4A6C83000
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 03:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHS/RLYnee+BgGxbPlqFc0T8NyH1ykE/ZYii7pYKon8=; b=FGt+vhsnjv/WHu
	WinJRBgb33sWdlSNxLroSVNozlqhlL8ptQoHtPG2OWCJbV+YzHs9xnh4WnOe6qHhbE4Lw1Cv4TPMg
	lqiBVaoeJx0Ii7eU4j9Xw97isCDWpqhE206c1+/yfyU6dKprY7/YJuzZWvAUg8gfybPW//JH9odGF
	NOLmf0ZKBAsah4a31XCXzGfbu8bKRFJuX+MDvrqo/3WyKj3wVfwjAl/McFcflskdt2IcGvZ6+pbl9
	6P/fGzUW3CqREa9NA1yGCCakcFPY/PnUcjHaPs8xP2TBXZEPDo9LOkCnIBxzyz/IieKf5T3Nbgj2X
	SzbTydzNsnDrw1o3A3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5Wu-000000019LM-3tgX;
	Mon, 30 Jun 2025 03:50:04 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5VM-00000001918-1UuN
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 03:48:31 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-748da522e79so972971b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jun 2025 20:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751255307; x=1751860107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFQsxLCkN/yrCHNlyEV/dF68pPJedJM8kd/qOCB51Kk=;
        b=Gq1wiQFcU6ZzOcmaI0OPznA2RQAQ0VFy1l+eQI3kzH1cbvCJ5ceWkixiV+5BvO36iQ
         UGtC5ZTkOelXq8IZPOLBgP23B9VYevXx1xItZTYjwh/Vx1vt4V9jHRDZmq6Z2glkh4nx
         jc1r3/7dcrA2L6+0B0uVg5GTKfUoLIMg1frbvkr0f5uYQmiyV7f0Ov6aKlxzby14OHzN
         qfGkg/tiOA4sfgNn//PCoNLRyKZGO0Dwxez3gAsFQr4D0M24K3dd0Nw83zABK2HcZw5E
         e4W9VDlcfw5lsGBnHbS3PajGwBXmMaqPw4ZZxp8M5x/3SF4RVNL//P4KvjiiA/GywYTR
         HJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751255307; x=1751860107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFQsxLCkN/yrCHNlyEV/dF68pPJedJM8kd/qOCB51Kk=;
        b=p23t4XFC4dgIxV49gZgAFf6kneHIzpl+ngsoqIPGEyQbo0Jmex8DjlT1dcOV6gd1sD
         ExI3DQ863z8CsdPsBSoAKGkvRaUhOqNVhcKqueLFXZXUCdEkNKzq3tP2u5E5xze1+Aou
         Ax9H4oEiv1m8bFqizs6ABu+kkRXZU3+2hms91nfVLLNulgzI4+vGculzng+zVmymyz6w
         tLiNXKhwuX5ooNaBLK6FsU8AVS+PD+6FcKp42Cla10RZG9l8Jps5VQ4J+ndmo8bUVaW5
         rFEfG8iOXuwScdIlfhcukbk9qJkSiuiw+4WA6r5jeYK/hihbKVEUu0xzGHkMCk6/kIqB
         dbuw==
X-Forwarded-Encrypted: i=1; AJvYcCV2Cqr4h119UfDNYlTymQpRXzDqskRQ+An50jIU3t2CNs0Ajah2ncwWHFmiI4eyPAG8bUTTykvc5nG2Uw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3RRY7c4Y666qtVfF29/J6HLAwHJSrAvF8nO+xoAsYit/3pAPm
	tDl6m3If8a90B+fQWfq5o56zUN+bJiMMQ21kA0luiQoS2/5mDuj0kuITU/gqRcxF0RnuHh8WLtl
	f2Mqh
X-Gm-Gg: ASbGncvRlJhRfIfJjBb0F5DdAk+bbNaPwQSNRKXhl9yygKYsq67pG83WY3e6OmI/+Om
	RD+yN9PuRGhsTEOd9vv9rSyaTCfYM0qrHLKbuCRGGfNVxaA565JP2u+ZsUFZzQMMN/zyA/VmdwU
	CM5BR/kGn47f1NC2jKuaxPZiHViRST9/kEhwnOYNGdrBusKdgMw5y74hI27JG1kZt+8VP9s8Tyz
	3gM9FzSTIfNA0Xl7FD8wLIs+yswaCx+ZOITAjXJhYmk3dI6p4JlDs800oWQqxBz1MqsvdeeViJH
	iZ/wCo0X6qrGLiQCxM/3AxRnBcM10iWmtcHHSrbc4asdARo4pzsom91WdrSLZdEyXlE/Dt9y
X-Google-Smtp-Source: AGHT+IHpHBjPFAAATJQptsjtLS2j6ZPZrkAWrRRMr3WRaNURjmZvw7lQa5uyyPBco66LK582kKThmA==
X-Received: by 2002:a05:6a00:b4b:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-74af6eab8cbmr16901576b3a.7.1751255307612;
        Sun, 29 Jun 2025 20:48:27 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57efaecsm7837862b3a.161.2025.06.29.20.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 20:48:27 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v3 3/3] iommu/riscv: Add ACPI support
Date: Mon, 30 Jun 2025 09:18:03 +0530
Message-ID: <20250630034803.1611262-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_204828_394005_5E70A6BB 
X-CRM114-Status: GOOD (  19.38  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
