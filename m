Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5996BCA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQdIpkCrjaOsMTx1U/yiu71U9KIrg9Tsdgq++4IGUPA=; b=Ak0rseIF2EUZGc
	PgV+cQTwNeWxhRwuHxpkKM07RW/P67DtojFWKp38FtwOIcazooG/KZ2o0RB/PJ80L64zwSXqvw/yR
	0XGJQewzsFSOgQZEKWfMw9LJ8P4sgdykULZ0YIPEnugRXI5aBikD2bct4lDFJc/XN9V3y1r8B+Zk2
	Hx7me2JK3JsnqJ7TxnMQzXb3zTiUz4MEifjUNGzM2gWbX8/mFc+Rv6mKEwGOiWoYJcbGGSwNz0GlJ
	6ToK1ukOGstfLoTXQSFrhScouGgviexyCSdZ8IWS0eG7ZdeExqQpIFran5rdsOtUou0bagkuo6HD+
	imYMM3EhwvvFVfaDnGCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8Wh-0000000DLZp-2agS;
	Wed, 13 Aug 2025 10:16:11 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um5tY-0000000Cve2-3zE5
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 07:27:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755070051; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L1f+HUg0bJRGOcX+H3+UOCAYzKHldarivOSe0woOODWB/xmLM3Vl4Uf5oTYDkQL47EK+KH3455zTrI7baRWDu2I78rq9pP9/+MxkSRb5JaMdEJTqLjLlx4vObJNlXRVzXbO1EWJ2XLTzX89WK6C75+Ru88pCGLEMVXRex9bc+bs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755070051; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RKA6Gk82y6Eq928Ga+eKi/GECAfyEc827NQ6LPCkBDM=; 
	b=hJhfFXlGVK+voGlrpH5yrppgvSu2QrSGT9AGFHuLP1O/RHLhVyzQ6EMnQMyHgAn9DH/VOJ3uVdT447k65o7MhIl953twMx+bhcy27IgGgIx7ACe7aTm7tBPqgwUzxyyR4kFOyeFcqQPpOtSG+KtwO8m07G+gcAxtxnS3TjniHIg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755070051;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RKA6Gk82y6Eq928Ga+eKi/GECAfyEc827NQ6LPCkBDM=;
	b=RtQgC9yC4pMaK8YBglGCk2gJVVF1OeGyYL7bc24SCCEDAQ3pWfiC4bJlsrTLGJuy
	awxWp3dgnW7TO/RNGFee2wRX4lSzDVLAao02/4fjNmW9zXXso9NzPIwfBNAIa7YTIFE
	QiT74hWu2IeVVL3Ft05xatJynJhJdDeotGGmnKAKTF6UYegF3VRn5PQBV+zGYekKshb
	zJTV4wf5Gbcp0A+gPddBabjobMbFPF+aKkI0Jjqhgaae8pB07u8iUq7iphSi6U1YsDx
	Kuxg2wE30ddD1ydrtbxRy0L07iEVMT2QgyZu1EDX6ynyfqGU86c6oEdKyjA8ua/txW5
	pUA8NzJ9EA==
Received: by mx.zohomail.com with SMTPS id 1755070049808595.2093170250893;
	Wed, 13 Aug 2025 00:27:29 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Yao Zi <ziyao@disroot.org>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 1/3] clk: thead: add support for enabling/disabling PLLs
Date: Wed, 13 Aug 2025 15:27:00 +0800
Message-ID: <20250813072702.2176993-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813072702.2176993-1-uwu@icenowy.me>
References: <20250813072702.2176993-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_002737_017530_7923F163 
X-CRM114-Status: GOOD (  14.18  )
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

The 2nd control word of T-Head TH1520 PLLs contains a bit to put the VCO
into reset state, which means disabling the PLL.

Some PLLs are put to disabled state by the bootloader, and the clock
driver should be able to enable them.

Add support for enabling/disabling PLLs. PLLs other than DPU ones are
set CLK_IS_CRITICAL to prevent killing the system -- they're meant to
drive CPU or system buses (even the GMAC/Video ones are driving arbitrary
buses).

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 drivers/clk/thead/clk-th1520-ap.c | 38 +++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index dd6359441f7e8..0b5458af8c550 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -18,6 +18,7 @@
 #define TH1520_PLL_FBDIV	GENMASK(19, 8)
 #define TH1520_PLL_REFDIV	GENMASK(5, 0)
 #define TH1520_PLL_BYPASS	BIT(30)
+#define TH1520_PLL_VCO_RST	BIT(29)
 #define TH1520_PLL_DSMPD	BIT(24)
 #define TH1520_PLL_FRAC		GENMASK(23, 0)
 #define TH1520_PLL_FRAC_BITS    24
@@ -242,6 +243,30 @@ static const struct clk_ops ccu_div_ops = {
 	.determine_rate	= clk_hw_determine_rate_no_reparent,
 };
 
+static void ccu_pll_disable(struct clk_hw *hw)
+{
+	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+
+	regmap_set_bits(pll->common.map, pll->common.cfg1,
+			TH1520_PLL_VCO_RST);
+}
+
+static int ccu_pll_enable(struct clk_hw *hw)
+{
+	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+
+	return regmap_clear_bits(pll->common.map, pll->common.cfg1,
+				 TH1520_PLL_VCO_RST);
+}
+
+static int ccu_pll_is_enabled(struct clk_hw *hw)
+{
+	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+
+	return !regmap_test_bits(pll->common.map, pll->common.cfg1,
+				 TH1520_PLL_VCO_RST);
+}
+
 static unsigned long th1520_pll_vco_recalc_rate(struct clk_hw *hw,
 						unsigned long parent_rate)
 {
@@ -299,6 +324,9 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops clk_pll_ops = {
+	.disable	= ccu_pll_disable,
+	.enable		= ccu_pll_enable,
+	.is_enabled	= ccu_pll_is_enabled,
 	.recalc_rate	= ccu_pll_recalc_rate,
 };
 
@@ -314,7 +342,7 @@ static struct ccu_pll cpu_pll0_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("cpu-pll0",
 					      osc_24m_clk,
 					      &clk_pll_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -326,7 +354,7 @@ static struct ccu_pll cpu_pll1_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("cpu-pll1",
 					      osc_24m_clk,
 					      &clk_pll_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -338,7 +366,7 @@ static struct ccu_pll gmac_pll_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("gmac-pll",
 					      osc_24m_clk,
 					      &clk_pll_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -358,7 +386,7 @@ static struct ccu_pll video_pll_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("video-pll",
 					      osc_24m_clk,
 					      &clk_pll_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -410,7 +438,7 @@ static struct ccu_pll tee_pll_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("tee-pll",
 					      osc_24m_clk,
 					      &clk_pll_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
