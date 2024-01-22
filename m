Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBB4C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nuD+uebX87/emnwR+4cOTv2HPnk+XNob1Cea1CrRYs=; b=O2r1gzkGeuT9HY
	MZMH/ZeIE8ZWIQWjtx9t+6OJHsZ62xVTmkqpneSGrDeau1VeBGeKhkdte1ScdvCrSuuiqiRBAxXcK
	T05fyV0u2erziV6OCQTwgwxR0+hBSjtnZpv5X6VgXpztGRDc9PnymzP/n0w/W7mq1BaHVGTKDfLiE
	KUVVV3+otIdyFDFcnt1z1JV9N1tCGdo6ghngpn9HQtuZmj7k7PJaD7aRktiNHvR9VB0tvvkyIGd88
	TR/7o/UuEwMwhjf5Wlx7pHwLgy9DqcBKo93ODvLo1fUUla/7Kd7LPDQgOLGi+ju+3t/J661YAvY2k
	EdihyHaLQSSxhKPzuZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtIE-00C4IM-0j;
	Mon, 22 Jan 2024 12:20:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtIA-00C4Fw-2K
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 12:20:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0C404B80DB8;
	Mon, 22 Jan 2024 12:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175C1C433A6;
	Mon, 22 Jan 2024 12:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705926040;
	bh=QV+x2Fo//YjJSJ0LUtc4qQeX5SsBa9GHRzYL4hGBQVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kGUqRyUFr33p5AHnUWU8wg/h4kIw6o0o6tNCCkrpV1gfPmTy4BSHOnWAnh+AyY/zX
	 4xzJBIJvxEALgfuTc3dnsPvRVfnz0ncdEv/PWGpkQYiFXoJkn2xpdhtQyUsp4+QYD4
	 3b5cTYhe9mCP4WZa9Nnk+lajfHMJF8CzB09gvlik/wl18oyfHICUyugM1tMUeTNTQe
	 UotfiEspRht3/aef+Ht/R+A/UOnGPbCwGs3o2C39ye+vCMP/Dr8vhXoXG9v6i7sSsj
	 G4mmzRv6w51pvZKtIXFW48nCYdpQImPpe3FYBkhD2EF0OZuB5f3GjzQn+vPmpQzmai
	 lENNNJ9sLh18g==
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
Subject: [PATCH v2 6/7] clk: microchip: mpfs: convert MSSPLL outputs to clk_divider
Date: Mon, 22 Jan 2024 12:19:54 +0000
Message-ID: <20240122-drop-down-kooky-1fdc850c16b6@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122-catty-roast-d3625dbb02fe@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5154; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GstYXae7YmaE0PSrBEvAfhgo8lU9+0CrRNVIt4fzA+k=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnrYlPLRXftesahl2KR0/pwwgmP9JDY1Ad2N82lW92ND r25z5HdUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgImU5jIynDAuWLrR4WuVhQ+L SsmPo3eTEuxWs61gtDkqeubh9f/fChkZfgmVqKat7979P2LT7E3XJJzc5p5k6LzGfOdTYpR+dLg hAwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_042043_042411_148E1171 
X-CRM114-Status: GOOD (  12.63  )
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

