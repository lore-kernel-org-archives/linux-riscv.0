Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E86C4361B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7AC82339D
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7AC82339D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RsQfvfp6wiYeWDkRfy0v14mWR/Di6xcl6m3g3W/piss=; b=t/2HIrh7dBUXBcqiOXYz+E7zW
	WsPcg/PbUbzjb85hKy/st/vNV+a9unDTpUeYSwKbsUEnWNcsB20Wr4yyZ7GESTO1lDjqAforKDRK5
	Tr3NpwnHfC1lrFPCAjQd142XvkcL7P5c9rnMrp3uo4pZOhYzfkYqF5MfVJCzTJnnnT6Gx3Ap0uQE8
	YP1XPFmhJtIMAweyxVDH/RDoa4OnSouZNu78wjO0ClfEmBWKYEmOzQE63eAlaNEf5cWmUFCmEjWpD
	18KGRVcAIlENMI+XPU6tOBrt5cDVq1AzjKMXBpVxh9dSB/FjODGau4FHIF++GhA66chUCeq3QnmCD
	rmCTFeG5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmFR6-0008Va-TV; Mon, 07 Dec 2020 12:16:12 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmFR3-0008Ub-UP
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 12:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607343369; x=1638879369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Gy8Pc0VWAdq3BNbu92BtoqbTlIqU+jDmxbRUZaKX4PE=;
 b=XibNXLrP9acLK/k5AO9hy8D9PZU9/ITKAx3D0MBukch+sUiPIPYbUSIt
 g5W2O+ZjcNbnX7yYiovtJqrfUeFVP7cbAPfCeF0P7UQ+lZSlcPVUICGlv
 bH/oiHZWhGru4kMQBrzytkHJA5/F2iZ22TZnpg1WdLz7dWOk+1DjpiXtI
 zEZqzegI+cczEaiXjU691pVo56B73yu+o/WeSybGyulpE7VIQAPN2LGUy
 f4WUrorxrkWP5SjMWtYh8tmsU72+4uIWAm7sPCoa+kJF/K33ZOrlmr1lW
 i2I4T3GqCBvCX22NXZKVW9Qk7lLHN+BLjbsMogH5FPPfwtUl0aA4iI8ga w==;
