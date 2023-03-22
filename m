Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32676C761AF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVIxbuPpCEd3udSw5r2TyRa/0cn/MBGdydnYE1XdbMY=; b=jh8vAn3RLnq0mG
	borjZS1VdPYqf5hTcW19KT6rljmbKPqWEtIgadNrZZLBi9UI/011jbCB/1O3YiX1f3iJDiGUHj7KV
	ZvL4ah+Llv601Af+2IVtN6re8A3ShH5/+62sbbykwavhWmZ2L58s8Jm7SabKQjnRdVX/dX2FIdLEO
	Hp1i5ceC9131uLdXvpUEwmr66dQD4lMAaMAjgW9uggyyRv+eG3FsVQ1EHIsF1fe0m8+DN7+wI14N8
	hsFaXu+pqFzD9y5qMeCRzf10yZCYBhiYpvl7Cij6rvzUldldx8GOdbwLCHIU4l0D+lne7I5A5B2dv
	pWtVUaCv8Y9wG52HSmWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pev5e-00FWUw-0H;
	Wed, 22 Mar 2023 09:49:06 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pev5Y-00FWLc-0E
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 09:49:03 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6215624E31D;
	Wed, 22 Mar 2023 17:48:33 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Mar
 2023 17:48:33 +0800
Received: from localhost.localdomain (183.27.97.64) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Mar
 2023 17:48:32 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v6 2/4] dmaengine: dw-axi-dmac: Add support for StarFive JH7110 DMA
Date: Wed, 22 Mar 2023 17:48:18 +0800
Message-ID: <20230322094820.24738-3-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230322094820.24738-1-walker.chen@starfivetech.com>
References: <20230322094820.24738-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_024900_394554_CC9F5F1F 
X-CRM114-Status: GOOD (  20.27  )
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

Add DMA reset operation in device probe and use different configuration
on CH_CFG registers according to match data. Update all uses of
of_device_is_compatible with of_device_get_match_data.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 38 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 4169e1d7d5ca..6cfcb541d8c3 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -21,10 +21,12 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
@@ -46,6 +48,10 @@
 	DMA_SLAVE_BUSWIDTH_32_BYTES	| \
 	DMA_SLAVE_BUSWIDTH_64_BYTES)
 
+#define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
+#define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
+#define AXI_DMA_FLAG_USE_CFG2		BIT(2)
+
 static inline void
 axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
 {
@@ -86,7 +92,8 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
 
 	cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
 		  config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
-	if (chan->chip->dw->hdata->reg_map_8_channels) {
+	if (chan->chip->dw->hdata->reg_map_8_channels &&
+	    !chan->chip->dw->hdata->use_cfg2) {
 		cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
 			 config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
 			 config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
@@ -1367,10 +1374,11 @@ static int parse_device_properties(struct axi_dma_chip *chip)
 
 static int dw_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
 	struct axi_dma_chip *chip;
 	struct dw_axi_dma *dw;
 	struct dw_axi_dma_hcfg *hdata;
+	struct reset_control *resets;
+	unsigned int flags;
 	u32 i;
 	int ret;
 
@@ -1398,12 +1406,25 @@ static int dw_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->regs))
 		return PTR_ERR(chip->regs);
 
-	if (of_device_is_compatible(node, "intel,kmb-axi-dma")) {
+	flags = (uintptr_t)of_device_get_match_data(&pdev->dev);
+	if (flags & AXI_DMA_FLAG_HAS_APB_REGS) {
 		chip->apb_regs = devm_platform_ioremap_resource(pdev, 1);
 		if (IS_ERR(chip->apb_regs))
 			return PTR_ERR(chip->apb_regs);
 	}
 
+	if (flags & AXI_DMA_FLAG_HAS_RESETS) {
+		resets = devm_reset_control_array_get_exclusive(&pdev->dev);
+		if (IS_ERR(resets))
+			return PTR_ERR(resets);
+
+		ret = reset_control_deassert(resets);
+		if (ret)
+			return ret;
+	}
+
+	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
+
 	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
 	if (IS_ERR(chip->core_clk))
 		return PTR_ERR(chip->core_clk);
@@ -1554,8 +1575,15 @@ static const struct dev_pm_ops dw_axi_dma_pm_ops = {
 };
 
 static const struct of_device_id dw_dma_of_id_table[] = {
-	{ .compatible = "snps,axi-dma-1.01a" },
-	{ .compatible = "intel,kmb-axi-dma" },
+	{
+		.compatible = "snps,axi-dma-1.01a"
+	}, {
+		.compatible = "intel,kmb-axi-dma",
+		.data = (void *)AXI_DMA_FLAG_HAS_APB_REGS,
+	}, {
+		.compatible = "starfive,jh7110-axi-dma",
+		.data = (void *)(AXI_DMA_FLAG_HAS_RESETS | AXI_DMA_FLAG_USE_CFG2),
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index e9d5eb0fd594..eb267cb24f67 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -33,6 +33,7 @@ struct dw_axi_dma_hcfg {
 	/* Register map for DMAX_NUM_CHANNELS <= 8 */
 	bool	reg_map_8_channels;
 	bool	restrict_axi_burst_len;
+	bool	use_cfg2;
 };
 
 struct axi_dma_chan {
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
