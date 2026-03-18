Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E844C10775E4
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=618Lxy69R3tOa057/vyMQ/l/QDuScvNqR0Wu/FpBRmE=; b=v9bUgYuK5oh7iz
	DLtPxAfSYxVrsSRp8V554NOGSFaoRm5egVS1CTakKX8sZZoKFRHcaxygu+70CUp+E9KlqtqngIXCd
	O03VdvZ0CRcDB3kfJNO8QpuETlNTYQc9t8zVoJqy/pKjgCn8fYpxGaBFn9UpNu8hHLRW+NSArjz/H
	H82AQkV6Jxoxl0Mg3dMOCKev1nKPrFuIyrgwFojB4Jf/ssolV0rEgzZSU+bJIMGeLah6/L+AtRXtl
	VSdEeYgswcE0fIUIcd8Emp+jb5FpNdI0A57YuKlpZC7YZpp7G+DGHD93W5c4KL/AMh4M0uwGSjslB
	D2Ck8uo2NLEp8Q4nmiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tuB-00000008xnB-0d7M;
	Wed, 18 Mar 2026 16:37:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tu9-00000008xmj-2TWi
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 16:37:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F5C960053;
	Wed, 18 Mar 2026 16:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15412C2BC87;
	Wed, 18 Mar 2026 16:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851876;
	bh=qXfofFT/trjhnPdhGlUBXmgmmTY9bSQeDk+832YPFio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GstVF2XOOimo5nwYNyngBHe+JUGCtpZjNkJn3FkMko6UgBPp1TwANQ1kauNFGpyOo
	 O6t/yebg79VawFRxauDhMVsLQQiyip4dRUqoCV+qu6ToydlL8Y6+ne3HbWG0UgJAi/
	 yx5rU23ylppi9hmmq2M8dVB/5eAbc/gm1QgMCeVXio4csMCFvsFvqGJDVF0OD6sj3B
	 gTyxpMk+tSW0YiI+tShk9Qp5H52dN5CYTp3BS70DFxW01HE+ppsvFnNUL5HL68YBKt
	 /ZhXY+O6/vQ4D9Y2u/y73HKwFb59+b/44DEcQDmQT6rlaWBZz6uPUJOOW3JTSih/MI
	 +edr4WplBhdkA==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com
Subject: [PATCH net-next v4 01/13] net: macb: rename macb_default_usrio to at91_default_usrio as not all platforms have mii mode control in usrio
Date: Wed, 18 Mar 2026 16:37:32 +0000
Message-ID: <20260318-proximity-playoff-d9a0c84ed6a9@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-surpass-puzzle-f94b46aa8808@spud>
References: <20260318-surpass-puzzle-f94b46aa8808@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10810; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=EKLjoCWb4dd6fnjRibapsUL7p5viCWSXvbtWmX4ncIU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm7rlyQM187R+5+cWyowNLSPyd/GE1b+uBedcdNlupPp coOLy4xd5SyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAifYcZGc4e+XVp+qelbhaa fiZfP/UELlhe90jp6oYD5lkZN3OOeWQyMqyaNtWq7NcBnZIHHqvv/Y/TO+X994+565fCWRedeT+ 0BXMAAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

Calling this structure macb_default_usrio is misleading, I believe, as
it implies that it should be used if your platform has nothing special
to do in usrio. Since usrio is platform dependent, the default here is
probably for each usrio to do nothing, with the macb documentation I
have access to prescribing no standard behaviour here. We noticed that
this was problematic because on mpfs, a bit that macb_default_usrio
sets to deal with the MII mode actually changes the source for the
tsu_clk to something with how the majority of mpfs devices are actually
configured!

Rename it to at91_default_usrio, since that's where the values actually
come from for these. I have no idea if any of the other platforms that
use the default actually copied at91's usrio configuration or if they
have usrio configurations where what the driver does has no impact.

Gate touching these bits behind a capability, like the clken refclock
usrio knob, so that platforms without the MII mode stuff can avoid
running this code.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb.h      |   1 +
 drivers/net/ethernet/cadence/macb_main.c | 108 +++++++++++++----------
 2 files changed, 63 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 87414a2ddf6e3..8cb0b3778ee9e 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -779,6 +779,7 @@
 #define MACB_CAPS_DMA_PTP			BIT(22)
 #define MACB_CAPS_RSC				BIT(23)
 #define MACB_CAPS_NO_LSO			BIT(24)
