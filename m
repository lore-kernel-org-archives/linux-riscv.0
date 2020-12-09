Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F21EC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C66CA23B45
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C66CA23B45
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=djO0g1jNs1xI76Uyoj/qxb9O4O+gstjXe70iv83t/d8=; b=wPCnIHuBqko+QNBWTzZIzHsoB
	qO1Hxm+jdIEX80CQOMtJ5fCHeixKrFNssutQq8RyA0+c+8O3KkpoNh9XW1B6UT+iswX8105u5se58
	rTfUlDb6PQc0SwNTtsM2y/l6eomZGeUPVNnvlSuXuX0gWo3fjgDyGEpmUGwhNGMmeDA/fdEvSUgdd
	PVGrblRVq1lOXjsJy2yArRWjiF5Nerbxoi6Tz938E/pE1mJi2FXWe3az3b2v5MpGCaKnc34vQS3UA
	XID3rsTXUV0/rjfhaRo504sbczF8+hOExdvmYyYIAqlNyGW95Boj+Ywb8aaEM5dTEuo5NM0ycqgCw
	O/k08Wsqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmz8Y-0001R5-OD; Wed, 09 Dec 2020 13:04:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmz8W-0001Nu-Bf
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 13:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607519044; x=1639055044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=PBMnO1VSHI9r6EHfdysUn/OdEkmam+sImjFCxbEArP0=;
 b=HrT4iowz/BpujbPWYwuXEyhFAoDOheCmkfNj8vI6WWTzjl8Qaknpam9m
 S5RG/C7ESXH2DzGdFVoyPW0TeVGy24zKJNdGumqPA8eH2DH7n3I1jZEbE
 yBSpsXcKKeWrgM2frRInrqm4A8+wOo7ksuh2tkN37WgI3A11FwKncTlLb
 ZS9yAHI4Qt8M+/pQz6cBenHBV/Zx9jAbGN34DdBi2b87wdZ2R18YDg0jp
 RKez1h7PNKwBEy7LlziXOFImVDpRHMPf0nYlneB6kV8S1xCFt1ZxWbU1f
 w89VMOr1nf+jlCThUbZb5sDyDNNREd4bjJk7XUZYWrO4dvYrCmizvLgkU g==;
IronPort-SDR: wrEO6W3284UM+3qUBQUJu8lgFzEFqpdEi6XJW5zW+8Hy9woIIOshmViNgm4tRckn/xbvZXLI8D
 69c+yxh26awkO1YCIcXzdZggMtRita38Ym0b1vxiEA1gAxMOf/eOrAJaotNOdjk2BBOevQTOhN
 jhXlqTrEueF7jHKhIKECE8B4MwMP3ufM8OxrJ86ZMXt0VOUUZk1XTrxanlmV/jbgTngIAO2/Mj
 5bKAGLEyxtCQn3BhtA9daE1r7ywuCv6G3qMypolm2ZE/+1NDVQ7lcwGYfD6dlyeUMz8r2iHBGh
 T4c=
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="96475098"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Dec 2020 06:04:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 9 Dec 2020 06:03:52 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 9 Dec 2020 06:03:47 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <natechancellor@gmail.com>, 
 <ndesaulniers@google.com>
Subject: [PATCH v3 1/8] net: macb: add userio bits as platform configuration
Date: Wed, 9 Dec 2020 15:03:32 +0200
Message-ID: <1607519019-19103-2-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_080404_592175_B8C8F7DB 
X-CRM114-Status: GOOD (  12.39  )
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

This is necessary for SAMA7G5 as it uses different values for
PHY interface and also introduces hdfctlen bit.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/cadence/macb.h      | 10 ++++++++++
 drivers/net/ethernet/cadence/macb_main.c | 28 ++++++++++++++++++++++++----
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 1f5da4e4f4b2..7daabffe4318 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1147,6 +1147,14 @@ struct macb_pm_data {
 	u32 usrio;
 };
 
