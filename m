Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E922C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+pS93ZyWrYqCYPZt26x5Vakrsq9OrBCvEhcSqYDouk=; b=RBDHhmRS1l67Ys
	wGbkK8VTKFNJ7M/7KBqD2FgBUtTbdsUuv/+3dlWizfJTynhzPJ72lX3jQxdZ/vFZzFUZA302m1AxY
	GI9zF56Iz+CttFBCZE4T07bqjjS1zZgQ5Oac+9DroDPGVs9wIFBN74kmBHlxuTVABoXN9v8Wu/1A5
	x1ZS8rP0wQi0S/gb7mGJNys52KMI98AEvorHYbSHNE9DYw3ZX4NPHoHVO1Yvm7uIDSHwfkdnBsGj7
	KxFy27hKZNKB2139aIGO2SP0rYL4hfZriXCQXru65CLo7FAr8sRMO7eNbrtObjyNT3TTyoTnWjaGG
	TD5rsCPbXX2NYDRgdqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtI5-00C4Dx-22;
	Mon, 22 Jan 2024 12:20:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtI2-00C4AK-06
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 12:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EFD2BCE2A6A;
	Mon, 22 Jan 2024 12:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA925C433C7;
	Mon, 22 Jan 2024 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705926026;
	bh=bk23V6jiVJn6faNPzjpeAvVhtjNYUjflsLQFK9+3aSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q8NqcTJp0I0+v4gqS6O6ownNfSOxkTNEnyPXkXmrqkFAxgCZYIqY1fO3Jd0uUZPfU
	 6S0lFomRaactRGb/U6I4YbesWHtIeZF/5ZiLq9E27+GLarQlBuDlc4xvyPPxoBN49N
	 rhUgrNdFCjS/jMvoZ9ISQF3JST5m5pMKB4OvpYXkrk7PY1aG9iPEehiJHxQebnG0jc
	 VP8xmIAeyscL3JscvTwd0h1gAT6juk9XBl+ub7tFAkfwM4JlLxNRG/0J4iovNZcaZQ
	 VGgZ8YTZMVefA5y5zu6aMh3xsrQ5gBbvcQ1vxu3fz4v3PXH7Dg6lY8VWKbS8bqaNH2
	 YER5WgLJSCgIg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 3/7] clk: microchip: mpfs: split MSSPLL in two
Date: Mon, 22 Jan 2024 12:19:51 +0000
Message-ID: <20240122-truth-scope-7b96ba10d491@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122-catty-roast-d3625dbb02fe@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10025; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=TAPscgRc3/2SRGpBrHR1CQ9xRHawcumgg4V8O/3bXw4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnrYlNKUtlFtc5bbjywetfx7FOeLzr5J5vuuHikT+cmu 1rm3IiPHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIanaG/3kKsQu7D5zn182r 4rBZ5imdYXG/i+1hWtSeSQeXPJ8VY83IMFefpar+he7e2HS5yc8spszS8Qotf7FwfvExvS+10nl POQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_042034_412265_C358E6ED 
X-CRM114-Status: GOOD (  22.01  )
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

The MSSPLL is really two stages - there's the PLL itself and 4 outputs,
each with their own divider. The current driver models this as a single
entity, outputting a single clock, used for both the CPU and AHB/AXI
buses. The other 3 outputs are used for the eMMC, "user crypto" and CAN
controller. Split the MSSPLL in two, as a precursor to adding support
for the other 3 outputs, with the PLL itself as one "hw" clock and the
output divider stage as another.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 188 ++++++++++++++++++++-----------
 1 file changed, 123 insertions(+), 65 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index c8ffa755b58d..acf598a32ce0 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -30,6 +30,13 @@
 #define MSSPLL_POSTDIV_WIDTH	0x07u
 #define MSSPLL_FIXED_DIV	4u
 
