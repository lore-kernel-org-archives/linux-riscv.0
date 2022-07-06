Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA4CC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJYRefdFxhbWGit2hmAgMB9nLxRuNuyK0y+4fsRR1tQ=; b=K62BMKDbo0X7u0
	0XoHrJ5cxDa4LcADi4dj1+ID4XsY6/8p4eOQD6dgulw0zEwasdvs+czeLyPxJV251ASY6C/dqKMoK
	eS+avJVD+nkDe69SLwCpQmhnzoT+RsXhfNZG+hZYc7UGw3J4b3sZdafEDjw6ENX12w0vxq+tw0rD6
	1ofpM1eDveR4P5IWpOA9DvBm765DahSenD+BXLvoaieOsyXjV/bBXOXeFrWCf6d77qTTOEdrghekd
	qlskWDiN1BIIB9VUEBGcHNkbWC2ATYMxEPgx4qe4ZqBBLN+MK5+3ZTJzSLbMRbnjeWbf6QJg77ULh
	2wFyway9K4j5sWb6up5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91zH-008CsF-17; Wed, 06 Jul 2022 10:10:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91hW-007xYP-Ux
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 09:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657101127; x=1688637127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ixTEFBBCmvimE/C5V7LJETD7sFfJnFOViWRROURSZYU=;
  b=Kq3MQx2h+2ezWp0W8oP7EAtoY3pCtmxfR5uAZUhaaKR8Fpvbq2Q2Aq2v
   KMaears63GfdBnR3SsxYIIqv6ciPEtNe2dkiH5IxGzm+u++HcI0nXk5GM
   C7jBi1RoNm0zBzr53vug/WYNbbUOstTfEK05qg8GgmWCHe2EeMZrG7czB
   pQzFmYTzLpVo0s4LXuw/1CU8Y0aPJsQp0BrmBhdmt9nFGcfqc6DmS/Egv
   55b72BhlCHISCKCO8espI2JyFnIUq+k3ELg6NwtdnsB7qHcdXvMB6cYoB
   6ivDSMDWUpaSMd/3Aqe+jq55z5Kv0bo63RSmo4ATR1nr5yut6aTk0ODIi
   w==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="163537865"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 02:52:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 02:52:05 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 02:52:02 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [net-next PATCH v3 4/5] net: macb: simplify error paths in init_reset_optional()
Date: Wed, 6 Jul 2022 10:51:28 +0100
Message-ID: <20220706095129.828253-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706095129.828253-1-conor.dooley@microchip.com>
References: <20220706095129.828253-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_025207_107148_5D42A162 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
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