+struct macb_usrio_config {
+	u32 mii;
+	u32 rmii;
+	u32 rgmii;
+	u32 refclk;
+	u32 hdfctlen;
+};
+
 struct macb_config {
 	u32			caps;
 	unsigned int		dma_burst_length;
@@ -1155,6 +1163,7 @@ struct macb_config {
 			    struct clk **rx_clk, struct clk **tsu_clk);
 	int	(*init)(struct platform_device *pdev);
 	int	jumbo_max_len;
+	const struct macb_usrio_config *usrio;
 };
 
 struct tsu_incr {
@@ -1288,6 +1297,7 @@ struct macb {
 	u32	rx_intr_mask;
 
 	struct macb_pm_data pm_data;
+	const struct macb_usrio_config *usrio;
 };
 
 #ifdef CONFIG_MACB_USE_HWSTAMP
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 7b1d195787dc..6d46153a7c4b 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3913,15 +3913,15 @@ static int macb_init(struct platform_device *pdev)
 	if (!(bp->caps & MACB_CAPS_USRIO_DISABLED)) {
 		val = 0;
 		if (phy_interface_mode_is_rgmii(bp->phy_interface))
-			val = GEM_BIT(RGMII);
+			val = bp->usrio->rgmii;
 		else if (bp->phy_interface == PHY_INTERFACE_MODE_RMII &&
 			 (bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
-			val = MACB_BIT(RMII);
+			val = bp->usrio->rmii;
 		else if (!(bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
-			val = MACB_BIT(MII);
+			val = bp->usrio->mii;
 
 		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
-			val |= MACB_BIT(CLKEN);
+			val |= bp->usrio->refclk;
 
 		macb_or_gem_writel(bp, USRIO, val);
 	}
@@ -4439,6 +4439,13 @@ static int fu540_c000_init(struct platform_device *pdev)
 	return macb_init(pdev);
 }
 
+static const struct macb_usrio_config macb_default_usrio = {
+	.mii = MACB_BIT(MII),
+	.rmii = MACB_BIT(RMII),
+	.rgmii = GEM_BIT(RGMII),
+	.refclk = MACB_BIT(CLKEN),
+};
+
 static const struct macb_config fu540_c000_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP,
@@ -4446,12 +4453,14 @@ static const struct macb_config fu540_c000_config = {
 	.clk_init = fu540_c000_clk_init,
 	.init = fu540_c000_init,
 	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config at91sam9260_config = {
 	.caps = MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config sama5d3macb_config = {
@@ -4459,6 +4468,7 @@ static const struct macb_config sama5d3macb_config = {
 	      | MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config pc302gem_config = {
@@ -4466,6 +4476,7 @@ static const struct macb_config pc302gem_config = {
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config sama5d2_config = {
@@ -4473,6 +4484,7 @@ static const struct macb_config sama5d2_config = {
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config sama5d3_config = {
@@ -4482,6 +4494,7 @@ static const struct macb_config sama5d3_config = {
 	.clk_init = macb_clk_init,
 	.init = macb_init,
 	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config sama5d4_config = {
@@ -4489,18 +4502,21 @@ static const struct macb_config sama5d4_config = {
 	.dma_burst_length = 4,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config emac_config = {
 	.caps = MACB_CAPS_NEEDS_RSTONUBR | MACB_CAPS_MACB_IS_EMAC,
 	.clk_init = at91ether_clk_init,
 	.init = at91ether_init,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config np4_config = {
 	.caps = MACB_CAPS_USRIO_DISABLED,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config zynqmp_config = {
@@ -4511,6 +4527,7 @@ static const struct macb_config zynqmp_config = {
 	.clk_init = macb_clk_init,
 	.init = macb_init,
 	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config zynq_config = {
@@ -4519,6 +4536,7 @@ static const struct macb_config zynq_config = {
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct of_device_id macb_dt_ids[] = {
@@ -4640,6 +4658,8 @@ static int macb_probe(struct platform_device *pdev)
 		bp->wol |= MACB_WOL_HAS_MAGIC_PACKET;
 	device_set_wakeup_capable(&pdev->dev, bp->wol & MACB_WOL_HAS_MAGIC_PACKET);
 
+	bp->usrio = macb_config->usrio;
+
 	spin_lock_init(&bp->lock);
 
 	/* setup capabilities */
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
