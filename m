Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D9FC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yoj4ZehTQzEErJelr7Dp0k6VwFDDqajkzLJg39IxK8w=; b=isH0oZVoIeZrLF
	yDY4xiLNYOyJy7UuITi2NXXY5gZdY/AYBgWhrg4Kcfqp0rAw+5+zgwYU8ldWjXWuFitovm0fQbquv
	IxXZ9fv7uXRDbrpAYreb61Y83DjY2RJpYs8XPmeCHAxKz/EOAxHx73T2/xu0ZN1HBXmoCbM/nogEM
	OFW+TSkgt9mEilyIpw12tREw2yX/w25uoBeyyT8bGXSUYUXyifPtqJQJlaz8WpMq1kuZtiE9/ICEm
	H53nl/G5+yqypi+G/lLS1gVM/xjlM7OKXL6R8bYQDMSsRr14waKKmUMemKzjUjUqA/rsZHqPmlPEX
	DS69IagZhFsEwmSB8yDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZD2F-00Dewj-OH; Mon, 06 Mar 2023 15:45:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZD29-00DevR-Ge
	for linux-riscv@bombadil.infradead.org; Mon, 06 Mar 2023 15:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VfJD5cYbiueaU/ESG7weKnCHlcWu6uFLK86Mc0K8yJI=; b=DyuoU0KZEnUwmUtYmgi7sts+nv
	ZYB6Gn8bqx+KP11nc6mKqZXA1KGKvCrxQhxi830pmnw+0miSpAuJRPErNU2npWWLqkmMaNOXbALtg
	RxRTrXyaPfYKVdtYOdwx/WCFAW4pJHbo3uOG9e9iXphtix4RqTRa/dwbUbNLfI3mHaQuXxPb3K2KE
	lhn/YFEAyJi47SN+yiENtnZg1UUnsLO44yRMvMMfkMrtlGDqBU74l81Cj+bKm5O70kY58u99mkC0u
	jI/25DppeIYerz0Xjupk8aLtID74qSRMp8Ql3bcAjQbPeAQK9PhurjYEnzo82v9riRL76JlB2bwGD
	Xg5VmlkA==;
Received: from ex01.ufhost.com ([61.152.239.75])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pZBTG-00GhBb-1X
	for linux-riscv@lists.infradead.org;
	Mon, 06 Mar 2023 14:05:49 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BF6A324DBC0;
	Mon,  6 Mar 2023 22:04:43 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 22:04:43 +0800
Received: from localhost.localdomain (183.27.97.46) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 22:04:43 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 2/3] dmaengine: dw-axi-dmac: Add support for StarFive JH7110 DMA
Date: Mon, 6 Mar 2023 22:04:29 +0800
Message-ID: <20230306140430.28951-3-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230306140430.28951-1-walker.chen@starfivetech.com>
References: <20230306140430.28951-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_140547_465325_66F96E13 
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

Add dma reset operation in device probe and use different configuration
on CH_CFG registers according to match data. Update all uses of
of_device_is_compatible with of_device_get_match_data.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 67 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  2 +
 2 files changed, 61 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index bf85aa0979ec..d1148f6fbcf9 100644
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
 
@@ -46,6 +48,12 @@
 	DMA_SLAVE_BUSWIDTH_32_BYTES	| \
 	DMA_SLAVE_BUSWIDTH_64_BYTES)
 
+struct axi_dma_chip_config {
+	int (*apb_setup)(struct platform_device *pdev, struct axi_dma_chip *chip);
+	int (*reset_init)(struct platform_device *pdev);
+	bool use_cfg2;
+};
+
 static inline void
 axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
 {
@@ -86,7 +94,8 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
 
 	cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
 		  config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
-	if (chan->chip->dw->hdata->reg_map_8_channels) {
+	if (chan->chip->dw->hdata->reg_map_8_channels &&
+	    !chan->chip->dw->hdata->use_cfg2) {
 		cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
 			 config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
 			 config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
@@ -1142,7 +1151,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	axi_chan_disable(chan);
 
 	ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
-					!(val & chan_active), 1000, 10000);
+					!(val & chan_active), 1000, DMAC_TIMEOUT_US);
 	if (ret == -ETIMEDOUT)
 		dev_warn(dchan2dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
@@ -1367,13 +1376,33 @@ static int parse_device_properties(struct axi_dma_chip *chip)
 	return 0;
 }
 
+static int intel_apb_setup(struct platform_device *pdev, struct axi_dma_chip *chip)
+{
+	chip->apb_regs = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(chip->apb_regs))
+		return PTR_ERR(chip->apb_regs);
+	else
+		return 0;
+}
+
+static int jh7110_reset_init(struct platform_device *pdev)
+{
+	struct reset_control *resets;
+
+	resets = devm_reset_control_array_get_exclusive(&pdev->dev);
+	if (IS_ERR(resets))
+		return PTR_ERR(resets);
+
+	return reset_control_deassert(resets);
+}
+
 static int dw_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
 	struct axi_dma_chip *chip;
 	struct resource *mem;
 	struct dw_axi_dma *dw;
 	struct dw_axi_dma_hcfg *hdata;
+	const struct axi_dma_chip_config *ccfg;
 	u32 i;
 	int ret;
 
@@ -1402,10 +1431,21 @@ static int dw_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->regs))
 		return PTR_ERR(chip->regs);
 
-	if (of_device_is_compatible(node, "intel,kmb-axi-dma")) {
-		chip->apb_regs = devm_platform_ioremap_resource(pdev, 1);
-		if (IS_ERR(chip->apb_regs))
-			return PTR_ERR(chip->apb_regs);
+	ccfg = of_device_get_match_data(&pdev->dev);
+	if (ccfg) {
+		if (ccfg->apb_setup) {
+			ret = ccfg->apb_setup(pdev, chip);
+			if (ret)
+				return ret;
+		}
+
+		if (ccfg->reset_init) {
+			ret = ccfg->reset_init(pdev);
+			if (ret)
+				return ret;
+		}
+
+		chip->dw->hdata->use_cfg2 = ccfg->use_cfg2;
 	}
 
 	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
@@ -1557,9 +1597,20 @@ static const struct dev_pm_ops dw_axi_dma_pm_ops = {
 	SET_RUNTIME_PM_OPS(axi_dma_runtime_suspend, axi_dma_runtime_resume, NULL)
 };
 
+static const struct axi_dma_chip_config intel_chip_config = {
+	.apb_setup = intel_apb_setup,
+	.use_cfg2 = false,
+};
+
+static const struct axi_dma_chip_config jh7110_chip_config = {
+	.reset_init = jh7110_reset_init,
+	.use_cfg2 = true,
+};
+
 static const struct of_device_id dw_dma_of_id_table[] = {
 	{ .compatible = "snps,axi-dma-1.01a" },
-	{ .compatible = "intel,kmb-axi-dma" },
+	{ .compatible = "intel,kmb-axi-dma", .data = &intel_chip_config },
+	{ .compatible = "starfive,jh7110-axi-dma", .data = &jh7110_chip_config },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index e9d5eb0fd594..b906d5884efe 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -21,6 +21,7 @@
 #define DMAC_MAX_CHANNELS	16
 #define DMAC_MAX_MASTERS	2
 #define DMAC_MAX_BLK_SIZE	0x200000
+#define DMAC_TIMEOUT_US		200000
 
 struct dw_axi_dma_hcfg {
 	u32	nr_channels;
@@ -33,6 +34,7 @@ struct dw_axi_dma_hcfg {
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
