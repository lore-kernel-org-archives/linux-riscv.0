Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79180C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 06:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1zXtAFR5hwCFH9qQZmCijuk7CVsqhtzLW71o2KZTSA=; b=QpNiIRxPXQXSgt
	2ls/i2jeGzW7FXTn5edg5EfxEpDupbh2JRh4rD1YixOAQ1cVKJRkdATNG8ep77WcNwpy8aorlycIL
	GQy5vBI1/QPChaLV7yMIoo+DWdK9CGiVLZtQ2GhhrhtAfqymhXqQeU0XVz2wsmBfASdt6fJevKWYM
	jLW/0FXFqSuLhI5vGfn+2gssfvOToOvV8mlQeM8GYF+genAm/UxzVGGTNkTYk270Mtpc1PKvMEZbR
	fITmg/sUfzEs7pXZvJyqWZOJfk9GtkvKWfoUwtaQ5s/vB8zwRY1SnXM2zZuqJUZrK5Ni1S2BbAaO4
	PoJ8SN5ie+xrUFtm+pxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2hh-00DINT-2i;
	Tue, 28 Mar 2023 06:21:09 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2hd-00DIDP-2C
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 06:21:07 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8F75C24E2F2;
	Tue, 28 Mar 2023 14:20:18 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Mar
 2023 14:20:18 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX162.cuchost.com (172.16.6.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 28 Mar 2023 14:20:17 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Jose Abreu <joabreu@synopsys.com>, Richard Cochran
	<richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [net-next v9 6/6] net: stmmac: starfive-dmac: Add phy interface settings
Date: Tue, 28 Mar 2023 14:20:09 +0800
Message-ID: <20230328062009.25454-7-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230328062009.25454-1-samin.guo@starfivetech.com>
References: <20230328062009.25454-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_232106_003615_9E53187D 
X-CRM114-Status: GOOD (  14.68  )
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
starfive,syscon: <&syscon, offset, shift>

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index ef5a769b1c75..53f517920a72 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -13,6 +13,10 @@
 
 #include "stmmac_platform.h"
 
+#define STARFIVE_DWMAC_PHY_INFT_RGMII	0x1
+#define STARFIVE_DWMAC_PHY_INFT_RMII	0x4
+#define STARFIVE_DWMAC_PHY_INFT_FIELD	0x7U
+
 struct starfive_dwmac {
 	struct device *dev;
 	struct clk *clk_tx;
@@ -44,6 +48,48 @@ static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed)
 		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
 }
 
+static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
+{
+	struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
+	struct regmap *regmap;
+	unsigned int args[2];
+	unsigned int mode;
+	int err;
+
+	switch (plat_dat->interface) {
+	case PHY_INTERFACE_MODE_RMII:
+		mode = STARFIVE_DWMAC_PHY_INFT_RMII;
+		break;
+
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+		mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
+		break;
+
+	default:
+		dev_err(dwmac->dev, "unsupported interface %d\n",
+			plat_dat->interface);
+		return -EINVAL;
+	}
+
+	regmap = syscon_regmap_lookup_by_phandle_args(dwmac->dev->of_node,
+						      "starfive,syscon",
+						      2, args);
+	if (IS_ERR(regmap)) {
+		dev_err(dwmac->dev, "syscon regmap failed.\n");
+		return -ENXIO;
+	}
+
+	/* args[0]:offset  args[1]: shift */
+	err = regmap_update_bits(regmap, args[0],
+				  STARFIVE_DWMAC_PHY_INFT_FIELD << args[1],
+				  mode << args[1]);
+	if (err)
+		return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");
+
+	return 0;
+}
+
 static int starfive_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -89,6 +135,8 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->dma_cfg->dche = true;
 
+	starfive_dwmac_set_mode(plat_dat);
+
 	err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (err) {
 		stmmac_remove_config_dt(pdev, plat_dat);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