+#define MACB_CAPS_USRIO_HAS_MII			BIT(25)
 
 /* LSO settings */
 #define MACB_LSO_UFO_ENABLE			0x01
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 5bc35f651ebd2..778d2115f66fc 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4613,13 +4613,15 @@ static int macb_init(struct platform_device *pdev)
 
 	if (!(bp->caps & MACB_CAPS_USRIO_DISABLED)) {
 		val = 0;
-		if (phy_interface_mode_is_rgmii(bp->phy_interface))
-			val = bp->usrio->rgmii;
-		else if (bp->phy_interface == PHY_INTERFACE_MODE_RMII &&
-			 (bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
-			val = bp->usrio->rmii;
-		else if (!(bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
-			val = bp->usrio->mii;
+		if (bp->caps & MACB_CAPS_USRIO_HAS_MII) {
+			if (phy_interface_mode_is_rgmii(bp->phy_interface))
+				val = bp->usrio->rgmii;
+			else if (bp->phy_interface == PHY_INTERFACE_MODE_RMII &&
+				 (bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
+				val = bp->usrio->rmii;
+			else if (!(bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
+				val = bp->usrio->mii;
+		}
 
 		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
 			val |= bp->usrio->refclk;
@@ -4637,13 +4639,6 @@ static int macb_init(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct macb_usrio_config macb_default_usrio = {
-	.mii = MACB_BIT(MII),
-	.rmii = MACB_BIT(RMII),
-	.rgmii = GEM_BIT(RGMII),
-	.refclk = MACB_BIT(CLKEN),
-};
-
 #if defined(CONFIG_OF)
 /* 1518 rounded up */
 #define AT91ETHER_MAX_RBUFF_SZ	0x600
@@ -5218,6 +5213,13 @@ static int eyeq5_init(struct platform_device *pdev)
 	return ret;
 }
 
+static const struct macb_usrio_config at91_default_usrio = {
+	.mii = MACB_BIT(MII),
+	.rmii = MACB_BIT(RMII),
+	.rgmii = GEM_BIT(RGMII),
+	.refclk = MACB_BIT(CLKEN),
+};
+
 static const struct macb_usrio_config sama7g5_usrio = {
 	.mii = 0,
 	.rmii = 1,
@@ -5228,104 +5230,114 @@ static const struct macb_usrio_config sama7g5_usrio = {
 
 static const struct macb_config fu540_c000_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
-		MACB_CAPS_GEM_HAS_PTP,
+		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.clk_init = fu540_c000_clk_init,
 	.init = fu540_c000_init,
 	.jumbo_max_len = 10240,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config at91sam9260_config = {
-	.caps = MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
+	.caps = MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
+		MACB_CAPS_USRIO_HAS_MII,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config sama5d3macb_config = {
 	.caps = MACB_CAPS_SG_DISABLED |
-		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
+		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
+		MACB_CAPS_USRIO_HAS_MII,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config pc302gem_config = {
-	.caps = MACB_CAPS_SG_DISABLED | MACB_CAPS_GIGABIT_MODE_AVAILABLE,
+	.caps = MACB_CAPS_SG_DISABLED | MACB_CAPS_GIGABIT_MODE_AVAILABLE |
+		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config sama5d2_config = {
-	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO,
+	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO |
+		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
 	.jumbo_max_len = 10240,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config sama5d29_config = {
-	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_GEM_HAS_PTP,
+	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_GEM_HAS_PTP |
+		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config sama5d3_config = {
 	.caps = MACB_CAPS_SG_DISABLED | MACB_CAPS_GIGABIT_MODE_AVAILABLE |
-		MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO,
+		MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO |
+		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
 	.jumbo_max_len = 10240,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config sama5d4_config = {
-	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
+	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
+		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 4,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config emac_config = {
-	.caps = MACB_CAPS_NEEDS_RSTONUBR | MACB_CAPS_MACB_IS_EMAC,
+	.caps = MACB_CAPS_NEEDS_RSTONUBR | MACB_CAPS_MACB_IS_EMAC |
+		MACB_CAPS_USRIO_HAS_MII,
 	.clk_init = at91ether_clk_init,
 	.init = at91ether_init,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config np4_config = {
 	.caps = MACB_CAPS_USRIO_DISABLED,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config zynqmp_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
 		MACB_CAPS_JUMBO |
-		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH,
+		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH |
+		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = init_reset_optional,
 	.jumbo_max_len = 10240,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config zynq_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_NO_GIGABIT_HALF |
-		MACB_CAPS_NEEDS_RSTONUBR,
+		MACB_CAPS_NEEDS_RSTONUBR |
+		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config mpfs_config = {
@@ -5335,7 +5347,7 @@ static const struct macb_config mpfs_config = {
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = init_reset_optional,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 	.max_tx_length = 4040, /* Cadence Erratum 1686 */
 	.jumbo_max_len = 4040,
 };
@@ -5343,7 +5355,8 @@ static const struct macb_config mpfs_config = {
 static const struct macb_config sama7g5_gem_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
 		MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
-		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP,
+		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP |
+		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -5353,7 +5366,8 @@ static const struct macb_config sama7g5_gem_config = {
 static const struct macb_config sama7g5_emac_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
 		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII |
-		MACB_CAPS_GEM_HAS_PTP,
+		MACB_CAPS_GEM_HAS_PTP |
+		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -5364,12 +5378,13 @@ static const struct macb_config versal_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH |
 		MACB_CAPS_NEED_TSUCLK | MACB_CAPS_QUEUE_DISABLE |
-		MACB_CAPS_QBV,
+		MACB_CAPS_QBV |
+		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = init_reset_optional,
 	.jumbo_max_len = 10240,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config eyeq5_config = {
@@ -5380,17 +5395,18 @@ static const struct macb_config eyeq5_config = {
 	.clk_init = macb_clk_init,
 	.init = eyeq5_init,
 	.jumbo_max_len = 10240,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 };
 
 static const struct macb_config raspberrypi_rp1_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
 		MACB_CAPS_JUMBO |
-		MACB_CAPS_GEM_HAS_PTP,
+		MACB_CAPS_GEM_HAS_PTP |
+		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &macb_default_usrio,
+	.usrio = &at91_default_usrio,
 	.jumbo_max_len = 10240,
 };
 
@@ -5431,7 +5447,7 @@ static const struct macb_config default_gem_config = {
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &macb_default_usrio,
+	.usrio = NULL,
 	.jumbo_max_len = 10240,
 };
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
