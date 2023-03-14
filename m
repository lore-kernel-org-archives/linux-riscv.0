Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816A8C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xy6L/HPbbRGWD1ktnWZWwzxvgsUQuze8whxRxDqyQt4=; b=0gBrSPbwR8KN4Z
	3Gm+/61W4pz2SffWG2b5VD1WcsbPmVhv9AyHZpPCCurjJBU5i5ow8/xwU5DQisLlanuvVw3URdVAI
	tyKweIRZEKdHYY+5JdpQ5mcgRxZczmSeb+LesC7DyqL9Ylr+UVpbSCtJncETaCtnPJ8oX6bPW8QXr
	GG+VcbzLX6HsviAcqUgJiS8k4UF/qjeLphrgjRvVVSR/1iK14KlXqWcS4I9X6bU9a3AAYYq2V2h7i
	IMmriBAFj1i5M9dkOTEKzeUJOD/84MTipmc+dXYGo6H9PCecPhKrtzFtrawvJCPUQ/AlbdnUd5Ndy
	BkWV0dHiG/YNrzjYMWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41n-00AAd7-37;
	Tue, 14 Mar 2023 12:45:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41m-00AAav-2n
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Mar 2023 12:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ATNN1fAyd7ThmYl7y76hCPbPjdTE2SPBw8iC/P8A9BU=; b=LNjivaDGUfcUbFaYrDmZp4uIMR
	5vWvu3SnGSfPwOZ9HUOwnh2LaMWrscBS5rrR7gaeuOnbalV0jxPL69ZX3DVTUtHuTbGfB35xAsKFX
	2/rqF/FERqqACgj9kg9Pv1b+bgG6T9VurHva2EjNgzAWnwZWC0PW79lXvycVrsM9SeJfexWCFhu2T
	FyTNeLKOtXDJudxcvSTRRSuTfyzlc4YlPRInse1jflKZufC2FpUdRV6R+UrUiaiM0oFsvXRqmqaf0
	jZeXNBA8n3fpsNRy1FEu5imzL1pc1ZM9jXE+cUwNPwDF+VH78gXaFnBE+AW319Nrz784T+Dz2vyCA
	ty6DUxRQ==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41h-001mgl-2A
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 12:45:17 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 453CB24E3C9;
	Tue, 14 Mar 2023 20:44:13 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 20:44:13 +0800
