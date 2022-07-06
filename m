Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3C3C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEDOU8Zxy30mme+D2j/pjlGpuSMsdjXsx93vyryo1Ck=; b=wPNmGXHm4KAVe0
	y8E/bg7kvd5Rj/ug0n5z+iFIBiObeygQJq0SohMeg+2vdBGB2b8l4A96yfkbGcq52gNtC7iY4aDyF
	ax0qYpmsnECal1uIqX/TqkB0Pq2qQ0AUmBGWaosqSe8POBLGbiYG+N0qWR+YF+E92weWPn1BM+Myj
	5qEHBSwjpyPDLazjJt4SpgQ0UvNpz4RRvD5TnizPdITTLhIeb+FwklT5f/0SKW8Ew+PyDGvcz46gq
	K5x1RvxSk9QIodh8vqnNTl3+HCTdPBzM0mmKUHS376Y381t3gP66K5Qfn7lLQnzkJ+fRjcqUwt/ds
	ePBParO9MW8I12aUz+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91zR-008D2a-O0; Wed, 06 Jul 2022 10:10:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91hZ-007xYP-V3
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 09:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657101130; x=1688637130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=om/UZBrb2XM7I9JkRLhYt07766ef5nyevWuoEb4xepc=;
  b=fL7Yq/NPRTSc7mOzIDjHQQLFenMOK+2CGSEhJIxcuz006wfsNapYe3zi
   9pbjh1a/EWMTbSOFmbqnLuCnAtWvXcx6ghddgPMPUxTRJ42vObqlo8PLz
   NLOs8ABDYsgMz2BegLBZnu1Ow+Sb3xjsBnEhePrH6ZoW5Sa5DKdy4F00f
   l4HAOA0lJQoLOSzqDW81s3DGNyy+Goi96UxTfid6rhrWvW3Te/Cq8iuo4
   x4R0GBRDoj9gN/+J2h4MJ7/1gug8jsIFR50VXLpQwjli1t4S9Va3StvLR
   LVjgrKkdvZjaXnbtcCl8Ru96A9MJViw3qG2wtmfF3klVvgEX1/vYSMtmO
   g==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="163537889"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 02:52:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 02:52:08 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 02:52:05 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [net-next PATCH v3 5/5] net: macb: sort init_reset_optional() with other init()s
Date: Wed, 6 Jul 2022 10:51:29 +0100
Message-ID: <20220706095129.828253-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706095129.828253-1-conor.dooley@microchip.com>
References: <20220706095129.828253-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_025210_123078_D667C336 
X-CRM114-Status: GOOD (  12.43  )
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

init_reset_optional() is somewhat oddly placed amidst the macb_config
struct definitions. Move it to a more reasonable location alongside
the fu540 init functions.

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 68 ++++++++++++------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 4423d99c72a7..36a659f2a289 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4600,6 +4600,40 @@ static int fu540_c000_init(struct platform_device *pdev)
 	return macb_init(pdev);
 }
 
+static int init_reset_optional(struct platform_device *pdev)
+{
+	struct net_device *dev = platform_get_drvdata(pdev);
+	struct macb *bp = netdev_priv(dev);
+	int ret;
+
+	if (bp->phy_interface == PHY_INTERFACE_MODE_SGMII) {
+		/* Ensure PHY device used in SGMII mode is ready */
+		bp->sgmii_phy = devm_phy_optional_get(&pdev->dev, NULL);
+
+		if (IS_ERR(bp->sgmii_phy))
+			return dev_err_probe(&pdev->dev, PTR_ERR(bp->sgmii_phy),
+					     "failed to get SGMII PHY\n");
+
+		ret = phy_init(bp->sgmii_phy);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "failed to init SGMII PHY\n");
+	}
+
+	/* Fully reset controller at hardware level if mapped in device tree */
+	ret = device_reset_optional(&pdev->dev);
+	if (ret) {
+		phy_exit(bp->sgmii_phy);
+		return dev_err_probe(&pdev->dev, ret, "failed to reset controller");
+	}
+
+	ret = macb_init(pdev);
+	if (ret)
+		phy_exit(bp->sgmii_phy);
+
+	return ret;
+}
+
 static const struct macb_usrio_config sama7g5_usrio = {
 	.mii = 0,
 	.rmii = 1,
@@ -4689,40 +4723,6 @@ static const struct macb_config np4_config = {
 	.usrio = &macb_default_usrio,
 };
 
-static int init_reset_optional(struct platform_device *pdev)
-{
-	struct net_device *dev = platform_get_drvdata(pdev);
-	struct macb *bp = netdev_priv(dev);
-	int ret;
-
-	if (bp->phy_interface == PHY_INTERFACE_MODE_SGMII) {
-		/* Ensure PHY device used in SGMII mode is ready */
-		bp->sgmii_phy = devm_phy_optional_get(&pdev->dev, NULL);
-
-		if (IS_ERR(bp->sgmii_phy))
-			return dev_err_probe(&pdev->dev, PTR_ERR(bp->sgmii_phy),
-					     "failed to get SGMII PHY\n");
-
-		ret = phy_init(bp->sgmii_phy);
-		if (ret)
-			return dev_err_probe(&pdev->dev, ret,
-					     "failed to init SGMII PHY\n");
-	}
-
-	/* Fully reset controller at hardware level if mapped in device tree */
-	ret = device_reset_optional(&pdev->dev);
-	if (ret) {
-		phy_exit(bp->sgmii_phy);
-		return dev_err_probe(&pdev->dev, ret, "failed to reset controller");
-	}
-
-	ret = macb_init(pdev);
-	if (ret)
-		phy_exit(bp->sgmii_phy);
-
-	return ret;
-}
-
 static const struct macb_config zynqmp_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
 		MACB_CAPS_JUMBO |
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
