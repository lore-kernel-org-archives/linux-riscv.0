Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D71C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 04:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwaiEDLRH0zYI5zkYDrlK9wOWijyKXsdNtqPat300D4=; b=2T1gHIfTuNWJ7J
	CQXMdQp+dPYCOgWPx/+VtAXx3v4AcZp9ObzVylVVFJ/uFhjIm04P+JODKAOOfs/zgNx9cj9GTd+rQ
	iXqv/pUkXblCs1IWGRQ6+1dA4m0RqP/2fNorDxBE435Y9xpS13ieZe5MFvZJ7Azs6wOI2/g24bVLt
	oJLZEFZb3yKL7mawtfLusN12roHy1amslLas3h/VrcdSAJlMtiU2sFUOlJfNi4Ijpze6x3pOtin58
	cyX/TZNyQ4G1thCKTSnpuak37Y2/SDWVBaAjCCKonEQWIGCKsY4HpJEs4ibFUUgz7cKM3bfS2MIbh
	0NPyFmsryxaL7K9/OsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxPD-0019Kg-0A;
	Sun, 29 Oct 2023 04:28:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxOh-0018xq-0N;
	Sun, 29 Oct 2023 04:27:36 +0000
Received: from localhost (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C16796607385;
	Sun, 29 Oct 2023 04:27:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698553653;
	bh=rQEEY6dQh5x1XU/k0bkvaMxbU5A9Ka+KlBHywJ6TdZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ply1YYfpowSWtHZbXt0ZnAxukmin99chjF272ojHa0/L8dD4MgwT8yDf3dX5K0kH7
	 N3qheSFgI2+Na+BqE5ZPpFRj6DsYlmMgAw2ya2cl/vVMRYIBAgt0xG/J+EUyVSIyiq
	 MHvqlJ79Hdy061OWUwAi2apEw/xePCHFtUJr6AgNclKW40CsbaR3bQKVG+x2MoF7Dy
	 DsgtRJ84r+PAtfm/vxu2KtRmDXgEOEVOeY0kdp0HCH3WOAoNKlmFaGjtayHxc88GBW
	 J4D3DP56T1NEpd9rfPxsYKjXw9qxOjXgEL9+Tnos5kBCwN/2V0M7glqryd5IscL55+
	 seI9heDfUmE8A==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 05/12] net: stmmac: dwmac-starfive: Add support for JH7100 SoC
Date: Sun, 29 Oct 2023 06:27:05 +0200
Message-ID: <20231029042712.520010-6-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_212735_441533_9A593172 
X-CRM114-Status: GOOD (  17.62  )
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

Add a missing quirk to enable support for the StarFive JH7100 SoC.

Additionally, for greater flexibility in operation, allow using the
rgmii-rxid and rgmii-txid phy modes.

Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  6 ++--
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 32 ++++++++++++++++---
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index a2b9e289aa36..c3c2c8360047 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -165,9 +165,9 @@ config DWMAC_STARFIVE
 	help
 	  Support for ethernet controllers on StarFive RISC-V SoCs
 
-	  This selects the StarFive platform specific glue layer support for
-	  the stmmac device driver. This driver is used for StarFive JH7110
-	  ethernet controller.
+	  This selects the StarFive platform specific glue layer support
+	  for the stmmac device driver. This driver is used for the
+	  StarFive JH7100 and JH7110 ethernet controllers.
 
 config DWMAC_STI
 	tristate "STi GMAC support"
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 5d630affb4d1..88c431edcea0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -15,13 +15,20 @@
 
 #include "stmmac_platform.h"
 
-#define STARFIVE_DWMAC_PHY_INFT_RGMII	0x1
-#define STARFIVE_DWMAC_PHY_INFT_RMII	0x4
-#define STARFIVE_DWMAC_PHY_INFT_FIELD	0x7U
+#define STARFIVE_DWMAC_PHY_INFT_RGMII		0x1
+#define STARFIVE_DWMAC_PHY_INFT_RMII		0x4
+#define STARFIVE_DWMAC_PHY_INFT_FIELD		0x7U
+
+#define JH7100_SYSMAIN_REGISTER49_DLYCHAIN	0xc8
+
+struct starfive_dwmac_data {
+	unsigned int gtxclk_dlychain;
+};
 
 struct starfive_dwmac {
 	struct device *dev;
 	struct clk *clk_tx;
+	const struct starfive_dwmac_data *data;
 };
 
 static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
@@ -67,6 +74,8 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
 		mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
 		break;
 
@@ -89,6 +98,14 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	if (err)
 		return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");
 
+	if (dwmac->data) {
+		err = regmap_write(regmap, JH7100_SYSMAIN_REGISTER49_DLYCHAIN,
+				   dwmac->data->gtxclk_dlychain);
+		if (err)
+			return dev_err_probe(dwmac->dev, err,
+					     "error selecting gtxclk delay chain\n");
+	}
+
 	return 0;
 }
 
@@ -114,6 +131,8 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	if (!dwmac)
 		return -ENOMEM;
 
+	dwmac->data = device_get_match_data(&pdev->dev);
+
 	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
 	if (IS_ERR(dwmac->clk_tx))
 		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
@@ -144,8 +163,13 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
 
+static const struct starfive_dwmac_data jh7100_data = {
+	.gtxclk_dlychain = 4
+};
+
 static const struct of_device_id starfive_dwmac_match[] = {
-	{ .compatible = "starfive,jh7110-dwmac"	},
+	{ .compatible = "starfive,jh7100-dwmac", .data = &jh7100_data },
+	{ .compatible = "starfive,jh7110-dwmac" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
