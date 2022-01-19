Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B411C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aE0ZfP1OumO7As4v8Mvuu7633c+jZ2ReZ7cCi42l6hk=; b=QFrPGsQF4fPXy1
	KH+WHJGEOiW0AbzTKqgjFGfk7ybgUnFGvnXORbUjkLiwsnQx6iV3DKVQCArgTATy8grg5UU/Wz9GM
	R7tAaKKwmDYfs5zSRBWi9JwFLPxx8VS4LoL91FEa9MHy5gtPMlUllrwQMEwXISWu2HQPno7TE4dOf
	yqhXXNNApr83/GOjfPLoIyWss1ODb9ipgQut3fzEPRus7gL2ikK+LKlfJ2dwpyRJxSAcDPH6vg1lj
	YqkyGsLgth7+IaJ/Tndj1+m/T3/4BJ2btNXv27mocAauzzKmovWNDHqMGSSnYNPRmxvF4sR5gmeWx
	88rSNG5v+3XSrY0ei7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA7H5-004Zah-IH; Wed, 19 Jan 2022 09:29:03 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA7H0-004ZWd-H8
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 09:29:01 +0000
Received: by mail-pf1-x42f.google.com with SMTP id i17so1997649pfk.11
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=180cyjRz+Y9+rOwCZ/fWUBjCQvnVUVC7b1b1X/dONts=;
 b=iPbsP82FmRznLy4gTSjHzhizg0qfrWchL2wpnC4bQt/DdyOE73RIyLkDshoXu8HxvI
 z6CpIv3IciEE1kNGHRWNclBsMm37UGGg7AK6NIC71XEKuaM+DdejU0saS951ByUvkCcA
 /WbhPI/t9q5AaIOU2SvNL7j8RUXQEJ10H2x8IUSlxNiQr2KTwkJZDHWAUk16yqprxf2X
 uY1z2zxWrEzx9PT04KGLSIrFG/ezC6poG0j2TjOil1kwHiFvHRLsSvMEs9XBzvX2JOar
 4Mq0bFG3G6inDkPTUhM/CYtnrbbLgf0HmY6cDEp9qdolMzAi+AqrVlG3z4n3vcFrop6o
 wavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=180cyjRz+Y9+rOwCZ/fWUBjCQvnVUVC7b1b1X/dONts=;
 b=PpPz9Ox0U4wki2ONK9yfDqXbRZwg9Xb16DA4qf044CFkvMeGoWZnymD3rVHf9xm3h8
 PLhdw2E3xDORGROGDaDOyksaMbRlXQzhJPCatkEvJzhYfkIWcEd/HVCLP4J1y6YfK357
 DD40JttGzl7PNFbz8q/kFit23hmFdemyrqugyHGoszNETdO19/vRWdO2GigK5vQAxubU
 Tj10YSB8JPx2kIJ1BXRBbeoaMCjNu2pl7CAIF2pLQR0QvnvpRj/J5nfg23MIF6Lr0S/N
 pI033fgY/WYqeZWuI43eioxZOe+U2f2UJp/LNmn0uAgzE4gnOrMGmtS+ime2tw9ydVJV
 x76w==
X-Gm-Message-State: AOAM532ZKo+X/lY+t8PsBHnxliIII20pL0Tf3ixI3GIDtmjfHGMZsnaP
 l/2yjzY++DpaA2DNaiQ1gOVBqQ==
X-Google-Smtp-Source: ABdhPJyBFMPVyaih6xzsH/uRKzZ3LYs5/ZwJEyECUWh4k3pJOZxT4zrHCoOs7R1HZJQzH1LdGPcabw==
X-Received: by 2002:a63:eb07:: with SMTP id t7mr26798287pgh.112.1642584537296; 
 Wed, 19 Jan 2022 01:28:57 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id y8sm1415894pfl.207.2022.01.19.01.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 01:28:56 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, lee.jones@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 4/4] clk: sifive: Move all stuff into SoCs header files from C
 files
