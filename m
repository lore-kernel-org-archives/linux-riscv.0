Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD3DC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCflS1HGnaaoCKx5j1erVBqALB8fm9FT9Zq7OOKn8wg=; b=ifpC4PA6C28kQl
	iAaB0bJuG/E+YXbzIT7HAF33tzK9Au7+qal+wioRf/MhjEyvNBdL1AYohNqXX0xNae/aqaFKGCW5d
	51EsNDlLrUtHICXUPouOJ3wYDlhZmGOG3K0dTAtCeHJLWgpC8uJn/30/cvaEn8N9FNb/D8NUtECKz
	akFhwis3pk3JHkKzI6frsGl/C16a7EJ5T2htcur+zjedIX0NyQlrMSkZDNjR3pAniwDc8PykXH351
	lhvk95Hp2C3mhTNUYpO9nPe2gYmLAKpVc9eUiXYRX95CalVN5Yd//0aY6EQbdLU/h6IIp3YGNdp2/
	wgY1LymHYTzidh6u8FZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0kr-00H2X3-QX; Tue, 30 Aug 2022 12:54:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0kS-00H1r1-T8
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661864024; x=1693400024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BOymteiUYS1PQ8HpYB6Q2qGyorrx+Ezs6Euf1b5luVQ=;
  b=16IRoRAOZSZ6aas0ag9N4KgAFavuL93aF3Rpz+R6ygC3ilQLwsuMx3Ax
   0NjU4Ud0YhxXIAlnzJeyHD10HZhALJMVvee6hXBsEtzjPWyBbgwUIRhkQ
   QO2EJOjW6cdSQit3x3shBEV9dmVzK3NZOgzEd8zAd1yZUMMyTIsD46ZlO
   2N24tXC+cf8a2gCq/h/0LXMM0gAXCkBh9m/m64XvYIVQHbkj37XNXbwkP
   jT5V6TiqYF2sXrZy6WtVy32VmjAz6Osqjy/L9xPdMObS8SqJLz9UjJPY9
   mHFnoMrnHUm00WJYZVzgpjnvRtC75oFQFYE9eDNyojRgOuOjawMNTgLUY
   w==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="188645764"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 05:53:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 05:53:41 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 05:53:39 -0700
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
Subject: [PATCH v4 09/13] clk: microchip: mpfs: simplify control reg access
Date: Tue, 30 Aug 2022 13:52:46 +0100
Message-ID: <20220830125249.2373416-9-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830125110.2372514-1-conor.dooley@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_055345_616612_351D83D0 
X-CRM114-Status: GOOD (  14.03  )
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