After splitting the MSSPLL in two, the PLL outputs have become
open-coded versions of clk_divider. Drop the custom clk ops structs, and
instead use the generic clk_divider_ops.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 81 ++++++--------------------------
 1 file changed, 14 insertions(+), 67 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index bed6adbb8a70..22eab91a6712 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -61,13 +61,10 @@ struct mpfs_msspll_hw_clock {
 
 struct mpfs_msspll_out_hw_clock {
 	void __iomem *base;
-	struct clk_hw hw;
+	struct clk_divider output;
 	struct clk_init_data init;
 	unsigned int id;
 	u32 reg_offset;
-	u32 shift;
-	u32 width;
-	u32 flags;
 };
 
 #define to_mpfs_msspll_out_clk(_hw) container_of(_hw, struct mpfs_msspll_out_hw_clock, hw)
@@ -177,75 +174,25 @@ static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_c
  * MSS PLL output clocks
  */
 
-static unsigned long mpfs_clk_msspll_out_recalc_rate(struct clk_hw *hw, unsigned long prate)
-{
-	struct mpfs_msspll_out_hw_clock *msspll_out_hw = to_mpfs_msspll_out_clk(hw);
-	void __iomem *postdiv_addr = msspll_out_hw->base + msspll_out_hw->reg_offset;
-	u32 postdiv;
-
-	postdiv = readl_relaxed(postdiv_addr) >> msspll_out_hw->shift;
-	postdiv &= clk_div_mask(msspll_out_hw->width);
-
-	return prate / postdiv;
-}
-
-static long mpfs_clk_msspll_out_round_rate(struct clk_hw *hw, unsigned long rate,
-					   unsigned long *prate)
-{
-	struct mpfs_msspll_out_hw_clock *msspll_out_hw = to_mpfs_msspll_out_clk(hw);
-
-	return divider_round_rate(hw, rate, prate, NULL, msspll_out_hw->width,
-				  msspll_out_hw->flags);
-}
-
-static int mpfs_clk_msspll_out_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
-{
-	struct mpfs_msspll_out_hw_clock *msspll_out_hw = to_mpfs_msspll_out_clk(hw);
-	void __iomem *postdiv_addr = msspll_out_hw->base + msspll_out_hw->reg_offset;
-	u32 postdiv;
-	int divider_setting;
-	unsigned long flags;
-
-	divider_setting = divider_get_val(rate, prate, NULL, msspll_out_hw->width,
-					  msspll_out_hw->flags);
-
-	if (divider_setting < 0)
-		return divider_setting;
-
-	spin_lock_irqsave(&mpfs_clk_lock, flags);
-
-	postdiv = readl_relaxed(postdiv_addr);
-	postdiv &= ~(clk_div_mask(msspll_out_hw->width) << msspll_out_hw->shift);
-	writel_relaxed(postdiv, postdiv_addr);
-
-	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
-
-	return 0;
-}
-
-static const struct clk_ops mpfs_clk_msspll_out_ops = {
-	.recalc_rate = mpfs_clk_msspll_out_recalc_rate,
-	.round_rate = mpfs_clk_msspll_out_round_rate,
-	.set_rate = mpfs_clk_msspll_out_set_rate,
-};
-
 #define CLK_PLL_OUT(_id, _name, _parent, _flags, _shift, _width, _offset) {	\
 	.id = _id,								\
-	.shift = _shift,							\
-	.width = _width,							\
+	.output.shift = _shift,							\
+	.output.width = _width,							\
+	.output.table = NULL,							\
 	.reg_offset = _offset,							\
-	.flags = _flags,							\
-	.hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_msspll_out_ops, 0),	\
+	.output.flags = _flags,							\
+	.output.hw.init = CLK_HW_INIT(_name, _parent, &clk_divider_ops, 0),	\
+	.output.lock = &mpfs_clk_lock,						\
 }
 
 static struct mpfs_msspll_out_hw_clock mpfs_msspll_out_clks[] = {
-	CLK_PLL_OUT(CLK_MSSPLL0, "clk_msspll", "clk_msspll_internal", 0,
+	CLK_PLL_OUT(CLK_MSSPLL0, "clk_msspll", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
 		    MSSPLL_POSTDIV02_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV01_CR),
-	CLK_PLL_OUT(CLK_MSSPLL1, "clk_msspll1", "clk_msspll_internal", 0,
+	CLK_PLL_OUT(CLK_MSSPLL1, "clk_msspll1", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
 		    MSSPLL_POSTDIV13_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV01_CR),
-	CLK_PLL_OUT(CLK_MSSPLL2, "clk_msspll2", "clk_msspll_internal", 0,
+	CLK_PLL_OUT(CLK_MSSPLL2, "clk_msspll2", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
 		    MSSPLL_POSTDIV02_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV23_CR),
-	CLK_PLL_OUT(CLK_MSSPLL3, "clk_msspll3", "clk_msspll_internal", 0,
+	CLK_PLL_OUT(CLK_MSSPLL3, "clk_msspll3", "clk_msspll_internal", CLK_DIVIDER_ONE_BASED,
 		    MSSPLL_POSTDIV13_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV23_CR),
 };
 
@@ -259,13 +206,13 @@ static int mpfs_clk_register_msspll_outs(struct device *dev,
 	for (i = 0; i < num_clks; i++) {
 		struct mpfs_msspll_out_hw_clock *msspll_out_hw = &msspll_out_hws[i];
 
-		msspll_out_hw->base = data->msspll_base;
-		ret = devm_clk_hw_register(dev, &msspll_out_hw->hw);
+		msspll_out_hw->output.reg = data->msspll_base + msspll_out_hw->reg_offset;
+		ret = devm_clk_hw_register(dev, &msspll_out_hw->output.hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register msspll out id: %d\n",
 					     msspll_out_hw->id);
 
-		data->hw_data.hws[msspll_out_hw->id] = &msspll_out_hw->hw;
+		data->hw_data.hws[msspll_out_hw->id] = &msspll_out_hw->output.hw;
 	}
 
 	return 0;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
