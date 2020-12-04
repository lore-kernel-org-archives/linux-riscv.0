Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B23C4361A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:35:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2E2D22A99
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2E2D22A99
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eaS6GHJlWLI6M3llpe93LTexhknor1jeQgowFy3Ye6k=; b=1fuFvuGWx3f1vMtQKUOhpnzeu
	hIOT7TqYJCuSouXdOg6bX17AaonSLRqsdCxLLpeFC0RtcfBRjhNBXGzFbTJq4mj3aTIkWyVwBD5O7
	Bgl24xcxqCvGII7TOsqj/L97p2IW3hDJJ5wckVjtXF1sJgrG9xJMl12795IXxr81hAqpmkm4yFqch
	kjex13qcC5csALj4+IV7jpt00WYeH9tRmHI+04gp6jiTTs2uxqf4rIgHw7/QGMS2cx9AjtTU1dTNJ
	0XEeBdn9X9XNFpBi15OKHJQJiGmMqGuLPG/W3HO7RsEn8QrjZOf1z4mrjZDtpr9VfXTTbFyALaZE3
	kzZEz3lnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klAIz-0000Xf-60; Fri, 04 Dec 2020 12:35:21 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klAIx-0000TX-Ht
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 12:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607085319; x=1638621319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=g1J9PQBnIlV0iQX/uOV1x4ubZU85IwPi2qdU1ENP0lg=;
 b=gU08VKVCS+QswBXxes1UBwYeSfHzaQL5Jaa4UMbPIWlIpxCAyGWkmdzA
 S7Df20XxaACI4GaHveOdZTrXPX2eeqY3nk/Q+nlWSyjSPFEettQFIt14h
 BO/X9374KncHDVQ1qQpDKkKShHJwJ5M/6GIGDlIVE1AGdo8xpX90L1wDO
 PP6JYYrEJEZWTnrhPq/NLeCkHKjGc2Hl1vfYUxJ39j03joHBl75hsV9ZF
 4CFmTONXOPHp0AGZogF5G5NvA5Rwr7Bal9qJT7fdWiYrJTc8czvNwD5em
 nRX5pDe1kGEpwD5nHzZT7UUEXN3cl66MjY+IsvFELVGJOsnAonWV91mSp g==;
IronPort-SDR: D2DUSi6LWDPa/lP7TKgXBQhoI/cowMjEzS/ZVxVNk+O1U5si6Nz6305FT8GJ2k2jdtDCsSx56p
 +pedqLfAEItdgwjDrQ8XMwoegq/W/rQo7FNgrn1gdQVEBsIA8QyZUwBnOEJkyEWD+P/82bXnDl
 3mbyoiv2035rn5KZFPhkWIWh0irCIy9aOUiKyFIrv2MkfAKesu+/+6o1xyaTNXR+0sG1ZhfJX7
 r16apTftoiagZfNTpKY3ArYGvzs7fhsnI3wav3t52adL+WZtBLMUpqln6+u0myEMzU/HMEZOce
 TIo=
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="106188212"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Dec 2020 05:35:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 4 Dec 2020 05:35:18 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 4 Dec 2020 05:35:12 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH 7/7] net: macb: add support for sama7g5 emac interface
Date: Fri, 4 Dec 2020 14:34:21 +0200
Message-ID: <1607085261-25255-8-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_073519_760280_B91F901B 
X-CRM114-Status: GOOD (  10.78  )
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
---
 drivers/net/ethernet/cadence/macb_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 22340e55d4b7..2e1f9b28e388 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4570,6 +4570,14 @@ static const struct macb_config sama7g5_gem_config = {
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
@@ -4588,6 +4596,7 @@ static const struct of_device_id macb_dt_ids[] = {
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