The control reg addresses are known when the clocks are registered, so
we can, instead of assigning a base pointer to the structs, assign the
control reg addresses directly. Accordingly, remove the interim
variables used during reads/writes to those registers.

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 42 +++++++++++++-------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 845658751690..60e1e82912fe 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -52,6 +52,7 @@ struct mpfs_msspll_hw_clock {
 #define to_mpfs_msspll_clk(_hw) container_of(_hw, struct mpfs_msspll_hw_clock, hw)
 
 struct mpfs_cfg_clock {
+	void __iomem *reg;
 	const struct clk_div_table *table;
 	u8 shift;
 	u8 width;
@@ -60,7 +61,6 @@ struct mpfs_cfg_clock {
 
 struct mpfs_cfg_hw_clock {
 	struct mpfs_cfg_clock cfg;
-	void __iomem *sys_base;
 	struct clk_hw hw;
 	struct clk_init_data init;
 	unsigned int id;
@@ -70,12 +70,12 @@ struct mpfs_cfg_hw_clock {
 #define to_mpfs_cfg_clk(_hw) container_of(_hw, struct mpfs_cfg_hw_clock, hw)
 
 struct mpfs_periph_clock {
+	void __iomem *reg;
 	u8 shift;
 };
 
 struct mpfs_periph_hw_clock {
 	struct mpfs_periph_clock periph;
-	void __iomem *sys_base;
 	struct clk_hw hw;
 	unsigned int id;
 };
@@ -214,14 +214,13 @@ static int mpfs_clk_register_msspll(struct device *dev, struct mpfs_msspll_hw_cl
 static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_clock *msspll_hws,
 				     unsigned int num_clks, struct mpfs_clock_data *data)
 {
-	void __iomem *base = data->msspll_base;
 	unsigned int i;
 	int ret;
 
 	for (i = 0; i < num_clks; i++) {
 		struct mpfs_msspll_hw_clock *msspll_hw = &msspll_hws[i];
 
-		ret = mpfs_clk_register_msspll(dev, msspll_hw, base);
+		ret = mpfs_clk_register_msspll(dev, msspll_hw, data->msspll_base);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
 					     CLK_MSSPLL);
@@ -240,10 +239,9 @@ static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long p
 {
 	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
 	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
-	void __iomem *base_addr = cfg_hw->sys_base;
 	u32 val;
 
-	val = readl_relaxed(base_addr + cfg_hw->reg_offset) >> cfg->shift;
+	val = readl_relaxed(cfg->reg) >> cfg->shift;
 	val &= clk_div_mask(cfg->width);
 
 	return divider_recalc_rate(hw, prate, val, cfg->table, cfg->flags, cfg->width);
@@ -261,7 +259,6 @@ static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned
 {
 	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
 	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
-	void __iomem *base_addr = cfg_hw->sys_base;
 	unsigned long flags;
 	u32 val;
 	int divider_setting;
@@ -272,10 +269,10 @@ static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned
 		return divider_setting;
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
-	val = readl_relaxed(base_addr + cfg_hw->reg_offset);
+	val = readl_relaxed(cfg->reg);
 	val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
 	val |= divider_setting << cfg->shift;
-	writel_relaxed(val, base_addr + cfg_hw->reg_offset);
+	writel_relaxed(val, cfg->reg);
 
 	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
 
@@ -318,9 +315,9 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
 };
 
 static int mpfs_clk_register_cfg(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hw,
-				 void __iomem *sys_base)
+				 void __iomem *base)
 {
-	cfg_hw->sys_base = sys_base;
+	cfg_hw->cfg.reg = base + cfg_hw->reg_offset;
 
 	return devm_clk_hw_register(dev, &cfg_hw->hw);
 }
@@ -328,14 +325,13 @@ static int mpfs_clk_register_cfg(struct device *dev, struct mpfs_cfg_hw_clock *c
 static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hws,
 				  unsigned int num_clks, struct mpfs_clock_data *data)
 {
-	void __iomem *sys_base = data->base;
 	unsigned int i, id;
 	int ret;
 
 	for (i = 0; i < num_clks; i++) {
 		struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
 
-		ret = mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
+		ret = mpfs_clk_register_cfg(dev, cfg_hw, data->base);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
 					     cfg_hw->id);
@@ -355,15 +351,14 @@ static int mpfs_periph_clk_enable(struct clk_hw *hw)
 {
 	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
 	struct mpfs_periph_clock *periph = &periph_hw->periph;
-	void __iomem *base_addr = periph_hw->sys_base;
 	u32 reg, val;
 	unsigned long flags;
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+	reg = readl_relaxed(periph->reg);
 	val = reg | (1u << periph->shift);
-	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
+	writel_relaxed(val, periph->reg);
 
 	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
 
@@ -374,15 +369,14 @@ static void mpfs_periph_clk_disable(struct clk_hw *hw)
 {
 	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
 	struct mpfs_periph_clock *periph = &periph_hw->periph;
-	void __iomem *base_addr = periph_hw->sys_base;
 	u32 reg, val;
 	unsigned long flags;
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+	reg = readl_relaxed(periph->reg);
 	val = reg & ~(1u << periph->shift);
-	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
+	writel_relaxed(val, periph->reg);
 
 	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
 }
@@ -391,10 +385,9 @@ static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
 {
 	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
 	struct mpfs_periph_clock *periph = &periph_hw->periph;
-	void __iomem *base_addr = periph_hw->sys_base;
 	u32 reg;
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+	reg = readl_relaxed(periph->reg);
 	if (reg & (1u << periph->shift))
 		return 1;
 
@@ -462,9 +455,9 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
 };
 
 static int mpfs_clk_register_periph(struct device *dev, struct mpfs_periph_hw_clock *periph_hw,
-				    void __iomem *sys_base)
+				    void __iomem *base)
 {
-	periph_hw->sys_base = sys_base;
+	periph_hw->periph.reg = base + REG_SUBBLK_CLOCK_CR;
 
 	return devm_clk_hw_register(dev, &periph_hw->hw);
 }
@@ -472,14 +465,13 @@ static int mpfs_clk_register_periph(struct device *dev, struct mpfs_periph_hw_cl
 static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_clock *periph_hws,
 				     int num_clks, struct mpfs_clock_data *data)
 {
-	void __iomem *sys_base = data->base;
 	unsigned int i, id;
 	int ret;
 
 	for (i = 0; i < num_clks; i++) {
 		struct mpfs_periph_hw_clock *periph_hw = &periph_hws[i];
 
-		ret = mpfs_clk_register_periph(dev, periph_hw, sys_base);
+		ret = mpfs_clk_register_periph(dev, periph_hw, data->base);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
 					     periph_hw->id);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
