Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CA2C4361B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 188132339D
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 188132339D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tCrRleembU68lG3cNR4wK6DIoBTibLEjzxkZXDaPa2U=; b=2Ivv0J+fxJnMarz6Xy0yHxbKY
	RTFPK3zFsoDRhDFOt3T9brzIvdTBppd0XRnGEb30cWWBFhRdQRxX7dP/S4HEsxhTEZ4ZOf9ycFc4b
	YI2tHGZw86TeG3bumiFXvERIFX7caTx0ghRRoQug25GrDr+JF7Zz8PTnF9+WqyaBylVKpTmJWFSJw
	k5NPSyL2uJGZxB/oJlsiMGFhD2QlI7Wi7ezpF/BFN6GvO0/x6xiVmR+wZIbz73naw6Tdb3t3fMmTY
	wQWvr+KiCOwVPvAYAEADdyQM0EKez1+dgTkt8Gv978nqyqrxljb/cAoMZ8PcPTPFlVkqKw9ZWqB2g
	QiL68L5lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmFRi-0000Mr-TO; Mon, 07 Dec 2020 12:16:51 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmFRd-0000Im-AS
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 12:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607343405; x=1638879405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=7c4o9HTAPU/FWDNBRxOIP9hZ2d9X8oAOdvZ31rPTtNA=;
 b=U4L5cy7Kg0Ygbko3ug46RoZrJn+LvyxdBz7GOea9Jbvwi06j8mCx1mcT
 eWDphsjsKxmfSXDgwltiEnariqpMUhRxMoGPDI2moKi7hUv5ai/Gih1JV
 1Ra8hq9y1I1OZRdV9SD7zhViYKxJx3Wyl3r7G+NwLA4txwd5BSTa7d2sV
 NUyNs47JPFmJfoVAFpFRCtTKepKRzg29v8UJcvOZKXocaZL9BE0wGb4fL
 1Y1ryhOFs+DomGI++QXAhw+V0Qe07J99k+GlWHGvUsdMrW2IWq5VzvCPq
 fmBSfnrBAQhD1y0Wzu5OTbzQlmz8MojRqNd690GABdDklqX4oHdB1RZx0 w==;
IronPort-SDR: JpSfP/AgQp80I2E07mROSc85GO+IM9hwMHoqsZw22CNZUSZa2rNq0wbldfGl20okQ6sKRVGJlH
 L8ic9lS44WkFgjY1jRzRmbTJZcL+MBOwvETWrXcLHviyJJ7Bhg8rO7WSZMvFl0zznu4sqVjDrh
 d4oMlrBUzPgluv4nzd7+GMgIMFSCa13Ly+nMkkbu1KEekqvzDai/YQt/kAE1WN475DXBIJ00in
 tBKdxDoZIeVVPwd+/jpBSz5srUkvomlpVvZjn2eJhsr4nBmxQFp99z8KJ4JePOLrjxENiwujr5
 oAw=
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="106497590"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2020 05:16:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 7 Dec 2020 05:16:43 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 7 Dec 2020 05:16:37 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH v2 8/8] net: macb: add support for sama7g5 emac interface
Date: Mon, 7 Dec 2020 14:15:33 +0200
Message-ID: <1607343333-26552-9-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_071645_597807_C48D7FE9 
X-CRM114-Status: GOOD (  10.66  )
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

Add support for SAMA7G5 10/100Mbps interface.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/cadence/macb_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index ca56476b3a04..bb280c55c4b3 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4574,6 +4574,14 @@ static const struct macb_config sama7g5_gem_config = {
 	.usrio = &sama7g5_usrio,
 };
 
+static const struct macb_config sama7g5_emac_config = {
+	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_USRIO_HAS_CLKEN,
+	.dma_burst_length = 16,
+	.clk_init = macb_clk_init,
+	.init = macb_init,
+	.usrio = &sama7g5_usrio,
+};
+
 static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,at32ap7000-macb" },
 	{ .compatible = "cdns,at91sam9260-macb", .data = &at91sam9260_config },
@@ -4592,6 +4600,7 @@ static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,zynq-gem", .data = &zynq_config },
 	{ .compatible = "sifive,fu540-c000-gem", .data = &fu540_c000_config },
 	{ .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
+	{ .compatible = "microchip,sama7g5-emac", .data = &sama7g5_emac_config },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, macb_dt_ids);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
