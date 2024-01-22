Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1691C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofMIX+t8PR/xTS4dsm1Ngntjx0GpHGyd8rQkxcyh+j4=; b=xNs+EqyzsGWuN6
	1riv7CEUFwXztQJhkgOp2AGNnVNrogUkmfm+E54uB80WPrhyopfu/qrYHChq1NGW0mSQN8ElFMBI7
	gSKuL0cm8giS2jaiHeyJZkha4YdO/dLBLFVwZVYzRQV7v+n6KwnrYrkknTmnil+m4BUsEgaHNQS6I
	iP8KQdZMk9rE0IEIaPtVHMPi95vBQoOT29uNeU4OgcqpAxY3d5dWNZeFUa/DSbHHJmx7vnp5uutVA
	Piu9LZueSs7664YT2P0ZMikn8nmkTt2orb+xThuDPHvwQa4UIkixiPk1/zyNBqqvnb4bFjMZs65eq
	EFK2fMtBtSfiS2Q1Bw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtI2-00C4CK-2v;
	Mon, 22 Jan 2024 12:20:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtHz-00C4B1-1z
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 12:20:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FD456139D;
	Mon, 22 Jan 2024 12:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84254C433B1;
	Mon, 22 Jan 2024 12:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705926030;
	bh=GmakhWZIvNK9KdJIPMvodNUaR1Ey8Ali7Xmgiv67KOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=re/5/Mio0eDHFIi2vAEe02mJjIVEKosRbSMGcS0HJjQ7Y3cEqugSbfeAv/ms1bmI/
	 DWi991AwCzNTn2cyqNRbDNrZm2CgJdAjoHG0JgLbPMFxXNBkoX0sJdK+mTR65xHEH8
	 ILiOZykEOBzpotsG/rUkrfTw4Ff6Mey4uPKEmrQbW9XAiuyoxNxOa2yZPiwALNb24c
	 vWOer+HbBiUrbBFqJRBYast/t/MSqVzbYP94UOYFe4gjjDGt6Ia4vUeDKBi35HRn9/
	 Yh/7RAuNUsRLYaWZp7sEUK92YizEDQlsNwBRT9PHIuvOsZ/L5fIJk0LvPBnYwRH4fY
	 aDG8+zSj4rPSw==
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
Subject: [PATCH v2 4/7] clk: microchip: mpfs: setup for using other mss pll outputs
Date: Mon, 22 Jan 2024 12:19:52 +0000
Message-ID: <20240122-sprint-hacking-8d2f20654bf1@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122-catty-roast-d3625dbb02fe@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4672; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=t4FAgw3fopovHlUFM1DCXwuCj6lBGSfP99KWVcOPLP0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnrYlOeBpZyrb4z/7tEllyWxuwSk0q7AwlKBy423daUS n0XP39/RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACayfwojw1SB7ZFr3NyPKT+c 8eofw6WKl4KhDjniFtPe/Pi/RaGx9Agjw9K9nwu+3/vlvr1hBm+IdsQ16x1Tb3B89n+8l2F506P 0VC4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_042031_736807_36B366AB 
X-CRM114-Status: GOOD (  15.57  )
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

Now that the MSSPLL is split, and the "postdiv" divider of the
cpu/AHB/AXI bus clock is represented by its own "hw" struct, make the
shifts, register offset and width a parameter of the initialisation
macro, rather than using defines that only work for one of the four
outputs.
Configuring this at initialisaion paves the way for using the other
three output clocks, where the register offset, and the bit shift
within that register, will differ.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index acf598a32ce0..911905d0433d 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -15,7 +15,8 @@
 
 /* address offset of control registers */
 #define REG_MSSPLL_REF_CR	0x08u
-#define REG_MSSPLL_POSTDIV_CR	0x10u
+#define REG_MSSPLL_POSTDIV01_CR	0x10u
+#define REG_MSSPLL_POSTDIV23_CR	0x14u
 #define REG_MSSPLL_SSCG_2_CR	0x2Cu
 #define REG_CLOCK_CONFIG_CR	0x08u
 #define REG_RTC_CLOCK_CR	0x0Cu
@@ -26,7 +27,7 @@
 #define MSSPLL_FBDIV_WIDTH	0x0Cu
 #define MSSPLL_REFDIV_SHIFT	0x08u
 #define MSSPLL_REFDIV_WIDTH	0x06u