+/*
+ * This clock ID is defined here, rather than the binding headers, as it is an
+ * internal clock only, and therefore has no consumers in other peripheral
+ * blocks.
+ */
+#define CLK_MSSPLL_INTERNAL	38u
+
 struct mpfs_clock_data {
 	struct device *dev;
 	void __iomem *base;
@@ -39,17 +46,27 @@ struct mpfs_clock_data {
 
 struct mpfs_msspll_hw_clock {
 	void __iomem *base;
+	struct clk_hw hw;
+	struct clk_init_data init;
 	unsigned int id;
 	u32 reg_offset;
 	u32 shift;
 	u32 width;
 	u32 flags;
-	struct clk_hw hw;
-	struct clk_init_data init;
 };
 
 #define to_mpfs_msspll_clk(_hw) container_of(_hw, struct mpfs_msspll_hw_clock, hw)
 
+struct mpfs_msspll_out_hw_clock {
+	void __iomem *base;
+	struct clk_hw hw;
+	struct clk_init_data init;
+	unsigned int id;
+	u32 flags;
+};
+
+#define to_mpfs_msspll_out_clk(_hw) container_of(_hw, struct mpfs_msspll_out_hw_clock, hw)
+
 struct mpfs_cfg_hw_clock {
 	struct clk_divider cfg;
 	struct clk_init_data init;
@@ -93,93 +110,40 @@ static const struct clk_div_table mpfs_div_rtcref_table[] = {
 	{ 0, 0 }
 };
 
+/*
+ * MSS PLL internal clock
+ */
+
 static unsigned long mpfs_clk_msspll_recalc_rate(struct clk_hw *hw, unsigned long prate)
-{
-	struct mpfs_msspll_hw_clock *msspll_hw = to_mpfs_msspll_clk(hw);
-	void __iomem *mult_addr = msspll_hw->base + msspll_hw->reg_offset;
-	void __iomem *ref_div_addr = msspll_hw->base + REG_MSSPLL_REF_CR;
-	void __iomem *postdiv_addr = msspll_hw->base + REG_MSSPLL_POSTDIV_CR;
-	u32 mult, ref_div, postdiv;
-
-	mult = readl_relaxed(mult_addr) >> MSSPLL_FBDIV_SHIFT;
-	mult &= clk_div_mask(MSSPLL_FBDIV_WIDTH);
-	ref_div = readl_relaxed(ref_div_addr) >> MSSPLL_REFDIV_SHIFT;
-	ref_div &= clk_div_mask(MSSPLL_REFDIV_WIDTH);
-	postdiv = readl_relaxed(postdiv_addr) >> MSSPLL_POSTDIV_SHIFT;
-	postdiv &= clk_div_mask(MSSPLL_POSTDIV_WIDTH);
-
-	return prate * mult / (ref_div * MSSPLL_FIXED_DIV * postdiv);
-}
-
-static long mpfs_clk_msspll_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
 {
 	struct mpfs_msspll_hw_clock *msspll_hw = to_mpfs_msspll_clk(hw);
 	void __iomem *mult_addr = msspll_hw->base + msspll_hw->reg_offset;
 	void __iomem *ref_div_addr = msspll_hw->base + REG_MSSPLL_REF_CR;
 	u32 mult, ref_div;
-	unsigned long rate_before_ctrl;
 
 	mult = readl_relaxed(mult_addr) >> MSSPLL_FBDIV_SHIFT;
 	mult &= clk_div_mask(MSSPLL_FBDIV_WIDTH);
 	ref_div = readl_relaxed(ref_div_addr) >> MSSPLL_REFDIV_SHIFT;
 	ref_div &= clk_div_mask(MSSPLL_REFDIV_WIDTH);
 
-	rate_before_ctrl = rate * (ref_div * MSSPLL_FIXED_DIV) / mult;
-
-	return divider_round_rate(hw, rate_before_ctrl, prate, NULL, MSSPLL_POSTDIV_WIDTH,
-				  msspll_hw->flags);
-}
-
-static int mpfs_clk_msspll_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
-{
-	struct mpfs_msspll_hw_clock *msspll_hw = to_mpfs_msspll_clk(hw);
-	void __iomem *mult_addr = msspll_hw->base + msspll_hw->reg_offset;
-	void __iomem *ref_div_addr = msspll_hw->base + REG_MSSPLL_REF_CR;
-	void __iomem *postdiv_addr = msspll_hw->base + REG_MSSPLL_POSTDIV_CR;
-	u32 mult, ref_div, postdiv;
-	int divider_setting;
-	unsigned long rate_before_ctrl, flags;
-
-	mult = readl_relaxed(mult_addr) >> MSSPLL_FBDIV_SHIFT;
-	mult &= clk_div_mask(MSSPLL_FBDIV_WIDTH);
-	ref_div = readl_relaxed(ref_div_addr) >> MSSPLL_REFDIV_SHIFT;
-	ref_div &= clk_div_mask(MSSPLL_REFDIV_WIDTH);
-
-	rate_before_ctrl = rate * (ref_div * MSSPLL_FIXED_DIV) / mult;
-	divider_setting = divider_get_val(rate_before_ctrl, prate, NULL, MSSPLL_POSTDIV_WIDTH,
-					  msspll_hw->flags);
-
-	if (divider_setting < 0)
-		return divider_setting;
-
-	spin_lock_irqsave(&mpfs_clk_lock, flags);
-
-	postdiv = readl_relaxed(postdiv_addr);
-	postdiv &= ~(clk_div_mask(MSSPLL_POSTDIV_WIDTH) << MSSPLL_POSTDIV_SHIFT);
-	writel_relaxed(postdiv, postdiv_addr);
-
-	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
-
-	return 0;
+	return prate * mult / (ref_div * MSSPLL_FIXED_DIV);
 }
 
 static const struct clk_ops mpfs_clk_msspll_ops = {
 	.recalc_rate = mpfs_clk_msspll_recalc_rate,
-	.round_rate = mpfs_clk_msspll_round_rate,
-	.set_rate = mpfs_clk_msspll_set_rate,
 };
 
 #define CLK_PLL(_id, _name, _parent, _shift, _width, _flags, _offset) {			\
 	.id = _id,									\
+	.flags = _flags,								\
 	.shift = _shift,								\
 	.width = _width,								\
 	.reg_offset = _offset,								\
-	.flags = _flags,								\
 	.hw.init = CLK_HW_INIT_PARENTS_DATA(_name, _parent, &mpfs_clk_msspll_ops, 0),	\
 }
 
 static struct mpfs_msspll_hw_clock mpfs_msspll_clks[] = {
-	CLK_PLL(CLK_MSSPLL, "clk_msspll", mpfs_ext_ref, MSSPLL_FBDIV_SHIFT,
+	CLK_PLL(CLK_MSSPLL_INTERNAL, "clk_msspll_internal", mpfs_ext_ref, MSSPLL_FBDIV_SHIFT,
 		MSSPLL_FBDIV_WIDTH, 0, REG_MSSPLL_SSCG_2_CR),
 };
 
@@ -196,7 +160,7 @@ static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_c
 		ret = devm_clk_hw_register(dev, &msspll_hw->hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
-					     CLK_MSSPLL);
+					     CLK_MSSPLL_INTERNAL);
 
 		data->hw_data.hws[msspll_hw->id] = &msspll_hw->hw;
 	}
@@ -204,6 +168,94 @@ static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_c
 	return 0;
 }
 
