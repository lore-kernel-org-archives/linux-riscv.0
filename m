Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37831C83F25
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DQmPjmvKygISFeZsAQAzrDsbBNM30msbsb7mgmndaGY=; b=obYoja0m0IlduM
	KR51rBULmvKM5hTS6L7A9TmWa5VC4jrN3X9PQSgiEsMXe6E/4VbfrU2Hxx94fCRQbXG9+DzLawLyo
	k2bBPMaXAiAZMZLGX3rTeLP7zTpWe8DyK2TqiIk6+UXZHpEMT/OwyK5vLnabGt2782SQRSD1grmzT
	kSn/T7uWGg0ywONN5SKCit4dFUPteUVpZVZ1aceskEOdftb0DC5eNb14wJBf89fm4ucKuZzQMsCCY
	WcvPTWNq/2iAnXPo2E5T26wZiaWHJ/ExAytvZ+WpqDSSTW+zng6L/RY48lHonDDPfX088gYHaC/gu
	RSUA6eby/BCfxnZPQFvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue81a-00000001lhn-00cd;
	Tue, 22 Jul 2025 08:06:58 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue81W-00000001lgL-1gjn
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 08:06:56 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 846932000A;
	Tue, 22 Jul 2025 10:06:51 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSkwosCWrUf5; Tue, 22 Jul 2025 10:06:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753171609; bh=hVGzWh4Vvx6CSvwzllIJGxjDisw7/fzLjSvjtPvZXg4=;
	h=From:To:Cc:Subject:Date;
	b=FmwpoXPTomLG7E+ru7ZPJ4rQaH8ipe8Zzlm9sgucYGXveZW6SxBMqfJfqmWOBys2V
	 LfISEBCIlmFxH1K6dvIBGmnhSmCN2qwEMfCHIIVkY62W9Nq1N/ZNj6LzK+v3Gz4D6c
	 wuP0tQePpFjHt42066+rluAn1ehkwHmQq2hxkJBMW1q0wIsWi2iXrQVRm/Kcd5obJb
	 ep/4hQK3tQZRgfi7dfXVQZ8Bmqo/6SLgat/zjkPmLWYAyKdUxzQuDb2cSKO7wY3r9x
	 2ES10eSAX/IzxtbhW5eEfVTfEFZgkeR0conowNalcl1Hecn31Fecuxm5zMcpbZuEE0
	 AGEEKAva0DgbA==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v3] clk: thead: th1520-ap: Describe mux clocks with clk_mux
Date: Tue, 22 Jul 2025 08:05:36 +0000
Message-ID: <20250722080535.60027-2-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_010654_982045_C37624D0 
X-CRM114-Status: GOOD (  15.83  )
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

Mux clocks are now described with a customized ccu_mux structure
consisting of ccu_internal and ccu_common substructures, and registered
later with devm_clk_hw_register_mux_parent_data_table(). As this helper
always allocates a new clk_hw structure, it's extremely hard to use mux
clocks as parents statically by clk_hw pointers, since CCF has no
knowledge about the clk_hw structure embedded in ccu_mux.

This scheme already causes issues for clock c910, which takes a mux
clock, c910-i0, as a possible parent. With mainline U-Boot that
reparents c910 to c910-i0 at boottime, c910 is considered as an orphan
by CCF.

This patch refactors handling of mux clocks, embeds a clk_mux structure
in ccu_mux directly. Instead of calling devm_clk_hw_register_mux_*(),
we could register mux clocks on our own without allocating any new
clk_hw pointer, fixing c910 clock's issue.

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---

This replaces the second patch in v2 of series "Fix orphan clocks in
clk-th1520-ap driver".

Note that the c910's issue cannot be reproduced with vendor U-Boot,
which always reparents c910 to its second parent, cpu-pll1. Another way
to confirm the bug is to examine
/sys/kernel/debug/clk/c910/clk_possible_parents, which obviously doesn't
match c910's definition. There's another patch[1] explaining and fixing
the issue that the unknown parent isn't shown as "(missing)" in debugfs.

[1]: https://lore.kernel.org/linux-clk/20250705095816.29480-2-ziyao@disroot.org/

Changed from v2:
- Avoid referring c910-i0 as parent for c910 with global names. Instead,
  refactor mux clock handling to make referring to mux clocks by clk_hw
  pointers possible
- Link to v2: https://lore.kernel.org/linux-riscv/20250710092135.61049-1-ziyao@disroot.org/

