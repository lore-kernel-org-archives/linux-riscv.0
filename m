Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F14DC74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 04:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcR/Zk/i8evLfz7ToOk1mRBbALauvZd7WWs1mk0fjVE=; b=09xfHUZKv34xLX
	D2UY5A9t1ZEU7JA57V3/tXC9sMqwSJCANiGaYG1opTpUWvVSTONW2pXpBoguvjWWaz9MkQsfkTAPJ
	0sf4AauhGQngO8tkVPp8taxg+T7hAZctECcRA/CvHw6cMmihwnlyzJN/xXKaF5F5pADLXY4vvdvB+
	pAcaaBo1p6w/m11a736b8LB3+N9/S+hIE0924y8jt4iB80GlCg05RDJuT45uZEOGOY9mF91roXnvU
	XBSw/uAIkGePU1XxtBaZszpJFjMPSqcPN71jvZPS7Ig8ffJMhk8zhrGkyCKACZy4CMmKCU+cpqh83
	pVQjyAddz6QY9L2On9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcfNQ-00FCKd-0f;
	Thu, 16 Mar 2023 04:38:08 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcfNN-00FC71-1j
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 04:38:07 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3C15024E21E;
	Thu, 16 Mar 2023 12:37:20 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 12:37:20 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX162.cuchost.com (172.16.6.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 16 Mar 2023 12:37:19 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>, Samin Guo
	<samin.guo@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v7 5/6] net: stmmac: Add glue layer for StarFive JH7110 SoC
Date: Thu, 16 Mar 2023 12:37:13 +0800
Message-ID: <20230316043714.24279-6-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230316043714.24279-1-samin.guo@starfivetech.com>
References: <20230316043714.24279-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_213805_875475_BA37B9C4 
X-CRM114-Status: GOOD (  23.42  )
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

This adds StarFive dwmac driver support on the StarFive JH7110 SoC.

Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 121 ++++++++++++++++++
 4 files changed, 135 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f876983130ae..0d22beee1a97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19917,6 +19917,7 @@ STARFIVE DWMAC GLUE LAYER
 M:	Emil Renner Berthing <kernel@esmil.dk>
 M:	Samin Guo <samin.guo@starfivetech.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/dwmac-starfive.c
 F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 
 STARFIVE JH71X0 CLOCK DRIVERS
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index f77511fe4e87..5f5a997f21f3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -165,6 +165,18 @@ config DWMAC_SOCFPGA
 	  for the stmmac device driver. This driver is used for
 	  arria5 and cyclone5 FPGA SoCs.
 
+config DWMAC_STARFIVE
+	tristate "StarFive dwmac support"
+	depends on OF && (ARCH_STARFIVE || COMPILE_TEST)
+	select MFD_SYSCON
+	default m if ARCH_STARFIVE
+	help
+	  Support for ethernet controllers on StarFive RISC-V SoCs
+
+	  This selects the StarFive platform specific glue layer support for
+	  the stmmac device driver. This driver is used for StarFive JH7110
+	  ethernet controller.
+
 config DWMAC_STI
 	tristate "STi GMAC support"
 	default ARCH_STI
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 057e4bab5c08..8738fdbb4b2d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DWMAC_OXNAS)	+= dwmac-oxnas.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
+obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
 obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
new file mode 100644
index 000000000000..ef5a769b1c75
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * StarFive DWMAC platform driver
+ *
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ *
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+
+#include "stmmac_platform.h"
+
+struct starfive_dwmac {
+	struct device *dev;
+	struct clk *clk_tx;
+};
+
+static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed)
+{
+	struct starfive_dwmac *dwmac = priv;
+	unsigned long rate;
+	int err;
+
+	switch (speed) {
+	case SPEED_1000:
+		rate = 125000000;
+		break;
+	case SPEED_100:
+		rate = 25000000;
+		break;
+	case SPEED_10:
+		rate = 2500000;
+		break;
+	default:
+		dev_err(dwmac->dev, "invalid speed %u\n", speed);
+		break;
+	}
+
+	err = clk_set_rate(dwmac->clk_tx, rate);
+	if (err)
+		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
+}
+
+static int starfive_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct starfive_dwmac *dwmac;
+	struct clk *clk_gtx;
+	int err;
+
+	err = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (err)
+		return err;
+
+	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat)) {
+		dev_err(&pdev->dev, "dt configuration failed\n");
+		return PTR_ERR(plat_dat);
+	}
+
+	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
+	if (!dwmac)
+		return -ENOMEM;
+
+	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(dwmac->clk_tx))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
+				     "error getting tx clock\n");
+
+	clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
+	if (IS_ERR(clk_gtx))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk_gtx),
+				     "error getting gtx clock\n");
+
+	/* Generally, the rgmii_tx clock is provided by the internal clock,
+	 * which needs to match the corresponding clock frequency according
+	 * to different speeds. If the rgmii_tx clock is provided by the
+	 * external rgmii_rxin, there is no need to configure the clock
+	 * internally, because rgmii_rxin will be adaptively adjusted.
+	 */
+	if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
+		plat_dat->fix_mac_speed = starfive_dwmac_fix_mac_speed;
+
+	dwmac->dev = &pdev->dev;
+	plat_dat->bsp_priv = dwmac;
+	plat_dat->dma_cfg->dche = true;
+
+	err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	if (err) {
+		stmmac_remove_config_dt(pdev, plat_dat);
+		return err;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id starfive_dwmac_match[] = {
+	{ .compatible = "starfive,jh7110-dwmac"	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
+
+static struct platform_driver starfive_dwmac_driver = {
+	.probe  = starfive_dwmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name = "starfive-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = starfive_dwmac_match,
+	},
+};
+module_platform_driver(starfive_dwmac_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("StarFive DWMAC platform driver");
+MODULE_AUTHOR("Emil Renner Berthing <kernel@esmil.dk>");
+MODULE_AUTHOR("Samin Guo <samin.guo@starfivetech.com>");
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
