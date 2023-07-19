Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47CAEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 09:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJb7Lxx3chVWr5syxQ2rzLstG4AveIn4XQG5J0VDw5s=; b=21ZM1ZAtwWadts
	HqBmG3aBFX28N5jtfGWTLgAr7GdxTqgbQ0idblpFYgeebEmcVj3cJI13VTS2ujz1Yee4jfDQHgxIF
	8SNQqSYYV4Vpv8bXZiF4Uru14R4yaOkRbuBxEpZOF4qJMK5aeiqS4yPzM3gt0tfYTQwHmlfC1KIVm
	Hc34+C1ony1oar4KjfL9SUCVRIYZctLWuIO/rxX55KoMEIpa+/pslVVAU1rQkZ4IkTUCnkvMPxoHB
	WOB+9qnQYWdp+xCWEwrXdjgZ+N6y1eKadh3O5SHkL4vYKzLYQMunC30j3EzoAfk0ZBjTVaKc1tcms
	VpgivsV+Tzcy2q/9z9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3Rv-006XZP-1M;
	Wed, 19 Jul 2023 09:26:23 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3Rp-006XVN-2l
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 09:26:20 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D094F7FE2;
	Wed, 19 Jul 2023 17:25:47 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Jul
 2023 17:25:47 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 19 Jul 2023 17:25:47 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v5 2/3] spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
Date: Wed, 19 Jul 2023 17:25:44 +0800
Message-ID: <20230719092545.1961401-3-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719092545.1961401-1-william.qiu@starfivetech.com>
References: <20230719092545.1961401-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_022618_269664_7A2899AA 
X-CRM114-Status: GOOD (  18.28  )
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

Add JH7110's clock initialization code to the driver.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306022017.UbwjjWRN-lkp@intel.com/
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202306040644.6ZHs55x4-lkp@intel.com/
---
 drivers/spi/spi-cadence-quadspi.c | 67 +++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index abf10f92415d..16985e1fe610 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -47,6 +47,12 @@
 
 #define CQSPI_OP_WIDTH(part) ((part).nbytes ? ilog2((part).buswidth) : 0)
 
+enum {
+	CLK_QSPI_APB = 0,
+	CLK_QSPI_AHB,
+	CLK_QSPI_NUM,
+};
+
 struct cqspi_st;
 
 struct cqspi_flash_pdata {
@@ -64,6 +70,7 @@ struct cqspi_st {
 	struct platform_device	*pdev;
 	struct spi_master	*master;
 	struct clk		*clk;
+	struct clk		*clks[CLK_QSPI_NUM];
 	unsigned int		sclk;
 
 	void __iomem		*iobase;
@@ -92,6 +99,8 @@ struct cqspi_st {
 	bool			wr_completion;
 	bool			slow_sram;
 	bool			apb_ahb_hazard;
+
+	bool			is_jh7110; /* Flag for StarFive JH7110 SoC */
 };
 
 struct cqspi_driver_platdata {
@@ -100,6 +109,8 @@ struct cqspi_driver_platdata {
 	int (*indirect_read_dma)(struct cqspi_flash_pdata *f_pdata,
 				 u_char *rxbuf, loff_t from_addr, size_t n_rx);
 	u32 (*get_dma_status)(struct cqspi_st *cqspi);
+	int (*jh7110_clk_init)(struct platform_device *pdev,
+			       struct cqspi_st *cqspi);
 };
 
 /* Operation timeout value */
@@ -1630,6 +1641,51 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi)
 	return 0;
 }
 
+static int cqspi_jh7110_clk_init(struct platform_device *pdev, struct cqspi_st *cqspi)
+{
+	static struct clk_bulk_data qspiclk[] = {
+		{ .id = "apb" },
+		{ .id = "ahb" },
+	};
+
+	int ret = 0;
+
+	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(qspiclk), qspiclk);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: failed to get qspi clocks\n", __func__);
+		return ret;
+	}
+
+	cqspi->clks[CLK_QSPI_APB] = qspiclk[0].clk;
+	cqspi->clks[CLK_QSPI_AHB] = qspiclk[1].clk;
+
+	ret = clk_prepare_enable(cqspi->clks[CLK_QSPI_APB]);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: failed to enable CLK_QSPI_APB\n", __func__);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(cqspi->clks[CLK_QSPI_AHB]);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: failed to enable CLK_QSPI_AHB\n", __func__);
+		goto disable_apb_clk;
+	}
+
+	cqspi->is_jh7110 = true;
+
+	return 0;
+
+disable_apb_clk:
+	clk_disable_unprepare(cqspi->clks[CLK_QSPI_APB]);
+
+	return ret;
+}
+
+static void cqspi_jh7110_disable_clk(struct platform_device *pdev, struct cqspi_st *cqspi)
+{
+	clk_disable_unprepare(cqspi->clks[CLK_QSPI_AHB]);
+	clk_disable_unprepare(cqspi->clks[CLK_QSPI_APB]);
+}
 static int cqspi_probe(struct platform_device *pdev)
 {
 	const struct cqspi_driver_platdata *ddata;
@@ -1655,6 +1711,7 @@ static int cqspi_probe(struct platform_device *pdev)
 
 	cqspi->pdev = pdev;
 	cqspi->master = master;
+	cqspi->is_jh7110 = false;
 	platform_set_drvdata(pdev, cqspi);
 
 	/* Obtain configuration from OF. */
@@ -1766,6 +1823,12 @@ static int cqspi_probe(struct platform_device *pdev)
 		if (ddata->quirks & CQSPI_NEEDS_APB_AHB_HAZARD_WAR)
 			cqspi->apb_ahb_hazard = true;
 
+		if (ddata->jh7110_clk_init) {
+			ret = cqspi_jh7110_clk_init(pdev, cqspi);
+			if (ret)
+				goto probe_clk_failed;
+		}
+
 		if (of_device_is_compatible(pdev->dev.of_node,
 					    "xlnx,versal-ospi-1.0")) {
 			ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
@@ -1830,6 +1893,9 @@ static void cqspi_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(cqspi->clk);
 
+	if (cqspi->is_jh7110)
+		cqspi_jh7110_disable_clk(pdev, cqspi);
+
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
@@ -1897,6 +1963,7 @@ static const struct cqspi_driver_platdata versal_ospi = {
 
 static const struct cqspi_driver_platdata jh7110_qspi = {
 	.quirks = CQSPI_DISABLE_DAC_MODE,
+	.jh7110_clk_init = cqspi_jh7110_clk_init,
 };
 
 static const struct cqspi_driver_platdata pensando_cdns_qspi = {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
