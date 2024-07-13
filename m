Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8A4C3DA45
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jul 2024 22:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2gQQuf3/asUtzacayq/+RHFuMXWSSHNzqQ6mowJ/MQ=; b=G16bNyrJpYGAzK
	tYvvNKgKnvT2/e/R+ry1nOXWn+YkQKcMXJ7NnHJaTV441x5SYY7dh/rWb/tVB1OYsI/np5nj2hmTn
	I446JgBYTnwPk3sCJFji5/20v63FwKm8HLFW/kO0B+mdIdqIwAVKicQkAFEj7GSqs19nqKR+9uWdJ
	daZKc6209+PEAMLDXO6oJFpvLQTy5oQFB1wauvOgxUIq2yHlPUH/bLyPySZrUuX+ZhXGy0cGqgzZA
	ICY8GCW1Ldmi88XQUYA5DewsEWV9FYH2PZqx1H5GAdHmtpzp4zRZzd1IFj5fcpnNjA3EEZYrngXuU
	qWNijjR+PHe/6W0CZs0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSlLo-00000003Isw-35P7;
	Sat, 13 Jul 2024 22:36:20 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSlKw-00000003ISB-2lkU
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jul 2024 22:35:28 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3d9db222782so1866771b6e.3
        for <linux-riscv@lists.infradead.org>; Sat, 13 Jul 2024 15:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720910125; x=1721514925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxcXi7NdNekPLYVDwNRh//Z2yxL04R6rwZHieCVOn5A=;
        b=xZe0K+wWEhL2j9T0lf2ULfFKCr9f3DVjHrue3yMbWUJDGE3iP2CS4SoeXo9WnhaxeQ
         +0jlzrWSuxSkyd1mxnKYrc7Bx9zTwBjJR7yaW2+cQxLIv+yy2ATtSx2PaSC6QH//MB1A
         yKhVKpZi8MPNw+5VQGA9G0JlNvxr0+n4O4VLADjy4R4tg/TKnBQ0kX2TOfOFjonyUZXG
         WMQ/wqNv53vbAo/fZvawZXuR4Lso9cvG/TpG/Ac0B4bsW/TH0Jht7kw2s3ADzteKHvgh
         XQWpzmwwT23Vg+mFoNYRRUogY+IY1odjiSPwIZjiQLP/MFURSGu5OpdTPPbpu4C5dg/Q
         kJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720910125; x=1721514925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxcXi7NdNekPLYVDwNRh//Z2yxL04R6rwZHieCVOn5A=;
        b=TzODn2rWRQRgSY7pkaFnihChXPPfgkLeieI6Uuv2CY243PSQN702kaYd95qQBn4+Ct
         nSItS2++0E2yqSe6KIXW14AisoDW39xEJBjm6XwCbOb6k95p1QCjp1pEEqm3gKiBM8BN
         XxQI0yOB9FwlLINcw2WSSj7zDVSKR4+EkfTDyHuLGhCxCGXo1lCtqK38h589E07NEySF
         XVfu2kmb0k+q34HZIUQOoWnVDBjBrn/txfCr3V7XgJxPYSGMT7Bhc6bHDYuf26u5hD8G
         mjZIv7mXMpfaJoMFFfI1NNd9Ht2WBV5QAa1PdddDywgHGray+XYGgwhoZUzYMilOGVOl
         WwxA==
X-Forwarded-Encrypted: i=1; AJvYcCVFDvzpCYv5cHBoNz3fjSlg7uOj+efWq+IbEtvIjogAnU0Y9D6MqWfMnl+y/atSdbs2VMkWNTWsYeluwJ93yzzO2LjeK9XHwO+pkstuiQsr
X-Gm-Message-State: AOJu0Yzurxp/G2VDgsiiV2tTz4WmPqDdYXJZz8EbCN+WOftOObA82Q/M
	IIfpeghcL/iVsvyGzns/mR8XfI18LSw9BkT/7NsEp88Otv4LLr1tH9Z7w85bzIE=
