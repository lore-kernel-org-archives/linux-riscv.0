Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1001C001B1
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 06:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+eKRaV1T332ZrM2t/K3GH+POVXE9g+oGCDHwdSnhVY=; b=m91eUhTWIlqxyR
	TxA9IvLhepSUZ90xVQgffYc98RP2MUiom9U6FuCHdS+AQak3WqoyX81ZIeVbu3bsryIkTyMxkDdeD
	8h+Ad+Z7deBs8ATL2LWiYMKU41HICIqdkQQLLUwHKkPhGZg6BazRnTDCEwzcW0Iv0whN85Qj2xhaZ
	dpnOqfMBU24W2khbKRgJy9BAhVXGk3VQQAwrywH7typT4UZ4nStXTPW18mWNu3l7PxYuorGutB6Z9
	lBSLabYQ+opHZ5ygzegBA2FCHrhlsXcPZYYT4PEk0hmW1jMM0ilusLukLzm7NIaeGfRxksoJgxezV
	9FbQZnTbeC3zyzpQGhzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZrD-00CMCR-0B;
	Tue, 04 Jul 2023 06:49:51 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZr6-00CM6g-0k
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 06:49:48 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1983D8159;
	Tue,  4 Jul 2023 14:49:20 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 14:49:20 +0800
Received: from localhost.localdomain (113.72.144.31) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 14:49:18 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, "William
 Qiu" <william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [RESEND PATCH v6 5/7] clk: starfive: jh7110-sys: Add PLL clocks source from DTS
Date: Tue, 4 Jul 2023 14:46:08 +0800
Message-ID: <20230704064610.292603-6-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.31]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_234944_631326_040EAEA8 
X-CRM114-Status: GOOD (  17.42  )
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

Modify PLL clocks source to be got from DTS or
the fixed factor clocks.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  1 +
 .../clk/starfive/clk-starfive-jh7110-sys.c    | 45 +++++++++++--------
 2 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 5195f7be5213..978b78ec08b1 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -35,6 +35,7 @@ config CLK_STARFIVE_JH7110_SYS
 	select AUXILIARY_BUS
 	select CLK_STARFIVE_JH71X0
 	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
+	select CLK_STARFIVE_JH7110_PLL
 	default ARCH_STARFIVE
 	help
 	  Say yes here to support the system clock controller on the
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index e6031345ef05..d56f48013388 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -386,6 +387,7 @@ EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
 
 static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 {
+	bool use_fixed_pll = true;	/* PLL clocks use fixed factor clocks or PLL driver */
 	struct jh71x0_clk_priv *priv;
 	unsigned int idx;
 	int ret;
@@ -402,28 +404,29 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	/*
-	 * These PLL clocks are not actually fixed factor clocks and can be
-	 * controlled by the syscon registers of JH7110. They will be dropped
-	 * and registered in the PLL clock driver instead.
-	 */
+	if (!IS_ERR(devm_clk_get(priv->dev, "pll0_out")))
+		use_fixed_pll = false;	/* can get pll clocks from PLL driver */
+
+	/* Use fixed factor clocks if can not get the PLL clocks from DTS */
+	if (use_fixed_pll) {
 	/* 24MHz -> 1000.0MHz */
-	priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
-							 "osc", 0, 125, 3);
-	if (IS_ERR(priv->pll[0]))
-		return PTR_ERR(priv->pll[0]);
+		priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
+								 "osc", 0, 125, 3);
+		if (IS_ERR(priv->pll[0]))
+			return PTR_ERR(priv->pll[0]);
 
 	/* 24MHz -> 1066.0MHz */
-	priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
-							 "osc", 0, 533, 12);
-	if (IS_ERR(priv->pll[1]))
-		return PTR_ERR(priv->pll[1]);
+		priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
+								 "osc", 0, 533, 12);
+		if (IS_ERR(priv->pll[1]))
+			return PTR_ERR(priv->pll[1]);
 
 	/* 24MHz -> 1188.0MHz */
-	priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
-							 "osc", 0, 99, 2);
-	if (IS_ERR(priv->pll[2]))
-		return PTR_ERR(priv->pll[2]);
+		priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
+								 "osc", 0, 99, 2);
+		if (IS_ERR(priv->pll[2]))
+			return PTR_ERR(priv->pll[2]);
+	}
 
 	for (idx = 0; idx < JH7110_SYSCLK_END; idx++) {
 		u32 max = jh7110_sysclk_data[idx].max;
@@ -462,8 +465,14 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 				parents[i].fw_name = "tdm_ext";
 			else if (pidx == JH7110_SYSCLK_MCLK_EXT)
 				parents[i].fw_name = "mclk_ext";
-			else
+			else if (use_fixed_pll)
 				parents[i].hw = priv->pll[pidx - JH7110_SYSCLK_PLL0_OUT];
+			else if (pidx == JH7110_SYSCLK_PLL0_OUT)
+				parents[i].fw_name = "pll0_out";
+			else if (pidx == JH7110_SYSCLK_PLL1_OUT)
+				parents[i].fw_name = "pll1_out";
+			else if (pidx == JH7110_SYSCLK_PLL2_OUT)
+				parents[i].fw_name = "pll2_out";
 		}
 
 		clk->hw.init = &init;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
