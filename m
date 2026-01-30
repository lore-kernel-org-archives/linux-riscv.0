Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B28D61037
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 06:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lj6ZNsPhN8RBu2DHQ97aktY3pNxdcQCSV0eQcMAf8r8=; b=KgwwADkSTtFq2X
	G61MUKSTDyRhjN7Y5EXxMUKabyHZ9rhhWwX/WhPh08nslpgz4oK2RBTK4mpnJOfwAbn5DD76CEGSk
	zJ1iOhgj5CngU1LYNdgmCnOwxdp6PMJqql2qocIdL2mMNE6bb04ZS7HvgZF4kYrzHsz0dXnVJ44rJ
	o842xD15hgjVxOK6dlR0wIWN3NpX3toaUz4tFGUcYO+KodOFvPRuzSxgA5wpOOhjGB98kzXRlyqI4
	xbo1+dgc1yVNSu9JJuEqpBtA5/E75U288v3aUHFsyCaFXYwfaDdCZ4+6zPQpkhBDUfF7cVyEEO5Y0
	onYm9MkMp8DNh+HcfCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliPQ-000000016z4-2dy5;
	Fri, 30 Jan 2026 06:55:12 +0000
Received: from out28-123.mail.aliyun.com ([115.124.28.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliPN-000000016yH-0q3N
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 06:55:11 +0000
Received: from guoyaxing.localdomain(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.gK.y6dm_1769756062 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 30 Jan 2026 14:54:48 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: tjeznach@rivosinc.com
Cc: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaxing Guo <guoyaxing@bosc.ac.cn>
Subject: [PATCH v1] iommu/riscv: Skip IRQ count check when using MSI interrupts
Date: Fri, 30 Jan 2026 14:54:20 +0800
Message-Id: <20260130065420.16811-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_225509_473528_DF52300F 
X-CRM114-Status: GOOD (  11.57  )
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

In RISC-V IOMMU platform devices that use MSI interrupts (indicated by the
presence of 'msi-parent' in the device tree), there are no wired interrupt
lines, so calling platform_get_irq_count() returns 0 or -ENXIO, causing the
driver to fail during probe.

However, MSI interrupts are allocated dynamically via the MSI subsystem and
do not appear in the device tree 'interrupts' property. Therefore, the
driver should not require a non-zero IRQ count when 'msi-parent' is present.

This patch fixes the bug where probe fails when using MSI interrupts
 (which do not have an 'interrupts' property in the device tree)..

Fixes: <d5f88acdd6ff> ("iommu/riscv: Add support for platform msi")

Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
---
 drivers/iommu/riscv/iommu-platform.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index 83a28c83f991..8f15b06e8499 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -68,12 +68,7 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	iommu->caps = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_CAPABILITIES);
 	iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
 
-	iommu->irqs_count = platform_irq_count(pdev);
-	if (iommu->irqs_count <= 0)
-		return dev_err_probe(dev, -ENODEV,
-				     "no IRQ resources provided\n");
-	if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
-		iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
+	iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
 
 	igs = FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps);
 	switch (igs) {
@@ -120,6 +115,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 		fallthrough;
 
 	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
+		iommu->irqs_count = platform_irq_count(pdev);
+		if (iommu->irqs_count <= 0)
+			return dev_err_probe(dev, -ENODEV,
+					     "no IRQ resources provided\n");
+		if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
+			iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
+
 		for (vec = 0; vec < iommu->irqs_count; vec++)
 			iommu->irqs[vec] = platform_get_irq(pdev, vec);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