Date: Wed, 19 Jan 2022 17:28:41 +0800
Message-Id: <70c9317814b06c7ce37688b158178b188d3fd604.1642582832.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1642582832.git.zong.li@sifive.com>
References: <cover.1642582832.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_012858_625441_D423EEAA 
X-CRM114-Status: GOOD (  18.84  )
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

Improve PRCI driver to reduce the complexity, we remove the SoCs C files
by putting all stuff in each SoCs header files, and include these
SoCs-specific header files in core of PRCI. It can also avoid the W=1
kernel build warnings about variable defined but not used
[-Wunused-const-variable=], like commit 487dc7bb6a0c ("clk: sifive:
fu540-prci: Declare static const variable 'prci_clk_fu540' where it's
used") does.

Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/sifive/Makefile      |   2 +-
 drivers/clk/sifive/fu540-prci.c  |  89 --------------------
 drivers/clk/sifive/fu540-prci.h  |  91 ++++++++++++++++++++-
 drivers/clk/sifive/fu740-prci.c  | 134 -------------------------------
 drivers/clk/sifive/fu740-prci.h  | 130 +++++++++++++++++++++++++++++-
 drivers/clk/sifive/sifive-prci.c |   5 --
 6 files changed, 214 insertions(+), 237 deletions(-)
 delete mode 100644 drivers/clk/sifive/fu540-prci.c
 delete mode 100644 drivers/clk/sifive/fu740-prci.c

diff --git a/drivers/clk/sifive/Makefile b/drivers/clk/sifive/Makefile
index 7b06fc04e6b3..efdf01f1c8d5 100644
--- a/drivers/clk/sifive/Makefile
+++ b/drivers/clk/sifive/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_CLK_SIFIVE_PRCI)	+= sifive-prci.o fu540-prci.o fu740-prci.o
+obj-$(CONFIG_CLK_SIFIVE_PRCI)	+= sifive-prci.o
diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
deleted file mode 100644
index d686f5cf3f71..000000000000
--- a/drivers/clk/sifive/fu540-prci.c
+++ /dev/null
@@ -1,89 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2018-2021 SiFive, Inc.
- * Copyright (C) 2018-2019 Wesley Terpstra
- * Copyright (C) 2018-2019 Paul Walmsley
- * Copyright (C) 2020-2021 Zong Li
- *
- * The FU540 PRCI implements clock and reset control for the SiFive
- * FU540-C000 chip.  This driver assumes that it has sole control
- * over all PRCI resources.
- *
- * This driver is based on the PRCI driver written by Wesley Terpstra:
- * https://github.com/riscv/riscv-linux/commit/999529edf517ed75b56659d456d221b2ee56bb60
- *
- * References:
- * - SiFive FU540-C000 manual v1p0, Chapter 7 "Clocking and Reset"
- */
-
-#include <linux/module.h>
-
-#include <dt-bindings/clock/sifive-fu540-prci.h>
-
-#include "fu540-prci.h"
-#include "sifive-prci.h"
-
-/* PRCI integration data for each WRPLL instance */
-
-static struct __prci_wrpll_data sifive_fu540_prci_corepll_data = {
-	.cfg0_offs = PRCI_COREPLLCFG0_OFFSET,
-	.cfg1_offs = PRCI_COREPLLCFG1_OFFSET,
-	.enable_bypass = sifive_prci_coreclksel_use_hfclk,
-	.disable_bypass = sifive_prci_coreclksel_use_corepll,
-};
-
-static struct __prci_wrpll_data sifive_fu540_prci_ddrpll_data = {
-	.cfg0_offs = PRCI_DDRPLLCFG0_OFFSET,
-	.cfg1_offs = PRCI_DDRPLLCFG1_OFFSET,
-};
-
-static struct __prci_wrpll_data sifive_fu540_prci_gemgxlpll_data = {
-	.cfg0_offs = PRCI_GEMGXLPLLCFG0_OFFSET,
-	.cfg1_offs = PRCI_GEMGXLPLLCFG1_OFFSET,
-};
-
-/* Linux clock framework integration */
-
-static const struct clk_ops sifive_fu540_prci_wrpll_clk_ops = {
-	.set_rate = sifive_prci_wrpll_set_rate,
-	.round_rate = sifive_prci_wrpll_round_rate,
-	.recalc_rate = sifive_prci_wrpll_recalc_rate,
-	.enable = sifive_prci_clock_enable,
-	.disable = sifive_prci_clock_disable,
-	.is_enabled = sifive_clk_is_enabled,
-};
-
-static const struct clk_ops sifive_fu540_prci_wrpll_ro_clk_ops = {
-	.recalc_rate = sifive_prci_wrpll_recalc_rate,
-};
-
-static const struct clk_ops sifive_fu540_prci_tlclksel_clk_ops = {
-	.recalc_rate = sifive_prci_tlclksel_recalc_rate,
-};
-
-/* List of clock controls provided by the PRCI */
-struct __prci_clock __prci_init_clocks_fu540[] = {
-	[FU540_PRCI_CLK_COREPLL] = {
-		.name = "corepll",
-		.parent_name = "hfclk",
-		.ops = &sifive_fu540_prci_wrpll_clk_ops,
-		.pwd = &sifive_fu540_prci_corepll_data,
-	},
-	[FU540_PRCI_CLK_DDRPLL] = {
-		.name = "ddrpll",
-		.parent_name = "hfclk",
-		.ops = &sifive_fu540_prci_wrpll_ro_clk_ops,
-		.pwd = &sifive_fu540_prci_ddrpll_data,
-	},
-	[FU540_PRCI_CLK_GEMGXLPLL] = {
-		.name = "gemgxlpll",
-		.parent_name = "hfclk",
-		.ops = &sifive_fu540_prci_wrpll_clk_ops,
-		.pwd = &sifive_fu540_prci_gemgxlpll_data,
-	},
-	[FU540_PRCI_CLK_TLCLK] = {
-		.name = "tlclk",
-		.parent_name = "corepll",
-		.ops = &sifive_fu540_prci_tlclksel_clk_ops,
-	},
-};
diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
index c220677dc010..e0173324f3c5 100644
--- a/drivers/clk/sifive/fu540-prci.h
+++ b/drivers/clk/sifive/fu540-prci.h
@@ -1,16 +1,99 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2020 SiFive, Inc.
- * Zong Li
+ * Copyright (C) 2018-2021 SiFive, Inc.
+ * Copyright (C) 2018-2019 Wesley Terpstra
+ * Copyright (C) 2018-2019 Paul Walmsley
+ * Copyright (C) 2020-2021 Zong Li
+ *
+ * The FU540 PRCI implements clock and reset control for the SiFive
+ * FU540-C000 chip.  This driver assumes that it has sole control
+ * over all PRCI resources.
+ *
+ * This driver is based on the PRCI driver written by Wesley Terpstra:
+ * https://github.com/riscv/riscv-linux/commit/999529edf517ed75b56659d456d221b2ee56bb60
+ *
+ * References:
+ * - SiFive FU540-C000 manual v1p0, Chapter 7 "Clocking and Reset"
  */
 
 #ifndef __SIFIVE_CLK_FU540_PRCI_H
 #define __SIFIVE_CLK_FU540_PRCI_H
 
