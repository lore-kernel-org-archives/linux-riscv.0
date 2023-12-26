Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434EFC4706F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 05:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZEaapnMJb+UN7YTCqn2kwOS4xFLuDXw8d1yG1G/7+E=; b=b+bN28ZXQwWhtd
	66VM00nb+JzCI9BVgM7MuHpKVpMK+IcB376i8Z9PMFHU2RcgOz7rzWkhJhycGsVi0FvYqtYpaMBYb
	x+J7tVFifdselccfGbF8XaPDM3Cb8m5L49ZZdOKOziTjwfD6i/M0vYa6bk8fBk1MRBMqaOcg1RPxz
	lY+dj9l5dWYjGRvQ8AIvnWv8rHQx04qcbjverEsmlxPcy/5wWKKYsPHdu5Wdf+dw+STl5rgVYLs4G
	CqNgGpvxPlI0vWXAIGEQxhAVZ0MdMHX9gIMqT34oi6Yx6R0mqp8PnS4G1MuDmjZTm36btH0bqOEIk
	1plFN07HdBhbVUyQATMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rI0BK-00BjQh-2X;
	Tue, 26 Dec 2023 05:40:47 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rI0BF-00BjHa-2A
	for linux-riscv@lists.infradead.org;
	Tue, 26 Dec 2023 05:40:43 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 51BC48043;
	Tue, 26 Dec 2023 13:40:22 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 26 Dec
 2023 13:40:22 +0800
Received: from jsia-virtual-machine.localdomain (202.188.176.82) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 26 Dec 2023 13:40:16 +0800
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
Subject: [RFC 12/16] clk: starfive: Add JH8100 South-West clock generator driver
Date: Tue, 26 Dec 2023 13:38:44 +0800
Message-ID: <20231226053848.25089-13-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231226053848.25089-1-jeeheng.sia@starfivetech.com>
References: <20231226053848.25089-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_214042_047568_C91CCE42 
X-CRM114-Status: GOOD (  18.58  )
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

Add support for JH8100 South-West (SWCRG) clock generator.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |   7 +
 drivers/clk/starfive/Makefile                 |   1 +
 drivers/clk/starfive/clk-starfive-jh8100-sw.c | 134 ++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jh8100-sw.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 23968e97969b..23ae894fedb9 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -95,3 +95,10 @@ config CLK_STARFIVE_JH8100_NE
 	default ARCH_STARFIVE
 	help
 	  Say yes here to support the North-East clock controller on the StarFive JH8100 SoC.
+
+config CLK_STARFIVE_JH8100_SW
+	bool "StarFive JH8100 South-West clock support"
+	depends on CLK_STARFIVE_JH8100_SYS
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the South-West clock controller on the StarFive JH8100 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index cecce3655600..242e2e75dadb 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -14,3 +14,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
 obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS)	+= clk-starfive-jh8100-sys.o
 obj-$(CONFIG_CLK_STARFIVE_JH8100_NW)	+= clk-starfive-jh8100-nw.o
 obj-$(CONFIG_CLK_STARFIVE_JH8100_NE)	+= clk-starfive-jh8100-ne.o
