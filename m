Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF60C7618D
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 03:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XhCHfW/+z3YlGDJ309PS7LGjaldKxGtcdiuHXWfPDuY=; b=e1iv4SgXjFLdMC
	A3T79daxvYujj4x4UAZC6LgvcDW5u/2WFP2DkAURSPLaiwzVA7o82TYpXETVKUKoCJphlDq4VyFgm
	hVfnvOd4+S7aa404GbfmFhPdwrBpx0HDEhgqnx9jUPxzOgK9WYvs/yfGFISvEGgCzJJYvuk91OJcS
	bN+jdtUa7hmy8y4fjjEsIac1tR2IXZegx8id08tnUGaqobAkjo9r1akHfhuV/efq59X3tGqw2dP8X
	PW4jhA9NkaSB8wEA3NdMfz8M4MS7elB5JLGek28vXHNUWykPhLA/RU16ebD+48gu1L0iHKDy84rc1
	PU5wSEEq1Gt0eGyzq5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdw6-00F3IW-1e;
	Thu, 16 Mar 2023 03:05:50 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdvz-00F3B4-20
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 03:05:46 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 21D6824E2AB;
	Thu, 16 Mar 2023 11:05:21 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 11:05:21 +0800
Received: from localhost.localdomain (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 11:05:19 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v2 5/6] clk: starfive: jh7110-sys: Modify PLL clocks source
Date: Thu, 16 Mar 2023 11:05:13 +0800
Message-ID: <20230316030514.137427-6-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_200543_955794_94770175 
X-CRM114-Status: GOOD (  14.30  )
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

Modify PLL clocks source to be got from dts instead of
the fixed factor clocks.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  1 +
 .../clk/starfive/clk-starfive-jh7110-sys.c    | 35 ++++---------------
 2 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index e306edf4defa..903a5097c642 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -35,6 +35,7 @@ config CLK_STARFIVE_JH7110_SYS
 	select AUXILIARY_BUS
 	select CLK_STARFIVE_JH71X0
 	select RESET_STARFIVE_JH7110
+	select CLK_STARFIVE_JH7110_PLL
 	default ARCH_STARFIVE
 	help
 	  Say yes here to support the system clock controller on the
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index b90d8035ba18..4bd8ff5ff912 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -329,9 +329,6 @@ static struct clk_hw *jh7110_sysclk_get(struct of_phandle_args *clkspec, void *d
 	if (idx < JH7110_SYSCLK_END)
 		return &priv->reg[idx].hw;
 
-	if (idx >= JH7110_SYSCLK_PLL0_OUT && idx <= JH7110_SYSCLK_PLL2_OUT)
-		return priv->pll[idx - JH7110_SYSCLK_PLL0_OUT];
-
 	return ERR_PTR(-EINVAL);
 }
 
@@ -355,29 +352,6 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(priv->dev, (void *)(&priv->base));
 
-	/*
-	 * These PLL clocks are not actually fixed factor clocks and can be
-	 * controlled by the syscon registers of JH7110. They will be dropped
-	 * and registered in the PLL clock driver instead.
-	 */
-	/* 24MHz -> 1000.0MHz */
-	priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
-							 "osc", 0, 125, 3);
-	if (IS_ERR(priv->pll[0]))
-		return PTR_ERR(priv->pll[0]);
-
-	/* 24MHz -> 1066.0MHz */
-	priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
-							 "osc", 0, 533, 12);
-	if (IS_ERR(priv->pll[1]))
-		return PTR_ERR(priv->pll[1]);
-
-	/* 24MHz -> 1188.0MHz */
-	priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
-							 "osc", 0, 99, 2);
-	if (IS_ERR(priv->pll[2]))
-		return PTR_ERR(priv->pll[2]);
-
 	for (idx = 0; idx < JH7110_SYSCLK_END; idx++) {
 		u32 max = jh7110_sysclk_data[idx].max;
 		struct clk_parent_data parents[4] = {};
@@ -415,9 +389,12 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 				parents[i].fw_name = "tdm_ext";
 			else if (pidx == JH7110_SYSCLK_MCLK_EXT)
 				parents[i].fw_name = "mclk_ext";
-			else if (pidx >= JH7110_SYSCLK_PLL0_OUT &&
-				 pidx <= JH7110_SYSCLK_PLL2_OUT)
-				parents[i].hw = priv->pll[pidx - JH7110_SYSCLK_PLL0_OUT];
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
