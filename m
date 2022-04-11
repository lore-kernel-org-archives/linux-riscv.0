Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF17C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNsk5tFyKnVgP22CUYql3of6XL6+VoLkvvZNwLl8z5c=; b=SXIJT3xL0KU0F4
	12bgj+VNKrDjVBqzuG1zfV0UQgdfX/mhjBG7s26uETDbpreizUYwc0IHhXBVkUW+BD8vXq98KhiQw
	AMnb7ONm/AbK45n5MROeahVuW8+ox00qJ8Lta6wukaxv3+yaZakEyRlogbuhD3Imph5OcAfl2JdvH
	vsyBSnnmndWPONOQ65cA1O90rCcxWz081Zy5N3fXvL1ui2H1APa62aRODAl7yvHGha8DnLMxhD00c
	JM1sKxUULnsRODJGRdNNWn1xcbmyN9BBK6g5+rx2mmuc1kU36HDB9Awjs1ZHUQ4TnuQ8phHBTQDJM
	GZjocWAv9+5aEYsWoy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpwO-007iu0-33; Mon, 11 Apr 2022 09:02:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpug-007har-P8
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 09:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649667646; x=1681203646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HeG0Gs2W8drs/SUtlvUt+LN6R4T8mLTr5o8GPW73zU8=;
 b=p0CpzFOr6Z1CZ6JBPR5zCtZmjmFgAZ/g/GKlcwe+LSs/T3AkVGUCBSG3
 7ujOvdOnFFz/tHmbG6jl02ZWoglcANEMet3jiXRa7QIftIHofcZUlmLEB
 Mq5YoFQ+p3IE3jrvmhqlkBfDehCHhjMJMRFKaJ15EgXUIkVqCa0OpF6Jz
 dR9TGs5mDYsFUXDvHMeTKCDmUTqM4Oo7xuWyARdEZXZMZDrwml8BNu+TJ
 rMCGNHg5Hf76lVZnYhYATmlAy8ChkpEPo84y/bfL2lidn51PQRtMBBS+p
 nwSTVzrncw3ubyhCgC8YyKxe89hdv92wlBE+t8nDeqoB0cxkNsQh1FzRU g==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="155113035"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:00:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 11 Apr 2022 02:00:41 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 8/9] clk: microchip: mpfs: add RTCREF clock control
Date: Mon, 11 Apr 2022 09:59:16 +0100
Message-ID: <20220411085916.941433-9-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411085916.941433-1-conor.dooley@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020046_963203_933BB17F 
X-CRM114-Status: GOOD (  12.92  )
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

Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 7c8dd5924c05..6565fb62507c 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -15,6 +15,7 @@
 #define REG_MSSPLL_POSTDIV_CR	0x10u
 #define REG_MSSPLL_SSCG_2_CR	0x2Cu
 #define REG_CLOCK_CONFIG_CR	0x08u
+#define REG_RTC_CLOCK_CR	0x0Cu
 #define REG_SUBBLK_CLOCK_CR	0x84u
 #define REG_SUBBLK_RESET_CR	0x88u
 
@@ -96,6 +97,17 @@ static const struct clk_div_table mpfs_div_ahb_table[] = {
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
@@ -234,6 +246,16 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
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
@@ -363,7 +385,7 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
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
