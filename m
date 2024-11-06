Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683BCD59F5A
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 17:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNybegm0HTOuUIBRCLeJAJRo9BP8elbsUkBTcBvwzxM=; b=kcyoFG6VHGRdV6
	+dVnUue9ayJFVmoxYF0GzHcNbBHzt8qaAQfUUDPoUo00xG0CBGWaayqpj06ht+Ssqge9P9ZnqlMU7
	7/xIqGHSBIG1dex3ZixA2Z0himbhtNZvK82QbWNF/sUi9ulsFaZIyBTTrEbUPU/UEw7S0OinfydJb
	ZiVvKiraXoKDBlPoYEc8U7AZHa5xdpA3a0ZdRJCNZMG70CfBCdtpUDfegbeFsNtLUfZXbiVTn1DmU
	UsCrz8hNfY8gh/mPHXN3COpq+YkOJ4S66Oa6jROIvFLSXoscRn+NRDxAy2nOEXjtSn9A4yDPmkQDD
	Ek9oWjelsZNz0UhHqSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kCY-00000004FPn-0Mho;
	Wed, 06 Nov 2024 17:52:18 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kBR-00000004F5e-0ORt
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 17:51:10 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9a68480164so723466b.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Nov 2024 09:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1730915467; x=1731520267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49hG3lsHGrJySpAEzyxRduAfSvP7r1BXPqy63OvAnoQ=;
        b=HyCka+V9LExHAu3iQaDLn/MLH/OBj2bWz6tW72QHGUKfd8+lYb4Lv+6QeeZ2QVnVwL
         mAiYr1FiZLFAI1cIBQfHjeLISfT5UtEKgh1m1bEqW5mHmVJjnzgU/+3LEhGKQ19nMHo1
         /6w2HKG48gdUJVgSRiNyCsTmeLif63Pv5JqecrnXYSkZaDW67650CTMCTN5/+R+wmH1L
         FS0swwYnYQ5J6eHXdGsNNAsSpTprnsPxfUK5QEDNLtOMeJ/ddm8+UGeSyqIuEpk3+uL8
         x0Vi+ETtK2yCM7PxNnr0mz4mwVNAEq2Eaz6mzLNT1onGldkEJYmNO54nf6Z4AmRcdJvA
         4cYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730915467; x=1731520267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49hG3lsHGrJySpAEzyxRduAfSvP7r1BXPqy63OvAnoQ=;
        b=QKGwfu+8dOnHuwQrwWFqBCdpzl/HYty1mklvz2lX6HJ5bIWGwi544UtrWMD0jb8aQY
         nUU3d9oYTOHDAJjiCf+0A+wkvxZRck0DnmM5o8Hddb28XNP2/feSqkl+HgRrDT7+ckAL
         vfpq6gtky0ahomqp0KyN8ySZ0eIc9I9zxD4CDywswv++zfrHQ3RBLuAhGgpShxuHTofw
         SxJ5hi2KusnWw77FHTbav2DPVMjRqcx3WlFKzyQtYLIQzYyH2W1mqcrYkzzGPb6a3ywF
         aIrUI01+QjXRrYIWubq2oj0FdYCwHWtApujSkgEDGveV8/VNOo4n5TN4REsVR7z/x8Vl
         U+oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqOdVgQdl7TQ2p7ZeR8rN/m2M6t0aOIClD8j0hlr3umZpsRunmeOLYKCz2koafKEHsUDaWxW+wkdpYXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yztd2esKCPRzfP+ssJQAaTnWiZMxkcv1FYeyp/5Svxr2K8gscGc
	lAuTLXzhLs3mndwqAtt4dfJADFRDbyPDRuLj4SotnUDXKY+fIkUuwpzvOV4TXo4=
X-Google-Smtp-Source: AGHT+IFfCwyaClKnReIWxUZd0iEfNRrNS6oO6x2m/KaQtRbS25PxoEe6F/CuTCRBg5p3XO9EVv7f2A==
X-Received: by 2002:a17:907:7d93:b0:a9a:8a4:e079 with SMTP id a640c23a62f3a-a9de5edea84mr4205271366b.31.1730915467354;
        Wed, 06 Nov 2024 09:51:07 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17d7328sm312443566b.129.2024.11.06.09.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 09:51:06 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 2/2] iommu/riscv: Add support for platform msi
Date: Wed,  6 Nov 2024 18:51:05 +0100
Message-ID: <20241106175102.219923-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106175102.219923-4-ajones@ventanamicro.com>
References: <20241106175102.219923-4-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_095109_264280_648AC044 
X-CRM114-Status: GOOD (  19.72  )
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

Apply platform_device_msi_init_and_alloc_irqs() to add support for
MSIs when the IOMMU is a platform device.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-platform.c | 102 ++++++++++++++++++++++-----
 1 file changed, 84 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index da336863f152..89aa622bcbde 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -11,18 +11,41 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/msi.h>
 
 #include "iommu-bits.h"
 #include "iommu.h"
 
