Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04787C7EE2F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnyZ0iO80ex52DOJRxfe33kpp0ttlovDJikM9oGbq3A=; b=fA4xHEkp8D3Hvm
	/w+nJp14+pV/PXbocNBpLMdnJ4Ej4jnmbgPBPStQSE5sjcl+DjMg2VKwC3kyZgQyRUjyz+XpbnY0l
	9UTYhQ73WNAnPIANQxSTWHr4fq0Pm8sIRQJfnLFKSkHGC7x8ACt27xnNIT10aFBEPQmeGT6arMeKB
	CPrQKS/zhhtFCGY/QOYjxnFP8rK7DY2ywUC0+0Cvx+MKT/pYNcw+eC+bL8uvEpxJdFXDJ2eUv8Ad0
	WziBNrC5Y9/b3d5stOLh02JA8OOGwLATZlhGVn0zRCsAQDNK9+ra9c19sUxyveqBKAEp/i2HXbT5b
	eLH8lKm8ECLwZGVSWm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1H2-005Z6g-Dr; Fri, 03 Mar 2023 09:00:20 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1Go-005Yjl-6m
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 09:00:10 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 12EDE24DC09;
	Fri,  3 Mar 2023 16:59:38 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Mar
 2023 16:59:38 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX162.cuchost.com (172.16.6.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 3 Mar 2023 16:59:37 +0800
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
	<samin.guo@starfivetech.com>
Subject: [PATCH v5 08/12] net: stmmac: starfive_dmac: Add phy interface settings
Date: Fri, 3 Mar 2023 16:59:24 +0800
Message-ID: <20230303085928.4535-9-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230303085928.4535-1-samin.guo@starfivetech.com>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_010006_594620_3E672D72 
X-CRM114-Status: GOOD (  13.69  )
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

dwmac supports multiple modess. When working under rmii and rgmii,
you need to set different phy interfaces.

According to the dwmac document, when working in rmii, it needs to be
set to 0x4, and rgmii needs to be set to 0x1.

The phy interface needs to be set in syscon, the format is as follows:
starfive,syscon: <&syscon, offset, mask>

Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 566378306f67..40fdd7036127 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -7,10 +7,15 @@
  *
  */
 
+#include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
+#include <linux/regmap.h>
 
 #include "stmmac_platform.h"
 
+#define MACPHYC_PHY_INFT_RMII	0x4
+#define MACPHYC_PHY_INFT_RGMII	0x1
+
 struct starfive_dwmac {
 	struct device *dev;
 	struct clk *clk_tx;
@@ -53,6 +58,46 @@ static void starfive_eth_fix_mac_speed(void *priv, unsigned int speed)
 		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
 }
 
+static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
+{
+	struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
+	struct of_phandle_args args;
+	struct regmap *regmap;
+	unsigned int reg, mask, mode;
+	int err;
+
+	switch (plat_dat->interface) {
+	case PHY_INTERFACE_MODE_RMII:
+		mode = MACPHYC_PHY_INFT_RMII;
+		break;
+
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+		mode = MACPHYC_PHY_INFT_RGMII;
+		break;
+
+	default:
+		dev_err(dwmac->dev, "Unsupported interface %d\n",
+			plat_dat->interface);
+	}
+
+	err = of_parse_phandle_with_fixed_args(dwmac->dev->of_node,
+					       "starfive,syscon", 2, 0, &args);
+	if (err) {
+		dev_dbg(dwmac->dev, "syscon reg not found\n");
+		return -EINVAL;
+	}
+
+	reg = args.args[0];
+	mask = args.args[1];
+	regmap = syscon_node_to_regmap(args.np);
+	of_node_put(args.np);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return regmap_update_bits(regmap, reg, mask, mode << __ffs(mask));
+}
+
 static int starfive_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -93,6 +138,7 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->dma_cfg->dche = true;
 
+	starfive_dwmac_set_mode(plat_dat);
 	err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (err) {
 		stmmac_remove_config_dt(pdev, plat_dat);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