+/*
+ * MSS PLL output clocks
+ */
+
+static unsigned long mpfs_clk_msspll_out_recalc_rate(struct clk_hw *hw, unsigned long prate)
+{
+	struct mpfs_msspll_out_hw_clock *msspll_out_hw = to_mpfs_msspll_out_clk(hw);
+	void __iomem *postdiv_addr = msspll_out_hw->base + REG_MSSPLL_POSTDIV_CR;
+	u32 postdiv;
+
+	postdiv = readl_relaxed(postdiv_addr) >> MSSPLL_POSTDIV_SHIFT;
+	postdiv &= clk_div_mask(MSSPLL_POSTDIV_WIDTH);
+
+	return prate / postdiv;
+}
+
+static long mpfs_clk_msspll_out_round_rate(struct clk_hw *hw, unsigned long rate,
+					   unsigned long *prate)
+{
+	struct mpfs_msspll_out_hw_clock *msspll_out_hw = to_mpfs_msspll_out_clk(hw);
+
+	return divider_round_rate(hw, rate, prate, NULL, MSSPLL_POSTDIV_WIDTH,
+				  msspll_out_hw->flags);
+}
+
+static int mpfs_clk_msspll_out_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
+{
+	struct mpfs_msspll_out_hw_clock *msspll_out_hw = to_mpfs_msspll_out_clk(hw);
+	void __iomem *postdiv_addr = msspll_out_hw->base + REG_MSSPLL_POSTDIV_CR;
+	u32 postdiv;
+	int divider_setting;
+	unsigned long flags;
+
+	divider_setting = divider_get_val(rate, prate, NULL, MSSPLL_POSTDIV_WIDTH,
+					  msspll_out_hw->flags);
+
+	if (divider_setting < 0)
+		return divider_setting;
+
+	spin_lock_irqsave(&mpfs_clk_lock, flags);
+
+	postdiv = readl_relaxed(postdiv_addr);
+	postdiv &= ~(clk_div_mask(MSSPLL_POSTDIV_WIDTH) << MSSPLL_POSTDIV_SHIFT);
+	writel_relaxed(postdiv, postdiv_addr);
+
+	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
+
+	return 0;
+}
+
+static const struct clk_ops mpfs_clk_msspll_out_ops = {
+	.recalc_rate = mpfs_clk_msspll_out_recalc_rate,
+	.round_rate = mpfs_clk_msspll_out_round_rate,
+	.set_rate = mpfs_clk_msspll_out_set_rate,
+};
+
+#define CLK_PLL_OUT(_id, _name, _parent, _flags) {				\
+	.id = _id,								\
+	.flags = _flags,							\
+	.hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_msspll_out_ops, 0),	\
+}
+
+static struct mpfs_msspll_out_hw_clock mpfs_msspll_out_clks[] = {
+	CLK_PLL_OUT(CLK_MSSPLL0, "clk_msspll", "clk_msspll_internal", 0),
+};
+
+static int mpfs_clk_register_msspll_outs(struct device *dev,
+					 struct mpfs_msspll_out_hw_clock *msspll_out_hws,
+					 unsigned int num_clks, struct mpfs_clock_data *data)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_clks; i++) {
+		struct mpfs_msspll_out_hw_clock *msspll_out_hw = &msspll_out_hws[i];
+
+		msspll_out_hw->base = data->msspll_base;
+		ret = devm_clk_hw_register(dev, &msspll_out_hw->hw);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register msspll out id: %d\n",
+					     msspll_out_hw->id);
+
+		data->hw_data.hws[msspll_out_hw->id] = &msspll_out_hw->hw;
+	}
+
+	return 0;
+}
+
 /*
  * "CFG" clocks
  */
