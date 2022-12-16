Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD371C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 07:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mZ77CMiNhEYkd3wptZRleFe3CBCzalPJee+T6kdyoo=; b=vxydKkyf6IegONUS+ycaDA2MsO
	aOu/NUHtSiGoL8PlzElqVZjYN4nTpA32AJD0dBCe0GRANt5/Wbw8O9WhVe3pCq9W48HTMwSM6vo+F
	XC5EtRVxZcMJstSebllAO8FLzafnPYROeUN6jYkVLai7jVW+sFwoLC4d/rNxIjYVnrY74+wQAhuhj
	ockeOBT9eafQGxIFOWgh/sLX0w0DzoaZGOrX2UDcib0r1hpQUwKYWV/QTgvsfjKFb3MlUqSDPh4dl
	PRRbeLQmBzotWC1Uc6K4AzQYm+Pg9EuBN+8D/SzWcnzPR8NAZwukdWHDztU+pcjzMZkTcIpKM3hH1
	zsvDPaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p64nl-00DJYr-2B; Fri, 16 Dec 2022 07:06:37 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p64nf-00DJDF-8y
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 07:06:33 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5823024E39B;
	Fri, 16 Dec 2022 15:05:44 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 16 Dec
 2022 15:05:44 +0800
Received: from wyh-VirtualBox.starfivetech.com (171.223.208.138) by
 EXMBX173.cuchost.com (172.16.6.93) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 16 Dec 2022 15:05:43 +0800
From: Yanhong Wang <yanhong.wang@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: [PATCH v2 7/9] net: stmmac: Add glue layer for StarFive JH71x0 SoCs
Date: Fri, 16 Dec 2022 15:06:30 +0800
Message-ID: <20221216070632.11444-8-yanhong.wang@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_230631_657082_331BA184 
X-CRM114-Status: GOOD (  22.18  )
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
Content-Type: multipart/mixed; boundary="===============0427349963911424441=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0427349963911424441==
Content-Type: text/plain; charset="n"
Content-Transfer-Encoding: quoted-printable

This adds StarFive dwmac driver support on the StarFive JH71x0 SoCs.

Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-starfive-plat.c      | 167 ++++++++++++++++++
 4 files changed, 181 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-pl=
at.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ff68b8524d2..c7d3229330aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19609,6 +19609,7 @@ F:	include/dt-bindings/clock/starfive*
 STARFIVE DWMAC GLUE LAYER
 M:	Yanhong Wang <yanhong.wang@starfivetech.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/dwmac-starfive-plat.c
 F:	Documentation/devicetree/bindings/net/motorcomm,yt8531.yaml
 F:	Documentation/devicetree/bindings/net/starfive,jh71x0-dwmac.yaml
=20
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
index 31ff35174034..ca3d4dd95a95 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -235,6 +235,18 @@ config DWMAC_INTEL_PLAT
 	  the stmmac device driver. This driver is used for the Intel Keem Bay
 	  SoC.
=20
+config DWMAC_STARFIVE_PLAT
+	tristate "StarFive dwmac support"
+	depends on OF && COMMON_CLK
+	depends on STMMAC_ETH
+	default SOC_STARFIVE
+	help
+	  Support for ethernet controllers on StarFive RISC-V SoCs
+
+	  This selects the StarFive platform specific glue layer support for
+	  the stmmac device driver. This driver is used for StarFive JH71x0
+	  ethernet controller.
+
 config DWMAC_VISCONTI
 	tristate "Toshiba Visconti DWMAC support"
 	default ARCH_VISCONTI
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/e=
thernet/stmicro/stmmac/Makefile
index d4e12e9ace4f..a63ab0ab5071 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+=3D dwmac-dwc-qos-eth.=
o
 obj-$(CONFIG_DWMAC_INTEL_PLAT)	+=3D dwmac-intel-plat.o
 obj-$(CONFIG_DWMAC_GENERIC)	+=3D dwmac-generic.o
 obj-$(CONFIG_DWMAC_IMX8)	+=3D dwmac-imx.o
+obj-$(CONFIG_DWMAC_STARFIVE_PLAT)	+=3D dwmac-starfive-plat.o
 obj-$(CONFIG_DWMAC_VISCONTI)	+=3D dwmac-visconti.o
 stmmac-platform-objs:=3D stmmac_platform.o
 dwmac-altr-socfpga-objs :=3D altr_tse_pcs.o dwmac-socfpga.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
