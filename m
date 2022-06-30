Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F26C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZuQwgUi5mLYn9x7CC02k08YXjuMaz45PFTdL83lmCI=; b=mWX2Ngw6EplMVP
	raNiIrHPWh0qvYCMnmtXxx6SNG8illZcyEH6+kSFJzMLWAZHVUeRj3ENasIGNe11/QoWWL22w9ECK
	rGR1jhYHXSX7fedwKue1ES8OK9K0dFWtL7msiquN7cOC013uJD4gDaHensilH/3lsFYvKVJ+MXqpK
	Ky8cVe0ZQHqPVZI8ge0kHndn3RIeAsdkv/L49J1711DwvCc+41W0gd+tKbFPt7Frt/nCyyROLjByH
	aH5p2UCg2Kcqn4yInlCFI39KoZ5StJb2QgdGEY6s3N8KprNQI1dTNV+Y24HU+NrrqGNsHrkA82GvJ
	sjvQqOKa9gujYvFPGh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pEP-00Fvop-DV; Thu, 30 Jun 2022 08:08:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pDy-00FvQ3-Ed
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 08:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656576510; x=1688112510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9aa9S4nRgmH6ZHHc2YgDURcnmguI4OQsZfesRXqpYaQ=;
  b=E6HT0CMig6TJl17pwzFTQXMyATqkx6V1Y5Zyhkh/Ex+kD2eRuuC4D2Zs
   mgJ1oozUGz6LQDpn+nLDo6zjTPGaA262sO6iFcNaFLtzh4GqrYeZcr5Ar
   JfLApuDyaK3ccDS7Sn2kJemkm3MDx3OxcClpJHIh4RUFtOVeUik+SVcT9
   b1XCQ8naK3KDLywksoe29d+sAEeOQHEcm3Ltp5u6eKvag1UNtyn6COFhX
   TK29IaWQ3iH9o6Tt0lBEMsJgjCmawzml5vwtJ7GgdAGyIYpOUN/TpKkFV
   UxQNdZ/iDox/Gwke09gdTCWsyvHhBSWHgkOdC2A4Og+vypzJm2iLp0rm/
   w==;
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="165782188"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 01:08:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 01:08:27 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 01:08:23 -0700
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
Subject: [PATCH v1 14/14] clk: microchip: mpfs: convert periph_clk to clk_gate
Date: Thu, 30 Jun 2022 09:05:33 +0100
Message-ID: <20220630080532.323731-15-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630080532.323731-1-conor.dooley@microchip.com>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_010830_630943_7CBF2A0E 
X-CRM114-Status: GOOD (  12.54  )
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

With the reset code moved to the recently added reset controller, there
is no need for custom ops any longer. Remove the custom ops and the
custom struct by converting to a clk_gate.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 73 +++-----------------------------
 1 file changed, 6 insertions(+), 67 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index c4d1c48d6d3d..9c3bff4f147a 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -58,19 +58,11 @@ struct mpfs_cfg_hw_clock {
 	u32 reg_offset;
 };
 
-struct mpfs_periph_clock {
-	void __iomem *reg;
-	u8 shift;
-};
-
 struct mpfs_periph_hw_clock {
-	struct mpfs_periph_clock periph;
-	struct clk_hw hw;
+	struct clk_gate periph;
 	unsigned int id;
 };
 
-#define to_mpfs_periph_clk(_hw) container_of(_hw, struct mpfs_periph_hw_clock, hw)
-
 /*
  * mpfs_clk_lock prevents anything else from writing to the
  * mpfs clk block while a software locked register is being written.
@@ -272,63 +264,10 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
  * peripheral clocks - devices connected to axi or ahb buses.
  */
 
-static int mpfs_periph_clk_enable(struct clk_hw *hw)
-{
-	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
-	struct mpfs_periph_clock *periph = &periph_hw->periph;
-	u32 reg, val;
-	unsigned long flags;
-
-	spin_lock_irqsave(&mpfs_clk_lock, flags);
-
-	reg = readl_relaxed(periph->reg);
-	val = reg | (1u << periph->shift);
-	writel_relaxed(val, periph->reg);
-
-	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
-
-	return 0;
-}
-
-static void mpfs_periph_clk_disable(struct clk_hw *hw)
-{
-	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
-	struct mpfs_periph_clock *periph = &periph_hw->periph;
-	u32 reg, val;
-	unsigned long flags;
-
-	spin_lock_irqsave(&mpfs_clk_lock, flags);
-
-	reg = readl_relaxed(periph->reg);
-	val = reg & ~(1u << periph->shift);
-	writel_relaxed(val, periph->reg);
-
-	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
-}
-
-static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
-{
-	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
-	struct mpfs_periph_clock *periph = &periph_hw->periph;
-	u32 reg;
-
-	reg = readl_relaxed(periph->reg);
-	if (reg & (1u << periph->shift))
-		return 1;
-
-	return 0;
-}
-
-static const struct clk_ops mpfs_periph_clk_ops = {
-	.enable = mpfs_periph_clk_enable,
-	.disable = mpfs_periph_clk_disable,
-	.is_enabled = mpfs_periph_clk_is_enabled,
-};
-
 #define CLK_PERIPH(_id, _name, _parent, _shift, _flags) {			\
-	.id = _id,							\
-	.periph.shift = _shift,							\
-	.hw.init = CLK_HW_INIT_HW(_name, _parent, &mpfs_periph_clk_ops,		\
+	.id = _id,								\
+	.periph.bit_idx = _shift,						\
+	.periph.hw.init = CLK_HW_INIT_HW(_name, _parent, &clk_gate_ops,		\
 				  _flags),					\
 }
 
@@ -388,13 +327,13 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
 		struct mpfs_periph_hw_clock *periph_hw = &periph_hws[i];
 
 		periph_hw->periph.reg = data->base + REG_SUBBLK_CLOCK_CR;
-		ret = devm_clk_hw_register(dev, &periph_hw->hw);
+		ret = devm_clk_hw_register(dev, &periph_hw->periph.hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
 					     periph_hw->id);
 
 		id = periph_hws[i].id;
-		data->hw_data.hws[id] = &periph_hw->hw;
+		data->hw_data.hws[id] = &periph_hw->periph.hw;
 	}
 
 	return 0;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