@@ -442,8 +494,8 @@ static int mpfs_clk_probe(struct platform_device *pdev)
 	int ret;
 
 	/* CLK_RESERVED is not part of clock arrays, so add 1 */
-	num_clks = ARRAY_SIZE(mpfs_msspll_clks) + ARRAY_SIZE(mpfs_cfg_clks)
-		   + ARRAY_SIZE(mpfs_periph_clks) + 1;
+	num_clks = ARRAY_SIZE(mpfs_msspll_clks) + ARRAY_SIZE(mpfs_msspll_out_clks)
+		   + ARRAY_SIZE(mpfs_cfg_clks)  + ARRAY_SIZE(mpfs_periph_clks) + 1;
 
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hw_data.hws, num_clks), GFP_KERNEL);
 	if (!clk_data)
@@ -466,6 +518,12 @@ static int mpfs_clk_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = mpfs_clk_register_msspll_outs(dev, mpfs_msspll_out_clks,
+					    ARRAY_SIZE(mpfs_msspll_out_clks),
+					    clk_data);
+	if (ret)
+		return ret;
+
 	ret = mpfs_clk_register_cfgs(dev, mpfs_cfg_clks, ARRAY_SIZE(mpfs_cfg_clks), clk_data);
 	if (ret)
 		return ret;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
