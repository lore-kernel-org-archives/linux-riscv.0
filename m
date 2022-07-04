Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D88C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 11:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2wQVB0zfBcPOXaeHpQXksHD0zkEvSJy1ikdQO7itV8=; b=d4bXwTIRCCnF2q
	KWkYfoKXOXob8PRtTb0kJf7Ly+0YOy9faZfxWllDOmMitwzrDYXF/2xoK0+HzDquHUpM6SB457gf8
	mnPw5Nye00stqpD+IoAhJ2hrL3K1q9C3nzHZDS/4yL06D17KWdSNgJPVd/AlDsC9zd61kuCpfLpOS
	xA0zAxZAESaxnHAkYw//GH5ftJDpFs0aF2Hh5Yi98Mo7ZcMDDcoiMy75awcnWXFbfVJl7myCF6ccd
	1iBeo7W8m5DFeoBwYfCEr0Ggh2yBpI0cJtN/AMu8RsLBuYd7FsPmxwyX/+U2FYyukccGrGDJXffF0
	hVTVLRpu8w2b9dtqfHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Kbn-0087xY-2N; Mon, 04 Jul 2022 11:51:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KWu-0081Yy-E9
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 11:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656935176; x=1688471176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ut5r7XOY+8r4BHR6rDG4F4J/JbNW2GuxLXfnNQpRYeY=;
  b=QcW5WupH6cUrA40YqclWBi4A4gaeDR+C/MPwtr1alTrOvjaBA/w5O2vD
   PlDZ7REfSJFwhKtYohDD+sQlhyYlgHopqmkbabl9OysA89AV3h/oU4SZL
   xYoQswU2oNZ/XwGE6tvT8CTHnV5+yb0Np6SUUMSZZMTkOGb8ij0brzM23
   YYh+DlSj0BbQ4EZloowTQGCy2H98xm2NuY6WjNPB1X+A6+7pm994aBQhw
   LzIG/pVAZqyS5GO6DSuSaAnbqwdIKQzPO1o0XP5ozqGSuMl6RUvv7Hsny
   Y7rwR47leSzhdPj5FH9g9IlQ4eclFLGbEpsIxusho25jcrBH3pTZpSDGh
   g==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="170950913"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 04:46:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 04:46:15 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 04:46:12 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [net-next PATCH v2 4/5] net: macb: simplify error paths in init_reset_optional()
Date: Mon, 4 Jul 2022 12:45:11 +0100
Message-ID: <20220704114511.1892332-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704114511.1892332-1-conor.dooley@microchip.com>
References: <20220704114511.1892332-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_044616_527349_E0B8564C 
X-CRM114-Status: GOOD (  10.35  )
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

The error handling paths in init_reset_optional() can all be
simplified to return dev_err_probe(). Do so.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 85a2e1ea7826..4423d99c72a7 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4699,27 +4699,21 @@ static int init_reset_optional(struct platform_device *pdev)
 		/* Ensure PHY device used in SGMII mode is ready */
 		bp->sgmii_phy = devm_phy_optional_get(&pdev->dev, NULL);
 
-		if (IS_ERR(bp->sgmii_phy)) {
-			ret = PTR_ERR(bp->sgmii_phy);
-			dev_err_probe(&pdev->dev, ret,
-				      "failed to get SGMII PHY\n");
-			return ret;
-		}
+		if (IS_ERR(bp->sgmii_phy))
+			return dev_err_probe(&pdev->dev, PTR_ERR(bp->sgmii_phy),
+					     "failed to get SGMII PHY\n");
 
 		ret = phy_init(bp->sgmii_phy);
-		if (ret) {
-			dev_err(&pdev->dev, "failed to init SGMII PHY: %d\n",
-				ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "failed to init SGMII PHY\n");
 	}
 
 	/* Fully reset controller at hardware level if mapped in device tree */
 	ret = device_reset_optional(&pdev->dev);
 	if (ret) {
-		dev_err_probe(&pdev->dev, ret, "failed to reset controller");
 		phy_exit(bp->sgmii_phy);
-		return ret;
+		return dev_err_probe(&pdev->dev, ret, "failed to reset controller");
 	}
 
 	ret = macb_init(pdev);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
