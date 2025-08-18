Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F2BCA0EED
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 05:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cI0qgovGYULS2J+MYO7eKMqzW/bWBtomy1kXMwubv8=; b=jHAWz6i7sXYNLi
	nOXLxWL7fL5TLdAMwtU5p0/1u1yBslONj0fkzuUanJ3MUrE9kD5rr8zN9320U82w7sg5VKa5wc2MY
	C195oodOJ8WYURpMJNe2GVo5ixeZ3Xa5M3Qws7rEtwBfECskS+BkzkecF+xkgQKkjnv81gfcz10G5
	Gds+vyo2G1JtjJgMl9x3AK/NcJjF5o2AUo/9ASlQD47v+s6o0ZqvuRv/1QXZO6+0mlGNUSv7KG4Y2
	cJ2XFboBwkqXPAfVgpkdvLpOXOdxcXID5kBYfNMl/NKzxMXZV4q/0JuqQVmMZo8hSXTtHmeme+ELF
	qGDHf3LIJ/efBHMMfbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsTo-00000006Yi3-1Qk6;
	Mon, 18 Aug 2025 05:32:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrxD-00000006ViP-41QC
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NTa6xqW99KKtlVHpIkJtLfUt2l8dIJi8RFcjVe+ZZ0s=; b=YJY/QWCZ+oo19lxSI7FxSrnWEH
	d37HDByxuGC/3hgYQrBrJ6LabbW56RYAWxWmmXq54aXU/eP6eoSTaR/ywYKiIeluNB0hYcToORsAR
	bk9XxhYmTDjsQ5+b8ywOCgmKGerxKZ4PJDYadglPxPFU80t1dwhXP7hyyXdBT9jk7d/qDep5vzPtv
	cTfh70AT4WUtUFMC99DkWw5Tj6EqobnP93/PiGu6FiPGmJbFPxMANcKnZBF+4OZqOKcvOgT/lYyRU
	G/RhCW02ZZXGKE3mHSA5geM5M41uAXU+VxTc7FtCL09KZHpjK82RE1b1GC/F4Gac3T9zSPg0EYOjp
	8odosfrQ==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrx3-0000000HFaN-3TV1
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:58:42 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e2eb9ae80so2714595b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755493110; x=1756097910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTa6xqW99KKtlVHpIkJtLfUt2l8dIJi8RFcjVe+ZZ0s=;
        b=PGeEnfSkM5Aff3iehKcOe4Epdz2wlt2yh8pDWjC0QnOENFMDablHJ5/+MO2EvvBFT1
         xhCVKp49ubAUFRh+HX4pcZKwqxfuF/S0yoGxY+LBnYWpKVZTS22NNEkwSfx4q8idFkft
         l5ufERyQSKuy899Q8iao+PRRtRjgut/2+F/PbUIcIS+6bIHpGKUM6dcyEJJ0bS9heAwX
         hMcLUi79HMOyhvSyK0zlX1wTp74qHAW9sN/bARtnOvAtXZClLHTrQSNBE2V1iNb+W2Ey
         H8e0AYE5uaAJenq2oFP02T7+ZA7VPZYWTCFEIRARAotI8P3mYTEJ5unExMnjbW8S8tyX
         gMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755493110; x=1756097910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTa6xqW99KKtlVHpIkJtLfUt2l8dIJi8RFcjVe+ZZ0s=;
        b=Du0K3hf+x3fRCHh5BO9XJ1+YMArJ5a8xHJ3P5YWb7pd+y8KsIrin9ecLnMRl1P6pyw
         YYCgqZIN9qsd57KkcpOh0tCtf4AO0wF9k//HgPlsVqGhwlcRjoSNlis6MzzGSDUGXxuW
         C26WdudLF0lReRAQS9072QBshZ+uq5MxYMIlnuH5zyAl3Pk+L9Jkmg1g6vT5iwuSHAD4
         UXbYlGH56+0UVe8pIUgcNZqMwKrJ6BhQjlevfYOEdtOm59ujbhtwT2Wm1ou3CFiBw2zK
         CrDunIXxrQNV90mrolt4R4lE6mN1Npu4hDUBBbOHP2ZqSJEnu9/TOjeMA2BhiWbV+RIw
         EbLA==
X-Forwarded-Encrypted: i=1; AJvYcCUX+c8mDbKgsr+wUaesXQPicqiyQjmrot7vyH9kfqw3wCYI+BHuWWNIjISrfshr8+URwho/VLMTHyZWRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9bFln4BZ8yGyhG9pDo0a0hl2dqD83OYNEBOP18tMlRSETzGmZ
	SpyL0A5Jl5Wu1tEoCaD0BDj9epv1HukIZZjnG/E7Hd4Xx/w5XaXKu2syI+AGksnQ/d0=
X-Gm-Gg: ASbGncvhUr9NEo39k/OBu0iQE9IAA386ryQlfxwKdveT96dyBOfDYOd0PM4Ys/1EPoF
	wnTX7epnyQRG49N80Fw7u2J32yN/Ou7d0BbDssnaem0dYbjD8wEBM9SQFCdI95t5DSxhXdzu9f2
	eFhY56U7DvUqnKdfgiAdEu9npxiPEYnFtTXkt7t7W3bXn8RchFClRppqdxkE3rks7yOD3PUInuf
	+8U8TXvzYv33ATASwwyU1CQe7opgaa95fUFrwSJC4vkllVnl34HzyFA855jpBrALoNX9xI54HTn
	Pa+BXIwhoNs9XbnLhR/lnwJFJOju8z8vlk9ibkUygwltugS1/HXaaffLIpuTsNJmUBn6k2ULr87
	u0Ik9cerGHQfP0EuDLIzUbmxlggrPbAqcOVVJE4ZZ
X-Google-Smtp-Source: AGHT+IGBQAQ9QouKj4M7l+2CqoGFg6HgZE82/OKBnQvuZfjFIYQJQta7bAXmxzrYRho/3qFml+C5sQ==
X-Received: by 2002:a05:6a20:3ca1:b0:240:265f:4eb0 with SMTP id adf61e73a8af0-240d300688bmr17338262637.4.1755493109991;
        Sun, 17 Aug 2025 21:58:29 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.199.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e4528c264sm6124047b3a.43.2025.08.17.21.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:58:29 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 3/3] iommu/riscv: Add ACPI support
Date: Mon, 18 Aug 2025 10:28:07 +0530
Message-ID: <20250818045807.763922-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818045807.763922-1-sunilvl@ventanamicro.com>
References: <20250818045807.763922-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_055840_564184_4FC664A7 
X-CRM114-Status: GOOD (  18.74  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
index 2d0d31ba2886..7d9370aa58f0 100644
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