+
+#include <linux/module.h>
+
+#include <dt-bindings/clock/sifive-fu540-prci.h>
+
 #include "sifive-prci.h"
 
-#define NUM_CLOCK_FU540	4
+/* PRCI integration data for each WRPLL instance */
+
+static struct __prci_wrpll_data sifive_fu540_prci_corepll_data = {
+	.cfg0_offs = PRCI_COREPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_COREPLLCFG1_OFFSET,
+	.enable_bypass = sifive_prci_coreclksel_use_hfclk,
+	.disable_bypass = sifive_prci_coreclksel_use_corepll,
+};
+
+static struct __prci_wrpll_data sifive_fu540_prci_ddrpll_data = {
+	.cfg0_offs = PRCI_DDRPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_DDRPLLCFG1_OFFSET,
+};
+
+static struct __prci_wrpll_data sifive_fu540_prci_gemgxlpll_data = {
+	.cfg0_offs = PRCI_GEMGXLPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_GEMGXLPLLCFG1_OFFSET,
+};
+
+/* Linux clock framework integration */
+
+static const struct clk_ops sifive_fu540_prci_wrpll_clk_ops = {
+	.set_rate = sifive_prci_wrpll_set_rate,
+	.round_rate = sifive_prci_wrpll_round_rate,
+	.recalc_rate = sifive_prci_wrpll_recalc_rate,
+	.enable = sifive_prci_clock_enable,
+	.disable = sifive_prci_clock_disable,
+	.is_enabled = sifive_clk_is_enabled,
+};
+
+static const struct clk_ops sifive_fu540_prci_wrpll_ro_clk_ops = {
+	.recalc_rate = sifive_prci_wrpll_recalc_rate,
+};
+
+static const struct clk_ops sifive_fu540_prci_tlclksel_clk_ops = {
+	.recalc_rate = sifive_prci_tlclksel_recalc_rate,
+};
+
+/* List of clock controls provided by the PRCI */
+static struct __prci_clock __prci_init_clocks_fu540[] = {
+	[FU540_PRCI_CLK_COREPLL] = {
+		.name = "corepll",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu540_prci_wrpll_clk_ops,
+		.pwd = &sifive_fu540_prci_corepll_data,
+	},
+	[FU540_PRCI_CLK_DDRPLL] = {
+		.name = "ddrpll",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu540_prci_wrpll_ro_clk_ops,
+		.pwd = &sifive_fu540_prci_ddrpll_data,
+	},
+	[FU540_PRCI_CLK_GEMGXLPLL] = {
+		.name = "gemgxlpll",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu540_prci_wrpll_clk_ops,
+		.pwd = &sifive_fu540_prci_gemgxlpll_data,
+	},
+	[FU540_PRCI_CLK_TLCLK] = {
+		.name = "tlclk",
+		.parent_name = "corepll",
+		.ops = &sifive_fu540_prci_tlclksel_clk_ops,
+	},
+};
 
-extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
+static const struct prci_clk_desc prci_clk_fu540 = {
+	.clks = __prci_init_clocks_fu540,
+	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
+};
 
 #endif /* __SIFIVE_CLK_FU540_PRCI_H */
diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
deleted file mode 100644
index bd66559fe2f8..000000000000
--- a/drivers/clk/sifive/fu740-prci.c
+++ /dev/null
@@ -1,134 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2020-2021 SiFive, Inc.
- * Copyright (C) 2020-2021 Zong Li
- */
-
-#include <linux/module.h>
-
-#include <dt-bindings/clock/sifive-fu740-prci.h>
-
-#include "fu540-prci.h"
-#include "sifive-prci.h"
-
-/* PRCI integration data for each WRPLL instance */
-
-static struct __prci_wrpll_data sifive_fu740_prci_corepll_data = {
-	.cfg0_offs = PRCI_COREPLLCFG0_OFFSET,
-	.cfg1_offs = PRCI_COREPLLCFG1_OFFSET,
-	.enable_bypass = sifive_prci_coreclksel_use_hfclk,
-	.disable_bypass = sifive_prci_coreclksel_use_final_corepll,
-};
-
-static struct __prci_wrpll_data sifive_fu740_prci_ddrpll_data = {
-	.cfg0_offs = PRCI_DDRPLLCFG0_OFFSET,
-	.cfg1_offs = PRCI_DDRPLLCFG1_OFFSET,
-};
-
-static struct __prci_wrpll_data sifive_fu740_prci_gemgxlpll_data = {
-	.cfg0_offs = PRCI_GEMGXLPLLCFG0_OFFSET,
-	.cfg1_offs = PRCI_GEMGXLPLLCFG1_OFFSET,
-};
-
-static struct __prci_wrpll_data sifive_fu740_prci_dvfscorepll_data = {
-	.cfg0_offs = PRCI_DVFSCOREPLLCFG0_OFFSET,
-	.cfg1_offs = PRCI_DVFSCOREPLLCFG1_OFFSET,
-	.enable_bypass = sifive_prci_corepllsel_use_corepll,
-	.disable_bypass = sifive_prci_corepllsel_use_dvfscorepll,
-};
-
-static struct __prci_wrpll_data sifive_fu740_prci_hfpclkpll_data = {
-	.cfg0_offs = PRCI_HFPCLKPLLCFG0_OFFSET,
-	.cfg1_offs = PRCI_HFPCLKPLLCFG1_OFFSET,
-	.enable_bypass = sifive_prci_hfpclkpllsel_use_hfclk,
-	.disable_bypass = sifive_prci_hfpclkpllsel_use_hfpclkpll,
-};
-
-static struct __prci_wrpll_data sifive_fu740_prci_cltxpll_data = {
-	.cfg0_offs = PRCI_CLTXPLLCFG0_OFFSET,
-	.cfg1_offs = PRCI_CLTXPLLCFG1_OFFSET,
-};
-
-/* Linux clock framework integration */
-
-static const struct clk_ops sifive_fu740_prci_wrpll_clk_ops = {
-	.set_rate = sifive_prci_wrpll_set_rate,
-	.round_rate = sifive_prci_wrpll_round_rate,
-	.recalc_rate = sifive_prci_wrpll_recalc_rate,
-	.enable = sifive_prci_clock_enable,
-	.disable = sifive_prci_clock_disable,
-	.is_enabled = sifive_clk_is_enabled,
-};
-
-static const struct clk_ops sifive_fu740_prci_wrpll_ro_clk_ops = {
-	.recalc_rate = sifive_prci_wrpll_recalc_rate,
-};
-
-static const struct clk_ops sifive_fu740_prci_tlclksel_clk_ops = {
-	.recalc_rate = sifive_prci_tlclksel_recalc_rate,
-};
-
-static const struct clk_ops sifive_fu740_prci_hfpclkplldiv_clk_ops = {
-	.recalc_rate = sifive_prci_hfpclkplldiv_recalc_rate,
-};
-
-static const struct clk_ops sifive_fu740_prci_pcie_aux_clk_ops = {
-	.enable = sifive_prci_pcie_aux_clock_enable,
-	.disable = sifive_prci_pcie_aux_clock_disable,
-	.is_enabled = sifive_prci_pcie_aux_clock_is_enabled,
-};
-
-/* List of clock controls provided by the PRCI */
-struct __prci_clock __prci_init_clocks_fu740[] = {
-	[FU740_PRCI_CLK_COREPLL] = {
-		.name = "corepll",
-		.parent_name = "hfclk",
-		.ops = &sifive_fu740_prci_wrpll_clk_ops,
-		.pwd = &sifive_fu740_prci_corepll_data,
-	},
-	[FU740_PRCI_CLK_DDRPLL] = {
-		.name = "ddrpll",
-		.parent_name = "hfclk",
-		.ops = &sifive_fu740_prci_wrpll_ro_clk_ops,
-		.pwd = &sifive_fu740_prci_ddrpll_data,
-	},
-	[FU740_PRCI_CLK_GEMGXLPLL] = {
-		.name = "gemgxlpll",
-		.parent_name = "hfclk",
-		.ops = &sifive_fu740_prci_wrpll_clk_ops,
-		.pwd = &sifive_fu740_prci_gemgxlpll_data,
-	},
-	[FU740_PRCI_CLK_DVFSCOREPLL] = {
-		.name = "dvfscorepll",
-		.parent_name = "hfclk",
-		.ops = &sifive_fu740_prci_wrpll_clk_ops,
-		.pwd = &sifive_fu740_prci_dvfscorepll_data,
-	},
-	[FU740_PRCI_CLK_HFPCLKPLL] = {
-		.name = "hfpclkpll",
-		.parent_name = "hfclk",
-		.ops = &sifive_fu740_prci_wrpll_clk_ops,
-		.pwd = &sifive_fu740_prci_hfpclkpll_data,
-	},
-	[FU740_PRCI_CLK_CLTXPLL] = {
-		.name = "cltxpll",
-		.parent_name = "hfclk",
-		.ops = &sifive_fu740_prci_wrpll_clk_ops,
-		.pwd = &sifive_fu740_prci_cltxpll_data,
-	},
-	[FU740_PRCI_CLK_TLCLK] = {
-		.name = "tlclk",
-		.parent_name = "corepll",
-		.ops = &sifive_fu740_prci_tlclksel_clk_ops,
-	},
-	[FU740_PRCI_CLK_PCLK] = {
-		.name = "pclk",
-		.parent_name = "hfpclkpll",
-		.ops = &sifive_fu740_prci_hfpclkplldiv_clk_ops,
-	},
-	[FU740_PRCI_CLK_PCIE_AUX] = {
-		.name = "pcie_aux",
-		.parent_name = "hfclk",
-		.ops = &sifive_fu740_prci_pcie_aux_clk_ops,
-	},
-};
diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-prci.h
index 511a0bf7ba2b..f31cd30fc395 100644
--- a/drivers/clk/sifive/fu740-prci.h
+++ b/drivers/clk/sifive/fu740-prci.h
@@ -1,17 +1,139 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2020 SiFive, Inc.
- * Zong Li
+ * Copyright (C) 2020-2021 SiFive, Inc.
+ * Copyright (C) 2020-2021 Zong Li
  */
 
 #ifndef __SIFIVE_CLK_FU740_PRCI_H
 #define __SIFIVE_CLK_FU740_PRCI_H
 