IronPort-SDR: /V9twlE602QPNR69lBGkEvoPJAm3mqAHtSjQZCKSFv3Dc7wV8dY163yPia7wSSteLG8SRMAc33
 9aHDRS0p9zENhVOzcaBVIg1BorFFNaXuoIuUP31SJkG0ILM9POagYPY+mBcSARPbAftRHUsSMu
 iQVMz1PQ62qrychZaNaZ/x9Ofa7JX4tuGXWZ8LZ9q6QlFLi8a0+8AYdr1ioQJqatPtQJnFWouy
 gblveH1W6wbNFIzkgWm1L/Ah0paywYqrFiCUXec22uuKLg63r45jYDISyZPTTt20nZUcPY84K5
 K5w=
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="98863491"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2020 05:16:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 7 Dec 2020 05:16:08 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 7 Dec 2020 05:16:00 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH v2 3/8] net: macb: add function to disable all macb clocks
Date: Mon, 7 Dec 2020 14:15:28 +0200
Message-ID: <1607343333-26552-4-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_071610_158325_6FF55A68 
X-CRM114-Status: GOOD (  11.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, yash.shah@sifive.com,
 linux-riscv@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add function to disable all macb clocks.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Suggested-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/cadence/macb_main.c | 62 ++++++++++++++++----------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index b23e986ac6dc..6b8e1109dfd3 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3694,6 +3694,16 @@ static void macb_probe_queues(void __iomem *mem,
 	*num_queues = hweight32(*queue_mask);
 }
 
+static void macb_clks_disable(struct clk *pclk, struct clk *hclk, struct clk *tx_clk,
+			      struct clk *rx_clk, struct clk *tsu_clk)
+{
+	clk_disable_unprepare(tx_clk);
+	clk_disable_unprepare(hclk);
+	clk_disable_unprepare(pclk);
+	clk_disable_unprepare(rx_clk);
+	clk_disable_unprepare(tsu_clk);
+}
+
 static int macb_clk_init(struct platform_device *pdev, struct clk **pclk,
 			 struct clk **hclk, struct clk **tx_clk,
 			 struct clk **rx_clk, struct clk **tsu_clk)
@@ -3743,40 +3753,37 @@ static int macb_clk_init(struct platform_device *pdev, struct clk **pclk,
 	err = clk_prepare_enable(*hclk);
 	if (err) {
 		dev_err(&pdev->dev, "failed to enable hclk (%d)\n", err);
-		goto err_disable_pclk;
+		hclk = NULL;
+		tx_clk = NULL;
+		rx_clk = NULL;
+		goto err_disable_clks;
 	}
 
 	err = clk_prepare_enable(*tx_clk);
 	if (err) {
 		dev_err(&pdev->dev, "failed to enable tx_clk (%d)\n", err);
-		goto err_disable_hclk;
+		tx_clk = NULL;
+		rx_clk = NULL;
+		goto err_disable_clks;
 	}
 
 	err = clk_prepare_enable(*rx_clk);
 	if (err) {
 		dev_err(&pdev->dev, "failed to enable rx_clk (%d)\n", err);
-		goto err_disable_txclk;
+		rx_clk = NULL;
+		goto err_disable_clks;
 	}
 
 	err = clk_prepare_enable(*tsu_clk);
 	if (err) {
 		dev_err(&pdev->dev, "failed to enable tsu_clk (%d)\n", err);
-		goto err_disable_rxclk;
+		goto err_disable_clks;
 	}
 
 	return 0;
 
-err_disable_rxclk:
-	clk_disable_unprepare(*rx_clk);
-
-err_disable_txclk:
-	clk_disable_unprepare(*tx_clk);
-
-err_disable_hclk:
-	clk_disable_unprepare(*hclk);
-
-err_disable_pclk:
-	clk_disable_unprepare(*pclk);
+err_disable_clks:
+	macb_clks_disable(*pclk, *hclk, *tx_clk, *rx_clk, NULL);
 
 	return err;
 }
@@ -4755,11 +4762,7 @@ static int macb_probe(struct platform_device *pdev)
 	free_netdev(dev);
 
 err_disable_clocks:
-	clk_disable_unprepare(tx_clk);
-	clk_disable_unprepare(hclk);
-	clk_disable_unprepare(pclk);
-	clk_disable_unprepare(rx_clk);
-	clk_disable_unprepare(tsu_clk);
+	macb_clks_disable(bp->pclk, bp->hclk, bp->tx_clk, bp->rx_clk, bp->tsu_clk);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -4784,11 +4787,8 @@ static int macb_remove(struct platform_device *pdev)
 		pm_runtime_disable(&pdev->dev);
 		pm_runtime_dont_use_autosuspend(&pdev->dev);
 		if (!pm_runtime_suspended(&pdev->dev)) {
-			clk_disable_unprepare(bp->tx_clk);
-			clk_disable_unprepare(bp->hclk);
-			clk_disable_unprepare(bp->pclk);
-			clk_disable_unprepare(bp->rx_clk);
-			clk_disable_unprepare(bp->tsu_clk);
+			macb_clks_disable(bp->pclk, bp->hclk, bp->tx_clk,
+					  bp->rx_clk, bp->tsu_clk);
 			pm_runtime_set_suspended(&pdev->dev);
 		}
 		phylink_destroy(bp->phylink);
@@ -4966,14 +4966,16 @@ static int __maybe_unused macb_runtime_suspend(struct device *dev)
 {
 	struct net_device *netdev = dev_get_drvdata(dev);
 	struct macb *bp = netdev_priv(netdev);
+	struct clk *pclk = NULL, *hclk = NULL, *tx_clk = NULL, *rx_clk = NULL;
 
 	if (!(device_may_wakeup(dev))) {
-		clk_disable_unprepare(bp->tx_clk);
-		clk_disable_unprepare(bp->hclk);
-		clk_disable_unprepare(bp->pclk);
-		clk_disable_unprepare(bp->rx_clk);
+		pclk = bp->pclk;
+		hclk = bp->hclk;
+		tx_clk = bp->tx_clk;
+		rx_clk = bp->rx_clk;
 	}
-	clk_disable_unprepare(bp->tsu_clk);
+
+	macb_clks_disable(pclk, hclk, tx_clk, rx_clk, bp->tsu_clk);
 
 	return 0;
 }
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
