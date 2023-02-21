Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3108AC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EOh6l5jvh8HJ+Yv7RzF3tT/vZ7VAScg9PsND+tzKzw=; b=fNrBJS1fYDKp5r
	pRPzAle8RJtWXoZw+SGsDrSelwitYJ0aI5LbIM5XTuXwjndg8GwS+3SKAXjeKxri4wyT52LdAfp5A
	KsjkFz72TbepzbTZQNLtdpZ922E+Frk+Cv4xrZJCQFDSbz6XiWdIorNM4piZmEkIiiigPLYVGT7AN
	MvgNaoSxfNdkji5Nzfgg6Sk8Hg/wKMppP71nApZQchVdGgo38BVnIDDnUMBr2EJKf6kMGLoyocOY8
	n9wtH2IluhxesecuqIFE9yL+2GVmEou5DmO/EvhHgH3zcIYGRINtuhPRqggaTgUDdzCiKF6uLg4G9
	yiUaLPRWMtcb8w4uXPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUO6Q-0073zr-AW; Tue, 21 Feb 2023 08:34:22 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUO6N-0073nC-1A
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 08:34:21 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7884524E359;
	Tue, 21 Feb 2023 16:33:32 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 16:33:32 +0800
Received: from localhost.localdomain (183.27.98.67) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 16:33:31 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v2 03/11] clk: starfive: Add StarFive JH7110 System-Top-Group clock driver
Date: Tue, 21 Feb 2023 16:33:15 +0800
Message-ID: <20230221083323.302471-4-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_003419_387360_4644622B 
X-CRM114-Status: GOOD (  20.83  )
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

Add driver for the StarFive JH7110 System-Top-Group clock controller.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  11 ++
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jh7110-stg.c    | 176 ++++++++++++++++++
 3 files changed, 188 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-stg.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 2aa664f2cdee..a462b6e53543 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -42,3 +42,14 @@ config CLK_STARFIVE_JH7110_AON
 	help
 	  Say yes here to support the always-on clock controller on the
 	  StarFive JH7110 SoC.
+
+config CLK_STARFIVE_JH7110_STG
+	tristate "StarFive JH7110 System-Top-Group clock support"
+	depends on CLK_STARFIVE_JH7110_SYS
+	select AUXILIARY_BUS
+	select CLK_STARFIVE_JH71X0
+	select RESET_STARFIVE_JH7110
+	default CLK_STARFIVE_JH7110_SYS
+	help
+	  Say yes here to support the System-Top-Group clock controller
+	  on the StarFive JH7110 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index f3df7d957b1e..b81e97ee2659 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO)	+= clk-starfive-jh7100-audio.o
 
 obj-$(CONFIG_CLK_STARFIVE_JH7110_SYS)	+= clk-starfive-jh7110-sys.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
+obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-stg.c b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
new file mode 100644
index 000000000000..a39d2fdb8011
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JH7110 System-Top-Group Clock Driver
+ *
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/starfive,jh7110-crg.h>
+
+#include "clk-starfive-jh71x0.h"
+
+/* external clocks */
+#define JH7110_STGCLK_OSC			(JH7110_STGCLK_END + 0)
+#define JH7110_STGCLK_HIFI4_CORE		(JH7110_STGCLK_END + 1)
+#define JH7110_STGCLK_STG_AXIAHB		(JH7110_STGCLK_END + 2)
+#define JH7110_STGCLK_USB_125M			(JH7110_STGCLK_END + 3)
+#define JH7110_STGCLK_CPU_BUS			(JH7110_STGCLK_END + 4)
+#define JH7110_STGCLK_HIFI4_AXI			(JH7110_STGCLK_END + 5)
+#define JH7110_STGCLK_NOCSTG_BUS		(JH7110_STGCLK_END + 6)
+#define JH7110_STGCLK_APB_BUS			(JH7110_STGCLK_END + 7)
+#define JH7110_STGCLK_EXT_END			(JH7110_STGCLK_END + 8)
+
+static const struct jh71x0_clk_data jh7110_stgclk_data[] = {
+	/* hifi4 */
+	JH71X0_GATE(JH7110_STGCLK_HIFI4_CLK_CORE, "hifi4_clk_core", 0,
+		    JH7110_STGCLK_HIFI4_CORE),
+	/* usb */
+	JH71X0_GATE(JH7110_STGCLK_USB0_APB, "usb0_apb", 0, JH7110_STGCLK_APB_BUS),
+	JH71X0_GATE(JH7110_STGCLK_USB0_UTMI_APB, "usb0_utmi_apb", 0, JH7110_STGCLK_APB_BUS),
+	JH71X0_GATE(JH7110_STGCLK_USB0_AXI, "usb0_axi", 0, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GDIV(JH7110_STGCLK_USB0_LPM, "usb0_lpm", 0, 2, JH7110_STGCLK_OSC),
+	JH71X0_GDIV(JH7110_STGCLK_USB0_STB, "usb0_stb", 0, 4, JH7110_STGCLK_OSC),
+	JH71X0_GATE(JH7110_STGCLK_USB0_APP_125, "usb0_app_125", 0, JH7110_STGCLK_USB_125M),
+	JH71X0__DIV(JH7110_STGCLK_USB0_REFCLK, "usb0_refclk", 2, JH7110_STGCLK_OSC),
+	/* pci-e */
+	JH71X0_GATE(JH7110_STGCLK_PCIE0_AXI_MST0, "pcie0_axi_mst0", 0,
+		    JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_PCIE0_APB, "pcie0_apb", 0, JH7110_STGCLK_APB_BUS),
+	JH71X0_GATE(JH7110_STGCLK_PCIE0_TL, "pcie0_tl", 0, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_PCIE1_AXI_MST0, "pcie1_axi_mst0", 0,
+		    JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_PCIE1_APB, "pcie1_apb", 0, JH7110_STGCLK_APB_BUS),
+	JH71X0_GATE(JH7110_STGCLK_PCIE1_TL, "pcie1_tl", 0, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_PCIE01_SLV_DEC_MAINCLK, "pcie01_slv_dec_mainclk",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
+	/* security */
+	JH71X0_GATE(JH7110_STGCLK_SEC_HCLK, "sec_hclk", 0, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_SEC_MISCAHB, "sec_miscahb", 0, JH7110_STGCLK_STG_AXIAHB),
+	/* stg mtrx */
+	JH71X0_GATE(JH7110_STGCLK_GRP0_MAIN, "mtrx_grp0_main",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_CPU_BUS),
+	JH71X0_GATE(JH7110_STGCLK_GRP0_BUS, "mtrx_grp0_bus",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_NOCSTG_BUS),
+	JH71X0_GATE(JH7110_STGCLK_GRP0_STG, "mtrx_grp0_stg",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_GRP1_MAIN, "mtrx_grp1_main",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_CPU_BUS),
+	JH71X0_GATE(JH7110_STGCLK_GRP1_BUS, "mtrx_grp1_bus",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_NOCSTG_BUS),
+	JH71X0_GATE(JH7110_STGCLK_GRP1_STG, "mtrx_grp1_stg",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_GRP1_HIFI, "mtrx_grp1_hifi",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_HIFI4_AXI),
+	/* e24_rvpi */
+	JH71X0_GDIV(JH7110_STGCLK_E2_RTC, "e2_rtc", 0, 24, JH7110_STGCLK_OSC),
+	JH71X0_GATE(JH7110_STGCLK_E2_CORE, "e2_core",
+		    CLK_IGNORE_UNUSED, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_E2_DBG, "e2_dbg", 0, JH7110_STGCLK_STG_AXIAHB),
+	/* dw_sgdma1p */
+	JH71X0_GATE(JH7110_STGCLK_DMA1P_AXI, "dma1p_axi", 0, JH7110_STGCLK_STG_AXIAHB),
+	JH71X0_GATE(JH7110_STGCLK_DMA1P_AHB, "dma1p_ahb", 0, JH7110_STGCLK_STG_AXIAHB),
+};
+
+static struct clk_hw *jh7110_stgclk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct jh71x0_clk_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx < JH7110_STGCLK_END)
+		return &priv->reg[idx].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int jh7110_stgcrg_probe(struct platform_device *pdev)
+{
+	struct jh71x0_clk_priv *priv;
+	unsigned int idx;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev,
+			    struct_size(priv, reg, JH7110_STGCLK_END),
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
+	dev_set_drvdata(priv->dev, (void *)(&priv->base));
+
+	for (idx = 0; idx < JH7110_STGCLK_END; idx++) {
+		u32 max = jh7110_stgclk_data[idx].max;
+		struct clk_parent_data parents[4] = {};
+		struct clk_init_data init = {
+			.name = jh7110_stgclk_data[idx].name,
+			.ops = starfive_jh71x0_clk_ops(max),
+			.parent_data = parents,
+			.num_parents =
+				((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
+			.flags = jh7110_stgclk_data[idx].flags,
+		};
+		struct jh71x0_clk *clk = &priv->reg[idx];
+		unsigned int i;
+		char *fw_name[JH7110_STGCLK_EXT_END - JH7110_STGCLK_END] = {
+			"osc",
+			"hifi4_core",
+			"stg_axiahb",
+			"usb_125m",
+			"cpu_bus",
+			"hifi4_axi",
+			"nocstg_bus",
+			"apb_bus"
+		};
+
+		for (i = 0; i < init.num_parents; i++) {
+			unsigned int pidx = jh7110_stgclk_data[idx].parents[i];
+
+			if (pidx < JH7110_STGCLK_END)
+				parents[i].hw = &priv->reg[pidx].hw;
+			else if (pidx < JH7110_STGCLK_EXT_END)
+				parents[i].fw_name = fw_name[pidx - JH7110_STGCLK_END];
+		}
+
+		clk->hw.init = &init;
+		clk->idx = idx;
+		clk->max_div = max & JH71X0_CLK_DIV_MASK;
+
+		ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_stgclk_get, priv);
+	if (ret)
+		return ret;
+
+	return jh7110_reset_controller_register(priv, "reset-stg", 2);
+}
+
+static const struct of_device_id jh7110_stgcrg_match[] = {
+	{ .compatible = "starfive,jh7110-stgcrg" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jh7110_stgcrg_match);
+
+static struct platform_driver jh7110_stgcrg_driver = {
+	.probe = jh7110_stgcrg_probe,
+	.driver = {
+		.name = "clk-starfive-jh7110-stg",
+		.of_match_table = jh7110_stgcrg_match,
+	},
+};
+module_platform_driver(jh7110_stgcrg_driver);
+
+MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JH7110 System-Top-Group clock driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
