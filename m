Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9E2C32774
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 12:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5uPq2g6puXTol5WppBBBSF+d61/0QWRwnH4882Yx6Q=; b=ATXkPkVDs/OoPX
	Om9V+KxCqkwwYQiKZtDrAdXx6/kZ9ANxSlS6qA/6JFXwHjBpoz5Ac9urQ3Ss4xCqSgan7EdxR99Za
	sBT8L0GQIHDq7nN/i20bI+sPGCuJZUCm98Wic9sMdu4noY6z6FFrfp08nRZzpk/Qry5/fhiM4Q528
	xpIkJKTEfgZ6jvRrmltVdQRIHHs0KuF56xaePluRndpK8AYCYY+HkHz/uZqn/oVf0Uyb/nYaihfRg
	2QxA2YdaheXrr75mu9oTq7mDEhfJZwc39zx6mp4MbcLqC7LCAcCmPQtVkWS+pohkkEnPheGlVpKA1
	Y7f7N+ciwhtND9tmDfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP16w-007rzH-B7; Fri, 19 Aug 2022 12:28:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP16o-007rOs-Qc
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 12:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660912098; x=1692448098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eJrWMvZV3yT76UldKtJmotcSxx4q47UGVot8PEf4K3Y=;
  b=cs8GLG1P8UL4r5rdmyio/r9j6wB87Mr/CcoCefgBtQ6R9sjx0+wioBJU
   WgZR3rmrnQNBSoiZ68Rx0NVQEXLtl5/GnZ3TsfgWuGsNgicgW8Ln4MSIl
   xKuXI9nP3NwqmtPm+bWy24apBIX5P4Cm/hdUZUePITfnMrni3iaMwpyCo
   n0CjLnMFM94ZtQNstqZirGjRfl5XUeUbTuMm+5tSnRasvJFmfQ8/aGsdw
   L7omHQ6xHghEYauxiigvKlOcOGnrJBMVOCL55JBSXT7DA6ZL7ezcrfHaN
   DVUC6eO22lShfJC5kVgnyz+pNQ/qMqimqfH7yRu6hTn5M1oe4wPpQ5pBZ
   w==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="187188546"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 05:28:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 05:28:16 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 05:28:14 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH 4/6] clk: microchip: add PolarFire SoC fabric clock support
Date: Fri, 19 Aug 2022 13:22:58 +0100
Message-ID: <20220819122259.183600-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220819122259.183600-1-conor.dooley@microchip.com>
References: <20220819122259.183600-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_052819_482404_279A91B4 
X-CRM114-Status: GOOD (  20.91  )
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

Add a driver to support the PLLs in PolarFire SoC's Clock Conditioning
Circuitry, an instance of which is located in each ordinal corner of
the FPGA. Only get_rate() is supported as these clocks are intended to
be statically configured by the FPGA design. Currently, the DLLs are
not supported by this driver. For more information on the hardware, see
"PolarFire SoC FPGA Clocking Resources" in the link below.

Link: https://onlinedocs.microchip.com/pr/GUID-8F0CC4C0-0317-4262-89CA-CE7773ED1931-en-US-1/index.html
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/Makefile       |   1 +
 drivers/clk/microchip/clk-mpfs-ccc.c | 294 +++++++++++++++++++++++++++
 2 files changed, 295 insertions(+)
 create mode 100644 drivers/clk/microchip/clk-mpfs-ccc.c

diff --git a/drivers/clk/microchip/Makefile b/drivers/clk/microchip/Makefile
index 5fa6dcf30a9a..13250e04e46c 100644
--- a/drivers/clk/microchip/Makefile
+++ b/drivers/clk/microchip/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_COMMON_CLK_PIC32) += clk-core.o
 obj-$(CONFIG_PIC32MZDA) += clk-pic32mzda.o
 obj-$(CONFIG_MCHP_CLK_MPFS) += clk-mpfs.o
