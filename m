Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B684DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWlNLd5t6+ZkS+1MGU0lY1PhPDr/wLcemNsQhDR3u74=; b=IGtc+ZAKXaTpD0
	2a3IOpY4zw2l7ES4d7hV1Ge+zmPZvACa29XuhBrNmdxo3D4cOBMoRo3Mlx4oqX2AzfHEbtS2zVp5I
	QulInTbmwFgcfaoPsP6VYcZy0CN01/cO0IDVprODiLG593HuoXEF/GV9kOs7qQnuhcYJ9NQIkiPYC
	3hcvaRnQzR7gSzQH/4i1whY9mqSqpTCNoQ51xwJKw/z1V+TqrylUAB7RyH7dHAvepk6nv9oFexkuB
	ikmUni7+mZwCtYkV1nG9F9u+y3HnhJTcb7Xki0wRfgTgMqcX1ec2CkqEVlKtWh0oBmoxS3gKDFDBc
	7jvlZhVQNqTssIsqdyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pED-00FveI-Cl; Thu, 30 Jun 2022 08:08:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pDs-00FvHU-2E
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 08:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656576504; x=1688112504;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S3guy6y0ln/n8/4PO8TiUDdh+3MMhxM5PFD87yFR1aw=;
  b=YuCDkwJ9ss8cXSoa4KVg8FO/A1UcxPTwtQ/VkyCWkzHhyj4nubZ892C+
   VCHoHSQWjuPS83c7Kg4G1bDDv8nN2bQ/mDSvMmMkHSZ+SxML4n1qLxENE
   aVULxiFJM3h3iqZnTdGI/0wnDXjBCqUMZAJFcpQ5Y04R7uiLYNu7tCZ8z
   y3vgW3LFPwurLSJpXEjYMLpZIiaN9Ftwf5WZ+4fi1vHL/EV1HI68WYgP/
   Qv2v5m1aPx/yiPQ1Xg7TxJbZYzBfnhz21d5Gxf0QrEZn2hbwvheF7lQnZ
   IFJq02dOx0mC+GMFSPZZ5PQtkz/wt9vk4msDtCh4BoZrhmm3MNrTvav19
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="170217635"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 01:08:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 01:08:22 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 01:08:18 -0700
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
Subject: [PATCH v1 13/14] clk: microchip: mpfs: convert cfg_clk to clk_divider
Date: Thu, 30 Jun 2022 09:05:32 +0100
Message-ID: <20220630080532.323731-14-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630080532.323731-1-conor.dooley@microchip.com>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_010824_152255_2CA2AD11 
X-CRM114-Status: GOOD (  11.73  )
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 75 +++-----------------------------
 1 file changed, 7 insertions(+), 68 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index e58d0bc4669a..c4d1c48d6d3d 100644
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
@@ -285,7 +224,7 @@ static const struct clk_ops mpfs_clk_cfg_ops = {
 	.cfg.table = _table,								\
 	.reg_offset = _offset,								\
 	.cfg.flags = _flags,								\
-	.hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_cfg_ops, 0),			\
+	.cfg.hw.init = CLK_HW_INIT(_name, _parent, &clk_divider_ops, 0),		\
 }
 
 static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
@@ -302,8 +241,8 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
 		.cfg.table = mpfs_div_rtcref_table,
 		.reg_offset = REG_RTC_CLOCK_CR,
 		.cfg.flags = CLK_DIVIDER_ONE_BASED,
-		.hw.init =
-			CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &mpfs_clk_cfg_ops, 0),
+		.cfg.hw.init =
+			CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &clk_divider_ops, 0),
 	}
 };
 
@@ -317,13 +256,13 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
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
@@ -393,7 +332,7 @@ static const struct clk_ops mpfs_periph_clk_ops = {
 				  _flags),					\
 }
 
-#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].hw)
+#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)
 
 /*
  * Critical clocks:
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
