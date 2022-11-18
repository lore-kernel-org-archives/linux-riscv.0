Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B79C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 01:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bF4p1vHZV6ck1oVJYWNgEaQtEKFno9G8N5STF/eUAs=; b=sbEKq8v4gizLw3
	yq9d34+CZMDS8k2z35Fa5dunvXmWE11/i00XY+qBybFFiRaECghvSOwo+VOJu2G4VZ3EprtaEKlg4
	lXhL0sp/UhJxP8uV0w01Sbyc/OoNDl26E6sNH446wBN6d7ADCXBTemWS6GODAF8PH5aUkYnNoIwtX
	WYXvWCnIhBi8yUiDCMtn1v4TkJ+uO9Nw0gvyISelMfaXjLaEGZaZnZWLomXZiByusI2tCAhGgGHbg
	Rylli/g0gzTWTTSp4SJurUUX0qoSO+phVQqSJyZGF/FRsLPlQtgaqbWLYM7ipr/qXPzGOjPUcmhto
	4yR7hSefU1Lw6X4F5g+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovpr0-001784-Lk; Fri, 18 Nov 2022 01:07:38 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovpqp-0016uA-De
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 01:07:30 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 495A324E19A;
	Fri, 18 Nov 2022 09:06:30 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:06:30 +0800
Received: from ubuntu.localdomain (183.27.96.116) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:06:29 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 01/14] clk: starfive: Factor out common JH7100 and JH7110 code
Date: Fri, 18 Nov 2022 09:06:14 +0800
Message-ID: <20221118010627.70576-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118010627.70576-1-hal.feng@starfivetech.com>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_170727_907104_CD0ED84B 
X-CRM114-Status: GOOD (  22.36  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

The clock control registers on the StarFive JH7100 and JH7110 work
identically, so factor out the code then drivers for the two SoCs
can share it without depending on each other. No functional change.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 MAINTAINERS                                |   2 +-
 drivers/clk/starfive/Kconfig               |   5 +
 drivers/clk/starfive/Makefile              |   3 +-
 drivers/clk/starfive/clk-starfive-jh7100.c | 325 --------------------
 drivers/clk/starfive/clk-starfive-jh7100.h |   2 +
 drivers/clk/starfive/clk-starfive-jh71x0.c | 333 +++++++++++++++++++++
 6 files changed, 343 insertions(+), 327 deletions(-)
 create mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 256f03904987..d43daa89d5f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19602,7 +19602,7 @@ STARFIVE JH7100 CLOCK DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
-F:	drivers/clk/starfive/clk-starfive-jh7100*
+F:	drivers/clk/starfive/
 F:	include/dt-bindings/clock/starfive-jh7100*.h
 
 STARFIVE JH7100 PINCTRL DRIVER
diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 003bd2d56ce7..594d516dcb38 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -1,8 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 
+config CLK_STARFIVE_JH71X0
+	bool
+
 config CLK_STARFIVE_JH7100
 	bool "StarFive JH7100 clock support"
 	depends on SOC_STARFIVE || COMPILE_TEST
+	select CLK_STARFIVE_JH71X0
 	default SOC_STARFIVE
 	help
 	  Say yes here to support the clock controller on the StarFive JH7100
@@ -11,6 +15,7 @@ config CLK_STARFIVE_JH7100
 config CLK_STARFIVE_JH7100_AUDIO
 	tristate "StarFive JH7100 audio clock support"
 	depends on CLK_STARFIVE_JH7100
+	select CLK_STARFIVE_JH71X0
 	default m if SOC_STARFIVE
 	help
 	  Say Y or M here to support the audio clocks on the StarFive JH7100
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 0fa8ecb9ec1c..82edfa9f9cb8 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-# StarFive Clock
+obj-$(CONFIG_CLK_STARFIVE_JH71X0)	+= clk-starfive-jh71x0.o
+
 obj-$(CONFIG_CLK_STARFIVE_JH7100)	+= clk-starfive-jh7100.o
 obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO)	+= clk-starfive-jh7100-audio.o
diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
index 691aeebc7092..eea52f16af0d 100644
--- a/drivers/clk/starfive/clk-starfive-jh7100.c
+++ b/drivers/clk/starfive/clk-starfive-jh7100.c
@@ -7,15 +7,10 @@
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
  */
 
-#include <linux/bits.h>
 #include <linux/clk-provider.h>
-#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/init.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
-#include <linux/module.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/starfive-jh7100.h>
@@ -269,326 +264,6 @@ static const struct jh7100_clk_data jh7100_clk_data[] __initconst = {
 	JH7100_GATE(JH7100_CLK_SYSERR_APB, "syserr_apb", 0, JH7100_CLK_APB2_BUS),
 };
 
-static struct jh7100_clk *jh7100_clk_from(struct clk_hw *hw)
-{
-	return container_of(hw, struct jh7100_clk, hw);
-}
-
-static struct jh7100_clk_priv *jh7100_priv_from(struct jh7100_clk *clk)
-{
-	return container_of(clk, struct jh7100_clk_priv, reg[clk->idx]);
-}
-
-static u32 jh7100_clk_reg_get(struct jh7100_clk *clk)
-{
-	struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
-	void __iomem *reg = priv->base + 4 * clk->idx;
-
-	return readl_relaxed(reg);
-}
-
-static void jh7100_clk_reg_rmw(struct jh7100_clk *clk, u32 mask, u32 value)
-{
-	struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
-	void __iomem *reg = priv->base + 4 * clk->idx;
-	unsigned long flags;
-
-	spin_lock_irqsave(&priv->rmw_lock, flags);
-	value |= readl_relaxed(reg) & ~mask;
-	writel_relaxed(value, reg);
-	spin_unlock_irqrestore(&priv->rmw_lock, flags);
-}
-
-static int jh7100_clk_enable(struct clk_hw *hw)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-
-	jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, JH7100_CLK_ENABLE);
-	return 0;
-}
-
-static void jh7100_clk_disable(struct clk_hw *hw)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-
-	jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, 0);
-}
-
-static int jh7100_clk_is_enabled(struct clk_hw *hw)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-
-	return !!(jh7100_clk_reg_get(clk) & JH7100_CLK_ENABLE);
-}
-
-static unsigned long jh7100_clk_recalc_rate(struct clk_hw *hw,
-					    unsigned long parent_rate)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-	u32 div = jh7100_clk_reg_get(clk) & JH7100_CLK_DIV_MASK;
-
-	return div ? parent_rate / div : 0;
-}
-
-static int jh7100_clk_determine_rate(struct clk_hw *hw,
-				     struct clk_rate_request *req)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-	unsigned long parent = req->best_parent_rate;
-	unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
-	unsigned long div = min_t(unsigned long, DIV_ROUND_UP(parent, rate), clk->max_div);
-	unsigned long result = parent / div;
-
-	/*
-	 * we want the result clamped by min_rate and max_rate if possible:
-	 * case 1: div hits the max divider value, which means it's less than
-	 * parent / rate, so the result is greater than rate and min_rate in
-	 * particular. we can't do anything about result > max_rate because the
-	 * divider doesn't go any further.
-	 * case 2: div = DIV_ROUND_UP(parent, rate) which means the result is
-	 * always lower or equal to rate and max_rate. however the result may
-	 * turn out lower than min_rate, but then the next higher rate is fine:
-	 *   div - 1 = ceil(parent / rate) - 1 < parent / rate
-	 * and thus
-	 *   min_rate <= rate < parent / (div - 1)
-	 */
-	if (result < req->min_rate && div > 1)
-		result = parent / (div - 1);
-
-	req->rate = result;
-	return 0;
-}
-
-static int jh7100_clk_set_rate(struct clk_hw *hw,
-			       unsigned long rate,
-			       unsigned long parent_rate)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-	unsigned long div = clamp(DIV_ROUND_CLOSEST(parent_rate, rate),
-				  1UL, (unsigned long)clk->max_div);
-
-	jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, div);
-	return 0;
-}
-
-static unsigned long jh7100_clk_frac_recalc_rate(struct clk_hw *hw,
-						 unsigned long parent_rate)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-	u32 reg = jh7100_clk_reg_get(clk);
-	unsigned long div100 = 100 * (reg & JH7100_CLK_INT_MASK) +
-			       ((reg & JH7100_CLK_FRAC_MASK) >> JH7100_CLK_FRAC_SHIFT);
-
-	return (div100 >= JH7100_CLK_FRAC_MIN) ? 100 * parent_rate / div100 : 0;
-}
-
-static int jh7100_clk_frac_determine_rate(struct clk_hw *hw,
-					  struct clk_rate_request *req)
-{
-	unsigned long parent100 = 100 * req->best_parent_rate;
-	unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
-	unsigned long div100 = clamp(DIV_ROUND_CLOSEST(parent100, rate),
-				     JH7100_CLK_FRAC_MIN, JH7100_CLK_FRAC_MAX);
-	unsigned long result = parent100 / div100;
-
-	/* clamp the result as in jh7100_clk_determine_rate() above */
-	if (result > req->max_rate && div100 < JH7100_CLK_FRAC_MAX)
-		result = parent100 / (div100 + 1);
-	if (result < req->min_rate && div100 > JH7100_CLK_FRAC_MIN)
-		result = parent100 / (div100 - 1);
-
-	req->rate = result;
-	return 0;
-}
-
-static int jh7100_clk_frac_set_rate(struct clk_hw *hw,
-				    unsigned long rate,
-				    unsigned long parent_rate)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-	unsigned long div100 = clamp(DIV_ROUND_CLOSEST(100 * parent_rate, rate),
-				     JH7100_CLK_FRAC_MIN, JH7100_CLK_FRAC_MAX);
-	u32 value = ((div100 % 100) << JH7100_CLK_FRAC_SHIFT) | (div100 / 100);
-
-	jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, value);
-	return 0;
-}
-
-static u8 jh7100_clk_get_parent(struct clk_hw *hw)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-	u32 value = jh7100_clk_reg_get(clk);
-
-	return (value & JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT;
-}
-
-static int jh7100_clk_set_parent(struct clk_hw *hw, u8 index)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-	u32 value = (u32)index << JH7100_CLK_MUX_SHIFT;
-
-	jh7100_clk_reg_rmw(clk, JH7100_CLK_MUX_MASK, value);
-	return 0;
-}
-
-static int jh7100_clk_mux_determine_rate(struct clk_hw *hw,
-					 struct clk_rate_request *req)
-{
-	return clk_mux_determine_rate_flags(hw, req, 0);
-}
-
-static int jh7100_clk_get_phase(struct clk_hw *hw)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-	u32 value = jh7100_clk_reg_get(clk);
-
-	return (value & JH7100_CLK_INVERT) ? 180 : 0;
-}
-
-static int jh7100_clk_set_phase(struct clk_hw *hw, int degrees)
-{
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-	u32 value;
-
-	if (degrees == 0)
-		value = 0;
-	else if (degrees == 180)
-		value = JH7100_CLK_INVERT;
-	else
-		return -EINVAL;
-
-	jh7100_clk_reg_rmw(clk, JH7100_CLK_INVERT, value);
-	return 0;
-}
-
-#ifdef CONFIG_DEBUG_FS
-static void jh7100_clk_debug_init(struct clk_hw *hw, struct dentry *dentry)
-{
-	static const struct debugfs_reg32 jh7100_clk_reg = {
-		.name = "CTRL",
-		.offset = 0,
-	};
-	struct jh7100_clk *clk = jh7100_clk_from(hw);
-	struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
-	struct debugfs_regset32 *regset;
-
-	regset = devm_kzalloc(priv->dev, sizeof(*regset), GFP_KERNEL);
-	if (!regset)
-		return;
-
-	regset->regs = &jh7100_clk_reg;
-	regset->nregs = 1;
-	regset->base = priv->base + 4 * clk->idx;
-
-	debugfs_create_regset32("registers", 0400, dentry, regset);
-}
-#else
-#define jh7100_clk_debug_init NULL
-#endif
-
-static const struct clk_ops jh7100_clk_gate_ops = {
-	.enable = jh7100_clk_enable,
-	.disable = jh7100_clk_disable,
-	.is_enabled = jh7100_clk_is_enabled,
-	.debug_init = jh7100_clk_debug_init,
-};
-
-static const struct clk_ops jh7100_clk_div_ops = {
-	.recalc_rate = jh7100_clk_recalc_rate,
-	.determine_rate = jh7100_clk_determine_rate,
-	.set_rate = jh7100_clk_set_rate,
-	.debug_init = jh7100_clk_debug_init,
-};
-
-static const struct clk_ops jh7100_clk_fdiv_ops = {
-	.recalc_rate = jh7100_clk_frac_recalc_rate,
-	.determine_rate = jh7100_clk_frac_determine_rate,
-	.set_rate = jh7100_clk_frac_set_rate,
-	.debug_init = jh7100_clk_debug_init,
-};
-
-static const struct clk_ops jh7100_clk_gdiv_ops = {
-	.enable = jh7100_clk_enable,
-	.disable = jh7100_clk_disable,
-	.is_enabled = jh7100_clk_is_enabled,
-	.recalc_rate = jh7100_clk_recalc_rate,
-	.determine_rate = jh7100_clk_determine_rate,
-	.set_rate = jh7100_clk_set_rate,
-	.debug_init = jh7100_clk_debug_init,
-};
-
-static const struct clk_ops jh7100_clk_mux_ops = {
-	.determine_rate = jh7100_clk_mux_determine_rate,
-	.set_parent = jh7100_clk_set_parent,
-	.get_parent = jh7100_clk_get_parent,
-	.debug_init = jh7100_clk_debug_init,
-};
-
-static const struct clk_ops jh7100_clk_gmux_ops = {
-	.enable = jh7100_clk_enable,
-	.disable = jh7100_clk_disable,
-	.is_enabled = jh7100_clk_is_enabled,
-	.determine_rate = jh7100_clk_mux_determine_rate,
-	.set_parent = jh7100_clk_set_parent,
-	.get_parent = jh7100_clk_get_parent,
-	.debug_init = jh7100_clk_debug_init,
-};
-
-static const struct clk_ops jh7100_clk_mdiv_ops = {
-	.recalc_rate = jh7100_clk_recalc_rate,
-	.determine_rate = jh7100_clk_determine_rate,
-	.get_parent = jh7100_clk_get_parent,
-	.set_parent = jh7100_clk_set_parent,
-	.set_rate = jh7100_clk_set_rate,
-	.debug_init = jh7100_clk_debug_init,
-};
-
-static const struct clk_ops jh7100_clk_gmd_ops = {
-	.enable = jh7100_clk_enable,
-	.disable = jh7100_clk_disable,
-	.is_enabled = jh7100_clk_is_enabled,
-	.recalc_rate = jh7100_clk_recalc_rate,
-	.determine_rate = jh7100_clk_determine_rate,
-	.get_parent = jh7100_clk_get_parent,
-	.set_parent = jh7100_clk_set_parent,
-	.set_rate = jh7100_clk_set_rate,
-	.debug_init = jh7100_clk_debug_init,
-};
-
-static const struct clk_ops jh7100_clk_inv_ops = {
-	.get_phase = jh7100_clk_get_phase,
-	.set_phase = jh7100_clk_set_phase,
-	.debug_init = jh7100_clk_debug_init,
-};
-
-const struct clk_ops *starfive_jh7100_clk_ops(u32 max)
-{
-	if (max & JH7100_CLK_DIV_MASK) {
-		if (max & JH7100_CLK_MUX_MASK) {
-			if (max & JH7100_CLK_ENABLE)
-				return &jh7100_clk_gmd_ops;
-			return &jh7100_clk_mdiv_ops;
-		}
-		if (max & JH7100_CLK_ENABLE)
-			return &jh7100_clk_gdiv_ops;
-		if (max == JH7100_CLK_FRAC_MAX)
-			return &jh7100_clk_fdiv_ops;
-		return &jh7100_clk_div_ops;
-	}
-
-	if (max & JH7100_CLK_MUX_MASK) {
-		if (max & JH7100_CLK_ENABLE)
-			return &jh7100_clk_gmux_ops;
-		return &jh7100_clk_mux_ops;
-	}
-
-	if (max & JH7100_CLK_ENABLE)
-		return &jh7100_clk_gate_ops;
-
-	return &jh7100_clk_inv_ops;
-}
-EXPORT_SYMBOL_GPL(starfive_jh7100_clk_ops);
-
 static struct clk_hw *jh7100_clk_get(struct of_phandle_args *clkspec, void *data)
 {
 	struct jh7100_clk_priv *priv = data;
diff --git a/drivers/clk/starfive/clk-starfive-jh7100.h b/drivers/clk/starfive/clk-starfive-jh7100.h
index f116be5740a5..a8ba6e25b5ce 100644
--- a/drivers/clk/starfive/clk-starfive-jh7100.h
+++ b/drivers/clk/starfive/clk-starfive-jh7100.h
@@ -4,6 +4,8 @@
 
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/spinlock.h>
 
 /* register fields */
 #define JH7100_CLK_ENABLE	BIT(31)
diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
new file mode 100644
index 000000000000..6c07b61b4a32
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JH7100 Clock Generator Driver
+ *
+ * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/io.h>
+
+#include "clk-starfive-jh7100.h"
+
+static struct jh7100_clk *jh7100_clk_from(struct clk_hw *hw)
+{
+	return container_of(hw, struct jh7100_clk, hw);
+}
+
+static struct jh7100_clk_priv *jh7100_priv_from(struct jh7100_clk *clk)
+{
+	return container_of(clk, struct jh7100_clk_priv, reg[clk->idx]);
+}
+
+static u32 jh7100_clk_reg_get(struct jh7100_clk *clk)
+{
+	struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
+	void __iomem *reg = priv->base + 4 * clk->idx;
+
+	return readl_relaxed(reg);
+}
+
+static void jh7100_clk_reg_rmw(struct jh7100_clk *clk, u32 mask, u32 value)
+{
+	struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
+	void __iomem *reg = priv->base + 4 * clk->idx;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->rmw_lock, flags);
+	value |= readl_relaxed(reg) & ~mask;
+	writel_relaxed(value, reg);
+	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+}
+
+static int jh7100_clk_enable(struct clk_hw *hw)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+
+	jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, JH7100_CLK_ENABLE);
+	return 0;
+}
+
+static void jh7100_clk_disable(struct clk_hw *hw)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+
+	jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, 0);
+}
+
+static int jh7100_clk_is_enabled(struct clk_hw *hw)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+
+	return !!(jh7100_clk_reg_get(clk) & JH7100_CLK_ENABLE);
+}
+
+static unsigned long jh7100_clk_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	u32 div = jh7100_clk_reg_get(clk) & JH7100_CLK_DIV_MASK;
+
+	return div ? parent_rate / div : 0;
+}
+
+static int jh7100_clk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	unsigned long parent = req->best_parent_rate;
+	unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
+	unsigned long div = min_t(unsigned long, DIV_ROUND_UP(parent, rate), clk->max_div);
+	unsigned long result = parent / div;
+
+	/*
+	 * we want the result clamped by min_rate and max_rate if possible:
+	 * case 1: div hits the max divider value, which means it's less than
+	 * parent / rate, so the result is greater than rate and min_rate in
+	 * particular. we can't do anything about result > max_rate because the
+	 * divider doesn't go any further.
+	 * case 2: div = DIV_ROUND_UP(parent, rate) which means the result is
+	 * always lower or equal to rate and max_rate. however the result may
+	 * turn out lower than min_rate, but then the next higher rate is fine:
+	 *   div - 1 = ceil(parent / rate) - 1 < parent / rate
+	 * and thus
+	 *   min_rate <= rate < parent / (div - 1)
+	 */
+	if (result < req->min_rate && div > 1)
+		result = parent / (div - 1);
+
+	req->rate = result;
+	return 0;
+}
+
+static int jh7100_clk_set_rate(struct clk_hw *hw,
+			       unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	unsigned long div = clamp(DIV_ROUND_CLOSEST(parent_rate, rate),
+				  1UL, (unsigned long)clk->max_div);
+
+	jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, div);
+	return 0;
+}
+
+static unsigned long jh7100_clk_frac_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	u32 reg = jh7100_clk_reg_get(clk);
+	unsigned long div100 = 100 * (reg & JH7100_CLK_INT_MASK) +
+			       ((reg & JH7100_CLK_FRAC_MASK) >> JH7100_CLK_FRAC_SHIFT);
+
+	return (div100 >= JH7100_CLK_FRAC_MIN) ? 100 * parent_rate / div100 : 0;
+}
+
+static int jh7100_clk_frac_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
+{
+	unsigned long parent100 = 100 * req->best_parent_rate;
+	unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
+	unsigned long div100 = clamp(DIV_ROUND_CLOSEST(parent100, rate),
+				     JH7100_CLK_FRAC_MIN, JH7100_CLK_FRAC_MAX);
+	unsigned long result = parent100 / div100;
+
+	/* clamp the result as in jh7100_clk_determine_rate() above */
+	if (result > req->max_rate && div100 < JH7100_CLK_FRAC_MAX)
+		result = parent100 / (div100 + 1);
+	if (result < req->min_rate && div100 > JH7100_CLK_FRAC_MIN)
+		result = parent100 / (div100 - 1);
+
+	req->rate = result;
+	return 0;
+}
+
+static int jh7100_clk_frac_set_rate(struct clk_hw *hw,
+				    unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	unsigned long div100 = clamp(DIV_ROUND_CLOSEST(100 * parent_rate, rate),
+				     JH7100_CLK_FRAC_MIN, JH7100_CLK_FRAC_MAX);
+	u32 value = ((div100 % 100) << JH7100_CLK_FRAC_SHIFT) | (div100 / 100);
+
+	jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, value);
+	return 0;
+}
+
+static u8 jh7100_clk_get_parent(struct clk_hw *hw)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	u32 value = jh7100_clk_reg_get(clk);
+
+	return (value & JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT;
+}
+
+static int jh7100_clk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	u32 value = (u32)index << JH7100_CLK_MUX_SHIFT;
+
+	jh7100_clk_reg_rmw(clk, JH7100_CLK_MUX_MASK, value);
+	return 0;
+}
+
+static int jh7100_clk_mux_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	return clk_mux_determine_rate_flags(hw, req, 0);
+}
+
+static int jh7100_clk_get_phase(struct clk_hw *hw)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	u32 value = jh7100_clk_reg_get(clk);
+
+	return (value & JH7100_CLK_INVERT) ? 180 : 0;
+}
+
+static int jh7100_clk_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	u32 value;
+
+	if (degrees == 0)
+		value = 0;
+	else if (degrees == 180)
+		value = JH7100_CLK_INVERT;
+	else
+		return -EINVAL;
+
+	jh7100_clk_reg_rmw(clk, JH7100_CLK_INVERT, value);
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void jh7100_clk_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	static const struct debugfs_reg32 jh7100_clk_reg = {
+		.name = "CTRL",
+		.offset = 0,
+	};
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
+	struct debugfs_regset32 *regset;
+
+	regset = devm_kzalloc(priv->dev, sizeof(*regset), GFP_KERNEL);
+	if (!regset)
+		return;
+
+	regset->regs = &jh7100_clk_reg;
+	regset->nregs = 1;
+	regset->base = priv->base + 4 * clk->idx;
+
+	debugfs_create_regset32("registers", 0400, dentry, regset);
+}
+#else
+#define jh7100_clk_debug_init NULL
+#endif
+
+static const struct clk_ops jh7100_clk_gate_ops = {
+	.enable = jh7100_clk_enable,
+	.disable = jh7100_clk_disable,
+	.is_enabled = jh7100_clk_is_enabled,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_div_ops = {
+	.recalc_rate = jh7100_clk_recalc_rate,
+	.determine_rate = jh7100_clk_determine_rate,
+	.set_rate = jh7100_clk_set_rate,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_fdiv_ops = {
+	.recalc_rate = jh7100_clk_frac_recalc_rate,
+	.determine_rate = jh7100_clk_frac_determine_rate,
+	.set_rate = jh7100_clk_frac_set_rate,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_gdiv_ops = {
+	.enable = jh7100_clk_enable,
+	.disable = jh7100_clk_disable,
+	.is_enabled = jh7100_clk_is_enabled,
+	.recalc_rate = jh7100_clk_recalc_rate,
+	.determine_rate = jh7100_clk_determine_rate,
+	.set_rate = jh7100_clk_set_rate,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_mux_ops = {
+	.determine_rate = jh7100_clk_mux_determine_rate,
+	.set_parent = jh7100_clk_set_parent,
+	.get_parent = jh7100_clk_get_parent,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_gmux_ops = {
+	.enable = jh7100_clk_enable,
+	.disable = jh7100_clk_disable,
+	.is_enabled = jh7100_clk_is_enabled,
+	.determine_rate = jh7100_clk_mux_determine_rate,
+	.set_parent = jh7100_clk_set_parent,
+	.get_parent = jh7100_clk_get_parent,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_mdiv_ops = {
+	.recalc_rate = jh7100_clk_recalc_rate,
+	.determine_rate = jh7100_clk_determine_rate,
+	.get_parent = jh7100_clk_get_parent,
+	.set_parent = jh7100_clk_set_parent,
+	.set_rate = jh7100_clk_set_rate,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_gmd_ops = {
+	.enable = jh7100_clk_enable,
+	.disable = jh7100_clk_disable,
+	.is_enabled = jh7100_clk_is_enabled,
+	.recalc_rate = jh7100_clk_recalc_rate,
+	.determine_rate = jh7100_clk_determine_rate,
+	.get_parent = jh7100_clk_get_parent,
+	.set_parent = jh7100_clk_set_parent,
+	.set_rate = jh7100_clk_set_rate,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_inv_ops = {
+	.get_phase = jh7100_clk_get_phase,
+	.set_phase = jh7100_clk_set_phase,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+const struct clk_ops *starfive_jh7100_clk_ops(u32 max)
+{
+	if (max & JH7100_CLK_DIV_MASK) {
+		if (max & JH7100_CLK_MUX_MASK) {
+			if (max & JH7100_CLK_ENABLE)
+				return &jh7100_clk_gmd_ops;
+			return &jh7100_clk_mdiv_ops;
+		}
+		if (max & JH7100_CLK_ENABLE)
+			return &jh7100_clk_gdiv_ops;
+		if (max == JH7100_CLK_FRAC_MAX)
+			return &jh7100_clk_fdiv_ops;
+		return &jh7100_clk_div_ops;
+	}
+
+	if (max & JH7100_CLK_MUX_MASK) {
+		if (max & JH7100_CLK_ENABLE)
+			return &jh7100_clk_gmux_ops;
+		return &jh7100_clk_mux_ops;
+	}
+
+	if (max & JH7100_CLK_ENABLE)
+		return &jh7100_clk_gate_ops;
+
+	return &jh7100_clk_inv_ops;
+}
+EXPORT_SYMBOL_GPL(starfive_jh7100_clk_ops);
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
