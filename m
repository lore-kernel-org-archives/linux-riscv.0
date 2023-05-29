Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0B9C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1NwJyVV/7W5Xd53s36T/HavRKpupS13fNkD23vOa6Q=; b=Xd9HYrCNcj/8Hz
	CWxO/JxWKdndZBlgjqVerIjbFj4jYmn6nr7BUQQKOr5xKZDQdsrEUCXcphylh8lcYvgWoKpDdcIbk
	X2AdL3GVou5yRY7sUBW57RjB1cWRkf4fpbuTVQ/4d7omkUt8TdTK0D+OZu4EvE3UOAqPk8UVb70N9
	nQLJVP0xIoZJOT6Io4RnhxsdJfKtFC1aMUFY2BSkrEwrldpTFc7ezPaQnpmRQWcD/FwbFBrQ1NBdY
	Z1ivje5refdElCp6LFXYciKzA4mcxMr+LS6x8qbLbTQ+buPAGInaNF3MJC4cEiok2efwxU5BaRRfo
	x/9lSj7APnbG5uyAwZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3bn4-00AOOD-2b;
	Mon, 29 May 2023 12:15:58 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3bmx-00AOJ0-0I;
	Mon, 29 May 2023 12:15:54 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8C8CF7FFE;
	Mon, 29 May 2023 20:15:08 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 29 May
 2023 20:15:07 +0800
Received: from ubuntu.localdomain (113.72.147.198) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 29 May
 2023 20:15:07 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: Jack Zhu <jack.zhu@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v5 2/3] phy: starfive: Add mipi dphy rx support
Date: Mon, 29 May 2023 05:15:02 -0700
Message-ID: <20230529121503.3544-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529121503.3544-1-changhuang.liang@starfivetech.com>
References: <20230529121503.3544-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.147.198]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_051551_643807_F76EBBD3 
X-CRM114-Status: GOOD (  22.65  )
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

Add mipi dphy rx support for the StarFive JH7110 SoC. It is used to
transfer CSI camera data.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                 |   7 +
 drivers/phy/Kconfig                         |   1 +
 drivers/phy/Makefile                        |   1 +
 drivers/phy/starfive/Kconfig                |  13 +
 drivers/phy/starfive/Makefile               |   2 +
 drivers/phy/starfive/phy-starfive-dphy-rx.c | 300 ++++++++++++++++++++
 6 files changed, 324 insertions(+)
 create mode 100644 drivers/phy/starfive/Kconfig
 create mode 100644 drivers/phy/starfive/Makefile
 create mode 100644 drivers/phy/starfive/phy-starfive-dphy-rx.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 92c7076c4fed..a5fac3f015b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20092,6 +20092,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
 
+STARFIVE JH7110 DPHY RX DRIVER
+M:	Jack Zhu <jack.zhu@starfivetech.com>
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
+F:	drivers/phy/starfive/phy-starfive-dphy-rx.c
+
 STARFIVE JH7110 MMC/SD/SDIO DRIVER
 M:	William Qiu <william.qiu@starfivetech.com>
 S:	Supported
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index f46e3148d286..0000149edbc4 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -91,6 +91,7 @@ source "drivers/phy/rockchip/Kconfig"
 source "drivers/phy/samsung/Kconfig"
 source "drivers/phy/socionext/Kconfig"
 source "drivers/phy/st/Kconfig"
