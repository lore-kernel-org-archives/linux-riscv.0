Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52870C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIzACGO/nzXj2dyVLB8G7ZWZav7eQqQGzjnvItTJ5tA=; b=bx2hXzF4Xq+TE6
	B6vg0QhMB78zs9ppM1hyE07sVecvVBDwAewmN2gHg9NaoO0bPFd13dSnGX004PI/+Z8IQcONgQ7xa
	Wm9zlW9KjG/wiuIVsamf/HjBKo0CdefJMIwHbylKSKIFJhTEMWzclQb5qVoeUSLrcHVfSxvtLjljg
	de/+a79YCs5B+WzNB6TC7HUy1zub6MZ821SL8hQ+v/14wRt8U3dWWrwiaWxqmLxA9Y8SUAbYKe1OW
	17Far6Te4CHfzSjA2aI1BeCMmskdHO/vSmNthEwGyqoi6kFbGKnmhYLksgWjl4cWDdF38nExmPc9J
	ntmFI64yODhPfTOZ0Upw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhnJ-00000009uQR-2V1I;
	Tue, 12 Aug 2025 05:43:33 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhnG-00000009uPr-4BEL
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 05:43:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1754977408; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eAhIiWNmQ6ezpM1mxCLbOoGo7q8UUea4xRmCr8FPbJpmC5raikgQsSOsRQZ17G7bfWSKbzfhAk9XJSbQEf9GWH8VqS8MJC5qAkB1LzL/FW1fWd2KF0kdY6gq3iMLeCovrLdKdqg/38o9sSEg6Gb7EOZzKS7DyubAUtbO6MS1Pz8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754977408; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ru2Vsb7/og+EijPXl6fKV4Ujus+LUwB94JMCeT6zV3E=; 
	b=E49ACa9e1KlsFqR6tntCei7Gg+hj1n2Ak6CZ16s35GCrngNIkKsxl75skuNlv4sAVA1uBzWE+tGqhweoHnRzMXTGAPx9w6rFVQrmgh83LOOK8N4cYB4GT7uuW+ktImWPq03yHcqoEPmOS+2xHrZS8PoLKEK/u3p41gEFxdQiV/c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754977408;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ru2Vsb7/og+EijPXl6fKV4Ujus+LUwB94JMCeT6zV3E=;
	b=jJdqH35y2BSVPgoURVbes57NTgZDZdGATmlg45vbV2oMEzJ4v7ydjFaOO7yduL6K
	WkBNuLZ7oXeJkML4RVJquQwC52k6kgqzap2fjYZwGo4zxeAiJu8qCgvUXUBq1vMLbRZ
	UjzbWN0IAwmCCQot+ncGlmRI6h5BdhgDWPvZcCuz0dgVzqBQcDm3rXtjV9oElAeAF2N
	dOZzuOX8IasspGRs/JV6ws/TS7du6v50LnnZDldj2G6D7ZrlZJjBNeLoV39R6czH9ly
	P6UYfbrj/YJaYdUwK3gJbHDMz1QJ48v/QzroTjtgyDjGO/HjMszDc8SizVXXV2MWF6S
	Q8nroX+eAw==
Received: by mx.zohomail.com with SMTPS id 1754977406437790.7145889568351;
	Mon, 11 Aug 2025 22:43:26 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/4] clk: thead: add support for enabling/disabling PLLs
Date: Tue, 12 Aug 2025 13:42:55 +0800
Message-ID: <20250812054258.1968351-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812054258.1968351-1-uwu@icenowy.me>
References: <20250812054258.1968351-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224331_096718_A937222E 
X-CRM114-Status: GOOD (  14.20  )
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
 drivers/clk/thead/clk-th1520-ap.c | 38 +++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index dd6359441f7e8..2f87c7c2c3baf 100644
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
