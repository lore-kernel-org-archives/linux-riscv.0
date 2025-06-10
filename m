Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C04C71133
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 11:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwKPcFld5oqLk83SfAvzmz+a5m67RYatgi7qicWQigk=; b=w40q3J2fNrHpe9
	xxNxP3vQNKHrKV8UJcIGnrsp8GFalib9mbNnIOEs4DA+33qNR4nsZuk7k0XDY73/cMoMwmYVVMKSQ
	7R8KZZRN9WoEZTtAV5M1vudEva054658zsroyTEQR8Pi0n7GpDpcrmS3pqhpnl3KZ8sb3VRL61YGj
	k1TMgQUQoDeXqgIjeAyvKTGmocVy+JfJYUDHPbVeqz6pbJU4s3WHpW2a2XfHvGjxiuxBgufaBcMiG
	XHaBnv7n/TYTv5XYT++BAfxkFhgDk9ayvjrYAbeEqCV5aYSc2jvGIckwR2nymJkidBDLzZgncq8jI
	w6TTesfpExV+fJqSpRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwpc-00000006bz3-4Bnf;
	Tue, 10 Jun 2025 11:07:53 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwVY-00000006WwF-18yx
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:47:09 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7426c44e014so4539574b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749552427; x=1750157227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FP3kf43rac5NeyS0tfBg63Ga8H9gH2daKAu3CycI9m8=;
        b=PAcYb1xd6GBOPWlIwOyCDjoA7bYgglPSjOHcp6ZnSetrhoJDtxBC7BYKidRrRjYj2O
         uMLqs+QtQkHfSDVIQhg/z4woLGWVVRO95GUPzUgtug2xHUAepjN7ObWNXsZR3SEKXLCM
         942bZUW35AQROA39Mhfi0TILQiVcx233CifJeZOhJoGmW9xltTRPvHaTL43BJUb6Bh3A
         sj2P0SnaR1z2dRCeg9XRrutMUt2oDEbVsCuc0Qd49S5IAQ0JNw7gc3JVKZDSoBoXFb0E
         EXqzndT6LQrYUT38WN/TBUJ74hdw85wz/lgJAPHD/M/LbQwgu2gw5FJWylk8lkI0Y590
         H05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552427; x=1750157227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FP3kf43rac5NeyS0tfBg63Ga8H9gH2daKAu3CycI9m8=;
        b=Hj6Z1OArk3kKWOzr7VKiyhgUFoNmb1WpG/Qr6HpvW4xnzwTKvDxxX4ZQvvjSmcid1j
         r9vJfEEERTPtK7GcQxuZz9LWf4Dln2n/JZ3BPp37SSq4YkEQlSgD9DPBi+gq4jB3ircv
         jpw2NgdKw5tJ5HoPNqChsA6QHHdV/x3OEQXj4keRThgXjnnyvSxS8od0nNXhNWjuy0Oq
         /TWyY2hAY8MVtrfefYDYIgsvRyKR+qI60ABIMV74W1F+wMt2FlM8zGU1G8h6ZaimYciI
         QTh66bp9/lYisYAOsdjYOBFgKWsp3nidL5Y6FDazmQFS5VGt/ANL2UGGHYQCuMSrxuGU
         e6vg==
X-Forwarded-Encrypted: i=1; AJvYcCW/35I6wovNlY9M2MVrabw1Jh8XcBC06QibyS54JGTUnwPxPZF7Ip3cPt/VVXwMbRqvFfX03Cp5p+eaCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLzVWRhhW8sco6Vxim1FIb9ZTYBgH6NoX4wG+7JNOfNs0vzQjV
	zD4wbRtESOuhoT19d1UXToK7WYlQIploxuvPpBZtmDecu7W9r1WSWNOJ2T/U65dgQ0k=
X-Gm-Gg: ASbGncu3V9iCcnBeXaCl9b/llAHa7hICT+8wGr1+Zl4iq2/ikplLqbW4+jrfB+yD3kC
	CF5K69r5WavYQMcUCZgDhqgjfi07885mfF1vAw7yo6fXgaMnYDrC5UMRzPgbMTS+hhh8DyJ4lmT
	JaUlj80/keEjlKIZY8Bx5/szekBWJSTczqVIkkF+mynFid2Wj5pk8ACodhO4pv3vtutGoa5cGNR
	kzduooHwbmwPz7UyQ2XvwMWNWziUFPlQ7o1GwW0M2jimnxzkdASelenmMuTmIFCkuleOfAP+uby
	NI24bVXeiuEniUP+tc/1VBkTy5U28bVdxSng4/wyvr4lqLpZdgwuYx1loJyTyC+a00U2NLdR
X-Google-Smtp-Source: AGHT+IHO3whMIsadT1gQS1uvXLzDhfAzklgArmoSaPyZ84SGmfZlfdnm+MiFoYtdG6mfvNnmI8Mwbw==
X-Received: by 2002:a05:6a00:194d:b0:740:b394:3ebd with SMTP id d2e1a72fcca58-74827e7faa7mr22225344b3a.7.1749552427592;
        Tue, 10 Jun 2025 03:47:07 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7152448b3a.73.2025.06.10.03.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:47:07 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v2 3/3] iommu/riscv: Add ACPI support
Date: Tue, 10 Jun 2025 16:16:41 +0530
Message-ID: <20250610104641.700940-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610104641.700940-1-sunilvl@ventanamicro.com>
References: <20250610104641.700940-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_034708_458253_7613186E 
X-CRM114-Status: GOOD (  19.25  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
Link: https://lore.kernel.org/r/20250514055723.1328557-5-sunilvl@ventanamicro.com
Signed-off-by: Anup Patel <anup@brainfault.org>
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
