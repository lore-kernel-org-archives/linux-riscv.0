Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB50C4361B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E2923B45
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5E2923B45
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4yn+jUNpLjCNQ4uG8SDeWD+L4iA1k5yleY8FCFsKjMM=; b=Spt9TTe/kTYOw7DOg+9/Jpema
	+nePrBkF7NH0Vvh8ViFW868rsH2XJf2TIJ+RFiyLrCCEMmGx998m61rLhaSGu+c1xZLsmdTcJc+Ob
	8VnNoqJEg6vIELlzZ4es99AJDHB4eumxlRP9+7jl6OZJx17GnwFz1k3Cn9jNXTTTsh5HDnsW/LMRK
	LW7Bvcjvy7imZX97iOmu8DkvF/nxvJXJg5uzujCsDhTuaVgTjFCEGSSrQhJ57Ox2LP7B4vuUQ8ilU
	br8nzZygiXPd1BDNb0mUsYFUAICRD6CqxzSdXN3GIsIS30ADEDXNkBHTogEMkmATG+YAmYx1ibVYE
	975bvSyZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmz8z-0001c9-3a; Wed, 09 Dec 2020 13:04:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmz8w-0001a2-05
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 13:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607519070; x=1639055070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HbDgA1apc3p92KhsV/3GN3NoRKjLIwJad3qyZ2Y7yKk=;
 b=FPUyQUZGp68zbO13EqTn9P0wp8ONOZW/u+IerGtS9RD1FWor9w2sRTsp
 GZfsZbyUn+1J4WgGEfymRRcgmrJeYK4SP7ct9hFx+g3ImM8cnfKj1pLy8
 QlTA4CSW8eXa6QaQQSYX7vKFYuIq7QxrClFtXH/cIey0+qGfJORXb5n7+
 82ODRvks3EWzhTj/zlblzK9unVIypaok4bxslv6LG9ozsxxbvge6wrYnf
 ZvhKClyoXPeFXWU9xiOKtVgMtGQ0uU2nzfwoodOszbY2LT0dIBjMALXft
 tNXWROCt7XYBU6ralOnSMfaXFbfjyzOYFRzv9U+Vs7qO0Me6FWSeBwC8p A==;
IronPort-SDR: UHhmzaQtbbB2lgAaBLeq4Mp1w3jTlP5U4MLAVD007wyqsTrvxDUUZ9sdPUpanh7927ZqLs7QxT
 CQww1BTLYEYUN8azrUeri+C9RyUx9leOYp5wVx8ktHpVFKD5yMo+BDhlgzD716gb6MZYHf7tr4
 VzGrw2Bv0qc2a8f9DhS64bu1H2eYN9maXFfUxpwPj88i3ltumeAeBxLfXpwyVTFLPpt6QZ/yYI
 fBTUxsoA5YQdmuBheBCatVt51SPVYR484lAc8SUzzRkjFpi603N1AA/JWgOABe0wPjebVnTZ2j
 fHM=
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="101519674"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Dec 2020 06:04:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 9 Dec 2020 06:04:28 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 9 Dec 2020 06:04:22 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <natechancellor@gmail.com>, 
 <ndesaulniers@google.com>
Subject: [PATCH v3 7/8] net: macb: add support for sama7g5 gem interface
Date: Wed, 9 Dec 2020 15:03:38 +0200
Message-ID: <1607519019-19103-8-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_080430_217264_88B4D7A8 
X-CRM114-Status: GOOD (  10.67  )
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

Add support for SAMA7G5 gigabit ethernet interface.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/cadence/macb_main.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 11bf4f8d32e1..5bae44931282 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4472,6 +4472,14 @@ static const struct macb_usrio_config macb_default_usrio = {
 	.refclk = MACB_BIT(CLKEN),
 };
 
+static const struct macb_usrio_config sama7g5_usrio = {
+	.mii = 0,
+	.rmii = 1,
+	.rgmii = 2,
+	.refclk = BIT(2),
+	.hdfctlen = BIT(6),
+};
+
 static const struct macb_config fu540_c000_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP,
@@ -4565,6 +4573,14 @@ static const struct macb_config zynq_config = {
 	.usrio = &macb_default_usrio,
 };
 
+static const struct macb_config sama7g5_gem_config = {
+	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG,
+	.dma_burst_length = 16,
+	.clk_init = macb_clk_init,
+	.init = macb_init,
+	.usrio = &sama7g5_usrio,
+};
+
 static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,at32ap7000-macb" },
 	{ .compatible = "cdns,at91sam9260-macb", .data = &at91sam9260_config },
@@ -4582,6 +4598,7 @@ static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,zynqmp-gem", .data = &zynqmp_config},
 	{ .compatible = "cdns,zynq-gem", .data = &zynq_config },
 	{ .compatible = "sifive,fu540-c000-gem", .data = &fu540_c000_config },
+	{ .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, macb_dt_ids);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
