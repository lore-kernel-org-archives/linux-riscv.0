Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063DCC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 14:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwhvy0kXEw67DNU1wDrHa1v5w8gN62UOU7BnXasxhik=; b=FjDB1Z2UJqLALX
	Q7xfeAd5ChlIuQBOmuHXIqHPz/wk2Gwrnw5ostqRZ941uq3oqayhpeNelA3NzOuk+2JnTm8rYp9sD
	FGKdNOZDRcVaWfM+WB+YwRnId/6xKtWJw8BEEIQovblfoigCuH1Mydv5pxum5pUcH1+Cwua43uJOQ
	eMuUUpsYZ9/sFIZOfHIgzlpP5dlKlO5gwDb8clneW2r+2TXs1OM6pPtIAV3j5gry3fVA45Vy1HY30
	yH1+Z6SXa8Bnxv4aq65iIHL+sdex6u6muuMEYDCPCm+PbyVtiNwzTuA8IxacCkXQPeNYEjWUR7RZ+
	Ay3j/VA8tkNw8WeppYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncpkf-0000tL-GC; Fri, 08 Apr 2022 14:38:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncpkR-0000dE-Ot
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 14:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649428683; x=1680964683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y4znpbft4pIXxYHAkK+6B1HyNkfqAGAWRhE3iy4VFNY=;
 b=k9TxWKR4vvy0XL6jTC7Of6E802Ugdf77/gzpUsxIKdlNJcVAySu6h9g6
 HCwG+NgXPDP8g8+Z6oO5OVxtKn4HympRyNxR5YDQHBDNgm9bvyeQl8Zlf
 ca9a0ifvvO2gp6QtEpOKukKqvHcmgYCan5nTJU0tGbUEA7gK60Q2qS1/r
 xQ9CcCh/Vno7znKyvGtcDEzHVwcRRtYxu3vy1vKIkJjG/3v3lwgXuiQ8e
 oWeleASNpF5i6YvELPIS6C1SIgvan0FJsMfR6VpgN33RKeYXg5DVRNJxE
 6zHHnBKOXVjQiXxSoko0xg0nS3HzHL1qB2CaeZM5B6xZsJiudi6ddme6/ A==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; d="scan'208";a="154925676"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2022 07:38:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 07:38:02 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 8 Apr 2022 07:37:59 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 6/7] clk: microchip: mpfs: add RTCREF clock control
Date: Fri, 8 Apr 2022 14:36:46 +0000
Message-ID: <20220408143646.3693104-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408143646.3693104-1-conor.dooley@microchip.com>
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_073803_972759_26873D57 
X-CRM114-Status: GOOD (  12.27  )
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

The reference clock used by the PolarFire SoC's onboard rtc was missing
from the clock driver. Add this clock at the "config" clock level, with
the external reference clock as its parent.

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index f22d4b40ef28..4a506d0140d4 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -15,6 +15,7 @@
 #define REG_MSSPLL_POSTDIV_CR	0x10u
 #define REG_MSSPLL_SSCG_2_CR	0x2Cu
 #define REG_CLOCK_CONFIG_CR	0x08u
+#define REG_RTC_CLOCK_CR	0x0Cu
 #define REG_SUBBLK_CLOCK_CR	0x84u
 
 #define MSSPLL_FBDIV_SHIFT	0x00u
@@ -95,6 +96,17 @@ static const struct clk_div_table mpfs_div_ahb_table[] = {
 	{ 0, 0 }
 };
 
+/*
+ * The only two supported reference clock frequencies for the PolarFire SoC are
+ * 100 and 125 MHz, as the rtc reference is required to be 1 MHz.
+ * It therefore only needs to have divider table entries corresponding to
+ * divide by 100 and 125.
+ */
+static const struct clk_div_table mpfs_div_rtcref_table[] = {
+	{ 100, 100 }, { 125, 125 },
+	{ 0, 0 }
+};
+
 static unsigned long mpfs_clk_msspll_recalc_rate(struct clk_hw *hw, unsigned long prate)
 {
 	struct mpfs_msspll_hw_clock *msspll_hw = to_mpfs_msspll_clk(hw);
@@ -233,6 +245,16 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
 		REG_CLOCK_CONFIG_CR),
 	CLK_CFG(CLK_AHB, "clk_ahb", "clk_msspll", 4, 2, mpfs_div_ahb_table, 0,
 		REG_CLOCK_CONFIG_CR),
+	{
+		.cfg.id = CLK_RTCREF,
+		.cfg.shift = 0,
+		.cfg.width = 12,
+		.cfg.table = mpfs_div_rtcref_table,
+		.cfg.reg_offset = REG_RTC_CLOCK_CR,
+		.cfg.flags = CLK_DIVIDER_ONE_BASED,
+		.hw.init =
+			CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &mpfs_clk_cfg_ops, 0),
+	}
 };
 
 static int mpfs_clk_register_cfg(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hw,
@@ -351,7 +373,7 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
 	CLK_PERIPH(CLK_MAC0, "clk_periph_mac0", PARENT_CLK(AHB), 1, 0),
 	CLK_PERIPH(CLK_MAC1, "clk_periph_mac1", PARENT_CLK(AHB), 2, 0),
 	CLK_PERIPH(CLK_MMC, "clk_periph_mmc", PARENT_CLK(AHB), 3, 0),
-	CLK_PERIPH(CLK_TIMER, "clk_periph_timer", PARENT_CLK(AHB), 4, 0),
+	CLK_PERIPH(CLK_TIMER, "clk_periph_timer", PARENT_CLK(RTCREF), 4, 0),
 	CLK_PERIPH(CLK_MMUART0, "clk_periph_mmuart0", PARENT_CLK(AHB), 5, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_MMUART1, "clk_periph_mmuart1", PARENT_CLK(AHB), 6, 0),
 	CLK_PERIPH(CLK_MMUART2, "clk_periph_mmuart2", PARENT_CLK(AHB), 7, 0),
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
