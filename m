Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D06BC46CD4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 05:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmJZ61Xig7vQnCN1bdWJne8AGzZBh5Yfhq/oTnnp/VA=; b=hI9lB6xPjZyevl
	eFukZnM2dD9BiWwGP6ep7Lbg4T4Ai51hBHQTAXRmSjUdS9CRl4gj4PCc3+KuW+MTcrA7dS0Z9ULmL
	eXr/koJqUP03HdcdSSAWZUc3/wQ8M3F9xXJxIyAwXMIn4/Qb/7GeC4VCa45aNtQ6Dkh7oOC0Kx3Wp
	AHdhvu81/8RM6b3oeVNzl2JIGwrlT0KcOzjwIrDd2zCYnbZVbd98TvHBa9dw88XQXz8vfp0aONUSd
	dOPTRzL501OOF25s1JSBECY5IEnHxsgIAm/C6t5/cXCViq0vFr84mZDFn0T/OX7oMk259yWodLVyF
	npTvDNW5qOJs8tzaDx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rI0BM-00BjRp-0b;
	Tue, 26 Dec 2023 05:40:48 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rI0BE-00BjMG-1d
	for linux-riscv@lists.infradead.org;
	Tue, 26 Dec 2023 05:40:43 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5D03D24E28F;
	Tue, 26 Dec 2023 13:40:35 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 26 Dec
 2023 13:40:35 +0800
Received: from jsia-virtual-machine.localdomain (202.188.176.82) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 26 Dec 2023 13:40:29 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <kernel@esmil.dk>, <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <p.zabel@pengutronix.de>,
	<emil.renner.berthing@canonical.com>, <hal.feng@starfivetech.com>,
	<xingyu.wu@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>
Subject: [RFC 14/16] clk: starfive: Add JH8100 Always-On clock generator driver
Date: Tue, 26 Dec 2023 13:38:46 +0800
Message-ID: <20231226053848.25089-15-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231226053848.25089-1-jeeheng.sia@starfivetech.com>
References: <20231226053848.25089-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_214041_048252_D7E19528 
X-CRM114-Status: GOOD (  19.28  )
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

Add support for JH8100 Always-On (AONCRG) clock generator.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |   7 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jh8100-aon.c    | 256 ++++++++++++++++++
 3 files changed, 264 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jh8100-aon.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 23ae894fedb9..3b1fbc795879 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -102,3 +102,10 @@ config CLK_STARFIVE_JH8100_SW
 	default ARCH_STARFIVE
 	help
 	  Say yes here to support the South-West clock controller on the StarFive JH8100 SoC.
+
+config CLK_STARFIVE_JH8100_AON
+	bool "StarFive JH8100 Always-On clock support"
+	depends on CLK_STARFIVE_JH8100_SYS
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the Always-On clock controller on the StarFive JH8100 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 242e2e75dadb..e498f1761c2d 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS)	+= clk-starfive-jh8100-sys.o
 obj-$(CONFIG_CLK_STARFIVE_JH8100_NW)	+= clk-starfive-jh8100-nw.o
 obj-$(CONFIG_CLK_STARFIVE_JH8100_NE)	+= clk-starfive-jh8100-ne.o
 obj-$(CONFIG_CLK_STARFIVE_JH8100_SW)	+= clk-starfive-jh8100-sw.o
