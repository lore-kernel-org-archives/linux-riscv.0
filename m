Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A9EC83F20
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMPd8JXI7PUGn10MIvf+DWM56eUxRvBiAfdaMrn95Wc=; b=Qsddd4R+KB2LQj
	LX7DtUemWgPhQZWsGuwk4LFT94/gulW3JSax7ymNY21TPo+lrBWRwNPy24CjDl/A7lRxueuOdIwQ6
	irKCgxgjAp7cJBbu+qJsnlTAhGVrz5FJIgoCns7yfqgksj4amg2cRo3nhmc8MLa8Gv0a7Lh8VwzNq
	+AKHDJXHvfwC+blgDNWN5/cN0F2yOS9Oo6Em+OOwGAMdikwQtTIV4mEL/Oajv3xq7PTa0umQLTorX
	hOXy/5umIBbXXxSm9TfQ10AIEMzDvhT6PDC+cyYzeqtIoXKxXXW1YGYSRPo9x/o6n/azJQVLl9F+c
	mZ3sA4Ws1mEn7qkqORtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoGo-0000000BQt4-1QY2;
	Thu, 10 Jul 2025 10:12:50 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZn5q-0000000BFq4-2OgK
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 08:57:27 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so1612887b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752137846; x=1752742646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VS7oZDoGeD1L8wjMbt7OByfnbNqci5pMCt79WKJZtII=;
        b=KJ/5nk6VQHcwISr5xg89/Q57O6NFcu+6NEa3YxKcmW32TArm9ZwIIcMpBkqIOlzZ83
         Dc1Nubl8WTGsY8h7EI3QEcXINBpjSbab3Old6HYwVRjEIqqwHOwcwjw84fwq0HYWfKHs
         +ehjRD2B9QFKqFaRzp4Q8upv373EzYcrzundWy7whzvqDr6odfwUVNEtU2qodk0NHdpX
         jciJvb96AdQz5/wmWFmDzl++qsL4xJGJdh2JOoLgvxDnVS6ezVO3GgX1qKo2wcxQb2qH
         KP2w0L1UPdsO3vyy3ZswtDsVhTkF62CipMXPTV+kq4N7GRqSbicWRwkK9tveVYJw6Vqz
         3szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137846; x=1752742646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS7oZDoGeD1L8wjMbt7OByfnbNqci5pMCt79WKJZtII=;
        b=rQ034U5THy5H71zt5qOtCAuQJELNySC8Hqp2SDhzZ0J311agJ1xdS85CbSDm/CwpvA
         7J2G7TBTKo6q+cy7vTg3zOlVo3SjVCYijxi+TtooLzVIob5E1E/zGITp6GW2z8YA9dOs
         6sC51AYt5jZu8pNHarMyEmkncEe1onKZuw5Fr0BK8cArjrCqqNadcUfhy7MSvd1F0ckH
         1xRKcAopu8DIEiuCmAwSgI78gjPXAs0x4laHzcEKZHN+GBXrkFPx4WNfmevLdtff34oH
         1gs2BULpnxCZQiTxSritulSrItpOYEKc3+NGGGFFbQx+vefdYzTcjP5U5mGwmxxlHpeZ
         9gEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1TrgzhKr06J6zPKA8KoVpfhKcRdvzlW1mB1fhlfVB3AnoZD7vzn23NOnWk2BOurxZcqURO2efr5SEqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbIJmLHa+KQRYCshKCfRg0dgDOouXIXVfg8ev3hlWC8V7IhQqe
	bZ2cD6WubkYCQYmde7TbKulNWj+lXTf1bs04XJhBJrhvcWiYzJgNY5YSUDtNuGSdU2I=
X-Gm-Gg: ASbGncucoEX0CJ2URssAKrevmucjYrpC3H83j9pofFwYWdViixQbvOq282eHLsecFN1
	laPIVSJJYQRCFkBhKhQKxsxDzn6rvmjLTOeYD3qGakdLXhOgoOenNwT0LaQGkGVPgxv44BDG+qd
	s06XsqCPQZcYtdRTIMprIeG8n7SdNLw+HZ2vxfa7GSdn7P2QjqGeVHP+CQPDmqkWrFRp86zRo2o
	15lTWf/TPen4c+TMCQSPpKmu8pnDpHWgX5daPX2pf9v+5gkf8CQ6ALauaMpFUlYmjLckkakf1j8
	clh5F508L54Q0IH7y1vhP42rc06PtUxrMncC3P2ggsrjA+7qeZEc/08uJUeKkQp6sZXz4rVbbdF
	ahNOfRjQ=
X-Google-Smtp-Source: AGHT+IHUdOd3Xm2iDHKE4tkW13G5yAQLxHKJQpWVcXGjXWDJYkcMmbOblQIeJliUDTeryLpJLtOVqQ==
X-Received: by 2002:a05:6a21:69c:b0:222:c9d0:7aac with SMTP id adf61e73a8af0-22fc4dfafddmr4472974637.15.1752137845826;
        Thu, 10 Jul 2025 01:57:25 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe52ecdcsm1522323a12.14.2025.07.10.01.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:57:25 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v4 3/3] iommu/riscv: Add ACPI support
Date: Thu, 10 Jul 2025 14:26:57 +0530
Message-ID: <20250710085657.2844330-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710085657.2844330-1-sunilvl@ventanamicro.com>
References: <20250710085657.2844330-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_015726_607481_9C890DCB 
X-CRM114-Status: GOOD (  19.17  )
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