Changed from v1:
- Split the two fixes into separate patches
- Link to v1: https://lore.kernel.org/all/20250705052028.24611-1-ziyao@disroot.org/

 drivers/clk/thead/clk-th1520-ap.c | 95 ++++++++++++-------------------
 1 file changed, 37 insertions(+), 58 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 5a102beb6ac1..cf1bba58f641 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -42,8 +42,9 @@ struct ccu_common {
 };
 
 struct ccu_mux {
-	struct ccu_internal	mux;
-	struct ccu_common	common;
+	int			clkid;
+	u32			reg;
+	struct clk_mux		mux;
 };
 
 struct ccu_gate {
@@ -75,6 +76,17 @@ struct ccu_pll {
 		.flags	= _flags,					\
 	}
 
+#define TH_CCU_MUX(_name, _parents, _shift, _width)			\
+	{								\
+		.mask		= GENMASK(_width - 1, 0),		\
+		.shift		= _shift,				\
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA(		\
+					_name,				\
+					_parents,			\
+					&clk_mux_ops,			\
+					0),				\
+	}
+
 #define CCU_GATE(_clkid, _struct, _name, _parent, _reg, _gate, _flags)	\
 	struct ccu_gate _struct = {					\
 		.enable	= _gate,					\
@@ -94,13 +106,6 @@ static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
 	return container_of(hw, struct ccu_common, hw);
 }
 
-static inline struct ccu_mux *hw_to_ccu_mux(struct clk_hw *hw)
-{
-	struct ccu_common *common = hw_to_ccu_common(hw);
-
-	return container_of(common, struct ccu_mux, common);
-}
-
 static inline struct ccu_pll *hw_to_ccu_pll(struct clk_hw *hw)
 {
 	struct ccu_common *common = hw_to_ccu_common(hw);
@@ -415,32 +420,20 @@ static const struct clk_parent_data c910_i0_parents[] = {
 };
 
 static struct ccu_mux c910_i0_clk = {
-	.mux	= TH_CCU_ARG(1, 1),
-	.common	= {
-		.clkid		= CLK_C910_I0,
-		.cfg0		= 0x100,
-		.hw.init	= CLK_HW_INIT_PARENTS_DATA("c910-i0",
-					      c910_i0_parents,
-					      &clk_mux_ops,
-					      0),
-	}
+	.clkid	= CLK_C910_I0,
+	.reg	= 0x100,
+	.mux	= TH_CCU_MUX("c910-i0", c910_i0_parents, 1, 1),
 };
 
 static const struct clk_parent_data c910_parents[] = {
-	{ .hw = &c910_i0_clk.common.hw },
+	{ .hw = &c910_i0_clk.mux.hw },
 	{ .hw = &cpu_pll1_clk.common.hw }
 };
 
 static struct ccu_mux c910_clk = {
-	.mux	= TH_CCU_ARG(0, 1),
-	.common	= {
-		.clkid		= CLK_C910,
-		.cfg0		= 0x100,
-		.hw.init	= CLK_HW_INIT_PARENTS_DATA("c910",
-					      c910_parents,
-					      &clk_mux_ops,
-					      0),
-	}
+	.clkid	= CLK_C910,
+	.reg	= 0x100,
+	.mux	= TH_CCU_MUX("c910", c910_parents, 0, 1),
 };
 
 static const struct clk_parent_data ahb2_cpusys_parents[] = {
@@ -925,15 +918,9 @@ static const struct clk_parent_data uart_sclk_parents[] = {
 };
 
 static struct ccu_mux uart_sclk = {
-	.mux	= TH_CCU_ARG(0, 1),
-	.common	= {
-		.clkid          = CLK_UART_SCLK,
-		.cfg0		= 0x210,
-		.hw.init	= CLK_HW_INIT_PARENTS_DATA("uart-sclk",
-					      uart_sclk_parents,
-					      &clk_mux_ops,
-					      0),
-	}
+	.clkid	= CLK_UART_SCLK,
+	.reg	= 0x210,
+	.mux	= TH_CCU_MUX("uart-sclk", uart_sclk_parents, 0, 1),
 };
 
 static struct ccu_common *th1520_pll_clks[] = {
@@ -970,10 +957,10 @@ static struct ccu_common *th1520_div_clks[] = {
 	&dpu1_clk.common,
 };
 
-static struct ccu_common *th1520_mux_clks[] = {
-	&c910_i0_clk.common,
-	&c910_clk.common,
-	&uart_sclk.common,
+static struct ccu_mux *th1520_mux_clks[] = {
+	&c910_i0_clk,
+	&c910_clk,
+	&uart_sclk,
 };
 
 static struct ccu_common *th1520_gate_clks[] = {
@@ -1075,7 +1062,7 @@ static const struct regmap_config th1520_clk_regmap_config = {
 struct th1520_plat_data {
 	struct ccu_common **th1520_pll_clks;
 	struct ccu_common **th1520_div_clks;
-	struct ccu_common **th1520_mux_clks;
+	struct ccu_mux	  **th1520_mux_clks;
 	struct ccu_common **th1520_gate_clks;
 
 	int nr_clks;
@@ -1162,23 +1149,15 @@ static int th1520_clk_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < plat_data->nr_mux_clks; i++) {
-		struct ccu_mux *cm = hw_to_ccu_mux(&plat_data->th1520_mux_clks[i]->hw);
-		const struct clk_init_data *init = cm->common.hw.init;
-
-		plat_data->th1520_mux_clks[i]->map = map;
-		hw = devm_clk_hw_register_mux_parent_data_table(dev,
-								init->name,
-								init->parent_data,
-								init->num_parents,
-								0,
-								base + cm->common.cfg0,
-								cm->mux.shift,
-								cm->mux.width,
-								0, NULL, NULL);
-		if (IS_ERR(hw))
-			return PTR_ERR(hw);
+		struct ccu_mux *cm = plat_data->th1520_mux_clks[i];
+
+		cm->mux.reg = base + cm->reg;
+
+		ret = devm_clk_hw_register(dev, &cm->mux.hw);
+		if (ret)
+			return ret;
 
-		priv->hws[cm->common.clkid] = hw;
+		priv->hws[cm->clkid] = &cm->mux.hw;
 	}
 
 	for (i = 0; i < plat_data->nr_gate_clks; i++) {
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