+static void riscv_iommu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
+{
+	struct device *dev = msi_desc_to_dev(desc);
+	struct riscv_iommu_device *iommu = dev_get_drvdata(dev);
+	u16 idx = desc->msi_index;
+	u64 addr;
+
+	addr = ((u64)msg->address_hi << 32) | msg->address_lo;
+
+	if (addr != (addr & RISCV_IOMMU_MSI_CFG_TBL_ADDR))
+		pr_warn_once("uh oh, the IOMMU can't send MSIs to 0x%llx, sending to 0x%llx instead\n",
+			     addr, addr & RISCV_IOMMU_MSI_CFG_TBL_ADDR);
+
+	addr &= RISCV_IOMMU_MSI_CFG_TBL_ADDR;
+
+	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_MSI_CFG_TBL_ADDR(idx), addr);
+	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_MSI_CFG_TBL_DATA(idx), msg->data);
+	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_MSI_CFG_TBL_CTRL(idx), 0);
+}
+
 static int riscv_iommu_platform_probe(struct platform_device *pdev)
 {
+	enum riscv_iommu_igs_settings igs;
 	struct device *dev = &pdev->dev;
 	struct riscv_iommu_device *iommu = NULL;
 	struct resource *res = NULL;
-	int vec;
+	int vec, ret;
 
 	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
 	if (!iommu)
@@ -40,16 +63,6 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	iommu->caps = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_CAPABILITIES);
 	iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
 
-	/* For now we only support WSI */
-	switch (FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps)) {
-	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
-	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
-		break;
-	default:
-		return dev_err_probe(dev, -ENODEV,
-				     "unable to use wire-signaled interrupts\n");
-	}
-
 	iommu->irqs_count = platform_irq_count(pdev);
 	if (iommu->irqs_count <= 0)
 		return dev_err_probe(dev, -ENODEV,
@@ -57,13 +70,60 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
 		iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
 
-	for (vec = 0; vec < iommu->irqs_count; vec++)
-		iommu->irqs[vec] = platform_get_irq(pdev, vec);
+	igs = FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps);
+	switch (igs) {
+	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
+	case RISCV_IOMMU_CAPABILITIES_IGS_MSI:
+		if (is_of_node(dev->fwnode))
+			of_msi_configure(dev, to_of_node(dev->fwnode));
+
+		if (!dev_get_msi_domain(dev)) {
+			dev_warn(dev, "failed to find an MSI domain");
+			goto msi_fail;
+		}
+
+		ret = platform_device_msi_init_and_alloc_irqs(dev, iommu->irqs_count,
+							      riscv_iommu_write_msi_msg);
+		if (ret) {
+			dev_warn(dev, "failed to allocate MSIs");
+			goto msi_fail;
+		}
+
+		for (vec = 0; vec < iommu->irqs_count; vec++)
+			iommu->irqs[vec] = msi_get_virq(dev, vec);
+
+		/* Enable message-signaled interrupts, fctl.WSI */
+		if (iommu->fctl & RISCV_IOMMU_FCTL_WSI) {
+			iommu->fctl ^= RISCV_IOMMU_FCTL_WSI;
+			riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
+		}
+
+		dev_info(dev, "using MSIs\n");
+		break;
+
+msi_fail:
+		if (igs != RISCV_IOMMU_CAPABILITIES_IGS_BOTH) {
+			dev_warn(dev, "\n");
+			return dev_err_probe(dev, -ENODEV,
+					     "unable to use wire-signaled interrupts\n");
+		}
+
+		dev_warn(dev, " - falling back to wired irqs\n");
+		fallthrough;
 
-	/* Enable wire-signaled interrupts, fctl.WSI */
-	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
-		iommu->fctl |= RISCV_IOMMU_FCTL_WSI;
-		riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
+	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
+		for (vec = 0; vec < iommu->irqs_count; vec++)
+			iommu->irqs[vec] = platform_get_irq(pdev, vec);
+
+		/* Enable wire-signaled interrupts, fctl.WSI */
+		if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
+			iommu->fctl |= RISCV_IOMMU_FCTL_WSI;
+			riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
+		}
+		dev_info(dev, "using wire-signaled interrupts\n");
+		break;
+	default:
+		return dev_err_probe(dev, -ENODEV, "invalid IGS\n");
 	}
 
 	return riscv_iommu_init(iommu);
@@ -71,7 +131,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 
 static void riscv_iommu_platform_remove(struct platform_device *pdev)
 {
-	riscv_iommu_remove(dev_get_drvdata(&pdev->dev));
+	struct riscv_iommu_device *iommu = dev_get_drvdata(&pdev->dev);
+	bool msi = !(iommu->fctl & RISCV_IOMMU_FCTL_WSI);
+
+	riscv_iommu_remove(iommu);
+
+	if (msi)
+		platform_device_msi_free_irqs_all(&pdev->dev);
 };
 
 static const struct of_device_id riscv_iommu_of_match[] = {
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
