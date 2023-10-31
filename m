Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2296C4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 05:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yt24VchO9NwYVG7edk3leoJ4Zh67UsY8xDsYZjxloK4=; b=UYZDy5zMXEnV81
	bxqs9CvQe7TlMOQtd+1yU5iiOGuV0xRu9rIIsIVF6MYIQccihXubVmB4fzhE1XipKDx/3S5XaW5W0
	nqqCr8OW9BZHTB5NpDg9+Pklw6LfuYdmkwX9jqX9MBNVDQCvQje2xW3BrFf6KBpmhP06uDIwbLLGt
	XV6x9ff4HjLUq1ZY1owjhxeXzX9PFtATktMCAhBUc5e07mlid20miS+VUizQg3BrB+i1+EALp/D3N
	YlrHqQjJpD0Ec/Y+QOzz6vinzMCt6qORNEF9BNgRWdX0pJpEYzjQESARQgG9iIji/RMEHr8yT8Edv
	UcsUd4eqWWbcKiJbIkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxhI0-004ZFx-0i;
	Tue, 31 Oct 2023 05:27:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxhHv-004ZEd-2G
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 05:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1698730059; x=1730266059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vJhEbYubpVGf21vpeHAIwxdulF7QvT8fhZVat8R+Pg0=;
  b=M47Ogeoh8+26N41NuKmsIKXypqB8tWx/xse1AUJBbZmc6nLIpVZ84D0u
   hgTS1WMeZGVHZzVL06F9kDBKtDZtGzlR55yPLFKP75jKdqN5cgrHgTUVz
   W8EVL9enQdXjlAUXCqKnSgI7KK8csMPzdY2mAzrqeJCrAjI/nBdqNs8bd
   OLiJhxZTsYGppWGyZF4psI0WtY8GAV0pKuueKeUE2wOw0xSctKqRPbiSp
   1mNLC43sWRMOnuiXM/TQdE7iSbvhS/KQuXDhmZgGncu/5/F4rf6z/++ya
   WuaqSUOeIn5tV+8AUuY+Pep5oThdss1jcQ3DXo4p1LVJTL8x0r0yRR+Kw
   A==;
X-CSE-ConnectionGUID: r/YQwnBYQ0ihAZZkayWq2A==
X-CSE-MsgGUID: wnCkYct9QTSxlNM17VuO5Q==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="11147693"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Oct 2023 22:27:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 30 Oct 2023 22:27:03 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 30 Oct 2023 22:26:58 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
Subject: [PATCH v4 3/4] dmaengine: sf-pdma: add mpfs-pdma compatible name
Date: Tue, 31 Oct 2023 10:57:52 +0530
Message-ID: <20231031052753.3430169-4-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031052753.3430169-1-shravan.chippa@microchip.com>
References: <20231031052753.3430169-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_222739_807262_37F54E47 
X-CRM114-Status: GOOD (  15.63  )
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

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 27 ++++++++++++++++++++++++---
 drivers/dma/sf-pdma/sf-pdma.h |  8 +++++++-
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 4c456bdef882..82ab12c40743 100644
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
+			pdma->transfer_type &= ~PDMA_STRICT_ORDERING;
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
