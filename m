Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54468C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EBD82339D
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EBD82339D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cv2YrBVghUY3LPjguM7X6P2XxJ5wUiCON2iNZZSiPF4=; b=GmuSNHURWg6yOUTuOuYi00xMz
	6PIW5bOMgngZfoCJtUzuCQQrhwkk76w5HHpqT6Abnds7YpeajC08GCiPCDAEmzCEAVe7hQlRXOsnC
	dEUcbku8KFreKQ0xc45406n6YHYLbeB6aj9YpxgO3WoPr+EbZOWx2ChzNuDaXzoe4HBAR6s7/EfUl
	Y+S6bnFqz79cVgoEjFVc5wmCzN8C0nScG0MzRe2bFiCYjgvkpb0/xYBAQ6twqLiU6dvUsN57i8YMx
	h5y4lnLdwMFYyQ4o7KhkvT8oBuxcrMb7AScfFiXiupCrOdfGxqdc+o9Da354JiGBkjqcC5j25E+cT
	9N+6HPtYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmFQz-0008T6-83; Mon, 07 Dec 2020 12:16:05 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmFQw-0008SF-Ms
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 12:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607343362; x=1638879362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=IKugsm/d3kZD6lpm6POkBOpF9mUABeF8EZuTFUDQaUo=;
 b=VWZmxtIbEQc1Z3PU0sgSBeL7Ls7z28O4tBZxlkWPcrhKKByhyhiDPgQp
 XfyEoGo6zXv3kbWvVNOBKpuFOfLIlJKSj0fJBqoAAABoGYD67X70uS+Ax
 dKXu9rwcaDUP/pC4B24sdP6/gKvLNU//5C0ycpBl1haJP//GjJ2vx1A6W
 kGw/k+MiOApPj4EE3O5P4PRgR+5HNkbP0DQVGQyA9PNb+jVVLtWTw1Zuh
 TgVHdwjw5HVW1AbQpQEETDJqL1w18YLvkBO0hVm8Un6E/RLxw1qkqINB9
 iypJDQaPZuJybJVdEbts9/Huigc4q95h1nGC+RQQr1Jv1cYDgGK6P2acA A==;
IronPort-SDR: D/hLZsD+sS0lWq+irP4F2zrvqsidTlIiAmkDwnu6uxhtBE80EyS5ilzSM3RzxowME678C2/8HJ
 VRHXtfLshW+IUqiJNhfuFlzZj70EcNanfIScbLCgtRyLy3KniEqpgwlL1gnONQ1N/6RAL+UfKF
 DdXTUapMJcrJD2tMZJ8wYzZ7Nv9rw/10hZpVO/lNsCfnimDTd95gSv8NBsDo65eMCPRGii4mh4
 gVztrwYiP9d7R6gKM/8/SWkulfseA0xGT+waIvpstBUBvZzDFzEnPqutPD1l5O6y1Kvg3+/FMh
 X4o=
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="106497444"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2020 05:16:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 7 Dec 2020 05:16:00 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 7 Dec 2020 05:15:53 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH v2 2/8] net: macb: add capability to not set the clock rate
Date: Mon, 7 Dec 2020 14:15:27 +0200
Message-ID: <1607343333-26552-3-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_071602_912128_E74730C3 
X-CRM114-Status: GOOD (  14.78  )
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

SAMA7G5's ethernet IPs TX clock could be provided by its generic clock or
by the external clock provided by the PHY. The internal IP logic divides
properly this clock depending on the link speed. The patch adds a new
capability so that macb_set_tx_clock() to not be called for IPs having
this capability (the clock rate, in case of generic clock, is set at the
boot time via device tree and the driver only enables it).

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/cadence/macb.h      |  1 +
 drivers/net/ethernet/cadence/macb_main.c | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 7daabffe4318..769694c7f86c 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -699,6 +699,7 @@
 #define MACB_CAPS_GEM_HAS_PTP			0x00000040
 #define MACB_CAPS_BD_RD_PREFETCH		0x00000080
 #define MACB_CAPS_NEEDS_RSTONUBR		0x00000100
+#define MACB_CAPS_CLK_HW_CHG			0x04000000
 #define MACB_CAPS_MACB_IS_EMAC			0x08000000
 #define MACB_CAPS_FIFO_MODE			0x10000000
 #define MACB_CAPS_GIGABIT_MODE_AVAILABLE	0x20000000
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 6d46153a7c4b..b23e986ac6dc 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -460,15 +460,14 @@ static void macb_init_buffers(struct macb *bp)
 
 /**
  * macb_set_tx_clk() - Set a clock to a new frequency
- * @clk:	Pointer to the clock to change
+ * @bp:		pointer to struct macb
  * @speed:	New frequency in Hz
- * @dev:	Pointer to the struct net_device
  */
-static void macb_set_tx_clk(struct clk *clk, int speed, struct net_device *dev)
+static void macb_set_tx_clk(struct macb *bp, int speed)
 {
 	long ferr, rate, rate_rounded;
 
-	if (!clk)
+	if (!bp->tx_clk || !(bp->caps & MACB_CAPS_CLK_HW_CHG))
 		return;
 
 	switch (speed) {
@@ -485,7 +484,7 @@ static void macb_set_tx_clk(struct clk *clk, int speed, struct net_device *dev)
 		return;
 	}
 
-	rate_rounded = clk_round_rate(clk, rate);
+	rate_rounded = clk_round_rate(bp->tx_clk, rate);
 	if (rate_rounded < 0)
 		return;
 
@@ -495,11 +494,12 @@ static void macb_set_tx_clk(struct clk *clk, int speed, struct net_device *dev)
 	ferr = abs(rate_rounded - rate);
 	ferr = DIV_ROUND_UP(ferr, rate / 100000);
 	if (ferr > 5)
-		netdev_warn(dev, "unable to generate target frequency: %ld Hz\n",
+		netdev_warn(bp->dev,
+			    "unable to generate target frequency: %ld Hz\n",
 			    rate);
 
-	if (clk_set_rate(clk, rate_rounded))
-		netdev_err(dev, "adjusting tx_clk failed.\n");
+	if (clk_set_rate(bp->tx_clk, rate_rounded))
+		netdev_err(bp->dev, "adjusting tx_clk failed.\n");
 }
 
 static void macb_validate(struct phylink_config *config,
@@ -751,7 +751,7 @@ static void macb_mac_link_up(struct phylink_config *config,
 		if (rx_pause)
 			ctrl |= MACB_BIT(PAE);
 
-		macb_set_tx_clk(bp->tx_clk, speed, ndev);
+		macb_set_tx_clk(bp, speed);
 
 		/* Initialize rings & buffers as clearing MACB_BIT(TE) in link down
 		 * cleared the pipeline and control registers.
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