Received: from localhost.localdomain (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 20:44:12 +0800
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
Subject: [PATCH v3 09/11] clk: starfive: Add StarFive JH7110 Video-Output clock driver
Date: Tue, 14 Mar 2023 20:44:02 +0800
Message-ID: <20230314124404.117592-10-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
References: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_124514_564894_003BB5EA 
X-CRM114-Status: GOOD (  22.85  )
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

Add driver for the StarFive JH7110 Video-Output clock controller.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  11 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jh7110-vout.c   | 240 ++++++++++++++++++
 3 files changed, 252 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-vout.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index be02eabebeff..b0c7744965d7 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -64,3 +64,14 @@ config CLK_STARFIVE_JH7110_ISP
 	help
 	  Say yes here to support the Image-Signal-Process clock controller
 	  on the StarFive JH7110 SoC.
+
+config CLK_STARFIVE_JH7110_VOUT
+	tristate "StarFive JH7110 Video-Output clock support"
+	depends on CLK_STARFIVE_JH7110_SYS && JH71XX_PMU
+	select AUXILIARY_BUS
+	select CLK_STARFIVE_JH71X0
+	select RESET_STARFIVE_JH7110
+	default m if ARCH_STARFIVE
+	help
+	  Say yes here to support the Video-Output clock controller
+	  on the StarFive JH7110 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 76fb9f8d628b..841377e45bb6 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_SYS)	+= clk-starfive-jh7110-sys.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
+obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
new file mode 100644
index 000000000000..02a6c98b1bcd
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JH7110 Video-Output Clock Driver
+ *
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <dt-bindings/clock/starfive,jh7110-crg.h>
+
+#include "clk-starfive-jh71x0.h"
+
+/* external clocks */
+#define JH7110_VOUTCLK_VOUT_SRC			(JH7110_VOUTCLK_END + 0)
+#define JH7110_VOUTCLK_VOUT_TOP_AHB		(JH7110_VOUTCLK_END + 1)
+#define JH7110_VOUTCLK_VOUT_TOP_AXI		(JH7110_VOUTCLK_END + 2)
+#define JH7110_VOUTCLK_VOUT_TOP_HDMITX0_MCLK	(JH7110_VOUTCLK_END + 3)
+#define JH7110_VOUTCLK_I2STX0_BCLK		(JH7110_VOUTCLK_END + 4)
+#define JH7110_VOUTCLK_HDMITX0_PIXELCLK		(JH7110_VOUTCLK_END + 5)
+#define JH7110_VOUTCLK_EXT_END			(JH7110_VOUTCLK_END + 6)
+
+/* VOUT domian clocks */
+struct vout_top_crg {
+	struct clk_bulk_data *top_clks;
+	int top_clks_num;
+	void __iomem *base;
+};
+
+static struct clk_bulk_data jh7110_vout_top_clks[] = {
+	{ .id = "vout_src" },
+	{ .id = "vout_top_ahb" }
+};
+
+static const struct jh71x0_clk_data jh7110_voutclk_data[] = {
+	/* divider */
+	JH71X0__DIV(JH7110_VOUTCLK_APB, "apb", 8, JH7110_VOUTCLK_VOUT_TOP_AHB),
+	JH71X0__DIV(JH7110_VOUTCLK_DC8200_PIX, "dc8200_pix", 63, JH7110_VOUTCLK_VOUT_SRC),
+	JH71X0__DIV(JH7110_VOUTCLK_DSI_SYS, "dsi_sys", 31, JH7110_VOUTCLK_VOUT_SRC),
+	JH71X0__DIV(JH7110_VOUTCLK_TX_ESC, "tx_esc", 31, JH7110_VOUTCLK_VOUT_TOP_AHB),
+	/* dc8200 */
+	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AXI, "dc8200_axi", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
+	JH71X0_GATE(JH7110_VOUTCLK_DC8200_CORE, "dc8200_core", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
+	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AHB, "dc8200_ahb", 0, JH7110_VOUTCLK_VOUT_TOP_AHB),
+	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", 0, 2,
+		    JH7110_VOUTCLK_DC8200_PIX,
+		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
+	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", 0, 2,
+		    JH7110_VOUTCLK_DC8200_PIX,
+		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
+	/* LCD */
+	JH71X0_GMUX(JH7110_VOUTCLK_DOM_VOUT_TOP_LCD, "dom_vout_top_lcd", 0, 2,
+		    JH7110_VOUTCLK_DC8200_PIX0,
+		    JH7110_VOUTCLK_DC8200_PIX1),
+	/* dsiTx */
+	JH71X0_GATE(JH7110_VOUTCLK_DSITX_APB, "dsiTx_apb", 0, JH7110_VOUTCLK_DSI_SYS),
+	JH71X0_GATE(JH7110_VOUTCLK_DSITX_SYS, "dsiTx_sys", 0, JH7110_VOUTCLK_DSI_SYS),
+	JH71X0_GMUX(JH7110_VOUTCLK_DSITX_DPI, "dsiTx_dpi", 0, 2,
+		    JH7110_VOUTCLK_DC8200_PIX,
+		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
+	JH71X0_GATE(JH7110_VOUTCLK_DSITX_TXESC, "dsiTx_txesc", 0, JH7110_VOUTCLK_TX_ESC),
+	/* mipitx DPHY */
+	JH71X0_GATE(JH7110_VOUTCLK_MIPITX_DPHY_TXESC, "mipitx_dphy_txesc", 0,
+		    JH7110_VOUTCLK_TX_ESC),
+	/* hdmi */
+	JH71X0_GATE(JH7110_VOUTCLK_HDMI_TX_MCLK, "hdmi_tx_mclk", 0,
+		    JH7110_VOUTCLK_VOUT_TOP_HDMITX0_MCLK),
+	JH71X0_GATE(JH7110_VOUTCLK_HDMI_TX_BCLK, "hdmi_tx_bclk", 0,
+		    JH7110_VOUTCLK_I2STX0_BCLK),
+	JH71X0_GATE(JH7110_VOUTCLK_HDMI_TX_SYS, "hdmi_tx_sys", 0, JH7110_VOUTCLK_APB),
+};
+
+static struct vout_top_crg *top_crg_from(void __iomem **base)
+{
+	return container_of(base, struct vout_top_crg, base);
+}
+
+static int jh7110_vout_top_crg_init(struct jh71x0_clk_priv *priv, struct vout_top_crg *top)
+{
+	struct reset_control *top_rst;
+	int ret;
+
+	top->top_clks = jh7110_vout_top_clks;
+	top->top_clks_num = ARRAY_SIZE(jh7110_vout_top_clks);
+	ret = devm_clk_bulk_get(priv->dev, top->top_clks_num, top->top_clks);
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "failed to get top clocks\n");
+
+	/* The reset should be shared and other Vout modules will use its. */
+	top_rst = devm_reset_control_get_shared(priv->dev, NULL);
+	if (IS_ERR(top_rst))
+		return dev_err_probe(priv->dev, PTR_ERR(top_rst), "failed to get top reset\n");
+
+	ret = clk_bulk_prepare_enable(top->top_clks_num, top->top_clks);
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "failed to enable top clocks\n");
+
+	return reset_control_deassert(top_rst);
+}
+
+static struct clk_hw *jh7110_voutclk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct jh71x0_clk_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx < JH7110_VOUTCLK_END)
+		return &priv->reg[idx].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int jh7110_voutcrg_probe(struct platform_device *pdev)
+{
+	struct jh71x0_clk_priv *priv;
+	struct vout_top_crg *top;
+	unsigned int idx;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev,
+			    struct_size(priv, reg, JH7110_VOUTCLK_END),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	top = devm_kzalloc(&pdev->dev, sizeof(*top), GFP_KERNEL);
+	if (!top)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->rmw_lock);
+	priv->dev = &pdev->dev;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	pm_runtime_enable(priv->dev);
+	ret = pm_runtime_get_sync(priv->dev);
+	if (ret < 0)
+		return dev_err_probe(priv->dev, ret, "failed to turn on power\n");
+
+	ret = jh7110_vout_top_crg_init(priv, top);
+	if (ret)
+		goto err_clk;
+
+	top->base = priv->base;
+	dev_set_drvdata(priv->dev, (void *)(&top->base));
+
+	for (idx = 0; idx < JH7110_VOUTCLK_END; idx++) {
+		u32 max = jh7110_voutclk_data[idx].max;
+		struct clk_parent_data parents[4] = {};
+		struct clk_init_data init = {
+			.name = jh7110_voutclk_data[idx].name,
+			.ops = starfive_jh71x0_clk_ops(max),
+			.parent_data = parents,
+			.num_parents =
+				((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
+			.flags = jh7110_voutclk_data[idx].flags,
+		};
+		struct jh71x0_clk *clk = &priv->reg[idx];
+		unsigned int i;
+		const char *fw_name[JH7110_VOUTCLK_EXT_END - JH7110_VOUTCLK_END] = {
+			"vout_src",
+			"vout_top_ahb",
+			"vout_top_axi",
+			"vout_top_hdmitx0_mclk",
+			"i2stx0_bclk",
+			"hdmitx0_pixelclk"
+		};
+
+		for (i = 0; i < init.num_parents; i++) {
+			unsigned int pidx = jh7110_voutclk_data[idx].parents[i];
+
+			if (pidx < JH7110_VOUTCLK_END)
+				parents[i].hw = &priv->reg[pidx].hw;
+			else if (pidx < JH7110_VOUTCLK_EXT_END)
+				parents[i].fw_name = fw_name[pidx - JH7110_VOUTCLK_END];
+		}
+
+		clk->hw.init = &init;
+		clk->idx = idx;
+		clk->max_div = max & JH71X0_CLK_DIV_MASK;
+
+		ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
+		if (ret)
+			goto err_exit;
+	}
+
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_voutclk_get, priv);
+	if (ret)
+		goto err_exit;
+
+	ret = jh7110_reset_controller_register(priv, "reset-vout", 4);
+	if (ret)
+		goto err_exit;
+
+	return 0;
+
+err_exit:
+	clk_bulk_disable_unprepare(top->top_clks_num, top->top_clks);
+err_clk:
+	pm_runtime_put_sync(priv->dev);
+	pm_runtime_disable(priv->dev);
+	return ret;
+}
+
+static int jh7110_voutcrg_remove(struct platform_device *pdev)
+{
+	void __iomem **base = dev_get_drvdata(&pdev->dev);
+	struct vout_top_crg *top = top_crg_from(base);
+
+	clk_bulk_disable_unprepare(top->top_clks_num, top->top_clks);
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id jh7110_voutcrg_match[] = {
+	{ .compatible = "starfive,jh7110-voutcrg" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jh7110_voutcrg_match);
+
+static struct platform_driver jh7110_voutcrg_driver = {
+	.probe = jh7110_voutcrg_probe,
+	.remove = jh7110_voutcrg_remove,
+	.driver = {
+		.name = "clk-starfive-jh7110-vout",
+		.of_match_table = jh7110_voutcrg_match,
+	},
+};
+module_platform_driver(jh7110_voutcrg_driver);
+
+MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JH7110 Video-Output clock driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
