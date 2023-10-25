Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF46C25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 10:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULIxGlW/6eLCd759Mr5MUP34q3hKiG8r8HwfCHnKhJ0=; b=xmA1UBkgCbbgMI
	6iVtkjuLGppferNhVPqMgNlkJaI0cpXukcXp/GUmmuVcHS6+2G0NUlnMDp5TaLAl+m6KMcQcMBBHU
	K4YwPtTcaiXINSIeRCHKsnj8Lvx6crnpOc87+W3xnp5ExpwkgxbbP5F/D80spGy8XpwN6/SQKEfsi
	TrC0ZirM44OY7eJwgT/BA9knJM4vp0QTxzUl3838Ylrwvoye2z7PDb50xk1xxNL1C2VdSg//iO7dF
	c7eHNmGz3tz0y8duKyxvuH4NaYDilYQ+PF1SlCyzByYRWC27XNBGHwuZuYcMZTmgWnO1ex76Hpxi/
	Nvq503rarzhRUQr5olWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvb25-00BzW6-0R;
	Wed, 25 Oct 2023 10:22:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvb20-00BzPa-2D
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 10:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1698229353; x=1729765353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rYuw1o7okKebBJNCnZT/Iov2A07t5OeBvEwPkDvAo7w=;
  b=O+iwABdfXCWrnncCvthLdq6s/uJLhLgLixvwp9fZleUKc4YYd9Hi47dS
   j0NmQZuhnJvD1tpyftLsYlvhK/Kti9Hw4Rayj5U2P2+3iwlZO94s+EL/9
   vU7Ld99ALXRQsz2uiJQZWUjnzW4DuuQPCL9nMCNAVIhkDEsmnSis39rpK
   T5u7Op7FKc8vG1OfuQyeY4UD2AmgTNnTfqVKiVwEOnuvNhEkXZN+eFJ5T
   E31szg63ST0Sh+YygdaoRPzCSDMP/8lxvw7CIJ7t+a3WWlprfnVpEBPOf
   hHLz5yD7qyoNVBY0+oEV0gwJ/JN5LfOnGyr5LEVs8q8bIRbkLD6d144vf
   Q==;
X-CSE-ConnectionGUID: hCRWSLnNROWYEPYDprosFg==
X-CSE-MsgGUID: FCcQ+OH0Sb2QnGb6dXeiJQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="10660976"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Oct 2023 03:22:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 25 Oct 2023 03:22:06 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 25 Oct 2023 03:22:01 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH v3 3/4] dmaengine: sf-pdma: add mpfs-pdma compatible name
Date: Wed, 25 Oct 2023 15:52:50 +0530
Message-ID: <20231025102251.3369472-4-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025102251.3369472-1-shravan.chippa@microchip.com>
References: <20231025102251.3369472-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_032232_736540_BC1863F1 
X-CRM114-Status: GOOD (  16.82  )
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

From: Shravan Chippa <shravan.chippa@microchip.com>

Sifive platform dma does not allow out-of-order transfers,
Add a PolarFire SoC specific compatible and code to support
for out-of-order dma transfers

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 27 ++++++++++++++++++++++++---
 drivers/dma/sf-pdma/sf-pdma.h |  8 +++++++-
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 4c456bdef882..9cc4beec40f0 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -25,6 +25,8 @@
 
 #include "sf-pdma.h"
 
+#define PDMA_QUIRK_NO_STRICT_ORDERING   BIT(0)
+
 #ifndef readq
 static inline unsigned long long readq(void __iomem *addr)
 {
@@ -66,7 +68,7 @@ static struct sf_pdma_desc *sf_pdma_alloc_desc(struct sf_pdma_chan *chan)
 static void sf_pdma_fill_desc(struct sf_pdma_desc *desc,
 			      u64 dst, u64 src, u64 size)
 {
-	desc->xfer_type = PDMA_FULL_SPEED;
+	desc->xfer_type =  desc->chan->pdma->transfer_type;
 	desc->xfer_size = size;
 	desc->dst_addr = dst;
 	desc->src_addr = src;
@@ -520,6 +522,7 @@ static struct dma_chan *sf_pdma_of_xlate(struct of_phandle_args *dma_spec,
 
 static int sf_pdma_probe(struct platform_device *pdev)
 {
+	const struct sf_pdma_driver_platdata *ddata;
 	struct sf_pdma *pdma;
 	int ret, n_chans;
 	const enum dma_slave_buswidth widths =
@@ -545,6 +548,14 @@ static int sf_pdma_probe(struct platform_device *pdev)
 
 	pdma->n_chans = n_chans;
 
+	pdma->transfer_type = PDMA_FULL_SPEED | PDMA_STRICT_ORDERING;
+
+	ddata  = device_get_match_data(&pdev->dev);
+	if (ddata) {
+		if (ddata->quirks & PDMA_QUIRK_NO_STRICT_ORDERING)
+			pdma->transfer_type &= ~(PDMA_STRICT_ORDERING) ;
+	}
+
 	pdma->membase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pdma->membase))
 		return PTR_ERR(pdma->membase);
@@ -632,9 +643,19 @@ static int sf_pdma_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sf_pdma_driver_platdata mpfs_pdma = {
+	.quirks = PDMA_QUIRK_NO_STRICT_ORDERING,
+};
+
 static const struct of_device_id sf_pdma_dt_ids[] = {
-	{ .compatible = "sifive,fu540-c000-pdma" },
-	{ .compatible = "sifive,pdma0" },
+	{
+		.compatible = "sifive,fu540-c000-pdma",
+	}, {
+		.compatible = "sifive,pdma0",
+	}, {
+		.compatible = "microchip,mpfs-pdma",
+		.data	    = &mpfs_pdma,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sf_pdma_dt_ids);
diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
index 5c398a83b491..267e79a5e0a5 100644
--- a/drivers/dma/sf-pdma/sf-pdma.h
+++ b/drivers/dma/sf-pdma/sf-pdma.h
@@ -48,7 +48,8 @@
 #define PDMA_ERR_STATUS_MASK				GENMASK(31, 31)
 
 /* Transfer Type */
-#define PDMA_FULL_SPEED					0xFF000008
+#define PDMA_FULL_SPEED					0xFF000000
+#define PDMA_STRICT_ORDERING				BIT(3)
 
 /* Error Recovery */
 #define MAX_RETRY					1
@@ -112,8 +113,13 @@ struct sf_pdma {
 	struct dma_device       dma_dev;
 	void __iomem            *membase;
 	void __iomem            *mappedbase;
+	u32			transfer_type;
 	u32			n_chans;
 	struct sf_pdma_chan	chans[];
 };
 
+struct sf_pdma_driver_platdata {
+	u32 quirks;
+};
+
 #endif /* _SF_PDMA_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
