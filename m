Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4452C19425
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7802323B45
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7802323B45
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w+C8gXiplFLAruTFxuNsChs5MpEm5eFXYxgsS3qf1wU=; b=a9kHAJTm8ufL5sgAulPGFd/ah
	99BUwGF2z83RB2rP0+ut6inVvrBTmYUBfoDQEmYYHo/qv0nuxaqSH+8VnZ27HLFpWMyKeiUkNh4T/
	hWTJHAEqmTehssha1jDtY/BrwKfnEPkO0N660gWj4fF4zzhlpDHQxmXuM+vHu7pgntaw00yMPBblm
	4bFcFJNHD3z8mZ8zcfIpYUbCzrMMyGy/4ue+y8yorv5kwI8uyMZCRzFQ54GMzsgCagHvo03TwLaA1
	eFGhuwkLkj1gtqLz3PoVPIhHVp1H15zuNtD8wsjXoipaFFGZ3QJZ0MhrN9gaFlOSPrnpttirMB8Vv
	iVyqHEv9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmz8p-0001WZ-8K; Wed, 09 Dec 2020 13:04:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmz8m-0001UL-3r
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 13:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607519060; x=1639055060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=sg8hMoePzZkTWnlOxX0XW4Z/Hbg3HlWIuTqcx3KINpI=;
 b=WIJR7K1NXAWzKzhSS5ISET3zFzwKtCGy0OWi5utcZ6R3gKRa7U+lAOZH
 Z5z4wx5b7+Rfi2REWJ5ZamqrQhMsaDWn/TOoyuxa6fsHzi4vbwYzDvjtZ
 Y/0/B/nWInaoA+qbpY1Z+iQqXiaL6z0vJpUiUyXv0E1myd6vSPcdJ2256
 RVH7BpRKK/nkTUqn3pwtbBGvfTrloMjLq7L7dnTRsAr9VaRRlbC2Ap3hS
 0lZANd7m/wzAff83MOCi//1HMMc5mYQdDxgT8DKQjj7Em9SP9YdbXlyS7
 XhPLR3Iohkd+0doWTBWZgyuhui2p0nq0DL5Zlo+USEWZyclmIWmZTXJcb Q==;
IronPort-SDR: id3YMpwKvkEftidcEpCGiNrQnezuZwNDGcG/C76YQQXDlPzhGInltryPQ/gAj30ffNqImpqtR+
 3RyY2g78NiMjid3BmPMROrdxddgH7X9MrCNpJi6EZobSt17X/5DuRFYBpH2/XA7OxJJuRM4lHx
 Fay6Sb0nP8riyxrVMxkeGppRn94pNL5zesmXW0YhLRu17106BjjOPO8JyHDMK30I+lFGlfbr5B
 7kECiBklenDY5lcdp1UoznIKf9weso56orsW0UEAxqYXMAZ5rikIEWFasuuZFnf9yIFUjUDAv1
 vqY=
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="96475122"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Dec 2020 06:04:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 9 Dec 2020 06:04:04 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 9 Dec 2020 06:03:59 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <natechancellor@gmail.com>, 
 <ndesaulniers@google.com>
Subject: [PATCH v3 3/8] net: macb: add function to disable all macb clocks
Date: Wed, 9 Dec 2020 15:03:34 +0200
Message-ID: <1607519019-19103-4-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_080420_553821_1E50A7DB 
X-CRM114-Status: GOOD (  11.42  )
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
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 yash.shah@sifive.com, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add function to disable all macb clocks.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Suggested-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/cadence/macb_main.c | 38 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index b23e986ac6dc..81704985a79b 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3694,6 +3694,20 @@ static void macb_probe_queues(void __iomem *mem,
 	*num_queues = hweight32(*queue_mask);
 }
 
+static void macb_clks_disable(struct clk *pclk, struct clk *hclk, struct clk *tx_clk,
+			      struct clk *rx_clk, struct clk *tsu_clk)
+{
+	struct clk_bulk_data clks[] = {
+		{ .clk = tsu_clk, },
+		{ .clk = rx_clk, },
+		{ .clk = pclk, },
+		{ .clk = hclk, },
+		{ .clk = tx_clk },
+	};
+
+	clk_bulk_disable_unprepare(ARRAY_SIZE(clks), clks);
+}
+
 static int macb_clk_init(struct platform_device *pdev, struct clk **pclk,
 			 struct clk **hclk, struct clk **tx_clk,
 			 struct clk **rx_clk, struct clk **tsu_clk)
@@ -4755,11 +4769,7 @@ static int macb_probe(struct platform_device *pdev)
 	free_netdev(dev);
 
 err_disable_clocks:
-	clk_disable_unprepare(tx_clk);
-	clk_disable_unprepare(hclk);
-	clk_disable_unprepare(pclk);
-	clk_disable_unprepare(rx_clk);
-	clk_disable_unprepare(tsu_clk);
+	macb_clks_disable(pclk, hclk, tx_clk, rx_clk, tsu_clk);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -4784,11 +4794,8 @@ static int macb_remove(struct platform_device *pdev)
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
@@ -4967,13 +4974,10 @@ static int __maybe_unused macb_runtime_suspend(struct device *dev)
 	struct net_device *netdev = dev_get_drvdata(dev);
 	struct macb *bp = netdev_priv(netdev);
 
-	if (!(device_may_wakeup(dev))) {
-		clk_disable_unprepare(bp->tx_clk);
-		clk_disable_unprepare(bp->hclk);
-		clk_disable_unprepare(bp->pclk);
-		clk_disable_unprepare(bp->rx_clk);
-	}
-	clk_disable_unprepare(bp->tsu_clk);
+	if (!(device_may_wakeup(dev)))
+		macb_clks_disable(bp->pclk, bp->hclk, bp->tx_clk, bp->rx_clk, bp->tsu_clk);
+	else
+		macb_clks_disable(NULL, NULL, NULL, NULL, bp->tsu_clk);
 
 	return 0;
 }
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