+obj-$(CONFIG_CLK_STARFIVE_JH8100_AON)	+= clk-starfive-jh8100-aon.o
diff --git a/drivers/clk/starfive/clk-starfive-jh8100-aon.c b/drivers/clk/starfive/clk-starfive-jh8100-aon.c
new file mode 100644
index 000000000000..ea547fbab6c7
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jh8100-aon.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JH8100 Always-On Clock Driver
+ *
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ *
+ * Author: Jee Heng Sia <jeeheng.sia@starfivetech.com>
+ *
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/starfive,jh8100-crg.h>
+
+#include "clk-starfive-jh8100.h"
+
+#define JH8100_AONCLK_NUM_CLKS		(JH8100_AONCLK_TOP_ICG_EN + 1)
+
+/* external clocks */
+#define JH8100_AONCLK_OSC		(JH8100_AONCLK_NUM_CLKS + 0)
+#define JH8100_AONCLK_GMAC0_RMII_FUNC	(JH8100_AONCLK_NUM_CLKS + 1)
+#define JH8100_AONCLK_AON_50		(JH8100_AONCLK_NUM_CLKS + 2)
+#define JH8100_AONCLK_GMAC0_RGMII_FUNC	(JH8100_AONCLK_NUM_CLKS + 3)
+#define JH8100_AONCLK_AON_125		(JH8100_AONCLK_NUM_CLKS + 4)
+#define JH8100_AONCLK_AON_2000		(JH8100_AONCLK_NUM_CLKS + 5)
+#define JH8100_AONCLK_AON_200		(JH8100_AONCLK_NUM_CLKS + 6)
+#define JH8100_AONCLK_AON_667		(JH8100_AONCLK_NUM_CLKS + 7)
+#define JH8100_AONCLK_RTC		(JH8100_AONCLK_NUM_CLKS + 8)
+
+static const struct starfive_clk_data jh8100_aoncrg_clk_data[] = {
+	/* source */
+	STARFIVE__MUX(JH8100_AONCLK_GMAC0_RMII_REFIN, "gmac0_rmii_refin", 2,
+		      JH8100_AONCLK_GMAC0_RMII_FUNC, JH8100_AONCLK_AON_50),
+	STARFIVE__MUX(JH8100_AONCLK_GMAC0_RGMII_RXIN, "gmac0_rgmii_rxin", 2,
+		      JH8100_AONCLK_GMAC0_RGMII_FUNC, JH8100_AONCLK_AON_125),
+	STARFIVE__DIV(JH8100_AONCLK_GMAC0_GTXCLK, "gmac0_gtxclk", 50, JH8100_AONCLK_AON_125),
+	STARFIVE__DIV(JH8100_AONCLK_AON_1000, "aon_1000", 2, JH8100_AONCLK_AON_2000),
+	STARFIVE__DIV(JH8100_AONCLK_AON_400, "aon_400", 5, JH8100_AONCLK_AON_2000),
+	STARFIVE__MUX(JH8100_AONCLK_AON_400_POSTOSC, "aon_400_postosc", 2,
+		      JH8100_AONCLK_OSC, JH8100_AONCLK_AON_400),
+	STARFIVE__DIV(JH8100_AONCLK_AON_500, "aon_500", 4, JH8100_AONCLK_AON_2000),
+	STARFIVE__MUX(JH8100_AONCLK_AON_500_POSTOSC, "aon_500_postosc", 2,
+		      JH8100_AONCLK_OSC, JH8100_AONCLK_AON_500),
+	STARFIVE__DIV(JH8100_AONCLK_XSPI_PHY, "xspi_phy", 4, JH8100_AONCLK_AON_200),
+	STARFIVE__DIV(JH8100_AONCLK_AON_100, "aon_100", 2, JH8100_AONCLK_AON_200),
+	STARFIVE__MUX(JH8100_AONCLK_AON_100_POSTOSC, "aon_100_postosc", 2,
+		      JH8100_AONCLK_OSC, JH8100_AONCLK_AON_100),
+	STARFIVE__MUX(JH8100_AONCLK_AON_50_POSTOSC, "aon_50_postosc", 2,
+		      JH8100_AONCLK_OSC, JH8100_AONCLK_AON_50),
+	STARFIVE_GATE(JH8100_AONCLK_DDR50_POSTOCC_ICG, "ddr50_postocc", CLK_IS_CRITICAL,
+		      JH8100_AONCLK_AON_50_POSTOSC),
+	STARFIVE_GATE(JH8100_AONCLK_DDR100_POSTOCC_ICG, "ddr100_postocc", CLK_IS_CRITICAL,
+		      JH8100_AONCLK_AON_100),
+	/* pufrt */
+	STARFIVE_GATE(JH8100_AONCLK_PUFRT_APB, "pufrt_apb", CLK_IS_CRITICAL,
+		      JH8100_AONCLK_OSC),
+	/* rtc hms */
+	STARFIVE_GATE(JH8100_AONCLK_RTC_HMS_APB, "rtc_hms_apb", 0, JH8100_AONCLK_OSC),
+	STARFIVE__DIV(JH8100_AONCLK_RTC_INTERNAL, "rtc_internal", 1020, JH8100_AONCLK_OSC),
+	STARFIVE__MUX(JH8100_AONCLK_RTC_HMS_OSC32K, "rtc_hms_osc32k", 2,
+		      JH8100_AONCLK_RTC, JH8100_AONCLK_RTC_INTERNAL),
+	STARFIVE_GATE(JH8100_AONCLK_RTC_HMS_CAL, "rtc_hms_cal", 0, JH8100_AONCLK_OSC),
+	/* gmac5_axi128 */
+	STARFIVE_GATE(JH8100_AONCLK_GMAC0_AXI128_AHB, "gmac0_axi128_ahb", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_200),
+	STARFIVE_GATE(JH8100_AONCLK_GMAC0_AXI128_MSTRCLK, "gmac0_axi128_mstrclk", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_667),
+	STARFIVE_GATE(JH8100_AONCLK_GMAC0_AXI128_AXI, "gmac0_axi128_axi", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_400_POSTOSC),
+	STARFIVE__DIV(JH8100_AONCLK_GMAC0_RMII_RTX, "gmac0_rmii_rtx", 30,
+		      JH8100_AONCLK_GMAC0_RMII_REFIN),
+	STARFIVE_GMUX(JH8100_AONCLK_GMAC0_AXI128_TX, "gmac0_axi128_tx", CLK_IGNORE_UNUSED, 2,
+		      JH8100_AONCLK_GMAC0_GTXCLK,
+		      JH8100_AONCLK_GMAC0_RMII_RTX),
+	STARFIVE_GINV(JH8100_AONCLK_GMAC0_AXI128_TX_INV, "gmac0_axi128_tx_inv", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_GMAC0_AXI128_TX),
+	STARFIVE__MUX(JH8100_AONCLK_GMAC0_AXI128_RX, "gmac0_axi128_rx", 2,
+		      JH8100_AONCLK_GMAC0_RGMII_RXIN, JH8100_AONCLK_GMAC0_RMII_RTX),
+	STARFIVE__INV(JH8100_AONCLK_GMAC0_AXI128_RX_INV, "gmac0_axi128_rx_inv",
+		      JH8100_AONCLK_GMAC0_AXI128_RX),
+	STARFIVE_GATE(JH8100_AONCLK_GMAC0_GTXC, "gmac0_gtxc", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_GMAC0_GTXCLK),
+	/* xspi */
+	STARFIVE_GATE(JH8100_AONCLK_XSPI_AXI, "xspi_axi", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_200),
+	STARFIVE_GATE(JH8100_AONCLK_XSPI_APB, "xspi_apb", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_OSC),
+	STARFIVE_GMUX(JH8100_AONCLK_XSPI_XSPI_PHY, "xspi_xspi_phy", CLK_IGNORE_UNUSED, 2,
+		      JH8100_AONCLK_OSC, JH8100_AONCLK_XSPI_PHY),
+	/* tvsensor */
+	STARFIVE_GATE(JH8100_AONCLK_TVSENSOR_PCLK, "tvsensor_pclk", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_OSC),
+	STARFIVE_GATE(JH8100_AONCLK_TVSENSOR_TSADC, "tvsensor_tsadc", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_OSC),
+	STARFIVE_GDIV(JH8100_AONCLK_TVSENSOR_BG, "tvsensor_bg", CLK_IGNORE_UNUSED, 3,
+		      JH8100_AONCLK_OSC),
+	/* meu */
+	STARFIVE_GATE(JH8100_AONCLK_MEU_PCLK_AP, "meu_pclk_ap", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_OSC),
+	STARFIVE_GATE(JH8100_AONCLK_MEU_PCLK_SCP, "meu_pclk_scp", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_OSC),
+	STARFIVE_GATE(JH8100_AONCLK_MEU_MEM_AXI, "meu_mem_axi", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_200),
+	/* aximem_128b */
+	STARFIVE_GATE(JH8100_AONCLK_AXIMEM_128B_ACLK, "aximem_128b_aclk", CLK_IS_CRITICAL,
+		      JH8100_AONCLK_AON_200),
+	/* apb2bisr */
+	STARFIVE_GATE(JH8100_AONCLK_APB2BISR_APB, "apb2bisr_apb", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_OSC),
+	STARFIVE_GATE(JH8100_AONCLK_APB2BISR_BISR, "apb2bisr_bisr", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_OSC),
+	/* emmc */
+	STARFIVE_GATE(JH8100_AONCLK_EMMC_S_PCLK, "emmc_s_pclk", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_50_POSTOSC),
+	STARFIVE_GATE(JH8100_AONCLK_EMMC_MSTRCLK, "emmc_mstrclk", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_667),
+	STARFIVE_GATE(JH8100_AONCLK_EMMC, "emmc", CLK_IGNORE_UNUSED, JH8100_AONCLK_AON_200),
+	STARFIVE_GATE(JH8100_AONCLK_EMMC_SDMCLK, "emmc_sdmclk", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_200),
+	STARFIVE_GATE(JH8100_AONCLK_EMMC_SDPHY_PCLK, "emmc_sdphy_pclk", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_50_POSTOSC),
+	/* sdio */
+	STARFIVE_GATE(JH8100_AONCLK_SDIO0_PCLK, "sdio0_pclk", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_50_POSTOSC),
+	STARFIVE_GATE(JH8100_AONCLK_SDIO0_MSTRCLK, "sdio0_mstrclk", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_667),
+	STARFIVE_GATE(JH8100_AONCLK_SDIO0, "sdio0", CLK_IGNORE_UNUSED, JH8100_AONCLK_AON_200),
+	STARFIVE_GATE(JH8100_AONCLK_SDIO0_SDMCLK, "sdio0_sdmclk", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_200),
+	STARFIVE_GATE(JH8100_AONCLK_SDIO0_SDPHY_PCLK, "sdio0_sdphy_pclk", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_50_POSTOSC),
+	/* top */
+	STARFIVE_GATE(JH8100_AONCLK_HCLK, "hclk", CLK_IS_CRITICAL, JH8100_AONCLK_AON_200),
+	STARFIVE_GATE(JH8100_AONCLK_ACLK, "aclk", CLK_IS_CRITICAL, JH8100_AONCLK_AON_500_POSTOSC),
+	STARFIVE_GATE(JH8100_AONCLK_PERF_MSTRCLK, "perf_mstrclk", CLK_IS_CRITICAL,
+		      JH8100_AONCLK_AON_667),
+	STARFIVE_GATE(JH8100_AONCLK_PERF_SLVCLK, "perf_slvclk", CLK_IS_CRITICAL,
+		      JH8100_AONCLK_AON_500_POSTOSC),
+	STARFIVE_GDIV(JH8100_AONCLK_GCLK0, "gclk0", CLK_IS_CRITICAL, 100, JH8100_AONCLK_AON_1000),
+	STARFIVE_GATE(JH8100_AONCLK_GCLK_OSC, "gclk_osc", CLK_IS_CRITICAL, JH8100_AONCLK_OSC),
+	/* icg_en */
+	STARFIVE_GATE(JH8100_AONCLK_RTC_ICG_EN, "rtc_en", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_OSC),
+	STARFIVE_GATE(JH8100_AONCLK_GMAC0_ICG_EN, "gmac0_en", 0, JH8100_AONCLK_GMAC0_GTXCLK),
+	STARFIVE_GATE(JH8100_AONCLK_XSPI_ICG_EN, "xspi_en", 0, JH8100_AONCLK_OSC),
+	STARFIVE_GATE(JH8100_AONCLK_TVSENSOR0_ICG_EN, "tvsensor0_en", 0, JH8100_AONCLK_OSC),
+	STARFIVE_GATE(JH8100_AONCLK_MEU_ICG_EN, "meu_en", CLK_IGNORE_UNUSED, JH8100_AONCLK_OSC),
+	STARFIVE_GATE(JH8100_AONCLK_APB2BISR_ICG_EN, "apb2bisr_en", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_OSC),
+	STARFIVE_GATE(JH8100_AONCLK_EMMC_ICG_EN, "emmc_en", 0, JH8100_AONCLK_AON_50_POSTOSC),
+	STARFIVE_GATE(JH8100_AONCLK_SDIO0_ICG_EN, "sdio0_en", 0, JH8100_AONCLK_AON_50_POSTOSC),
+	STARFIVE_GATE(JH8100_AONCLK_TOP_ICG_EN, "top_en", CLK_IGNORE_UNUSED,
+		      JH8100_AONCLK_AON_500_POSTOSC),
+};
+
+static struct clk_hw *jh8100_aoncrg_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct starfive_clk_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx < JH8100_AONCLK_NUM_CLKS)
+		return &priv->reg[idx].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int __init jh8100_aoncrg_probe(struct platform_device *pdev)
+{
+	struct starfive_clk_priv *priv;
+	unsigned int idx;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev,
+			    struct_size(priv, reg, JH8100_AONCLK_NUM_CLKS),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->rmw_lock);
+	priv->dev = &pdev->dev;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	for (idx = 0; idx < JH8100_AONCLK_NUM_CLKS; idx++) {
+		u32 max = jh8100_aoncrg_clk_data[idx].max;
+		struct clk_parent_data parents[4] = {};
+		struct clk_init_data init = {
+			.name = jh8100_aoncrg_clk_data[idx].name,
+			.ops = starfive_clk_ops(max),
+			.parent_data = parents,
+			.num_parents =
+				((max & STARFIVE_CLK_MUX_MASK) >> STARFIVE_CLK_MUX_SHIFT) + 1,
+			.flags = jh8100_aoncrg_clk_data[idx].flags,
+		};
+		struct starfive_clk *clk = &priv->reg[idx];
+		unsigned int i;
+
+		for (i = 0; i < init.num_parents; i++) {
+			unsigned int pidx = jh8100_aoncrg_clk_data[idx].parents[i];
+
+			if (pidx < JH8100_AONCLK_NUM_CLKS)
+				parents[i].hw = &priv->reg[pidx].hw;
+			else if (pidx == JH8100_AONCLK_OSC)
+				parents[i].fw_name = "osc";
+			else if (pidx == JH8100_AONCLK_GMAC0_RMII_FUNC)
+				parents[i].fw_name = "gmac0-rmii-func";
+			else if (pidx == JH8100_AONCLK_AON_50)
+				parents[i].fw_name = "aon50";
+			else if (pidx == JH8100_AONCLK_GMAC0_RGMII_FUNC)
+				parents[i].fw_name = "gmac0-rgmii-func";
+			else if (pidx == JH8100_AONCLK_AON_125)
+				parents[i].fw_name = "aon125";
+			else if (pidx == JH8100_AONCLK_AON_2000)
+				parents[i].fw_name = "aon2000";
+			else if (pidx == JH8100_AONCLK_AON_200)
+				parents[i].fw_name = "aon200";
+			else if (pidx == JH8100_AONCLK_AON_667)
+				parents[i].fw_name = "aon667";
+			else if (pidx == JH8100_AONCLK_RTC)
+				parents[i].fw_name = "rtc";
+		}
+
+		clk->hw.init = &init;
+		clk->idx = idx;
+		clk->max_div = max & STARFIVE_CLK_DIV_MASK;
+
+		ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh8100_aoncrg_clk_get, priv);
+	if (ret)
+		return ret;
+
+	return jh8100_reset_controller_register(priv, "rst-aon", 4);
+}
+
+static const struct of_device_id jh8100_aoncrg_match[] = {
+	{ .compatible = "starfive,jh8100-aoncrg" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jh8100_aoncrg_driver = {
+	.driver = {
+		.name = "clk-starfive-jh8100-aon",
+		.of_match_table = jh8100_aoncrg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver_probe(jh8100_aoncrg_driver, jh8100_aoncrg_probe);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
