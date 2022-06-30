Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22691C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UN3r2F17uuwOSzlg4ngTBqVLgHAYDwWAp3XakN4qXOw=; b=r+IzvI+N3P37Ew
	ib7e40lXB2MabhYEMKM3Dqw3hsdM5GMcjTcRqXV/PRsOcqHf9h1z7hFDfS9sXFNLUrFf5D+CdUyY2
	ys/PUHxaV2xs20ybJqF8r9yC9O802eJkT5kfjHBbObbYcZav3jChp8eBEdFzDSE3mLPHadlifWYtq
	Fer3QAXCGaW7o9u4z4jrYoWbdqMn/oF34YPs8DQ951LYJ2tQcn9GlQnYbergXgbp+Dn7tuQ6MyfGk
	/hsMnqCj+HpX0AlmqFFR+l93JYpJgg/2xzSoH4oz8vBC1abl5aYXkucpf0cmsc0rs4mlGcTMxZ+B7
	JCSEzp56g58hd62wtRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pDy-00FvQq-Tp; Thu, 30 Jun 2022 08:08:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pDj-00FvDu-EX
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 08:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656576495; x=1688112495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LzcT9PRBOETMeZFMi6u1K2uBQ8ZkHXso84gFS8NMZwc=;
  b=yp8O3ASRB+76jyLWLsp0IDrgFUwfhExASjIeWuEU1QTpXB1K8EdoIAjZ
   EnFJ23E/TAVi9vr4usyUvLbp4Wow95SaZU4q0utkrZhkNlw2N/TdsNWXc
   3KLOtiazZzxWFF95KKMrcJc1Kp1uXeb77pwkwcatqPzlCkRxh3GA5lUPg
   Ih2aCXWvEZMNa9W0t1JKtKE+2v3vuCWq17CICBlKuHlag1lWweDPYnsrx
   bjGTgTQTRN2muaOvaeIuy0qot8SDixA5HzNpkvR69phcedbcbYBE8op9V
   9tIJ2tbwqZ+ieYxnHipcfULE7zDnZ+RrXak0IJr66Va3A6UDIaIOOcoKW
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="170493002"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 01:08:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 01:08:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 01:08:09 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Daire McNamara" <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v1 11/14] clk: microchip: mpfs: simplify control reg access
Date: Thu, 30 Jun 2022 09:05:30 +0100
Message-ID: <20220630080532.323731-12-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630080532.323731-1-conor.dooley@microchip.com>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_010815_560916_F6D0B6ED 
X-CRM114-Status: GOOD (  14.21  )
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 42 +++++++++++++-------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 750f28481498..0330c2839a24 100644
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
 
@@ -461,9 +454,9 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
 };
 
 static int mpfs_clk_register_periph(struct device *dev, struct mpfs_periph_hw_clock *periph_hw,
-				    void __iomem *sys_base)
+				    void __iomem *base)
 {
-	periph_hw->sys_base = sys_base;
+	periph_hw->periph.reg = base + REG_SUBBLK_CLOCK_CR;
 
 	return devm_clk_hw_register(dev, &periph_hw->hw);
 }
@@ -471,14 +464,13 @@ static int mpfs_clk_register_periph(struct device *dev, struct mpfs_periph_hw_cl
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