+#include <linux/module.h>
+
+#include <dt-bindings/clock/sifive-fu740-prci.h>
+
 #include "sifive-prci.h"
 
-#define NUM_CLOCK_FU740	9
+/* PRCI integration data for each WRPLL instance */
+
+static struct __prci_wrpll_data sifive_fu740_prci_corepll_data = {
+	.cfg0_offs = PRCI_COREPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_COREPLLCFG1_OFFSET,
+	.enable_bypass = sifive_prci_coreclksel_use_hfclk,
+	.disable_bypass = sifive_prci_coreclksel_use_final_corepll,
+};
+
+static struct __prci_wrpll_data sifive_fu740_prci_ddrpll_data = {
+	.cfg0_offs = PRCI_DDRPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_DDRPLLCFG1_OFFSET,
+};
+
+static struct __prci_wrpll_data sifive_fu740_prci_gemgxlpll_data = {
+	.cfg0_offs = PRCI_GEMGXLPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_GEMGXLPLLCFG1_OFFSET,
+};
+
+static struct __prci_wrpll_data sifive_fu740_prci_dvfscorepll_data = {
+	.cfg0_offs = PRCI_DVFSCOREPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_DVFSCOREPLLCFG1_OFFSET,
+	.enable_bypass = sifive_prci_corepllsel_use_corepll,
+	.disable_bypass = sifive_prci_corepllsel_use_dvfscorepll,
+};
+
+static struct __prci_wrpll_data sifive_fu740_prci_hfpclkpll_data = {
+	.cfg0_offs = PRCI_HFPCLKPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_HFPCLKPLLCFG1_OFFSET,
+	.enable_bypass = sifive_prci_hfpclkpllsel_use_hfclk,
+	.disable_bypass = sifive_prci_hfpclkpllsel_use_hfpclkpll,
+};
+
+static struct __prci_wrpll_data sifive_fu740_prci_cltxpll_data = {
+	.cfg0_offs = PRCI_CLTXPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_CLTXPLLCFG1_OFFSET,
+};
+
+/* Linux clock framework integration */
+
+static const struct clk_ops sifive_fu740_prci_wrpll_clk_ops = {
+	.set_rate = sifive_prci_wrpll_set_rate,
+	.round_rate = sifive_prci_wrpll_round_rate,
+	.recalc_rate = sifive_prci_wrpll_recalc_rate,
+	.enable = sifive_prci_clock_enable,
+	.disable = sifive_prci_clock_disable,
+	.is_enabled = sifive_clk_is_enabled,
+};
 
