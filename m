Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E28CCCA47B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 08:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvMgL0uzYla+EV4TkHFJlOB+eCTZ0I+xGgfS347ikCE=; b=rNIN2P+wwkb+n3
	9LlB+LH045q36chp12aYNOSxMv0r3A5fpIqaITfX8POLiLa8eLIrTZWwoPh2pSXhWyMAyqAUxaNlN
	+Ff+ojIGM0GuP28kVhJVa1weMOE3XJAgXPPuNwsawVWbWti6a/jyUcE+tB3OpEsVQX/zbKJRlBcOL
	QitUvJ/i0Fb9oOEcm42+n11mbDJ+NHGsAIp6A7fEsTaGvxNXc5eJ0sGf5mix4dH/obZsN2Cwkm+v2
	TNuylwUWlF40AHQcDi04m3WYb+ICAR4ui7JMlH8DuW+rYtTnOsQTDV7ElwRRxdhnyp9ypstIp7kyM
	qu8fKcY+UmsJItKIoHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pDQ-00Futs-4F; Thu, 30 Jun 2022 08:07:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pDM-00Funu-3i
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 08:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656576471; x=1688112471;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QRztPqLPpCR+G/Am0XR/jSeACTyPFrOzNB1djYsPfM4=;
  b=sGgqNyonaMbZORvfgCu8WGWHBUFzMYVsjRIwFTfzYuW526+5/xJgGE9/
   SHX4yRJd8edqqGpB6k6uzz48cM5jy+QbNQ349YqeZB5MZOwyElEWYidTy
   w2CKHs8/CrnRRQ9ZL3Bp1iv2dcauS74tBcPsDt23JAqVgblLpzH+bl8NN
   SyQKOhihyFYbgLs8vWUnjAo4kMkmYQNo7/Lzva8h2oiUq13etLf8K886T
   tUEA//P/gkGcR/HfmRXpYN4IePEOpja3uJSxYKAYgPkm4VZyzENtz3pYi
   9XgmmovMNSYJ0go/D1OGj0vCWuwr2zeDlpE6xYvLYJ6qIRQ84ZwlcobES
   w==;
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="102426685"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 01:07:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 01:07:51 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 01:07:47 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Daire McNamara" <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v1 06/14] net: macb: add polarfire soc reset support
Date: Thu, 30 Jun 2022 09:05:25 +0100
Message-ID: <20220630080532.323731-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630080532.323731-1-conor.dooley@microchip.com>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_010752_270835_78B552A0 
X-CRM114-Status: GOOD (  14.45  )
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

To date, the Microchip PolarFire SoC (MPFS) has been using the
cdns,macb compatible, however the generic device does not have reset
support. Add a new compatible & .data for MPFS to hook into the reset
functionality added for zynqmp support (and make the zynqmp init
function generic in the process).

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 25 +++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index d89098f4ede8..325f0463fd42 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4689,33 +4689,32 @@ static const struct macb_config np4_config = {
 	.usrio = &macb_default_usrio,
 };
 
-static int zynqmp_init(struct platform_device *pdev)
+static int init_reset_optional(struct platform_device *pdev)
 {
 	struct net_device *dev = platform_get_drvdata(pdev);
 	struct macb *bp = netdev_priv(dev);
 	int ret;
 
 	if (bp->phy_interface == PHY_INTERFACE_MODE_SGMII) {
-		/* Ensure PS-GTR PHY device used in SGMII mode is ready */
+		/* Ensure PHY device used in SGMII mode is ready */
 		bp->sgmii_phy = devm_phy_optional_get(&pdev->dev, NULL);
 
 		if (IS_ERR(bp->sgmii_phy)) {
 			ret = PTR_ERR(bp->sgmii_phy);
 			dev_err_probe(&pdev->dev, ret,
-				      "failed to get PS-GTR PHY\n");
+				      "failed to get SGMII PHY\n");
 			return ret;
 		}
 
 		ret = phy_init(bp->sgmii_phy);
 		if (ret) {
-			dev_err(&pdev->dev, "failed to init PS-GTR PHY: %d\n",
+			dev_err(&pdev->dev, "failed to init SGMII PHY: %d\n",
 				ret);
 			return ret;
 		}
 	}
 
-	/* Fully reset GEM controller at hardware level using zynqmp-reset driver,
-	 * if mapped in device tree.
+	/* Fully reset controller at hardware level if mapped in device tree
 	 */
 	ret = device_reset_optional(&pdev->dev);
 	if (ret) {
@@ -4737,7 +4736,7 @@ static const struct macb_config zynqmp_config = {
 			MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
-	.init = zynqmp_init,
+	.init = init_reset_optional,
 	.jumbo_max_len = 10240,
 	.usrio = &macb_default_usrio,
 };
@@ -4751,6 +4750,17 @@ static const struct macb_config zynq_config = {
 	.usrio = &macb_default_usrio,
 };
 
+static const struct macb_config mpfs_config = {
+	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
+			MACB_CAPS_JUMBO |
+			MACB_CAPS_GEM_HAS_PTP,
+	.dma_burst_length = 16,
+	.clk_init = macb_clk_init,
+	.init = init_reset_optional,
+	.usrio = &macb_default_usrio,
+	.jumbo_max_len = 10240,
+};
+
 static const struct macb_config sama7g5_gem_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
 		MACB_CAPS_MIIONRGMII,
@@ -4787,6 +4797,7 @@ static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,zynqmp-gem", .data = &zynqmp_config},
 	{ .compatible = "cdns,zynq-gem", .data = &zynq_config },
 	{ .compatible = "sifive,fu540-c000-gem", .data = &fu540_c000_config },
+	{ .compatible = "microchip,mpfs-macb", .data = &mpfs_config },
 	{ .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
 	{ .compatible = "microchip,sama7g5-emac", .data = &sama7g5_emac_config },
 	{ /* sentinel */ }
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
