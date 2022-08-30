Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F703ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmvK/POP8vH3wZrzFF1gRhWEWJ8e78X3AOhfZlB0be8=; b=BypfxQxJCOZCr9
	cCzw7IHw51hf4DF1271QexLh/m7n3WfzlnSSZYQqV1HFNP5Lby2eB9UERcflN490YTE5k6urQLjZk
	sh9V03nKrX5Qu/6T9lw/9QnqyXB5NVct2a9SofVgOYAt/63eQ5RGr0kWe/7fl2zLqZeUcDSz95kPO
	Z3Os3FV0B7Wn97kF5g1yvJVmthnBXGsX9Mhgbo+WrF69xXOHkP2fcSKaxwXAn/ZRp0IMmIKnmCjhe
	TSnTB2D9lMTNDYQIKDeN1vzAs5K+lc7ZoIvtzO98eBZW0pZMPYa/b/EghXUE1MGFLgzQE133h+DiA
	9JEiD77VmNmSGpugba+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0ky-00H2hv-1M; Tue, 30 Aug 2022 12:54:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0kX-00H1w4-C4
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661864029; x=1693400029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EbmcAymNM1YIUUjdyCZltrBq2nVqbjLmU0iw126wIYs=;
  b=eTYdz0OrZAYmuBEfJZoUfFFk84YIHLmr4iZ9OqaEyxoi/tWUxHGNy8pm
   /tst858GpJo38EZfxM2IR/mRqbCJXWJte9DxTfsQelmJmvf8fbaIM2GuH
   5+ZH+xUf0z90kktk+iWsDju8io2XHQ9qpWbUu+ETw3Bs/bafTdg4OMtPW
   79RGD0mMZj7T31Sdm13PzxFztihXk+o9I9XDs3bQSU7RofPxPFR1RE3Jh
   Mtp7f4n8FlIBu7L8rC4HhGZJqL4K9QhiQYknKOL7wU5Iv9pvZ1k47COFQ
   OvENEzYrdtnkuT/dB/l0zLNljEI0i6JzE9l4NVbacQNlI7NYGimhVkBxt
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="174802848"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 05:53:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 05:53:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 05:53:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 11/13] clk: microchip: mpfs: convert cfg_clk to clk_divider
Date: Tue, 30 Aug 2022 13:52:48 +0100
Message-ID: <20220830125249.2373416-11-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830125110.2372514-1-conor.dooley@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_055349_559745_79AAD403 
X-CRM114-Status: GOOD (  11.31  )
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