-extern struct __prci_clock __prci_init_clocks_fu740[NUM_CLOCK_FU740];
+static const struct clk_ops sifive_fu740_prci_wrpll_ro_clk_ops = {
+	.recalc_rate = sifive_prci_wrpll_recalc_rate,
+};
+
+static const struct clk_ops sifive_fu740_prci_tlclksel_clk_ops = {
+	.recalc_rate = sifive_prci_tlclksel_recalc_rate,
+};
+
+static const struct clk_ops sifive_fu740_prci_hfpclkplldiv_clk_ops = {
+	.recalc_rate = sifive_prci_hfpclkplldiv_recalc_rate,
+};
+
+static const struct clk_ops sifive_fu740_prci_pcie_aux_clk_ops = {
+	.enable = sifive_prci_pcie_aux_clock_enable,
+	.disable = sifive_prci_pcie_aux_clock_disable,
+	.is_enabled = sifive_prci_pcie_aux_clock_is_enabled,
+};
+
+/* List of clock controls provided by the PRCI */
+static struct __prci_clock __prci_init_clocks_fu740[] = {
+	[FU740_PRCI_CLK_COREPLL] = {
+		.name = "corepll",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu740_prci_wrpll_clk_ops,
+		.pwd = &sifive_fu740_prci_corepll_data,
+	},
+	[FU740_PRCI_CLK_DDRPLL] = {
+		.name = "ddrpll",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu740_prci_wrpll_ro_clk_ops,
+		.pwd = &sifive_fu740_prci_ddrpll_data,
+	},
+	[FU740_PRCI_CLK_GEMGXLPLL] = {
+		.name = "gemgxlpll",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu740_prci_wrpll_clk_ops,
+		.pwd = &sifive_fu740_prci_gemgxlpll_data,
+	},
+	[FU740_PRCI_CLK_DVFSCOREPLL] = {
+		.name = "dvfscorepll",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu740_prci_wrpll_clk_ops,
+		.pwd = &sifive_fu740_prci_dvfscorepll_data,
+	},
+	[FU740_PRCI_CLK_HFPCLKPLL] = {
+		.name = "hfpclkpll",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu740_prci_wrpll_clk_ops,
+		.pwd = &sifive_fu740_prci_hfpclkpll_data,
+	},
+	[FU740_PRCI_CLK_CLTXPLL] = {
+		.name = "cltxpll",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu740_prci_wrpll_clk_ops,
+		.pwd = &sifive_fu740_prci_cltxpll_data,
+	},
+	[FU740_PRCI_CLK_TLCLK] = {
+		.name = "tlclk",
+		.parent_name = "corepll",
+		.ops = &sifive_fu740_prci_tlclksel_clk_ops,
+	},
+	[FU740_PRCI_CLK_PCLK] = {
+		.name = "pclk",
+		.parent_name = "hfpclkpll",
+		.ops = &sifive_fu740_prci_hfpclkplldiv_clk_ops,
+	},
+	[FU740_PRCI_CLK_PCIE_AUX] = {
+		.name = "pcie_aux",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu740_prci_pcie_aux_clk_ops,
+	},
+};
 
 static const struct prci_clk_desc prci_clk_fu740 = {
 	.clks = __prci_init_clocks_fu740,
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index 80a288c59e56..916d2fc28b9c 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -12,11 +12,6 @@
 #include "fu540-prci.h"
 #include "fu740-prci.h"
 
-static const struct prci_clk_desc prci_clk_fu540 = {
-	.clks = __prci_init_clocks_fu540,
-	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
-};
-
 /*
  * Private functions
  */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