new file mode 100644
index 000000000000..f8b68dd53c91
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * StarFive DWMAC platform driver
+ *
+ * Copyright(C) 2022 StarFive Technology Co., Ltd.
+ *
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include "stmmac_platform.h"
+
+struct starfive_dwmac {
+	struct device *dev;
+	struct clk *clk_tx;
+	struct clk *clk_gtx;
+	struct clk *clk_gtxc;
+};
+
+#define JH7100_SYSMAIN_REGISTER28 0x70
+/* The value below is not a typo, just really bad naming by StarFive =C2=
=AF\_(=E3=83=84)_/=C2=AF */
+#define JH7100_SYSMAIN_REGISTER49 0xc8
+
+static int starfive_eth_plat_jh7100_syscon_init(struct device *dev)
+{
+	struct device_node *np =3D dev->of_node;
+	struct regmap *sysmain;
+	u32 gtxclk_dlychain;
+	int ret;
+
+	sysmain =3D syscon_regmap_lookup_by_phandle(np, "starfive,syscon");
+	if (IS_ERR(sysmain))
+		return dev_err_probe(dev, PTR_ERR(sysmain),
+				     "error getting sysmain registers\n");
+
+	/* Choose RGMII interface to the phy.
+	 * TODO: support other interfaces once we know the meaning of other
+	 * values in the register
+	 */
+	ret =3D regmap_update_bits(sysmain, JH7100_SYSMAIN_REGISTER28, 0x7, 1);
+	if (ret)
+		return dev_err_probe(dev, ret, "error selecting gmac interface\n");
+
+	if (!of_property_read_u32(np, "starfive,gtxclk-dlychain", &gtxclk_dlych=
ain)) {
+		ret =3D regmap_write(sysmain, JH7100_SYSMAIN_REGISTER49, gtxclk_dlycha=
in);
+		if (ret)
+			return dev_err_probe(dev, ret, "error selecting gtxclk delay chain\n"=
);
+	}
+
+	return 0;
+}
+
+static void starfive_eth_plat_fix_mac_speed(void *priv, unsigned int spe=
ed)
+{
+	struct starfive_dwmac *dwmac =3D priv;
+	unsigned long rate;
+	int err;
+
+	switch (speed) {
+	case SPEED_1000:
+		rate =3D 125000000;
+		break;
+	case SPEED_100:
+		rate =3D 25000000;
+		break;
+	case SPEED_10:
+		rate =3D 2500000;
+		break;
+	default:
+		dev_err(dwmac->dev, "invalid speed %u\n", speed);
+		return;
+	}
+
+	err =3D clk_set_rate(dwmac->clk_gtx, rate);
+	if (err)
+		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
+}
+
+static int starfive_eth_plat_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct starfive_dwmac *dwmac;
+	int (*syscon_init)(struct device *dev);
+	int err;
+
+	err =3D stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (err)
+		return err;
+
+	plat_dat =3D stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat)) {
+		dev_err(&pdev->dev, "dt configuration failed\n");
+		return PTR_ERR(plat_dat);
+	}
+
+	dwmac =3D devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
+	if (!dwmac)
+		return -ENOMEM;
+
+	syscon_init =3D of_device_get_match_data(&pdev->dev);
+	if (syscon_init) {
+		err =3D syscon_init(&pdev->dev);
+		if (err)
+			return err;
+	}
+
+	dwmac->clk_tx =3D devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(dwmac->clk_tx))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
+						"error getting tx clock\n");
+
+	dwmac->clk_gtx =3D devm_clk_get_enabled(&pdev->dev, "gtx");
+	if (IS_ERR(dwmac->clk_gtx))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_gtx),
+						"error getting gtx clock\n");
+
+	/* Only StarFive JH7110 SoC support gtxc clock */
+	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-dwmac")=
) {
+		dwmac->clk_gtxc =3D devm_clk_get_enabled(&pdev->dev, "gtxc");
+		if (IS_ERR(dwmac->clk_gtxc))
+			return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_gtxc),
+							"error getting gtxc clock\n");
+	}
+
+	dwmac->dev =3D &pdev->dev;
+	plat_dat->fix_mac_speed =3D starfive_eth_plat_fix_mac_speed;
+	plat_dat->init =3D NULL;
+	plat_dat->bsp_priv =3D dwmac;
+	plat_dat->dma_cfg->dche =3D true;
+
+	err =3D stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	if (err) {
+		stmmac_remove_config_dt(pdev, plat_dat);
+		return err;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id starfive_eth_plat_match[] =3D {
+	{
+		.compatible =3D "starfive,jh7110-dwmac"
+	},
+	{
+		.compatible =3D "starfive,jh7100-dwmac",
+		.data =3D starfive_eth_plat_jh7100_syscon_init,
+	},
+	{ }
+};
+
+static struct platform_driver starfive_eth_plat_driver =3D {
+	.probe  =3D starfive_eth_plat_probe,
+	.remove =3D stmmac_pltfr_remove,
+	.driver =3D {
+		.name =3D "starfive-eth-plat",
+		.pm =3D &stmmac_pltfr_pm_ops,
+		.of_match_table =3D starfive_eth_plat_match,
+	},
+};
+
+module_platform_driver(starfive_eth_plat_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("StarFive DWMAC platform driver");
+MODULE_AUTHOR("Yanhong Wang <yanhong.wang@starfivetech.com>");
--=20
2.17.1



--===============0427349963911424441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0427349963911424441==--