The cfg_clk struct is now just a redefinition of the clk_divider struct
with custom implentations of the ops, that implement an extra level of
redirection. Remove the custom struct and replace it with clk_divider.

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 78 ++++----------------------------
 1 file changed, 9 insertions(+), 69 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 538cb589d232..88a200e88e54 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -51,24 +51,13 @@ struct mpfs_msspll_hw_clock {
 
 #define to_mpfs_msspll_clk(_hw) container_of(_hw, struct mpfs_msspll_hw_clock, hw)
 
-struct mpfs_cfg_clock {
-	void __iomem *reg;
-	const struct clk_div_table *table;
-	u8 shift;
-	u8 width;
-	u8 flags;
-};
-
 struct mpfs_cfg_hw_clock {
-	struct mpfs_cfg_clock cfg;
-	struct clk_hw hw;
+	struct clk_divider cfg;
 	struct clk_init_data init;
 	unsigned int id;
 	u32 reg_offset;
 };
 
-#define to_mpfs_cfg_clk(_hw) container_of(_hw, struct mpfs_cfg_hw_clock, hw)
-
 struct mpfs_periph_clock {
 	void __iomem *reg;
 	u8 shift;
@@ -228,56 +217,6 @@ static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_c
  * "CFG" clocks
  */
 
-static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long prate)
-{
-	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
-	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
-	u32 val;
-
-	val = readl_relaxed(cfg->reg) >> cfg->shift;
-	val &= clk_div_mask(cfg->width);
-
-	return divider_recalc_rate(hw, prate, val, cfg->table, cfg->flags, cfg->width);
-}
-
-static long mpfs_cfg_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
-{
-	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
-	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
-
-	return divider_round_rate(hw, rate, prate, cfg->table, cfg->width, 0);
-}
-
-static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
-{
-	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
-	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
-	unsigned long flags;
-	u32 val;
-	int divider_setting;
-
-	divider_setting = divider_get_val(rate, prate, cfg->table, cfg->width, 0);
-
-	if (divider_setting < 0)
-		return divider_setting;
-
-	spin_lock_irqsave(&mpfs_clk_lock, flags);
-	val = readl_relaxed(cfg->reg);
-	val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
-	val |= divider_setting << cfg->shift;
-	writel_relaxed(val, cfg->reg);
-
-	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
-
-	return 0;
-}
-
-static const struct clk_ops mpfs_clk_cfg_ops = {
-	.recalc_rate = mpfs_cfg_clk_recalc_rate,
-	.round_rate = mpfs_cfg_clk_round_rate,
-	.set_rate = mpfs_cfg_clk_set_rate,
-};
-
 #define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags, _offset) {		\
 	.id = _id,									\
 	.cfg.shift = _shift,								\
@@ -285,7 +224,8 @@ static const struct clk_ops mpfs_clk_cfg_ops = {
 	.cfg.table = _table,								\
 	.reg_offset = _offset,								\
 	.cfg.flags = _flags,								\
-	.hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_cfg_ops, 0),			\
+	.cfg.hw.init = CLK_HW_INIT(_name, _parent, &clk_divider_ops, 0),		\
+	.cfg.lock = &mpfs_clk_lock,							\
 }
 
 static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
@@ -302,8 +242,8 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
 		.cfg.table = mpfs_div_rtcref_table,
 		.reg_offset = REG_RTC_CLOCK_CR,
 		.cfg.flags = CLK_DIVIDER_ONE_BASED,
-		.hw.init =
-			CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &mpfs_clk_cfg_ops, 0),
+		.cfg.hw.init =
+			CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &clk_divider_ops, 0),
 	}
 };
 
@@ -317,13 +257,13 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
 		struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
 
 		cfg_hw->cfg.reg = data->base + cfg_hw->reg_offset;
-		ret = devm_clk_hw_register(dev, &cfg_hw->hw);
+		ret = devm_clk_hw_register(dev, &cfg_hw->cfg.hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
 					     cfg_hw->id);
 
 		id = cfg_hw->id;
-		data->hw_data.hws[id] = &cfg_hw->hw;
+		data->hw_data.hws[id] = &cfg_hw->cfg.hw;
 	}
 
 	return 0;
@@ -393,7 +333,7 @@ static const struct clk_ops mpfs_periph_clk_ops = {
 				  _flags),					\
 }
 
-#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].hw)
+#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)
 
 /*
  * Critical clocks:
@@ -413,7 +353,7 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
 	CLK_PERIPH(CLK_MAC1, "clk_periph_mac1", PARENT_CLK(AHB), 2, 0),
 	CLK_PERIPH(CLK_MMC, "clk_periph_mmc", PARENT_CLK(AHB), 3, 0),
 	CLK_PERIPH(CLK_TIMER, "clk_periph_timer",
-		   &mpfs_cfg_clks[CLK_RTCREF - RTCREF_OFFSET].hw, 4, 0),
+		   &mpfs_cfg_clks[CLK_RTCREF - RTCREF_OFFSET].cfg.hw, 4, 0),
 	CLK_PERIPH(CLK_MMUART0, "clk_periph_mmuart0", PARENT_CLK(AHB), 5, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_MMUART1, "clk_periph_mmuart1", PARENT_CLK(AHB), 6, 0),
 	CLK_PERIPH(CLK_MMUART2, "clk_periph_mmuart2", PARENT_CLK(AHB), 7, 0),
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
