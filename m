Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747B3D59F56
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 17:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2SMCe7Ytd0Dl5sP11f7D2ZEXpMITHR1bV/mX30c/0g=; b=XdN1JJIYoMA+og
	CnlgX2u/y1YtPLRIuc6UzECd6Ea6j5/WlHxcVWKbZ+AIYoKBTztk6zRAbozXDBQyqhxsHyv9fjk7Y
	8aKcGxNY9e1SFHd675Rd9nQ+QEWuYOV96NzEv8dE4BRl9Jkf5CuVKgN3I4/yIDU1iUz1bYigV0lmT
	Sbn45uiGwWCrV1YvieOdpcmQMe8ULG2osRj9jSb5sRDqrF7p3SH46gKb2e55BG2EtSjv0DAtQNvHJ
	7gbCopyy2F+XSz1kuPOer5Bb4gh5FxBqL4mzkeZr/hNZqFrDRAE2xpppTkcG/020OkHonPCTXblHJ
	j7G4EDpWvjOWmT4s8jjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kCX-00000004FPh-1wza;
	Wed, 06 Nov 2024 17:52:17 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kBP-00000004F52-3tUR
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 17:51:10 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9acafdb745so25593966b.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Nov 2024 09:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1730915466; x=1731520266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g96IwKhGkFLWIqbkT7NwpHd+U4DZ81t2GIHo2pf1780=;
        b=GHX8zJVJjJf1tdzw5+0qSgslDy0OoogGliJqwODFTWGgZ4IAJQGuDEi944NtrKk2Au
         VqeIL4ifUdR43RUU9EdQqR8+QK4cqPFVpwI+4VEMemVW6W9fvkWd0+oElFY1IZISj0Sj
         4fI5K54wqxwkABKzuBqzzHr+qij+P/0QRrbbX4Vpn5mLH6eZ9ttQjnFqe8eQkClyGgqf
         haZRoXqLLHNLsi/EK52zZIreyY6c35cL5Pr5qU1OILSA9Ya3xXH75bBaPAJ68fAumhBJ
         gHAzbXkeb+M1jSMJPBx2oYMIiUwTcgsgdweThz7rz8Q4398v06BbtrpNOYZ3tC7Utyhq
         PbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730915466; x=1731520266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g96IwKhGkFLWIqbkT7NwpHd+U4DZ81t2GIHo2pf1780=;
        b=j15alA6ix3owlUsg1Fox2wntE/x+a+MHnv3+tX0RxWiaNz+4Shf5hcBhaRAd8VgJkr
         9bE4HSStDDqiNH4QEOT1ctLE3YJmRIabCbxew5LB66uibGXxcRSwNqnKgv4PXStG6c5J
         2xR/8nTzG5E1vZ35oMHEqwwZqjrKXJe4Jd3fYi0S3y/+RQEpcXDXkreVulp2iGsCRGAL
         fKWYvaAuYhhqjP1+dhOH03avz2HpUhWwOghbyZOPm3P0+YAAdPBMKjW1sn36HSzB+/SG
         UvD2GVZ8BjMXPB9WLpUdxCnOM2VLVDZ3a3c1Ln8/6fQ6xd+u0Fh4i+2f0D5aAdqa1FuW
         fh/A==
X-Forwarded-Encrypted: i=1; AJvYcCUnXBO5eJPkMXXsSip+nJKa+lnT96Si87AgdjS7WWesev9GEhUDSTDspn0pySTtZvtWG9gnaSnxnifWgg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5hWa0LOOfrMNMTtWoiqL6SACr9ppbwnT1Ix1ksbOij9zyZf62
	l+U+2EUeE/uFjKGmXt5ir8Ozv5RArvoQrnA38Opv2s9Q+sZw/fb2h8iM+h7Q2Mk=
X-Google-Smtp-Source: AGHT+IEFqB7EqZ9/qt6Tv+l9s3WePIJJrBkQGmuE+wise2peEn4wuYWmsni9+gmk+GDjL44CfjLWRg==
X-Received: by 2002:a17:907:948d:b0:a9a:597:8cc9 with SMTP id a640c23a62f3a-a9ed50cb67dmr4422366b.12.1730915465830;
        Wed, 06 Nov 2024 09:51:05 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16d4d6bsm309041166b.44.2024.11.06.09.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 09:51:05 -0800 (PST)
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
Subject: [PATCH 1/2] iommu/riscv: Free irq vectors on pci remove
Date: Wed,  6 Nov 2024 18:51:04 +0100
Message-ID: <20241106175102.219923-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106175102.219923-4-ajones@ventanamicro.com>
References: <20241106175102.219923-4-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_095108_014681_D6EF3D9D 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

riscv_iommu_pci_probe() calls pci_alloc_irq_vectors() which
states pci_free_irq_vectors() must be called on cleanup.

Fixes: 68682e9578fb ("iommu/riscv: Add RISC-V IOMMU PCIe device driver")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/riscv/iommu-pci.c b/drivers/iommu/riscv/iommu-pci.c
index c7a89143014c..25a27e627a0e 100644
--- a/drivers/iommu/riscv/iommu-pci.c
+++ b/drivers/iommu/riscv/iommu-pci.c
@@ -99,6 +99,7 @@ static void riscv_iommu_pci_remove(struct pci_dev *pdev)
 	struct riscv_iommu_device *iommu = dev_get_drvdata(&pdev->dev);
 
 	riscv_iommu_remove(iommu);
+	pci_free_irq_vectors(pdev);
 }
 
 static const struct pci_device_id riscv_iommu_pci_tbl[] = {
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
