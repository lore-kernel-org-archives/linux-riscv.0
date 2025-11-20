Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94899CF8854
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5RK8EAKyrCOwFBX706EaCgSgZJVRGRrDLRNMa0mOSE=; b=J7IgvLs9SP91ru
	FK0YQdW+ZeqYt1zosm6kP3+4RL3Z6GHo/+zCwyuyG/+JHEYkPMk3XztCKDlAkFFQzxwf1ipkuIC5C
	xJMvZegaDs3ffRT3MK7wIyyY4WP93toyj7sJDkzgLZ6wU0suaeyn350PzX0PLoiIHJvERih9iKoAL
	W9HrLOHTiiFFpc6MWGB/r+caidcQLM6GDpAZbXA8+zydy+JE4PAm5R9yUEIrJh7dVO1uItoJMR2Zc
	Mb/RxSn1RN2+TcqLF+ugVR+VYmiT4LaI3cuF3F6jw0OxUg0xvDvOWf8aG0zf5Vw0ZN3w/c66sIoZJ
	BPmfrASKQ1jbuvATmIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4WF-00000006i1j-0rQd;
	Thu, 20 Nov 2025 13:16:15 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4W4-00000006hyf-450A
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 13:16:13 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0713422FD2;
	Thu, 20 Nov 2025 14:15:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxLEOPIpJFEM; Thu, 20 Nov 2025 14:15:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644554; bh=6xpttd36WKtetXe3TLfe39yIQ65ubw2+nD4vPw42ObU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dauS815vMS2uVrKC/+1pYPMxbH5mEBEWihDJucOXtozNQkP4BM191pFxXMrBAf4wC
	 Bn1NWFEl5dyG7p5wGO79mDFzBbdjbDbm37fUpnXtA0TM1JkJsgHBCo162yBIdiOOW5
	 6f1GhtpW153JbBviEz/3nMC8+W1DH3qwB4zkrLHC7pu4kNgr8lyUzimoWB2cUwvPd6
	 dhsX7V31IaUQ/zbjdAHq8CYBkom9fMyv7GqD5FnZjdiHIK9gjG6k8CW3GJhnVtkjHf
	 qCc7Bhju5Q+sNvi0BJyxUgfEW1niaAqiyLICpV7VEoauupfhC+pDvVHxmztydSfGlT
	 6jYvFd/uUCWIg==
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
Subject: [PATCH 4/7] clk: thead: th1520-ap: Support setting PLL rates
Date: Thu, 20 Nov 2025 13:14:13 +0000
Message-ID: <20251120131416.26236-5-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_051610_877334_2747D1C4 
X-CRM114-Status: GOOD (  14.50  )
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

TH1520 ships several PLLs that could operate in either integer or
fractional mode. However, the TRM only lists a few configuration whose
stability is considered guaranteed.

Add a table-lookup rate determination logic to support PLL rate setting,
and fill up frequency-configuration tables for AP-subsystem PLLs.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 142 ++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index b820d47387bb..bf8e80c39a9e 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -22,6 +22,7 @@
 #define TH1520_PLL_REFDIV	GENMASK(5, 0)
 #define TH1520_PLL_BYPASS	BIT(30)
 #define TH1520_PLL_VCO_RST	BIT(29)
+#define TH1520_PLL_DACPD	BIT(25)
 #define TH1520_PLL_DSMPD	BIT(24)
 #define TH1520_PLL_FRAC		GENMASK(23, 0)
 #define TH1520_PLL_FRAC_BITS    24
@@ -72,9 +73,19 @@ struct ccu_div {
 	struct ccu_common	common;
 };
 
+struct ccu_pll_cfg {
+	unsigned long		freq;
+	u32			fbdiv;
+	u32			frac;
+	u32			postdiv1;
+	u32			postdiv2;
+};
+
 struct ccu_pll {
 	struct ccu_common	common;
 	u32			lock_sts_mask;
+	int			cfgnum;
+	const struct ccu_pll_cfg *cfgs;
 };
 
 #define TH_CCU_ARG(_shift, _width)					\
