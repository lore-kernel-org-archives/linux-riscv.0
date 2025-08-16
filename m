Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7513BCA0EEB
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzgOJN927eBWzgNNcZg8MlOgbnYMk1L8ElEsIN1KWjc=; b=fu/HBztF3vl/2J
	FjfkYTxYjlHTjDXVHYmhsJ7xmWgivvRJ9JnKjFFsbCkLplHHMd8P1VSVXoVBMZnC1JMXbUhiklUTg
	4vF2k70ZWMJ3hohwnrPvHADjMBqSOfSa9sXHtwRWc7hmNt4tX06XFHMoBgjCJm+eaA3pPV9s4+Qh+
	uwDYZKQbldfdt0SzBS96vQjaOrdyE7hDF3HlaNa32fWjoAdX+/N9azD4Dvh2v2gdRE4N3GFlA0LC4
	CR11MYbq97tI/6AmL9eeObbW1gi8wLEhxYY0sZoo0Uxm0HbjcYAOUEeuOme0MXokqwLuF8qL/B0up
	XsN2oOCtnuxi5U6eh/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCxO-00000004N1a-3vWt;
	Sat, 16 Aug 2025 09:12:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCxF-00000004N0R-3g9E
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Aug 2025 09:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wQL6RzmWDVretl33sqWxS4afoARp3tc0r+5Jdb2Dkdg=; b=e0iu7JWVj1P/CNAhISNFhzeEBO
	Df8WuPK1PsCpf3VvXhFckVX7zaKx/m06dkCY1zzTh9TOaqg0Bhuos68ha6mfBjvIXl4gcbh3TnEoZ
	nbLIvTKgxjVrqamUer62AdZk9Fczh72o51kJJp7vYU6QFumtWXIh4/o+2FlB0/hA2LtNlMJQdYM0Y
	3zaXnrHkRuJoiy51LWPSe+49BwlieWGdWudLXqTEIb0r1OvPj7dwzj1lE8S//Xq6d7PECUW1XKWzp
	lQAdyAHW4Ji6NrIF3bTq+sfIRSCdCnSxxiEq4JKFGux/2U2Cg5YbPFtHeVRMEmhMQlPzP34+HRbV6
	0jPST1Jg==;
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCxC-0000000Gwip-36Jr
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 09:12:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755335512; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WSsgTThAy7jMuDrf1u3yDPZ9tT+4wHD06xMgMRwaMQ5Uumu9rxxgSmFW//9fFKani0A8RmE50+G43SS2zQ9S+qz6mw1aifv00c9SS18Z5UvFkyOkvPVrHdSf3qoVb0OVR4Bf5Up9gneNG1KH89cHG/40jf7kpUizrMzaYJbZfZc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755335512; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wQL6RzmWDVretl33sqWxS4afoARp3tc0r+5Jdb2Dkdg=; 
	b=jsKnafYLAD5U8kAXRX1F7x7bkpzO3Av2UdIe7KorGqqlQTpcR0l35wK/uzI2NO/JEBpPZ+2a9G2wXXM+jYeFV7tzI64xKx6eaqQH4LxWDzvmUsLbRRcj0IxuVTQTyZ82hH00N8Tk8pv7fId+6LKWmM0yzYgvxHCEKbywXNhM7Xw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755335512;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wQL6RzmWDVretl33sqWxS4afoARp3tc0r+5Jdb2Dkdg=;
	b=E+wq0B7OaGSLi++tEfIhLjrEE2MtVCD/Xw0K/l1lCZVHIUpEJSMgdwKBOYDO8n1t
	95+r241QrcMZXwZh05hDoNFPXS/6wDJv5P/mQ8E7d9qQGMI+cr7rFxEQ/7lH4moHqnw
	rwC9Do/U+b/tqngHqfLAzfQuDw5fJYH0LXfgLDeu4ABl5HkLmIj98DVtz6Yb6B58sXs
	mNjK6JPXN3yd9qtlHGiazWCK4f1Aj1XljDhc0tImZwTqICLNSTwNNzwQe4cHJIRg5nl
	wlCuXu8l9dpGxQiJBodeG9R+/khVL7hg0WTE+3uGNHpcLVEN6Yydjk63gxrupbYqAb6
	S8WH5ZSB4w==
Received: by mx.zohomail.com with SMTPS id 1755335508929177.78944857973283;
	Sat, 16 Aug 2025 02:11:48 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3 2/4] clk: thead: add support for enabling/disabling PLLs
Date: Sat, 16 Aug 2025 17:11:11 +0800
Message-ID: <20250816091113.2596048-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816091113.2596048-1-uwu@icenowy.me>
References: <20250816091113.2596048-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_101159_077800_1BB37A00 
X-CRM114-Status: GOOD (  13.29  )
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
Reviewed-by: Drew Fustini <fustini@kernel.org>
---
No changes in v2.
Changes in v3:
- Added Drew's R-b.

 drivers/clk/thead/clk-th1520-ap.c | 38 +++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index ec52726fbea95..d81445e24a96a 100644
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
@@ -236,6 +237,30 @@ static const struct clk_ops ccu_div_ops = {
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
@@ -293,6 +318,9 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops clk_pll_ops = {
+	.disable	= ccu_pll_disable,
+	.enable		= ccu_pll_enable,
+	.is_enabled	= ccu_pll_is_enabled,
 	.recalc_rate	= ccu_pll_recalc_rate,
 };
 
@@ -308,7 +336,7 @@ static struct ccu_pll cpu_pll0_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("cpu-pll0",
 					      osc_24m_clk,
 					      &clk_pll_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -320,7 +348,7 @@ static struct ccu_pll cpu_pll1_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("cpu-pll1",
 					      osc_24m_clk,
 					      &clk_pll_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -332,7 +360,7 @@ static struct ccu_pll gmac_pll_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("gmac-pll",
 					      osc_24m_clk,
 					      &clk_pll_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -352,7 +380,7 @@ static struct ccu_pll video_pll_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("video-pll",
 					      osc_24m_clk,
 					      &clk_pll_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -404,7 +432,7 @@ static struct ccu_pll tee_pll_clk = {
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