+obj-$(CONFIG_MCHP_CLK_MPFS) += clk-mpfs-ccc.o
diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
new file mode 100644
index 000000000000..d6a1777c428c
--- /dev/null
+++ b/drivers/clk/microchip/clk-mpfs-ccc.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ *
+ * Copyright (C) 2022 Microchip Technology Inc. and its subsidiaries
+ */
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/microchip,mpfs-clock.h>
+
+/* address offset of control registers */
+#define MPFS_CCC_PLL_CR			0x04u
+#define MPFS_CCC_REF_CR			0x08u
+#define MPFS_CCC_SSCG_2_CR		0x2Cu
+#define MPFS_CCC_POSTDIV01_CR		0x10u
+#define MPFS_CCC_POSTDIV23_CR		0x14u
+
+#define MPFS_CCC_FBDIV_SHIFT		0x00u
+#define MPFS_CCC_FBDIV_WIDTH		0x0Cu
+#define MPFS_CCC_POSTDIV0_SHIFT		0x08u
+#define MPFS_CCC_POSTDIV1_SHIFT		0x18u
+#define MPFS_CCC_POSTDIV2_SHIFT		MPFS_CCC_POSTDIV0_SHIFT
+#define MPFS_CCC_POSTDIV3_SHIFT		MPFS_CCC_POSTDIV1_SHIFT
+#define MPFS_CCC_POSTDIV_WIDTH		0x06u
+#define MPFS_CCC_REFCLK_SEL		BIT(6)
+#define MPFS_CCC_REFDIV_SHIFT		0x08u
+#define MPFS_CCC_REFDIV_WIDTH		0x06u
+
+#define MPFS_CCC_FIXED_DIV		4
+#define MPFS_CCC_OUTPUTS_PER_PLL	4
+#define MPFS_CCC_REFS_PER_PLL		2
+
+struct mpfs_ccc_data {
+	void __iomem **pll_base;
+	struct device *dev;
+	const char *location;
+	struct clk_hw_onecell_data hw_data;
+};
+
+struct mpfs_ccc_pll_hw_clock {
+	void __iomem *base;
+	const char *name;
+	const struct clk_parent_data *parents;
+	unsigned int id;
+	u32 reg_offset;
+	u32 shift;
+	u32 width;
+	u32 flags;
+	struct clk_hw hw;
+	struct clk_init_data init;
+};
+
+#define to_mpfs_ccc_clk(_hw) container_of(_hw, struct mpfs_ccc_pll_hw_clock, hw)
+
+/*
+ * mpfs_ccc_lock prevents anything else from writing to a fabric ccc
+ * while a software locked register is being written.
+ */
+static DEFINE_SPINLOCK(mpfs_ccc_lock);
+
+static const struct clk_parent_data mpfs_ccc_pll0_refs[] = {
+	{ .fw_name = "pll0_ref0" },
+	{ .fw_name = "pll0_ref1" },
+};
+
+static const struct clk_parent_data mpfs_ccc_pll1_refs[] = {
+	{ .fw_name = "pll1_ref0" },
+	{ .fw_name = "pll1_ref1" },
+};
+
+static unsigned long mpfs_ccc_pll_recalc_rate(struct clk_hw *hw, unsigned long prate)
+{
+	struct mpfs_ccc_pll_hw_clock *ccc_hw = to_mpfs_ccc_clk(hw);
+	void __iomem *mult_addr = ccc_hw->base + ccc_hw->reg_offset;
+	void __iomem *ref_div_addr = ccc_hw->base + MPFS_CCC_REF_CR;
+	u32 mult, ref_div;
+
+	mult = readl_relaxed(mult_addr) >> MPFS_CCC_FBDIV_SHIFT;
+	mult &= clk_div_mask(MPFS_CCC_FBDIV_WIDTH);
+	ref_div = readl_relaxed(ref_div_addr) >> MPFS_CCC_REFDIV_SHIFT;
+	ref_div &= clk_div_mask(MPFS_CCC_REFDIV_WIDTH);
+
+	return prate * mult / (ref_div * MPFS_CCC_FIXED_DIV);
+}
+
+static u8 mpfs_ccc_pll_get_parent(struct clk_hw *hw)
+{
+	struct mpfs_ccc_pll_hw_clock *ccc_hw = to_mpfs_ccc_clk(hw);
+	void __iomem *pll_cr_addr = ccc_hw->base + MPFS_CCC_PLL_CR;
+
+	return !!(readl_relaxed(pll_cr_addr) & MPFS_CCC_REFCLK_SEL);
+}
+
+static const struct clk_ops mpfs_ccc_pll_ops = {
+	.recalc_rate = mpfs_ccc_pll_recalc_rate,
+	.get_parent = mpfs_ccc_pll_get_parent,
+};
+
+#define CLK_CCC_PLL(_id, _parents, _shift, _width, _flags, _offset) {		\
+	.id = _id,									\
+	.shift = _shift,								\
+	.width = _width,								\
+	.reg_offset = _offset,								\
+	.flags = _flags,								\
+	.parents = _parents,\
+}
+
+static struct mpfs_ccc_pll_hw_clock mpfs_ccc_pll_clks[] = {
+	CLK_CCC_PLL(CLK_CCC_PLL0, mpfs_ccc_pll0_refs, MPFS_CCC_FBDIV_SHIFT,
+		    MPFS_CCC_FBDIV_WIDTH, 0, MPFS_CCC_SSCG_2_CR),
+	CLK_CCC_PLL(CLK_CCC_PLL1, mpfs_ccc_pll1_refs, MPFS_CCC_FBDIV_SHIFT,
+		    MPFS_CCC_FBDIV_WIDTH, 0, MPFS_CCC_SSCG_2_CR),
+};
+
+struct mpfs_ccc_out_hw_clock {
+	struct clk_divider divider;
+	struct clk_init_data init;
+	unsigned int id;
+	u32 reg_offset;
+};
+
+#define CLK_CCC_OUT(_id, _shift, _width, _flags, _offset) {	\
+	.id = _id,						\
+	.divider.shift = _shift,				\
+	.divider.width = _width,				\
+	.reg_offset = _offset,					\
+	.divider.flags = _flags,				\
+	.divider.lock = &mpfs_ccc_lock,				\
+}
+
+static struct mpfs_ccc_out_hw_clock mpfs_ccc_pll0out_clks[] = {
+	CLK_CCC_OUT(CLK_CCC_PLL0_OUT0, MPFS_CCC_POSTDIV0_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
+		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV01_CR),
+	CLK_CCC_OUT(CLK_CCC_PLL0_OUT1, MPFS_CCC_POSTDIV1_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
+		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV01_CR),
+	CLK_CCC_OUT(CLK_CCC_PLL0_OUT2, MPFS_CCC_POSTDIV2_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
+		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV23_CR),
+	CLK_CCC_OUT(CLK_CCC_PLL0_OUT3, MPFS_CCC_POSTDIV3_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
+		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV23_CR),
+};
+
+static struct mpfs_ccc_out_hw_clock mpfs_ccc_pll1out_clks[] = {
+	CLK_CCC_OUT(CLK_CCC_PLL1_OUT0, MPFS_CCC_POSTDIV0_SHIFT, MPFS_CCC_POSTDIV_WIDTH, 0,
+		    MPFS_CCC_POSTDIV01_CR),
+	CLK_CCC_OUT(CLK_CCC_PLL1_OUT1, MPFS_CCC_POSTDIV1_SHIFT, MPFS_CCC_POSTDIV_WIDTH, 0,
+		    MPFS_CCC_POSTDIV01_CR),
+	CLK_CCC_OUT(CLK_CCC_PLL1_OUT2, MPFS_CCC_POSTDIV2_SHIFT, MPFS_CCC_POSTDIV_WIDTH, 0,
+		    MPFS_CCC_POSTDIV23_CR),
+	CLK_CCC_OUT(CLK_CCC_PLL1_OUT3, MPFS_CCC_POSTDIV3_SHIFT, MPFS_CCC_POSTDIV_WIDTH, 0,
+		    MPFS_CCC_POSTDIV23_CR),
+};
+
+static struct mpfs_ccc_out_hw_clock *mpfs_ccc_pllout_clks[] = {
+	mpfs_ccc_pll0out_clks, mpfs_ccc_pll1out_clks
+};
+
+static int mpfs_ccc_register_outputs(struct device *dev, struct mpfs_ccc_out_hw_clock *out_hws,
+				     unsigned int num_clks, struct mpfs_ccc_data *data,
+				     struct mpfs_ccc_pll_hw_clock *parent)
+{
+	int ret;
+
+	for (unsigned int i = 0; i < num_clks; i++) {
+		struct mpfs_ccc_out_hw_clock *out_hw = &out_hws[i];
+		char *name = devm_kzalloc(dev, 13, GFP_KERNEL);
+
+		snprintf(name, 19, "%s_out%u", parent->name, i);
+		out_hw->divider.hw.init = CLK_HW_INIT_HW(name, &parent->hw, &clk_divider_ops, 0);
+		out_hw->divider.reg = data->pll_base[i / MPFS_CCC_OUTPUTS_PER_PLL] +
+			out_hw->reg_offset;
+
+		ret = devm_clk_hw_register(dev, &out_hw->divider.hw);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
+					     out_hw->id);
+
+		data->hw_data.hws[out_hw->id] = &out_hw->divider.hw;
+	}
+
+	return 0;
+}
+
+#define CLK_HW_INIT_PARENTS_DATA_FIXED_SIZE(_name, _parents, _ops, _flags)	\
+	(&(struct clk_init_data) {						\
+		.flags		= _flags,					\
+		.name		= _name,					\
+		.parent_data	= _parents,					\
+		.num_parents	= MPFS_CCC_REFS_PER_PLL,			\
+		.ops		= _ops,						\
+	})
+
+static int mpfs_ccc_register_plls(struct device *dev, struct mpfs_ccc_pll_hw_clock *pll_hws,
+				  unsigned int num_clks, struct mpfs_ccc_data *data)
+{
+	int ret;
+
+	for (unsigned int i = 0; i < num_clks; i++) {
+		struct mpfs_ccc_pll_hw_clock *pll_hw = &pll_hws[i];
+		char *name = devm_kzalloc(dev, 8, GFP_KERNEL);
+
+		snprintf(name, 14, "%s_pll%u", dev->of_node->name, i);
+		pll_hw->name = (const char *)name;
+		pll_hw->base = data->pll_base[i];
+		pll_hw->hw.init = CLK_HW_INIT_PARENTS_DATA_FIXED_SIZE(pll_hw->name,
+								      pll_hw->parents,
+								      &mpfs_ccc_pll_ops, 0);
+
+		ret = devm_clk_hw_register(dev, &pll_hw->hw);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register ccc id: %d\n",
+					     pll_hw->id);
+
+		data->hw_data.hws[pll_hw->id] = &pll_hw->hw;
+
+		ret = mpfs_ccc_register_outputs(dev, mpfs_ccc_pllout_clks[i],
+						MPFS_CCC_OUTPUTS_PER_PLL, data, pll_hw);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int mpfs_ccc_probe(struct platform_device *pdev)
+{
+	struct mpfs_ccc_data *clk_data;
+	void __iomem *pll_base[ARRAY_SIZE(mpfs_ccc_pll_clks)];
+	unsigned int num_clks;
+	int ret;
+
+	num_clks = ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pll0out_clks)
+		+ ARRAY_SIZE(mpfs_ccc_pll1out_clks);
+
+	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, num_clks),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	pll_base[0] = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pll_base[0]))
+		return PTR_ERR(pll_base[0]);
+
+	pll_base[1] = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(pll_base[1]))
+		return PTR_ERR(pll_base[1]);
+
+	clk_data->pll_base = pll_base;
+
+	clk_data->dev = &pdev->dev;
+
+	ret = mpfs_ccc_register_plls(clk_data->dev, mpfs_ccc_pll_clks,
+				     ARRAY_SIZE(mpfs_ccc_pll_clks), clk_data);
+	if (ret)
+		return ret;
+
+	ret = devm_of_clk_add_hw_provider(clk_data->dev, of_clk_hw_onecell_get,
+					  &clk_data->hw_data);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static const struct of_device_id mpfs_ccc_of_match_table[] = {
+	{ .compatible = "microchip,mpfs-ccc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mpfs_ccc_of_match_table);
+
+static struct platform_driver mpfs_ccc_driver = {
+	.probe = mpfs_ccc_probe,
+	.driver	= {
+		.name = "microchip-mpfs-ccc",
+		.of_match_table = mpfs_ccc_of_match_table,
+	},
+};
+
+static int __init clk_ccc_init(void)
+{
+	return platform_driver_register(&mpfs_ccc_driver);
+}
+core_initcall(clk_ccc_init);
+
+static void __exit clk_ccc_exit(void)
+{
+	platform_driver_unregister(&mpfs_ccc_driver);
+}
+module_exit(clk_ccc_exit);
+
+MODULE_DESCRIPTION("Microchip PolarFire SoC Clock Conditioning Circuitry Driver");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_LICENSE("GPL");
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
