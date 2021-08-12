Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E181BC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:45:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A495B60EE5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A495B60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RhTC0dtoR58x+OjS734PhbEnEilES57c6nAAdtStYbk=; b=nQVSm7cAdVjs18
	gvjtK7FP0uebrd3LyX8jaVBzoHhLKcFIC3jBSUUXAyuCzUpuwwSXR88JoHpmCigu0ltc2wv1ZjqdM
	hyRfnFhUlzuh4hg7zRrNmLNlAIxpLsxHVTh6/rVEd59p18SBkGs5PRdlnBThRZaSVHRSBKERglnzZ
	Xr1klBYP6NJ6m8qeAw7q32FccHVxiUonr4C35SaMwg3d8/52NSCnW6RYoTwTtkQ12m4LBX3w3Xzwt
	2Li/wgK/do7FuaAIu9vXKnMVWWv+CP+Ba013WUqH7gTBGGuX0ZQATp3reAgGa4GNeRzpwi+J1E8tZ
	Cl2ltHTn5oXYT8NUiT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE5OM-008xzQ-VB; Thu, 12 Aug 2021 07:44:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE5OD-008xvT-0O
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 07:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628754272; x=1660290272;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=LR8LWE1CYZvg3jg13iK01DDmUkN7vvjsZ05D6kFuE2c=;
 b=G18ByoD1lZLnEWqcxMjZHC05qoTR3slUgdGpumGmm1dhHB2lcWtWiXE+
 rWK8DhMaD82ZiJtUuDWleEiGwCQxWF5xHEuqL2Kt7ROe9cujP+6V6jVNQ
 FK1jThIew9kILu54m4wyPlvdHpJiPYo3kSLE3+Yq0JnZZn7OruKjs41KI
 BCtBbL0RLxwXkx3KmJcTpIr0RLmSh2p5U8Jvi/CutPaSwxyd/Qx/4xIRn
 BQJn7uWL/IkcVFvJHIn2ug4mZVgFwdEAE3vwU2aW2i/9bLtFnP3X//6+U
 xYSazKGEQ7F3S9AGCdLeuEgOs+hveTBsfEzzUCcIAXBkreYTT14ye/hgO Q==;
IronPort-SDR: JR9/pWOEuAoC9x+PzmZbeGeGU9f25/AAKXPRjHw2Ctg4P4PXKCrYZqz39n7T+GVSlf7gD4DFuk
 RJ93ki3TYKS68R4UZUsSy51Y3j8Jy+ui2uxm6XCbXvtu2o4MAeh3GwsNye3f64s0stG2gGUZ+c
 iV+AlFfyCB6ZLrYRWkF9r6SA+ee7Nkde47zVjdFRVDBRxef1TPSScatthU9qBY7YfXQ4tCDoVN
 zmC0sdocUUsidsu86ZaGoXTQMCwHuNYMas0ga4t5uvW8JBuvKZ8fQ6L0zWivnp2peOxpSf2O7m
 3MysDY+1jcy5bs43nD5x4dt9
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; d="scan'208";a="139788973"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Aug 2021 00:44:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 12 Aug 2021 00:44:30 -0700
Received: from che-lt-i63539u.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 12 Aug 2021 00:44:25 -0700
From: Hari Prasath <Hari.PrasathGE@microchip.com>
To: <nicolas.ferre@microchip.com>, <claudiu.beznea@microchip.com>,
 <davem@davemloft.net>, <kuba@kernel.org>, <linux@armlinux.org.uk>,
 <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <robh@kernel.org>, <devicetree@vger.kernel.org>
CC: <mpuswlinux@microchip.com>, <Hari.PrasathGE@microchip.com>
Subject: [PATCH net-next 1/2] net: macb: Add PTP support for SAMA5D29
Date: Thu, 12 Aug 2021 13:14:21 +0530
Message-ID: <20210812074422.13487-1-Hari.PrasathGE@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_004433_137277_2F2EFF1A 
X-CRM114-Status: UNSURE (   8.20  )
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

Add PTP capability to the macb config object for sama5d29.

Signed-off-by: Hari Prasath <Hari.PrasathGE@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 181ebc235925..d13fb1d31821 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4533,6 +4533,14 @@ static const struct macb_config sama5d2_config = {
 	.usrio = &macb_default_usrio,
 };
 
+static const struct macb_config sama5d29_config = {
+	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_GEM_HAS_PTP,
+	.dma_burst_length = 16,
+	.clk_init = macb_clk_init,
+	.init = macb_init,
+	.usrio = &macb_default_usrio,
+};
+
 static const struct macb_config sama5d3_config = {
 	.caps = MACB_CAPS_SG_DISABLED | MACB_CAPS_GIGABIT_MODE_AVAILABLE
 	      | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO,
@@ -4610,6 +4618,7 @@ static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,gem", .data = &pc302gem_config },
 	{ .compatible = "cdns,sam9x60-macb", .data = &at91sam9260_config },
 	{ .compatible = "atmel,sama5d2-gem", .data = &sama5d2_config },
+	{ .compatible = "atmel,sama5d29-gem", .data = &sama5d29_config },
 	{ .compatible = "atmel,sama5d3-gem", .data = &sama5d3_config },
 	{ .compatible = "atmel,sama5d3-macb", .data = &sama5d3macb_config },
 	{ .compatible = "atmel,sama5d4-gem", .data = &sama5d4_config },
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
