Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57A0C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rx/PCGg/HMbOgI47BiAopE4Q/RmWUgirfSq/geJGXIc=; b=fEXIm+pVmt8Rlv
	nfClQhGJ6w6xLt7hFKoPAbXW0/Fz9M1wv5rpZd0f6dx+fwaaeKfrQtjVpEfY7oz32cMJwwJSwbh78
	2LfeEToMgYjcsKC1n7dGSdfrqbjL/Ze9c4+m1gOMwWMIUrsfXMg9SM9NV7ZPuN/XiXU2G2IMXjzWH
	b1X+GxMfwdYPmn9+oaaaAjLZ3vx93khChgIYOr56yjImS00XOBZ3SP6lP36Bkryy8GfyUVU78MApb
	3J357521N9jiJm0brxWFBBL34Fu8D2MHUylkGXIcDilCqYbZ+GqwQeFipWM3jaOT82YuDK3+a8vP3
	P4jX3pf2whzjPOluTnWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8L0V-008fRu-PT; Mon, 04 Jul 2022 12:16:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8L0S-008fOV-Eu
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 12:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656937008; x=1688473008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TrBWC54P2CLz/iMBkusZyjETCWePFhmnr/L05n3qk6g=;
  b=ndqwtDFWG/FCgbfvLZTEG5Li7LMesyemWtw5NGxQxcc0xkNFGz53js3f
   LnSk9EdNTrDXF76aOl2ujgILxn5dx9TgKEsgYZl/COCnq70JOjyDGxdhC
   Q4m3Nr2klcMupzpJO6ilW1csdJybVBnHhjVGk3ESCYE60nunDHlwWII1Z
   a+afVpO8iwrQYmck8u+qWJSH9oa7qLOVNBOfAZSIoR6rM9641Sk08lUL7
   ufu1YGk4bij9v4f0uVotDEZEjFj5uZitLz8nrfurXk5ndix+Fpb/K3wyn
   jFhQAtLXIy+aWhmQI0q7TmPkGaCmJppboO6q24EaZBGPBOmI9tSX3A3Ch
   w==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="166262039"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 05:16:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 05:16:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 05:16:41 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 08/12] clk: microchip: mpfs: move id & offset out of clock structs
Date: Mon, 4 Jul 2022 13:15:55 +0100
Message-ID: <20220704121558.2088698-9-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704121558.2088698-1-conor.dooley@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_051648_588961_3C8BDE76 
X-CRM114-Status: GOOD (  12.37  )
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

The id and offset are the only thing differentiating the clock structs
from "regular" clock structures. On the pretext of converting to more
normal structures, move the id and offset out of the clock structs and
into the hw structs instead.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index a23f63bcd074..750f28481498 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -53,8 +53,6 @@ struct mpfs_msspll_hw_clock {
 
 struct mpfs_cfg_clock {
 	const struct clk_div_table *table;
-	unsigned int id;
-	u32 reg_offset;
 	u8 shift;
 	u8 width;
 	u8 flags;
@@ -65,12 +63,13 @@ struct mpfs_cfg_hw_clock {
 	void __iomem *sys_base;
 	struct clk_hw hw;
 	struct clk_init_data init;
+	unsigned int id;
+	u32 reg_offset;
 };
 
 #define to_mpfs_cfg_clk(_hw) container_of(_hw, struct mpfs_cfg_hw_clock, hw)
 
 struct mpfs_periph_clock {
-	unsigned int id;
 	u8 shift;
 };
 
@@ -78,6 +77,7 @@ struct mpfs_periph_hw_clock {
 	struct mpfs_periph_clock periph;
 	void __iomem *sys_base;
 	struct clk_hw hw;
+	unsigned int id;
 };
 
 #define to_mpfs_periph_clk(_hw) container_of(_hw, struct mpfs_periph_hw_clock, hw)
@@ -243,7 +243,7 @@ static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long p
 	void __iomem *base_addr = cfg_hw->sys_base;
 	u32 val;
 
-	val = readl_relaxed(base_addr + cfg->reg_offset) >> cfg->shift;
+	val = readl_relaxed(base_addr + cfg_hw->reg_offset) >> cfg->shift;
 	val &= clk_div_mask(cfg->width);
 
 	return divider_recalc_rate(hw, prate, val, cfg->table, cfg->flags, cfg->width);
@@ -272,10 +272,10 @@ static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned
 		return divider_setting;
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
-	val = readl_relaxed(base_addr + cfg->reg_offset);
+	val = readl_relaxed(base_addr + cfg_hw->reg_offset);
 	val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
 	val |= divider_setting << cfg->shift;
-	writel_relaxed(val, base_addr + cfg->reg_offset);
+	writel_relaxed(val, base_addr + cfg_hw->reg_offset);
 
 	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
 
@@ -289,11 +289,11 @@ static const struct clk_ops mpfs_clk_cfg_ops = {
 };
 
 #define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags, _offset) {		\
-	.cfg.id = _id,									\
+	.id = _id,									\
 	.cfg.shift = _shift,								\
 	.cfg.width = _width,								\
 	.cfg.table = _table,								\
-	.cfg.reg_offset = _offset,							\
+	.reg_offset = _offset,								\
 	.cfg.flags = _flags,								\
 	.hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_cfg_ops, 0),			\
 }
@@ -306,11 +306,11 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
 	CLK_CFG(CLK_AHB, "clk_ahb", "clk_msspll", 4, 2, mpfs_div_ahb_table, 0,
 		REG_CLOCK_CONFIG_CR),
 	{
-		.cfg.id = CLK_RTCREF,
+		.id = CLK_RTCREF,
 		.cfg.shift = 0,
 		.cfg.width = 12,
 		.cfg.table = mpfs_div_rtcref_table,
-		.cfg.reg_offset = REG_RTC_CLOCK_CR,
+		.reg_offset = REG_RTC_CLOCK_CR,
 		.cfg.flags = CLK_DIVIDER_ONE_BASED,
 		.hw.init =
 			CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &mpfs_clk_cfg_ops, 0),
@@ -338,9 +338,9 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
 		ret = mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
-					     cfg_hw->cfg.id);
+					     cfg_hw->id);
 
-		id = cfg_hw->cfg.id;
+		id = cfg_hw->id;
 		data->hw_data.hws[id] = &cfg_hw->hw;
 	}
 
@@ -408,7 +408,7 @@ static const struct clk_ops mpfs_periph_clk_ops = {
 };
 
 #define CLK_PERIPH(_id, _name, _parent, _shift, _flags) {			\
-	.periph.id = _id,							\
+	.id = _id,							\
 	.periph.shift = _shift,							\
 	.hw.init = CLK_HW_INIT_HW(_name, _parent, &mpfs_periph_clk_ops,		\
 				  _flags),					\
@@ -481,9 +481,9 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
 		ret = mpfs_clk_register_periph(dev, periph_hw, sys_base);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
-					     periph_hw->periph.id);
+					     periph_hw->id);
 
-		id = periph_hws[i].periph.id;
+		id = periph_hws[i].id;
 		data->hw_data.hws[id] = &periph_hw->hw;
 	}
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