-#define MSSPLL_POSTDIV_SHIFT	0x08u
+#define MSSPLL_POSTDIV02_SHIFT	0x08u
 #define MSSPLL_POSTDIV_WIDTH	0x07u
 #define MSSPLL_FIXED_DIV	4u
 
@@ -62,6 +63,9 @@ struct mpfs_msspll_out_hw_clock {
 	struct clk_hw hw;
 	struct clk_init_data init;
 	unsigned int id;
+	u32 reg_offset;
+	u32 shift;
+	u32 width;
 	u32 flags;
 };
 
@@ -175,11 +179,11 @@ static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_c
 static unsigned long mpfs_clk_msspll_out_recalc_rate(struct clk_hw *hw, unsigned long prate)
 {
 	struct mpfs_msspll_out_hw_clock *msspll_out_hw = to_mpfs_msspll_out_clk(hw);
-	void __iomem *postdiv_addr = msspll_out_hw->base + REG_MSSPLL_POSTDIV_CR;
+	void __iomem *postdiv_addr = msspll_out_hw->base + msspll_out_hw->reg_offset;
 	u32 postdiv;
 
-	postdiv = readl_relaxed(postdiv_addr) >> MSSPLL_POSTDIV_SHIFT;
-	postdiv &= clk_div_mask(MSSPLL_POSTDIV_WIDTH);
+	postdiv = readl_relaxed(postdiv_addr) >> msspll_out_hw->shift;
+	postdiv &= clk_div_mask(msspll_out_hw->width);
 
 	return prate / postdiv;
 }
@@ -189,19 +193,19 @@ static long mpfs_clk_msspll_out_round_rate(struct clk_hw *hw, unsigned long rate
 {
 	struct mpfs_msspll_out_hw_clock *msspll_out_hw = to_mpfs_msspll_out_clk(hw);
 
-	return divider_round_rate(hw, rate, prate, NULL, MSSPLL_POSTDIV_WIDTH,
+	return divider_round_rate(hw, rate, prate, NULL, msspll_out_hw->width,
 				  msspll_out_hw->flags);
 }
 
 static int mpfs_clk_msspll_out_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
 {
 	struct mpfs_msspll_out_hw_clock *msspll_out_hw = to_mpfs_msspll_out_clk(hw);
-	void __iomem *postdiv_addr = msspll_out_hw->base + REG_MSSPLL_POSTDIV_CR;
+	void __iomem *postdiv_addr = msspll_out_hw->base + msspll_out_hw->reg_offset;
 	u32 postdiv;
 	int divider_setting;
 	unsigned long flags;
 
-	divider_setting = divider_get_val(rate, prate, NULL, MSSPLL_POSTDIV_WIDTH,
+	divider_setting = divider_get_val(rate, prate, NULL, msspll_out_hw->width,
 					  msspll_out_hw->flags);
 
 	if (divider_setting < 0)
@@ -210,7 +214,7 @@ static int mpfs_clk_msspll_out_set_rate(struct clk_hw *hw, unsigned long rate, u
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
 
 	postdiv = readl_relaxed(postdiv_addr);
-	postdiv &= ~(clk_div_mask(MSSPLL_POSTDIV_WIDTH) << MSSPLL_POSTDIV_SHIFT);
+	postdiv &= ~(clk_div_mask(msspll_out_hw->width) << msspll_out_hw->shift);
 	writel_relaxed(postdiv, postdiv_addr);
 
 	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
@@ -224,14 +228,18 @@ static const struct clk_ops mpfs_clk_msspll_out_ops = {
 	.set_rate = mpfs_clk_msspll_out_set_rate,
 };
 
-#define CLK_PLL_OUT(_id, _name, _parent, _flags) {				\
+#define CLK_PLL_OUT(_id, _name, _parent, _flags, _shift, _width, _offset) {	\
 	.id = _id,								\
+	.shift = _shift,							\
+	.width = _width,							\
+	.reg_offset = _offset,							\
 	.flags = _flags,							\
 	.hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_msspll_out_ops, 0),	\
 }
 
 static struct mpfs_msspll_out_hw_clock mpfs_msspll_out_clks[] = {
-	CLK_PLL_OUT(CLK_MSSPLL0, "clk_msspll", "clk_msspll_internal", 0),
+	CLK_PLL_OUT(CLK_MSSPLL0, "clk_msspll", "clk_msspll_internal", 0,
+		    MSSPLL_POSTDIV02_SHIFT, MSSPLL_POSTDIV_WIDTH, REG_MSSPLL_POSTDIV01_CR),
 };
 
 static int mpfs_clk_register_msspll_outs(struct device *dev,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