+obj-$(CONFIG_CLK_STARFIVE_JH8100_SW)	+= clk-starfive-jh8100-sw.o
diff --git a/drivers/clk/starfive/clk-starfive-jh8100-sw.c b/drivers/clk/starfive/clk-starfive-jh8100-sw.c
new file mode 100644
index 000000000000..f583f7d984ed
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jh8100-sw.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JH8100 South-West Clock Driver
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
+#define JH8100_SWCLK_NUM_CLKS		(JH8100_SWCLK_VDEC_ICG_EN + 1)
+
+/* external clocks */
+#define JH8100_SWCLK_APB_BUS		(JH8100_SWCLK_NUM_CLKS + 0)
+#define JH8100_SWCLK_VDEC_ROOT		(JH8100_SWCLK_NUM_CLKS + 1)
+#define JH8100_SWCLK_FLEXNOC1		(JH8100_SWCLK_NUM_CLKS + 2)
+
+static const struct starfive_clk_data jh8100_swcrg_clk_data[] = {
+	/* jpeg */
+	STARFIVE__DIV(JH8100_SWCLK_JPEG_AXI, "jpeg_axi", 20, JH8100_SWCLK_VDEC_ROOT),
+	STARFIVE_GATE(JH8100_SWCLK_VC9000DJ_AXI, "vc9000dj_axi", CLK_IGNORE_UNUSED,
+		      JH8100_SWCLK_JPEG_AXI),
+	STARFIVE_GDIV(JH8100_SWCLK_VC9000DJ_VDEC, "vc9000dj_vdec", CLK_IGNORE_UNUSED, 40,
+		      JH8100_SWCLK_VDEC_ROOT),
+	STARFIVE_GATE(JH8100_SWCLK_VC9000DJ_APB, "vc9000dj_apb", CLK_IGNORE_UNUSED,
+		      JH8100_SWCLK_APB_BUS),
+	/* video dec */
+	STARFIVE__DIV(JH8100_SWCLK_VDEC_AXI, "vdec_axi", 20, JH8100_SWCLK_VDEC_ROOT),
+	STARFIVE_GATE(JH8100_SWCLK_VC9000D_AXI, "vc9000d_axi", CLK_IGNORE_UNUSED,
+		      JH8100_SWCLK_VDEC_AXI),
+	STARFIVE_GDIV(JH8100_SWCLK_VC9000D_VDEC, "vc9000d_vdec", CLK_IGNORE_UNUSED, 40,
+		      JH8100_SWCLK_FLEXNOC1),
+	STARFIVE_GATE(JH8100_SWCLK_VC9000D_APB, "vc9000d_apb", CLK_IGNORE_UNUSED,
+		      JH8100_SWCLK_APB_BUS),
+	/* icg_en */
+	STARFIVE_GATE(JH8100_SWCLK_JPEG_ICG_EN, "jpeg_en", 0, JH8100_SWCLK_VDEC_ROOT),
+	STARFIVE_GATE(JH8100_SWCLK_VDEC_ICG_EN, "vdec_en", 0, JH8100_SWCLK_VDEC_AXI),
+};
+
+static struct clk_hw *jh8100_swcrg_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct starfive_clk_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx < JH8100_SWCLK_NUM_CLKS)
+		return &priv->reg[idx].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int jh8100_swcrg_probe(struct platform_device *pdev)
+{
+	struct starfive_clk_priv *priv;
+	unsigned int idx;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev,
+			    struct_size(priv, reg, JH8100_SWCLK_NUM_CLKS),
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
+	for (idx = 0; idx < JH8100_SWCLK_NUM_CLKS; idx++) {
+		u32 max = jh8100_swcrg_clk_data[idx].max;
+		struct clk_parent_data parents[4] = {};
+		struct clk_init_data init = {
+			.name = jh8100_swcrg_clk_data[idx].name,
+			.ops = starfive_clk_ops(max),
+			.parent_data = parents,
+			.num_parents =
+				((max & STARFIVE_CLK_MUX_MASK) >> STARFIVE_CLK_MUX_SHIFT) + 1,
+			.flags = jh8100_swcrg_clk_data[idx].flags,
+		};
+		struct starfive_clk *clk = &priv->reg[idx];
+		unsigned int i;
+
+		for (i = 0; i < init.num_parents; i++) {
+			unsigned int pidx = jh8100_swcrg_clk_data[idx].parents[i];
+
+			if (pidx < JH8100_SWCLK_NUM_CLKS)
+				parents[i].hw = &priv->reg[pidx].hw;
+			else if (pidx == JH8100_SWCLK_APB_BUS)
+				parents[i].fw_name = "apb_bus";
+			else if (pidx == JH8100_SWCLK_VDEC_ROOT)
+				parents[i].fw_name = "vdec_root";
+			else if (pidx == JH8100_SWCLK_FLEXNOC1)
+				parents[i].fw_name = "flexnoc1";
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
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh8100_swcrg_clk_get, priv);
+	if (ret)
+		return ret;
+
+	return jh8100_reset_controller_register(priv, "rst-sw", 3);
+}
+
+static const struct of_device_id jh8100_swcrg_match[] = {
+	{ .compatible = "starfive,jh8100-swcrg" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jh8100_swcrg_driver = {
+	.driver = {
+		.name = "clk-starfive-jh8100-sw",
+		.of_match_table = jh8100_swcrg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver_probe(jh8100_swcrg_driver, jh8100_swcrg_probe);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