X-Google-Smtp-Source: AGHT+IGC6e6E4K6/IAZSwMYQqIInqL2PX4aVPcqzv6ekRwJScTIvLtBEafckxBXBT3eQrxK7SURAkA==
X-Received: by 2002:a05:6808:189b:b0:3d9:2b15:65d4 with SMTP id 5614622812f47-3d93c01937bmr17474047b6e.21.1720910125460;
        Sat, 13 Jul 2024 15:35:25 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:d7fc:57d0:ada6:13b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc4d9d8sm14640025ad.264.2024.07.13.15.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 15:35:25 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Sat, 13 Jul 2024 15:35:12 -0700
Subject: [PATCH RFC net-next 3/4] net: stmmac: add glue layer for T-HEAD
 TH1520 SoC
MIME-Version: 1.0
Message-Id: <20240713-thead-dwmac-v1-3-81f04480cd31@tenstorrent.com>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
In-Reply-To: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720910119; l=11652;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=E3AC2G47Ix6UzDcEHy3fI7MDOIXOWOddF4EcXRil+6w=;
 b=elEsSv8/lccNPQbHia9lGD4uvQZFjLjPAAphiARVOcr+eKdlEEgWdBPpp39/Auusjasbg4+s1
 9JtIZk8LXAaBw1etvRt+vQzUzhAp5o0eCfKGACDGRlsrJg9dG6kCW/e
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_153526_883903_5EFCD101 
X-CRM114-Status: GOOD (  21.68  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Add dwmac glue driver to support the dwmac on the T-HEAD TH1520 SoC.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Link: https://lore.kernel.org/r/20230827091710.1483-4-jszhang@kernel.org
[esmil: rename plat->interface -> plat->mac_interface,
        use devm_stmmac_probe_config_dt()]
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: change apb registers from syscon to second reg of gmac node]
Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 MAINTAINERS                                       |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig       |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile      |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 300 ++++++++++++++++++++++
 4 files changed, 313 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c724c2c4e06c..11fc14e406c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19322,6 +19322,7 @@ F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
 F:	Documentation/devicetree/bindings/net/thead,dwmac.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	drivers/pinctrl/pinctrl-th1520.c
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 05cc07b8f48c..82030adaf16e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -228,6 +228,17 @@ config DWMAC_SUN8I
 	  stmmac device driver. This driver is used for H3/A83T/A64
 	  EMAC ethernet controller.
 
+config DWMAC_THEAD
+	tristate "T-HEAD dwmac support"
+	depends on OF && (ARCH_THEAD || COMPILE_TEST)
+	select MFD_SYSCON
+	help
+	  Support for ethernet controllers on T-HEAD RISC-V SoCs
+
+	  This selects the T-HEAD platform specific glue layer support for
+	  the stmmac device driver. This driver is used for T-HEAD TH1520
+	  ethernet controller.
+
 config DWMAC_IMX8
 	tristate "NXP IMX8 DWMAC support"
 	default ARCH_MXC
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index c2f0e91f6bf8..d065634c6223 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
 obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
 obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
+obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
 obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
 obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
 obj-$(CONFIG_DWMAC_LOONGSON1)	+= dwmac-loongson1.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
