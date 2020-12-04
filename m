Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48846C4361A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:35:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DBD22A99
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DBD22A99
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ABo3LkTGa1nxeAX3h3payBqFKeTZ3gsBSHmRkADPZ7s=; b=nkUjEonf/i/jI8yfywbpd+PYf
	ykfA+9bJNh+6aZSQuuhuCamPnWfQTFuvB0x8BEfiJilIC55ugFiXX2boS+HvT2XkTCaH4W478jc6u
	ZOkOA52g5m2y80br7+O0+2frPEHCth6iqbxfPuRDk5Y9sIWC+KFg5QUGYZ7S87JHEgzerwYk+ypol
	PyXeG65s1kyzC7WSbbzToJko8YauqS9U84C6qzzH6klj/v7db+XUSEKZS29yXoCDYw49nnp3ikHhd
	oN1JJ01LQEMD/NSn6/4onXxotLsLhJWBLxVw615fImP3LiFbP+i/BpJZZiU+Ey4ouEaP2hKvkKpFo
	cL934wlyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klAIu-0000VE-Ds; Fri, 04 Dec 2020 12:35:16 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klAIr-0000TX-4g
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 12:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607085312; x=1638621312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=yzKQluhYPffqyE+muc7ujoCkg9zgVEFQBijHQdhkibk=;
 b=K3t9a0U1X4Jn66QvwElG/tIMQRei3jVo0nMjxIRXmiLw5PFpvtfA60SI
 fOyN9vxRak6cjIUAHlnm2qsJEdCQk5dCdP/LcvTMlxJUpx5sD+F+uTFdP
 /TnwXqMFCbrAXY+iK/TxIuqmbR1e6mOXvE2lmYKwb37XFPYzT+X7r2G4i
 081E8Xrwxacy1x0lnerhf/FjRFI5CFfLG20uTv1UFqQXJZTw4x+D3jvIk
 iNSlLXHLxpLl6D69iMukK3jNj/E5y+n5WhGrX4KY8EQCNnrBb7d9fUoXY
 pe+mQyELjVJnnd1lE0kSY6oY3wMMhan2jsKOpnqXVxxY5Ba+c3kJ0imz+ w==;
IronPort-SDR: 56pKorbgBMzy4H9gJX9mAjHU66b5Tv7xjzoKOfeQriAozK6hoifvsE7LIZH21kDwzfxU542zbv
 axKxp2m9LCMvba3btBfSSU9Hg5d5uFQ/0xFYFZEJVce4m9q3t94UowO0ExohEx7Df1b44i+cgz
 nLlPpEj3OKh0/NWRv+7i6+lHVGPTZYZyTWrNTsDt5OP5lrbh1yrP0hv1nkUMaWZQ37/wOyN4P5
 NBfpeyxrYTXN2GKn/3keBaSYQNUELc/Xcs12xUPU1/Ef3J8DJA7kz+MbkVaMtkSevAhE4NQj6Z
 sj8=
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="106188165"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Dec 2020 05:35:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 4 Dec 2020 05:35:11 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 4 Dec 2020 05:35:05 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH 6/7] net: macb: add support for sama7g5 gem interface
Date: Fri, 4 Dec 2020 14:34:20 +0200
Message-ID: <1607085261-25255-7-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_073513_358305_6F8D6AA3 
X-CRM114-Status: GOOD (  10.42  )
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

Add support for SAMA7G5 gigabit ethernet interface.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 29d144690b3b..22340e55d4b7 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4461,6 +4461,14 @@ static const struct macb_usrio_config macb_default_usrio = {
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
@@ -4554,6 +4562,14 @@ static const struct macb_config zynq_config = {
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
@@ -4571,6 +4587,7 @@ static const struct of_device_id macb_dt_ids[] = {
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