+source "drivers/phy/starfive/Kconfig"
 source "drivers/phy/sunplus/Kconfig"
 source "drivers/phy/tegra/Kconfig"
 source "drivers/phy/ti/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index 54f312c10a40..fb3dc9de6111 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -31,6 +31,7 @@ obj-y					+= allwinner/	\
 					   samsung/	\
 					   socionext/	\
 					   st/		\
+					   starfive/	\
 					   sunplus/	\
 					   tegra/	\
 					   ti/		\
diff --git a/drivers/phy/starfive/Kconfig b/drivers/phy/starfive/Kconfig
new file mode 100644
index 000000000000..f989b8ff8bcb
--- /dev/null
+++ b/drivers/phy/starfive/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for StarFive platforms
+#
+
+config PHY_STARFIVE_DPHY_RX
+	tristate "StarFive D-PHY RX Support"
+	select GENERIC_PHY
+	select GENERIC_PHY_MIPI_DPHY
+	help
+	  Choose this option if you have a StarFive D-PHY in your
+	  system. If M is selected, the module will be called
+	  phy-starfive-dphy-rx.
diff --git a/drivers/phy/starfive/Makefile b/drivers/phy/starfive/Makefile
new file mode 100644
index 000000000000..7ec576cb30ae
--- /dev/null
+++ b/drivers/phy/starfive/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_STARFIVE_DPHY_RX)      += phy-starfive-dphy-rx.o
diff --git a/drivers/phy/starfive/phy-starfive-dphy-rx.c b/drivers/phy/starfive/phy-starfive-dphy-rx.c
new file mode 100644
index 000000000000..6974ed904d0d
--- /dev/null
+++ b/drivers/phy/starfive/phy-starfive-dphy-rx.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DPHY driver for the StarFive JH7110 SoC
+ *
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#define STF_DPHY_APBCFGSAIF_SYSCFG(x)		(x)
+
+#define STF_DPHY_DA_CDPHY_R100_CTRL0_2D1C_EFUSE_EN BIT(6)
+#define STF_DPHY_DA_CDPHY_R100_CTRL0_2D1C_EFUSE_IN GENMASK(12, 7)
+#define STF_DPHY_DA_CDPHY_R100_CTRL1_2D1C_EFUSE_EN BIT(19)
+#define STF_DPHY_DA_CDPHY_R100_CTRL1_2D1C_EFUSE_IN GENMASK(25, 20)
+
+#define STF_DPHY_DATA_BUS16_8			BIT(8)
+#define STF_DPHY_DEBUG_MODE_SEL			GENMASK(15, 9)
+
+#define STF_DPHY_ENABLE_CLK			BIT(6)
+#define STF_DPHY_ENABLE_CLK1			BIT(7)
+#define STF_DPHY_ENABLE_LAN0			BIT(8)
+#define STF_DPHY_ENABLE_LAN1			BIT(9)
+#define STF_DPHY_ENABLE_LAN2			BIT(10)
+#define STF_DPHY_ENABLE_LAN3			BIT(11)
+#define STF_DPHY_GPI_EN				GENMASK(17, 12)
+#define STF_DPHY_HS_FREQ_CHANGE_CLK		BIT(18)
+#define STF_DPHY_HS_FREQ_CHANGE_CLK1		BIT(19)
+#define STF_DPHY_LANE_SWAP_CLK			GENMASK(22, 20)
+#define STF_DPHY_LANE_SWAP_CLK1			GENMASK(25, 23)
+#define STF_DPHY_LANE_SWAP_LAN0			GENMASK(28, 26)
+#define STF_DPHY_LANE_SWAP_LAN1			GENMASK(31, 29)
+
+#define STF_DPHY_LANE_SWAP_LAN2			GENMASK(2, 0)
+#define STF_DPHY_LANE_SWAP_LAN3			GENMASK(5, 3)
+#define STF_DPHY_MP_TEST_EN			BIT(6)
+#define STF_DPHY_MP_TEST_MODE_SEL		GENMASK(11, 7)
+#define STF_DPHY_PLL_CLK_SEL			GENMASK(21, 12)
+#define STF_DPHY_PRECOUNTER_IN_CLK		GENMASK(29, 22)
+
+#define STF_DPHY_PRECOUNTER_IN_CLK1		GENMASK(7, 0)
+#define STF_DPHY_PRECOUNTER_IN_LAN0		GENMASK(15, 8)
+#define STF_DPHY_PRECOUNTER_IN_LAN1		GENMASK(23, 16)
+#define STF_DPHY_PRECOUNTER_IN_LAN2		GENMASK(31, 24)
+
+#define STF_DPHY_PRECOUNTER_IN_LAN3		GENMASK(7, 0)
+#define STF_DPHY_RX_1C2C_SEL			BIT(8)
+
+#define STF_MAP_LANES_NUM			6
+
+struct regval {
+	u32 addr;
+	u32 val;
+};
+
+struct stf_dphy_info {
+	/**
+	 * @maps:
+	 *
+	 * Physical lanes and logic lanes mapping table.
+	 *
+	 * The default order is:
+	 * [clk lane0, data lane 0, data lane 1, data lane 2, date lane 3, clk lane 1]
+	 */
+	u8 maps[STF_MAP_LANES_NUM];
+};
+
+struct stf_dphy {
+	struct device *dev;
+	void __iomem *regs;
+	struct clk *cfg_clk;
+	struct clk *ref_clk;
+	struct clk *tx_clk;
+	struct reset_control *rstc;
+	struct regulator *mipi_0p9;
+	struct phy *phy;
+	const struct stf_dphy_info *info;
+};
+
+static const struct regval stf_dphy_init_list[] = {
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(4), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(8), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(12), 0x0000fff0 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(16), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(20), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(24), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(28), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(32), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(36), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(40), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(40), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(48), 0x24000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(52), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(56), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(60), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(64), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(68), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(72), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(76), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(80), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(84), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(88), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(92), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(96), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(100), 0x02000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(104), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(108), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(112), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(116), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(120), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(124), 0x0000000c },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(128), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(132), 0xcc500000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(136), 0x000000cc },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(140), 0x00000000 },
+	{ STF_DPHY_APBCFGSAIF_SYSCFG(144), 0x00000000 },
+};
+
+static int stf_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct stf_dphy *dphy = phy_get_drvdata(phy);
+	const struct stf_dphy_info *info = dphy->info;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(stf_dphy_init_list); i++)
+		writel(stf_dphy_init_list[i].val,
+		       dphy->regs + stf_dphy_init_list[i].addr);
+
+	writel(FIELD_PREP(STF_DPHY_DA_CDPHY_R100_CTRL0_2D1C_EFUSE_EN, 1) |
+	       FIELD_PREP(STF_DPHY_DA_CDPHY_R100_CTRL0_2D1C_EFUSE_IN, 0x1b) |
+	       FIELD_PREP(STF_DPHY_DA_CDPHY_R100_CTRL1_2D1C_EFUSE_EN, 1) |
+	       FIELD_PREP(STF_DPHY_DA_CDPHY_R100_CTRL1_2D1C_EFUSE_IN, 0x1b),
+	       dphy->regs + STF_DPHY_APBCFGSAIF_SYSCFG(0));
+
+	writel(FIELD_PREP(STF_DPHY_DATA_BUS16_8, 0) |
+	       FIELD_PREP(STF_DPHY_DEBUG_MODE_SEL, 0x5a),
+	       dphy->regs + STF_DPHY_APBCFGSAIF_SYSCFG(184));
+
+	writel(FIELD_PREP(STF_DPHY_ENABLE_CLK, 1) |
+	       FIELD_PREP(STF_DPHY_ENABLE_CLK1, 1) |
+	       FIELD_PREP(STF_DPHY_ENABLE_LAN0, 1) |
+	       FIELD_PREP(STF_DPHY_ENABLE_LAN1, 1) |
+	       FIELD_PREP(STF_DPHY_ENABLE_LAN2, 1) |
+	       FIELD_PREP(STF_DPHY_ENABLE_LAN3, 1) |
+	       FIELD_PREP(STF_DPHY_GPI_EN, 0) |
+	       FIELD_PREP(STF_DPHY_HS_FREQ_CHANGE_CLK, 0) |
+	       FIELD_PREP(STF_DPHY_HS_FREQ_CHANGE_CLK1, 0) |
+	       FIELD_PREP(STF_DPHY_LANE_SWAP_CLK, info->maps[0]) |
+	       FIELD_PREP(STF_DPHY_LANE_SWAP_CLK1, info->maps[5]) |
+	       FIELD_PREP(STF_DPHY_LANE_SWAP_LAN0, info->maps[1]) |
+	       FIELD_PREP(STF_DPHY_LANE_SWAP_LAN1, info->maps[2]),
+	       dphy->regs + STF_DPHY_APBCFGSAIF_SYSCFG(188));
+
+	writel(FIELD_PREP(STF_DPHY_LANE_SWAP_LAN2, info->maps[3]) |
+	       FIELD_PREP(STF_DPHY_LANE_SWAP_LAN3, info->maps[4]) |
+	       FIELD_PREP(STF_DPHY_MP_TEST_EN, 0) |
+	       FIELD_PREP(STF_DPHY_MP_TEST_MODE_SEL, 0) |
+	       FIELD_PREP(STF_DPHY_PLL_CLK_SEL, 0x37c) |
+	       FIELD_PREP(STF_DPHY_PRECOUNTER_IN_CLK, 8),
+	       dphy->regs + STF_DPHY_APBCFGSAIF_SYSCFG(192));
+
+	writel(FIELD_PREP(STF_DPHY_PRECOUNTER_IN_CLK1, 8) |
+	       FIELD_PREP(STF_DPHY_PRECOUNTER_IN_LAN0, 7) |
+	       FIELD_PREP(STF_DPHY_PRECOUNTER_IN_LAN1, 7) |
+	       FIELD_PREP(STF_DPHY_PRECOUNTER_IN_LAN2, 7),
+	       dphy->regs + STF_DPHY_APBCFGSAIF_SYSCFG(196));
+
+	writel(FIELD_PREP(STF_DPHY_PRECOUNTER_IN_LAN3, 7) |
+	       FIELD_PREP(STF_DPHY_RX_1C2C_SEL, 0),
+	       dphy->regs + STF_DPHY_APBCFGSAIF_SYSCFG(200));
+
+	return 0;
+}
+
+static int stf_dphy_power_on(struct phy *phy)
+{
+	struct stf_dphy *dphy = phy_get_drvdata(phy);
+	int ret;
+
+	pm_runtime_get_sync(dphy->dev);
+
+	ret = regulator_enable(dphy->mipi_0p9);
+	if (ret)
+		return ret;
+
+	clk_set_rate(dphy->cfg_clk, 99000000);
+	clk_set_rate(dphy->ref_clk, 49500000);
+	clk_set_rate(dphy->tx_clk, 19800000);
+	reset_control_deassert(dphy->rstc);
+
+	return 0;
+}
+
+static int stf_dphy_power_off(struct phy *phy)
+{
+	struct stf_dphy *dphy = phy_get_drvdata(phy);
+
+	reset_control_assert(dphy->rstc);
+
+	regulator_disable(dphy->mipi_0p9);
+
+	pm_runtime_put_sync(dphy->dev);
+
+	return 0;
+}
+
+static const struct phy_ops stf_dphy_ops = {
+	.configure = stf_dphy_configure,
+	.power_on  = stf_dphy_power_on,
+	.power_off = stf_dphy_power_off,
+};
+
+static int stf_dphy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct stf_dphy *dphy;
+
+	dphy = devm_kzalloc(&pdev->dev, sizeof(*dphy), GFP_KERNEL);
+	if (!dphy)
+		return -ENOMEM;
+
+	dphy->info = of_device_get_match_data(&pdev->dev);
+
+	dev_set_drvdata(&pdev->dev, dphy);
+	dphy->dev = &pdev->dev;
+
+	dphy->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dphy->regs))
+		return PTR_ERR(dphy->regs);
+
+	dphy->cfg_clk = devm_clk_get(&pdev->dev, "cfg");
+	if (IS_ERR(dphy->cfg_clk))
+		return PTR_ERR(dphy->cfg_clk);
+
+	dphy->ref_clk = devm_clk_get(&pdev->dev, "ref");
+	if (IS_ERR(dphy->ref_clk))
+		return PTR_ERR(dphy->ref_clk);
+
+	dphy->tx_clk = devm_clk_get(&pdev->dev, "tx");
+	if (IS_ERR(dphy->tx_clk))
+		return PTR_ERR(dphy->tx_clk);
+
+	dphy->rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
+	if (IS_ERR(dphy->rstc))
+		return PTR_ERR(dphy->rstc);
+
+	dphy->mipi_0p9 = devm_regulator_get(&pdev->dev, "mipi_0p9");
+	if (IS_ERR(dphy->mipi_0p9))
+		return PTR_ERR(dphy->mipi_0p9);
+
+	dphy->phy = devm_phy_create(&pdev->dev, NULL, &stf_dphy_ops);
+	if (IS_ERR(dphy->phy)) {
+		dev_err(&pdev->dev, "Failed to create PHY\n");
+		return PTR_ERR(dphy->phy);
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	phy_set_drvdata(dphy->phy, dphy);
+	phy_provider = devm_of_phy_provider_register(&pdev->dev,
+						     of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct stf_dphy_info starfive_dphy_info = {
+	.maps = {4, 0, 1, 2, 3, 5},
+};
+
+static const struct of_device_id stf_dphy_dt_ids[] = {
+	{
+		.compatible = "starfive,jh7110-dphy-rx",
+		.data = &starfive_dphy_info,
+	},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, stf_dphy_dt_ids);
+
+static struct platform_driver stf_dphy_driver = {
+	.probe = stf_dphy_probe,
+	.driver = {
+		.name	= "starfive-dphy-rx",
+		.of_match_table = stf_dphy_dt_ids,
+	},
+};
+module_platform_driver(stf_dphy_driver);
+
+MODULE_AUTHOR("Jack Zhu <jack.zhu@starfivetech.com>");
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive DPHY RX driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