new file mode 100644
index 000000000000..809e75dc51d5
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * T-HEAD DWMAC platform driver
+ *
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_net.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "stmmac_platform.h"
+
+#define GMAC_CLK_EN			0x00
+#define  GMAC_TX_CLK_EN			BIT(1)
+#define  GMAC_TX_CLK_N_EN		BIT(2)
+#define  GMAC_TX_CLK_OUT_EN		BIT(3)
+#define  GMAC_RX_CLK_EN			BIT(4)
+#define  GMAC_RX_CLK_N_EN		BIT(5)
+#define  GMAC_EPHY_REF_CLK_EN		BIT(6)
+#define GMAC_RXCLK_DELAY_CTRL		0x04
+#define  GMAC_RXCLK_BYPASS		BIT(15)
+#define  GMAC_RXCLK_INVERT		BIT(14)
+#define  GMAC_RXCLK_DELAY_MASK		GENMASK(4, 0)
+#define  GMAC_RXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
+#define GMAC_TXCLK_DELAY_CTRL		0x08
+#define  GMAC_TXCLK_BYPASS		BIT(15)
+#define  GMAC_TXCLK_INVERT		BIT(14)
+#define  GMAC_TXCLK_DELAY_MASK		GENMASK(4, 0)
+#define  GMAC_TXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
+#define GMAC_PLLCLK_DIV			0x0c
+#define  GMAC_PLLCLK_DIV_EN		BIT(31)
+#define  GMAC_PLLCLK_DIV_MASK		GENMASK(7, 0)
+#define  GMAC_PLLCLK_DIV_NUM(x)		FIELD_PREP(GMAC_PLLCLK_DIV_MASK, (x))
+#define GMAC_GTXCLK_SEL			0x18
+#define  GMAC_GTXCLK_SEL_PLL		BIT(0)
+#define GMAC_INTF_CTRL			0x1c
+#define  PHY_INTF_MASK			BIT(0)
+#define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
+#define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
+#define GMAC_TXCLK_OEN			0x20
+#define  TXCLK_DIR_MASK			BIT(0)
+#define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
+#define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
+
+#define GMAC_GMII_RGMII_RATE	125000000
+#define GMAC_MII_RATE		25000000
+
+static const struct regmap_config regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+struct thead_dwmac {
+	struct plat_stmmacenet_data *plat;
+	struct regmap *apb_regmap;
+	struct device *dev;
+	u32 rx_delay;
+	u32 tx_delay;
+};
+
+static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
+{
+	struct thead_dwmac *dwmac = plat->bsp_priv;
+	u32 phyif;
+
+	switch (plat->mac_interface) {
+	case PHY_INTERFACE_MODE_MII:
+		phyif = PHY_INTF_MII_GMII;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		phyif = PHY_INTF_RGMII;
+		break;
+	default:
+		dev_err(dwmac->dev, "unsupported phy interface %d\n",
+			plat->mac_interface);
+		return -EINVAL;
+	};
+
+	regmap_write(dwmac->apb_regmap, GMAC_INTF_CTRL, phyif);
+
+	return 0;
+}
+
+static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
+{
+	struct thead_dwmac *dwmac = plat->bsp_priv;
+	u32 txclk_dir;
+
+	switch (plat->mac_interface) {
+	case PHY_INTERFACE_MODE_MII:
+		txclk_dir = TXCLK_DIR_INPUT;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		txclk_dir = TXCLK_DIR_OUTPUT;
+		break;
+	default:
+		dev_err(dwmac->dev, "unsupported phy interface %d\n",
+			plat->mac_interface);
+		return -EINVAL;
+	};
+
+	regmap_write(dwmac->apb_regmap, GMAC_TXCLK_OEN, txclk_dir);
+
+	return 0;
+}
+
+static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
+{
+	struct thead_dwmac *dwmac = priv;
+	struct plat_stmmacenet_data *plat = dwmac->plat;
+	unsigned long rate;
+	u32 div;
+
+	switch (plat->mac_interface) {
+	/* For MII, rxc/txc is provided by phy */
+	case PHY_INTERFACE_MODE_MII:
+		return;
+
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		rate = clk_get_rate(plat->stmmac_clk);
+		if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
+		    rate % GMAC_MII_RATE != 0) {
+			dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
+			return;
+		}
+
+		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV, GMAC_PLLCLK_DIV_EN, 0);
+
+		switch (speed) {
+		case SPEED_1000:
+			div = rate / GMAC_GMII_RGMII_RATE;
+			break;
+		case SPEED_100:
+			div = rate / GMAC_MII_RATE;
+			break;
+		case SPEED_10:
+			div = rate * 10 / GMAC_MII_RATE;
+			break;
+		default:
+			dev_err(dwmac->dev, "invalid speed %u\n", speed);
+			return;
+		}
+		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
+				   GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
+
+		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
+				   GMAC_PLLCLK_DIV_EN, GMAC_PLLCLK_DIV_EN);
+		break;
+	default:
+		dev_err(dwmac->dev, "unsupported phy interface %d\n",
+			plat->mac_interface);
+		return;
+	}
+}
+
+static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
+{
+	struct thead_dwmac *dwmac = plat->bsp_priv;
+	u32 reg;
+
+	switch (plat->mac_interface) {
+	case PHY_INTERFACE_MODE_MII:
+		reg = GMAC_RX_CLK_EN | GMAC_TX_CLK_EN;
+		break;
+
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		/* use pll */
+		regmap_write(dwmac->apb_regmap, GMAC_GTXCLK_SEL, GMAC_GTXCLK_SEL_PLL);
+
+		reg = GMAC_TX_CLK_EN | GMAC_TX_CLK_N_EN | GMAC_TX_CLK_OUT_EN |
+		      GMAC_RX_CLK_EN | GMAC_RX_CLK_N_EN;
+		break;
+
+	default:
+		dev_err(dwmac->dev, "unsupported phy interface %d\n",
+			plat->mac_interface);
+		return -EINVAL;
+	}
+
+	regmap_write(dwmac->apb_regmap, GMAC_CLK_EN, reg);
+
+	return 0;
+}
+
+static int thead_dwmac_init(struct platform_device *pdev,
+			    struct plat_stmmacenet_data *plat)
+{
+	struct thead_dwmac *dwmac = plat->bsp_priv;
+	int ret;
+
+	ret = thead_dwmac_set_phy_if(plat);
+	if (ret)
+		return ret;
+
+	ret = thead_dwmac_set_txclk_dir(plat);
+	if (ret)
+		return ret;
+
+	regmap_write(dwmac->apb_regmap, GMAC_RXCLK_DELAY_CTRL,
+		     GMAC_RXCLK_DELAY_VAL(dwmac->rx_delay));
+	regmap_write(dwmac->apb_regmap, GMAC_TXCLK_DELAY_CTRL,
+		     GMAC_TXCLK_DELAY_VAL(dwmac->tx_delay));
+
+	thead_dwmac_fix_speed(dwmac, SPEED_1000, 0);
+
+	return thead_dwmac_enable_clk(plat);
+}
+
+static int thead_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat;
+	struct stmmac_resources stmmac_res;
+	struct thead_dwmac *dwmac;
+	struct device_node *np = pdev->dev.of_node;
+	u32 delay_ps;
+	int ret;
+	void __iomem *apb;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get resources\n");
+
+	plat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
+				     "dt configuration failed\n");
+
+	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
+	if (!dwmac)
+		return -ENOMEM;
+
+	if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay_ps))
+		dwmac->rx_delay = delay_ps;
+	if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay_ps))
+		dwmac->tx_delay = delay_ps;
+
+	apb = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(apb))
+		return dev_err_probe(&pdev->dev, PTR_ERR(apb),
+				     "Failed to remap gmac apb registers\n");
+
+	dwmac->apb_regmap = devm_regmap_init_mmio(&pdev->dev, apb, &regmap_config);
+	if (IS_ERR(dwmac->apb_regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->apb_regmap),
+				     "Failed to access gmac apb registers\n");
+
+	dwmac->dev = &pdev->dev;
+	dwmac->plat = plat;
+	plat->bsp_priv = dwmac;
+	plat->fix_mac_speed = thead_dwmac_fix_speed;
+
+	ret = thead_dwmac_init(pdev, plat);
+	if (ret)
+		return ret;
+
+	return stmmac_dvr_probe(&pdev->dev, plat, &stmmac_res);
+}
+
+static const struct of_device_id thead_dwmac_match[] = {
+	{ .compatible = "thead,th1520-dwmac" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, thead_dwmac_match);
+
+static struct platform_driver thead_dwmac_driver = {
+	.probe = thead_dwmac_probe,
+	.remove_new = stmmac_pltfr_remove,
+	.driver = {
+		.name = "thead-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = thead_dwmac_match,
+	},
+};
+module_platform_driver(thead_dwmac_driver);
+
+MODULE_AUTHOR("T-HEAD");
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
+MODULE_DESCRIPTION("T-HEAD dwmac platform driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
