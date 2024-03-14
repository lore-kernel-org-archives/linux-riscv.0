Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8488EC5475B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 11:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lQTvKrOvOgFXhV2nxduqbbrnZF9jIqKBrLODgsuLTsY=; b=0D+Ar5byO3SWD0
	ZIyrXl346XmryZJSXqpUOKM2YulEvz+/f0SQonR7f5rOtplcKJI/i2lPTxXqX/6Qfw826yHpgqEQy
	4Z7FGtOnuf0fi/iTnAsywAMmMcfRoloz8dkYLAPTE6keK/3a6kn8QWXQlt/UBVmBmKi2UYio7nemk
	N7XxUU+HRNBDlMMKZLuRO0+C2VfvRW6GtWpw7K3/mKNVZGAUeUQ4wByTZz+q/xd02tNu9SwEoHFg8
	QNwp5EakAmKo8XesHHeMMNUIK5Y6sIUl6FjuQY4cssGGRcqlCC5DpLsKC7FCBbcwt+DTXKsrfsntt
	kw4IeFkl18n03q1XbC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkitx-0000000E0gZ-10qA;
	Thu, 14 Mar 2024 11:05:33 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkitt-0000000E0eu-2e04
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 11:05:31 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by laurent.telenet-ops.be with bizsmtp
	id yb5G2B00R0SSLxL01b5GhH; Thu, 14 Mar 2024 12:05:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rkitO-003gBz-Tu;
	Thu, 14 Mar 2024 12:05:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rkitg-00F90v-Fj;
	Thu, 14 Mar 2024 12:05:16 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] clk: starfive: jh7100: Use provided clocks instead of hardcoded names
Date: Thu, 14 Mar 2024 12:05:13 +0100
Message-Id: <898aa0925a9598d44721d00145015b215434cb3b.1710414195.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_040529_839466_69FB35C5 
X-CRM114-Status: GOOD (  15.97  )
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

The Starfive JH7100 clock driver does not use the DT "clocks" property
to find its external input clocks, but instead relies on the names of
the actual external clock providers.  This is fragile, and caused
breakage when sanitizing clock names in DT.

Fix this by obtaining the external input clocks through the DT "clocks"
property, and using their clk_hw objects or corresponding name.

Fixes: f03606470886 ("riscv: dts: starfive: replace underscores in node names")
Fixes: 4210be668a09ee20 ("clk: starfive: Add JH7100 clock generator driver")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
After this is applied, the workaround in commit 7921e231f85a349d
("riscv: dts: starfive: jh7100: fix root clock names") can be reverted.
---
 drivers/clk/starfive/clk-starfive-jh7100.c | 47 +++++++++++++++-------
 drivers/clk/starfive/clk-starfive-jh71x0.h |  1 +
 2 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
index 0342db24c27e10df..08e6f03f2cfc36c1 100644
--- a/drivers/clk/starfive/clk-starfive-jh7100.c
+++ b/drivers/clk/starfive/clk-starfive-jh7100.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -18,10 +19,18 @@
 #include "clk-starfive-jh71x0.h"
 
 /* external clocks */
-#define JH7100_CLK_OSC_SYS		(JH7100_CLK_END + 0)
-#define JH7100_CLK_OSC_AUD		(JH7100_CLK_END + 1)
-#define JH7100_CLK_GMAC_RMII_REF	(JH7100_CLK_END + 2)
-#define JH7100_CLK_GMAC_GR_MII_RX	(JH7100_CLK_END + 3)
+enum {
+	EXT_CLK_OSC_SYS,
+	EXT_CLK_OSC_AUD,
+	EXT_CLK_GMAC_RMII_REF,
+	EXT_CLK_GMAC_GR_MII_RX,
+	EXT_NUM_CLKS
+};
+
+#define JH7100_CLK_OSC_SYS		(JH7100_CLK_END + EXT_CLK_OSC_SYS)
+#define JH7100_CLK_OSC_AUD		(JH7100_CLK_END + EXT_CLK_OSC_AUD)
+#define JH7100_CLK_GMAC_RMII_REF	(JH7100_CLK_END + EXT_CLK_GMAC_RMII_REF)
+#define JH7100_CLK_GMAC_GR_MII_RX	(JH7100_CLK_END + EXT_CLK_GMAC_GR_MII_RX)
 
 static const struct jh71x0_clk_data jh7100_clk_data[] __initconst = {
 	JH71X0__MUX(JH7100_CLK_CPUNDBUS_ROOT, "cpundbus_root", 0, 4,
@@ -284,8 +293,12 @@ static struct clk_hw *jh7100_clk_get(struct of_phandle_args *clkspec, void *data
 
 static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
 {
+	static const char *jh7100_ext_clk[EXT_NUM_CLKS] =
+		{ "osc_sys", "osc_aud", "gmac_rmii_ref", "gmac_gr_mii_rxclk" };
 	struct jh71x0_clk_priv *priv;
+	const char *osc_sys;
 	unsigned int idx;
+	struct clk *clk;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, JH7100_CLK_PLL0_OUT), GFP_KERNEL);
@@ -298,13 +311,23 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	for (idx = 0; idx < EXT_NUM_CLKS; idx++) {
+		clk = devm_clk_get(&pdev->dev, jh7100_ext_clk[idx]);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+
+		priv->ext[idx] = __clk_get_hw(clk);
+	}
+
+	osc_sys = clk_hw_get_name(priv->ext[EXT_CLK_OSC_SYS]);
+
 	priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
-							 "osc_sys", 0, 40, 1);
+							 osc_sys, 0, 40, 1);
 	if (IS_ERR(priv->pll[0]))
 		return PTR_ERR(priv->pll[0]);
 
 	priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
-							 "osc_sys", 0, 64, 1);
+							 osc_sys, 0, 64, 1);
 	if (IS_ERR(priv->pll[1]))
 		return PTR_ERR(priv->pll[1]);
 
@@ -331,16 +354,10 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
 
 			if (pidx < JH7100_CLK_PLL0_OUT)
 				parents[i].hw = &priv->reg[pidx].hw;
-			else if (pidx < JH7100_CLK_END)
+			else if (pidx < JH7100_CLK_OSC_SYS)
 				parents[i].hw = priv->pll[pidx - JH7100_CLK_PLL0_OUT];
-			else if (pidx == JH7100_CLK_OSC_SYS)
-				parents[i].fw_name = "osc_sys";
-			else if (pidx == JH7100_CLK_OSC_AUD)
-				parents[i].fw_name = "osc_aud";
-			else if (pidx == JH7100_CLK_GMAC_RMII_REF)
-				parents[i].fw_name = "gmac_rmii_ref";
-			else if (pidx == JH7100_CLK_GMAC_GR_MII_RX)
-				parents[i].fw_name = "gmac_gr_mii_rxclk";
+			else if (pidx <= JH7100_CLK_GMAC_GR_MII_RX)
+				parents[i].hw = priv->ext[pidx - JH7100_CLK_OSC_SYS];
 		}
 
 		clk->hw.init = &init;
diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
index 23e052fc15495c41..4f46939179cd7418 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.h
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
@@ -115,6 +115,7 @@ struct jh71x0_clk_priv {
 	struct device *dev;
 	void __iomem *base;
 	struct clk_hw *pll[3];
+	struct clk_hw *ext[4];
 	struct jh71x0_clk reg[];
 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
