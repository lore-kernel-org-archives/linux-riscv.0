Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F30C761AF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 02:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIaTa4Eb4hUXJ6yDdsii4B4mHuvEyyQD/IlCF4mfY5I=; b=GgAuDQPdCLoaNa
	va3U8ZgVyb3hejB/IuJR2v3FE7o0ujB57/XRZhTwfvdVf24PbF0RKrEAILD7zQjfwXE181S5sej0T
	gFU9bSVKD/4DR+SgihFM0f2YbwuCMkg9WBj57NcBDbxf73BU2vcp82CqygfTv4kKZ8F7JeUqoe0FP
	eWvjbE7nPOu8EGqGnc1CDZRRWRIrQruzIJ3L2akrWt+sb0F151LNDRERx3d2Rgd6F/HSt78cXfOf8
	kboJM+fBCszXdStkn9f3L95Aw0muzFpLMOr88uU9Fcv/Wblo7QqIlo7nfb1dJwxGmisN5IVMbsYIA
	/EmRlocGGzJNwwHsmjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfXAl-003OgR-0S;
	Fri, 24 Mar 2023 02:28:55 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfXAh-003OaV-0o
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 02:28:52 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4A05524E1E1;
	Fri, 24 Mar 2023 10:28:28 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Mar
 2023 10:28:28 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX162.cuchost.com (172.16.6.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 24 Mar 2023 10:28:27 +0800
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
Subject: [PATCH v8 6/6] net: stmmac: starfive_dmac: Add phy interface settings
Date: Fri, 24 Mar 2023 10:28:19 +0800
Message-ID: <20230324022819.2324-7-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230324022819.2324-1-samin.guo@starfivetech.com>
References: <20230324022819.2324-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_192851_621885_8B756555 
X-CRM114-Status: GOOD (  14.14  )
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
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index ef5a769b1c75..84690c8f0250 100644
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
@@ -44,6 +48,43 @@ static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed)
 		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
 }
 
+static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
+{
+	struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
+	struct regmap *regmap;
+	unsigned int args[2];
+	unsigned int mode;
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
+	return regmap_update_bits(regmap, args[0],
+				  STARFIVE_DWMAC_PHY_INFT_FIELD << args[1],
+				  mode << args[1]);
+}
+
 static int starfive_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -89,6 +130,12 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->dma_cfg->dche = true;
 
+	err = starfive_dwmac_set_mode(plat_dat);
+	if (err) {
+		dev_err(&pdev->dev, "dwmac set mode failed.\n");
+		return err;
+	}
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