@@ -391,17 +402,102 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
+static const struct ccu_pll_cfg *ccu_pll_lookup_best_cfg(struct ccu_pll *pll,
+							 unsigned long rate)
+{
+	unsigned long best_delta = ULONG_MAX;
+	const struct ccu_pll_cfg *best_cfg;
+	int i;
+
+	for (i = 0; i < pll->cfgnum; i++) {
+		const struct ccu_pll_cfg *cfg = &pll->cfgs[i];
+		unsigned long delta;
+
+		delta = abs_diff(cfg->freq, rate);
+		if (delta < best_delta) {
+			best_delta	= delta;
+			best_cfg	= cfg;
+		}
+	}
+
+	return best_cfg;
+}
+
+static int ccu_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+
+	req->rate = ccu_pll_lookup_best_cfg(pll, req->rate)->freq;
+
+	return 0;
+}
+
+static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+	const struct ccu_pll_cfg *cfg;
+
+	cfg = ccu_pll_lookup_best_cfg(pll, rate);
+
+	ccu_pll_disable(hw);
+
+	regmap_write(pll->common.map, pll->common.cfg0,
+		     FIELD_PREP(TH1520_PLL_REFDIV,	1)		|
+		     FIELD_PREP(TH1520_PLL_FBDIV,	cfg->fbdiv)	|
+		     FIELD_PREP(TH1520_PLL_POSTDIV1,	cfg->postdiv1)	|
+		     FIELD_PREP(TH1520_PLL_POSTDIV2,	cfg->postdiv2));
+
+	regmap_update_bits(pll->common.map, pll->common.cfg1,
+			   TH1520_PLL_DACPD | TH1520_PLL_DSMPD |
+			   TH1520_PLL_FRAC,
+			   cfg->frac ? cfg->frac :
+				TH1520_PLL_DACPD | TH1520_PLL_DSMPD);
+
+	return ccu_pll_enable(hw);
+}
+
 static const struct clk_ops clk_pll_ops = {
 	.disable	= ccu_pll_disable,
 	.enable		= ccu_pll_enable,
 	.is_enabled	= ccu_pll_is_enabled,
 	.recalc_rate	= ccu_pll_recalc_rate,
+	.determine_rate	= ccu_pll_determine_rate,
+	.set_rate	= ccu_pll_set_rate,
 };
 
 static const struct clk_parent_data osc_24m_clk[] = {
 	{ .index = 0 }
 };
 
+static const struct ccu_pll_cfg cpu_pll_cfgs[] = {
+	{ 125000000,	125,	0, 6, 4 },
+	{ 200000000,	125,	0, 5, 3 },
+	{ 300000000,	125,	0, 5, 2 },
+	{ 400000000,	100,	0, 3, 2 },
+	{ 500000000,	125,	0, 6, 1 },
+	{ 600000000,	125,	0, 5, 1 },
+	{ 702000000,	117,	0, 4, 1 },
+	{ 800000000,	100,	0, 3, 1 },
+	{ 900000000,	75,	0, 2, 1 },
+	{ 1000000000,	125,	0, 3, 1 },
+	{ 1104000000,	92,	0, 2, 1 },
+	{ 1200000000,	100,	0, 2, 1 },
+	{ 1296000000,	108,	0, 2, 1 },
+	{ 1404000000,	117,	0, 2, 1 },
+	{ 1500000000,	125,	0, 2, 1 },
+	{ 1608000000,	67,	0, 1, 1 },
+	{ 1704000000,	71,	0, 1, 1 },
+	{ 1800000000,	75,	0, 1, 1 },
+	{ 1896000000,	79,	0, 1, 1 },
+	{ 1992000000,	83,	0, 1, 1 },
+	{ 2112000000,	88,	0, 1, 1 },
+	{ 2208000000,	92,	0, 1, 1 },
+	{ 2304000000,	96,	0, 1, 1 },
+	{ 2400000000,	100,	0, 1, 1 },
+};
+
 static struct ccu_pll cpu_pll0_clk = {
 	.common		= {
 		.clkid		= CLK_CPU_PLL0,
@@ -413,6 +509,8 @@ static struct ccu_pll cpu_pll0_clk = {
 					      CLK_IS_CRITICAL),
 	},
 	.lock_sts_mask		= BIT(1),
+	.cfgnum			= ARRAY_SIZE(cpu_pll_cfgs),
+	.cfgs			= cpu_pll_cfgs,
 };
 
 static struct ccu_pll cpu_pll1_clk = {
@@ -426,6 +524,16 @@ static struct ccu_pll cpu_pll1_clk = {
 					      CLK_IS_CRITICAL),
 	},
 	.lock_sts_mask		= BIT(4),
