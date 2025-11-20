Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4C9CF8854
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 13:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSvU8nW87KBqb4wKhn45KJ+d5qM7Jez0MZOr9/YOq0Q=; b=QTBvPVtV1zuf2l
	IezrI121a5cc1UBLJF+vN3rji0gPkfr5zoyITGPXbsgKy9PnLgnrj1TLCrcX1sbfG9XPuOtlNlDai
	EjigUep7QuQTmu5dLj0pXHKRzaGfApVokmNQzijhnESIP6/YbZl7glcBiLT5tqFVuomWcNk63gjx3
	o1HMtJ2XcG/x+LWw7C5RB4rVO9V4rKxxaefi6RlzAI4HSCXcWeT22/IPk8lAQ9gaYHZ8pMXRUyi/g
	gEYxBujG7XwWb9NLYXF0hz2oqnEDp9lkWCu7Bl/Q0o4RNC3F8XbnfK8IChvvVxzOMovHvhi8SHcwS
	Z11WqhRmCDeYAyZ2tC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Vp-00000006htE-3iwa;
	Thu, 20 Nov 2025 13:15:49 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Vn-00000006hrU-3ZQT
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 13:15:49 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AD35722FD2;
	Thu, 20 Nov 2025 14:15:45 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPPvRQRZVFl5; Thu, 20 Nov 2025 14:15:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644545; bh=ryFSKJJYAQEuIhfDnfaPdlN0e3PPj9IXfbwSk6AoBpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TGDzjodrR1emmTiX70eqbr3bcJW1Dwk36Jx9wAgiBJSGlG75bylJyWlsdIHNbtj2z
	 TA/DIhStw85lnIpe/4b1BTjQgOssV9wlI+9des4yRYZmUkOASnHkcNM8BcLOWjrQaY
	 YATCb1NZZXQNm+3ttq2OH/rioX20txzZoJe4kEnO0qRp4AR31Dx8dXv/ZqR+llPGxu
	 3ksyOsprr39MOGZRbNYR0kz1Pvbei43gEhyEYU/CtvGk3LfHSSr2/qjUpaN5Z1ot2P
	 HCiS4TBtaJiDGbk+r35++gPTSSPyuztCdvE/j/PX+kjgz/rXwHdXN1deu6ujZLeogc
	 UiLSfUGGUvoxw==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 3/7] clk: thead: th1520-ap: Add C910 bus clock
Date: Thu, 20 Nov 2025 13:14:12 +0000
Message-ID: <20251120131416.26236-4-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_051548_019677_E9AE9D14 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

This divider takes c910_clk as parent and is essential for the C910
cluster to operate, thus is marked as CLK_IS_CRITICAL.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index d870f0c665f8..b820d47387bb 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -539,6 +539,20 @@ static struct ccu_mux c910_clk = {
 	.mux	= TH_CCU_MUX("c910", c910_parents, 0, 1),
 };
 
+static struct ccu_div c910_bus_clk = {
+	.enable		= BIT(7),
+	.div_en		= BIT(11),
+	.div		= TH_CCU_DIV_FLAGS(8, 3, 0),
+	.common		= {
+		.clkid		= CLK_C910_BUS,
+		.cfg0		= 0x100,
+		.hw.init	= CLK_HW_INIT_HW("c910-bus",
+						 &c910_clk.mux.hw,
+						 &ccu_div_ops,
+						 CLK_IS_CRITICAL),
+	},
+};
+
 static const struct clk_parent_data ahb2_cpusys_parents[] = {
 	{ .hw = &gmac_pll_clk.common.hw },
 	{ .index = 0 }
@@ -1051,6 +1065,7 @@ static struct ccu_common *th1520_pll_clks[] = {
 };
 
 static struct ccu_common *th1520_div_clks[] = {
+	&c910_bus_clk.common,
 	&ahb2_cpusys_hclk.common,
 	&apb3_cpusys_pclk.common,
 	&axi4_cpusys2_aclk.common,
@@ -1194,7 +1209,7 @@ static const struct th1520_plat_data th1520_ap_platdata = {
 	.th1520_mux_clks = th1520_mux_clks,
 	.th1520_gate_clks = th1520_gate_clks,
 
-	.nr_clks = CLK_UART_SCLK + 1,
+	.nr_clks = CLK_C910_BUS + 1,
 
 	.nr_pll_clks = ARRAY_SIZE(th1520_pll_clks),
 	.nr_div_clks = ARRAY_SIZE(th1520_div_clks),
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
