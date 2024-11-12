Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF68D42B80
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwVTdMusM1J3fQUdH5e2PJvrBc/yw3IS8OiUuJ+WHZk=; b=m70RBrVYv0MHml
	hyZBx9DRpt7pOh+h004eX4huZrFp/REoNMZd7JixblxsQ4S0Vqw6g0BMtcZH3kiDNAQTP3kcbJkCM
	P5TS35FXhmb7Xaw7BQxLCqEJgaHuLB0BmvavDDdan8qLbSpXkXswdXE6LHmTZ4MFvJbCjs+UTk+dS
	D6mGROA+AYaUBPZAmcQVoXSsPlZKbOwZbtpu7WrqipK5u3DvgZzqSaYENaZ5dbI8VLLaCshs7LSic
	15Tt1E6NORqknBuJkABrazioDxSGmD4m8YTkTeSfS4IwxMFB5+rrC63LnmXubfi8eDeAGfiiAjZHv
	19h30dzX/3d6wqkcXHXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArCP-00000003dCV-3Bvf;
	Tue, 12 Nov 2024 13:44:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr2y-00000003bJc-32Dt
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 13:35:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4316cce103dso71267965e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731418507; x=1732023307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJIMNBzuMK7h+qGksPtnaBGirglhm92ygI/WSEl5z9I=;
        b=c5Nni+J7oPHbO6bcfrLdwcxst8hMPpeHiZAOYXor0s+kRhnl424jzA94i6nlPM9C00
         XEsE/OOwKfcn0Wx6oh2K9LI8RIgPmMvfkqQ/VOwKVWYZvMA417+MIsdnWZ4rnvpo3aIp
         xcnIsUajZj39B3Y04fXVYeuohXg7N1s1fops2rlLTEsxYqa4IufCOxMhGhLMMh/jdfO4
         yFq+qSFU4MsO+/TxrF+ZNuzzmPQDbPsoDSEHX40YWDMzopUxezBkWyALpj4R0PHDwBTH
         nv+szKI/K/GTUMacSGD8p273w6OgGIbfU7Lg4OfN9gJYsLqE/hTZdI8ckKAHLDnbGCRc
         /f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418507; x=1732023307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJIMNBzuMK7h+qGksPtnaBGirglhm92ygI/WSEl5z9I=;
        b=o0GIg9+pa31ZrB1lwUYDwlHMdnOsk/3UtMGEIF6mwIHqKxA1iJEGFrNKztOHmkvhUC
         YBUI1UT7EA3RQBz7Iy98s6XlgMhxLv7Z4U2kfOr+0n7JvL4niSHjHfWai3bZkUbu3GHx
         LDcCzIklTdMQOgU2dvYT5ejml3vQimOtRaEJaWgf9LnD49FZuZnM8UkViOFu8ZJmcd4J
         NADtAWF31mxtyg7R8wwrBlwcMmKSZrA5Lp3i8WxYo4NwAZYpb9Clq26QXJxfpc2RXQzp
         Z3lYwF1+WTQQImh1yteI/HgnKDJ7feWCRUoP16nechighEhoshcxE/dVujq828zPz67o
         fNnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9nDJ5X3ymrp0al9cFnXO2U5RFd63dPg9qRZ8O7ypVwLw6BJeIMhwaRUdujYgkcXsB7HsAfKFKgrA3vQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKIWYbTs8t0b1Ao8zoNWw9QidOFtyP9Bk8GQrMje8roLtTrhAI
	ztTn179z4n7TPESZuFi7ha09+hUZfl2VXPl8vfVq5fQGSIrlCSU2ljaKoVq6uOA=
X-Google-Smtp-Source: AGHT+IG/Z7mx614mpiSG+bVLADanukSwztBdE+h0N2Kt0vduWKMvN0NDCdisoOsaoV/RL2Zy6lGUTA==
X-Received: by 2002:a05:600c:458e:b0:431:6083:cd30 with SMTP id 5b1f17b1804b1-432b74fed94mr166289775e9.6.1731418507263;
        Tue, 12 Nov 2024 05:35:07 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432cf118daesm12548325e9.0.2024.11.12.05.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 05:35:06 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	samuel.holland@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v2 1/1] iommu/riscv: Add support for platform msi
Date: Tue, 12 Nov 2024 14:35:06 +0100
Message-ID: <20241112133504.491984-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112133504.491984-3-ajones@ventanamicro.com>
References: <20241112133504.491984-3-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_053508_896137_54FD6848 
X-CRM114-Status: GOOD (  19.71  )
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
index da336863f152..34b925909816 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -11,18 +11,43 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/msi.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
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
+	if (addr != (addr & RISCV_IOMMU_MSI_CFG_TBL_ADDR)) {
+		dev_err_once(dev,
+			     "uh oh, the IOMMU can't send MSIs to 0x%llx, sending to 0x%llx instead\n",
+			     addr, addr & RISCV_IOMMU_MSI_CFG_TBL_ADDR);
+	}
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
@@ -40,16 +65,6 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
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
@@ -57,13 +72,58 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
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
+			dev_warn(dev, "failed to find an MSI domain\n");
+			goto msi_fail;
+		}
+
+		ret = platform_device_msi_init_and_alloc_irqs(dev, iommu->irqs_count,
+							      riscv_iommu_write_msi_msg);
+		if (ret) {
+			dev_warn(dev, "failed to allocate MSIs\n");
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
+			return dev_err_probe(dev, -ENODEV,
+					     "unable to use wire-signaled interrupts\n");
+		}
+
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