+	.cfgnum			= ARRAY_SIZE(cpu_pll_cfgs),
+	.cfgs			= cpu_pll_cfgs,
+};
+
+static const struct ccu_pll_cfg gmac_pll_cfg = {
+	.freq		= 1000000000,
+	.fbdiv		= 125,
+	.frac		= 0,
+	.postdiv1	= 3,
+	.postdiv2	= 1,
 };
 
 static struct ccu_pll gmac_pll_clk = {
@@ -439,6 +547,8 @@ static struct ccu_pll gmac_pll_clk = {
 					      CLK_IS_CRITICAL),
 	},
 	.lock_sts_mask		= BIT(3),
+	.cfgnum			= 1,
+	.cfgs			= &gmac_pll_cfg,
 };
 
 static const struct clk_hw *gmac_pll_clk_parent[] = {
@@ -449,6 +559,14 @@ static const struct clk_parent_data gmac_pll_clk_pd[] = {
 	{ .hw = &gmac_pll_clk.common.hw }
 };
 
+static const struct ccu_pll_cfg video_pll_cfg = {
+	.freq		= 792000000,
+	.fbdiv		= 99,
+	.frac		= 0,
+	.postdiv1	= 3,
+	.postdiv2	= 1,
+};
+
 static struct ccu_pll video_pll_clk = {
 	.common		= {
 		.clkid		= CLK_VIDEO_PLL,
@@ -460,6 +578,8 @@ static struct ccu_pll video_pll_clk = {
 					      CLK_IS_CRITICAL),
 	},
 	.lock_sts_mask		= BIT(7),
+	.cfgnum			= 1,
+	.cfgs			= &video_pll_cfg,
 };
 
 static const struct clk_hw *video_pll_clk_parent[] = {
@@ -470,6 +590,14 @@ static const struct clk_parent_data video_pll_clk_pd[] = {
 	{ .hw = &video_pll_clk.common.hw }
 };
 
+static const struct ccu_pll_cfg dpu_pll_cfg = {
+	.freq		= 1188000000,
+	.fbdiv		= 99,
+	.frac		= 0,
+	.postdiv1	= 2,
+	.postdiv2	= 1,
+};
+
 static struct ccu_pll dpu0_pll_clk = {
 	.common		= {
 		.clkid		= CLK_DPU0_PLL,
@@ -481,6 +609,8 @@ static struct ccu_pll dpu0_pll_clk = {
 					      0),
 	},
 	.lock_sts_mask		= BIT(8),
+	.cfgnum			= 1,
+	.cfgs			= &dpu_pll_cfg,
 };
 
 static const struct clk_hw *dpu0_pll_clk_parent[] = {
@@ -498,12 +628,22 @@ static struct ccu_pll dpu1_pll_clk = {
 					      0),
 	},
 	.lock_sts_mask		= BIT(9),
+	.cfgnum			= 1,
+	.cfgs			= &dpu_pll_cfg,
 };
 
 static const struct clk_hw *dpu1_pll_clk_parent[] = {
 	&dpu1_pll_clk.common.hw
 };
 
+static const struct ccu_pll_cfg tee_pll_cfg = {
+	.freq		= 792000000,
+	.fbdiv		= 99,
+	.frac		= 0,
+	.postdiv1	= 3,
+	.postdiv2	= 1,
+};
+
 static struct ccu_pll tee_pll_clk = {
 	.common		= {
 		.clkid		= CLK_TEE_PLL,
@@ -515,6 +655,8 @@ static struct ccu_pll tee_pll_clk = {
 					      CLK_IS_CRITICAL),
 	},
 	.lock_sts_mask		= BIT(10),
+	.cfgnum			= 1,
+	.cfgs			= &tee_pll_cfg,
 };
 
 static const struct clk_parent_data c910_i0_parents[] = {
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
