Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4072C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjbRWyX36ZXUWctMGR5Jj11fPowKheKY/GPdG4BBOc0=; b=1wzqMgIWl18+wU
	iC6Xk9IpWFukRUO2NTtjY9uVDMkiW9UyF4pdUIh6kdcccIARhEvE5RUopHrzVEjHpd3Y6KHtuwf5c
	sQZihXtoetwp4RBKwENDrvBtmsf3/JyvnDIFCRltXNNy7aO4F1OyV7jRtQgpAISTqRzWHyuj7tmP9
	Pg8lcQJUzHZKrvEEqAvTF/bh/Pdcnxw2uGlWSIHZiGeiUEotPi8Vro2VNiMObRUCsD5CmNujVEqjm
	QWui3LyOWQ7IW/10Qli7qSmDbrM/wCux8VR82veHLdchgVVG2oM3TcZNTjsFDAQsKChd1gOVZ5/Q7
	m4qA9VN6DPTfemlseqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYFr-00FHHb-1i;
	Fri, 08 Dec 2023 10:38:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYFo-00FHGB-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 10:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1702031924; x=1733567924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2EQm1WbcHBB0qSzV6W9atlXp3QWQx/LQ8hNLQCOVPww=;
  b=Chx0TXiralSysK2ufVnIkDnm3a8IcJHrDwNaWmvog1U2OArhn7N43Ajb
   6nlOK329PcJ878Afht075Ci8vC004cMD6pUDZDsEs9oLETNej0pC6gSAb
   Yuzc19ckUO8FqSThKpsMAtbUF1hJf7/YUTf9S9DWngTvyzqXhMfB2upzS
   WmTsVJVNOHruW9ea2WveqLeMPGLMtXod23WOKZzUrrLAI8+pa71XCT1ls
   ovuZNfkDEbPEGTjkJmuu1pNBUbSpkWe3fq2ZL5+N6MlfMUDcyL61Nofrl
   +Gn+kOp/uCFvsBs9fGvrqJ2tWvZe/vTC/vatL1Zw7bghurPZMlLbqh8mt
   g==;
X-CSE-ConnectionGUID: Cvz3gSbpStiroKFn2Lwqew==
X-CSE-MsgGUID: TlwQAlMGSYWg/x1j129+hg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="13864089"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Dec 2023 03:38:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 03:38:04 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 03:37:59 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
Subject: [PATCH v5 3/4] dmaengine: sf-pdma: add mpfs-pdma compatible name
Date: Fri, 8 Dec 2023 16:08:55 +0530
Message-ID: <20231208103856.3732998-4-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208103856.3732998-1-shravan.chippa@microchip.com>
References: <20231208103856.3732998-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_023844_535886_F135071C 
X-CRM114-Status: GOOD (  15.50  )
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

Sifive platform dma (sf-pdma) has both in-order and out-of-order
configurations but sf-pdam driver configured to do in-order DMA
transfers, with out-of-order configuration got better throughput
in the PolarFire SoC platform.

Add a PolarFire SoC specific compatible and code to support
for out-of-order dma transfers

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 27 ++++++++++++++++++++++++---
 drivers/dma/sf-pdma/sf-pdma.h |  8 +++++++-
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 6109e1c5a09e..428473611115 100644
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
@@ -493,6 +495,7 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
 
 static int sf_pdma_probe(struct platform_device *pdev)
 {
+	const struct sf_pdma_driver_platdata *ddata;
 	struct sf_pdma *pdma;
 	int ret, n_chans;
 	const enum dma_slave_buswidth widths =
@@ -518,6 +521,14 @@ static int sf_pdma_probe(struct platform_device *pdev)
 
 	pdma->n_chans = n_chans;
 
+	pdma->transfer_type = PDMA_FULL_SPEED | PDMA_STRICT_ORDERING;
+
+	ddata  = device_get_match_data(&pdev->dev);
+	if (ddata) {
+		if (ddata->quirks & PDMA_QUIRK_NO_STRICT_ORDERING)
+			pdma->transfer_type &= ~PDMA_STRICT_ORDERING;
+	}
+
 	pdma->membase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pdma->membase))
 		return PTR_ERR(pdma->membase);
@@ -603,9 +614,19 @@ static void sf_pdma_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&pdma->dma_dev);
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
index d05772b5d8d3..215e07183d7e 100644
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
 	struct sf_pdma_chan	chans[] __counted_by(n_chans);
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
