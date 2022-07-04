Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A466C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqgocqaeH68uxNEgev3abW5T5AY1shP1Zi4ghq4AGjY=; b=Sid89Go2iVSB25
	YLN/N/Rg/4uRfvGVuiSY56LozZn8fBUwj/uwtpfxpKcoKYId75F6qp9539fMUDEnx2H7BIna7kVE1
	IrJL+jKJFpU0SyF2DJPf01G5AxC6XuhhkZQhOydzq+csr1OkBf1C8GZ9VNZMMvjhFWW1lxZ4mDdAx
	18sZL2YcU576Nt3RapIKvFWXooMOlJNzm1+EmZknUNWtZ5zcVgClu4Yq+MjKicXDPkTPkkkUypdSX
	fuv2+5XO3kDzaOnW2rxyrVmknQooZhVVTcrsVR1VakmuH0hiF2PJj9x/Qnd2V/FssqLaHu1GR2uox
	LlJAPIPLSrdMkAUm6LOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KcA-0088Qb-0s; Mon, 04 Jul 2022 11:51:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KWy-0081f8-2Z
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 11:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656935179; x=1688471179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zfbKyBLC0mFyQIJx/KT+jhrSiCA/8O4T/yeF8thm6iM=;
  b=vEohZ2okuoWK8d48kO5MJR89H8FFykMEhBel6WsCgRmfLc59j5ctLr3C
   KBd9kUUmhZ9jl41Ky7AkudE0jve3rBuY8G2TgpKzBG3TQL2Y7IAu89lVF
   cSh47fryrb2lFHeo/7+9WUACIcZhVeD4gGgIul14iuCk5+7TZS1ev1gCt
   yvV9F0czkqGGbe5ijjfXZ1Oq0v1umeRKSi21uyvof9JILfVv1E4R22OZY
   Gzs0aM/mVUQKcDxhRzvA5tAT0fhXzK0Y+R/hZDI+3+lQSTMWsqE7+ckJ5
   0a7txDpDQnfihip+LHijaFmzWLCnBwKZt29mGMAZ6OxtA/zqmBsdZ5+5e
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="170950918"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 04:46:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 04:46:18 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 04:46:15 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [net-next PATCH v2 5/5] net: macb: sort init_reset_optional() with other init()s
Date: Mon, 4 Jul 2022 12:45:12 +0100
Message-ID: <20220704114511.1892332-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704114511.1892332-1-conor.dooley@microchip.com>
References: <20220704114511.1892332-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_044620_169167_7A73E25E 
X-CRM114-Status: GOOD (  13.01  )
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
