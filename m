Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FB3C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZTw5GlBZjNFNNdHTk9A5kMfMGVQkVZxofbVft7tBYo=; b=HkTviqO1l3ONKq
	jURua3slBD0WEMh6EOiE5Go5H2+q8593W+XK5irMNURmXcDI/lwAVTCOurHIm4xaiy9uXUXnH+7ML
	V9kRBCClT+UW/vr33h7AAasmvW3IqGafdQiqDeqZDhd9QxA2yqHJrTuseJed/EvtLCdco9ueIx2SQ
	jZw5Q6kMoq97KVsI4MCvteMG6FeBbI4aQ2JMOjpIlUcO7q7JGsjTPK/73iXL+o6eEQrPjV1hDYF4g
	iExuQ5fPRZIM/gJXmb7IEJReCMrXZqwRbv0+hvu2KaC+ppMtkF+D8ey6yQ1CImTeS/i4bjKGht/gX
	OcdilpnIJ/N8Gs6A4xGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y87-00EjRw-Vk; Sun, 19 Jun 2022 16:50:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y80-00EjOJ-II
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 16:50:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id e25so7804336wrc.13
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jun 2022 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gopwvsW4YZ7UonEyNdDMzhV85NCQ2TW0QKUGmgQ7L+A=;
        b=PPRsmuFvXCAnoP528hN1t16BHLynhT/bO2rdEnC0Xz4knixhQo48QsK8CVqIHwVuHt
         1MQg+IXAktJOWtHvgZLi01BCJEpfF/f0hjZVEfXIAxarIhHn6jci/o5r56pFckiE8lHO
         xL59bWW7auYReXeIDVHZsU0rdTbOm3y/6AU5GDj6hfOgM3Z9IUpA6BkY0zdE1EW5fB5f
         +23QiHLcxNZUnzSIlRpsFejQ2aPd3p1xJe3rpFvVIMpk/4G461je7S5b+gh2lMtMzirn
         D31QY5/tHoJHPcYQY9eO3U/UXkD5nKSCshArD8i5ieLniTPWojHTEIPDmte7x4BtDIla
         3uhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gopwvsW4YZ7UonEyNdDMzhV85NCQ2TW0QKUGmgQ7L+A=;
        b=4C5ZzJWJ0nOeOVElLHru9Uc1leJegmtmJHIjHdiDlBRr+6m31vFss6ECmCFuVkgWY/
         EhL5ZydgYaB5blZJSWh7YbJzS6Saf6HWWMHfQElWDtqhh7C1RVbBRVgh7dn2kZUJ6CM1
         T6L86OcdVOr9dYEkJ3At1jjFnathdoTgas/xCyZrVApQpz9tbZ7ql0ZyykD2NqsK/uGT
         MC+ItExB04bOG/O+7Q977EnjHMnDVUpx2sTcDEn0igUeQBswQkEj57E9yWcAifwSmhFe
         UpGbLznMe8c+KO2Oj2V1KGrNcVZAPXXOc9f+PbnyEDS7IFxwqQB6d1NDP5zuCkPCKl/1
         j61Q==
X-Gm-Message-State: AJIora8FP+fGxiQ1/stBYfgNBzAcU1yyOfjwQxQETjf6ujHjIi0JMBoF
	yrrNDMieh/6Ilm3nF8k3FBdcnw==
X-Google-Smtp-Source: AGRyM1u8/TXPS06SfhDWZfnvfFABhGjitdfgdEIZo8EF7U4BuS6IZE7QVX/Y0ckD0cYHUGtSh+yJwA==
X-Received: by 2002:a05:6000:2c7:b0:219:b52d:d122 with SMTP id o7-20020a05600002c700b00219b52dd122mr18399366wry.507.1655657422909;
        Sun, 19 Jun 2022 09:50:22 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm9189510wrj.6.2022.06.19.09.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 09:50:22 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC 5/6] net: macb: add polarfire soc reset support
Date: Sun, 19 Jun 2022 17:49:35 +0100
Message-Id: <20220619164935.1492823-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220619164935.1492823-1-mail@conchuod.ie>
References: <20220619164935.1492823-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_095024_656569_93BB6F33 
X-CRM114-Status: GOOD (  14.99  )
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
