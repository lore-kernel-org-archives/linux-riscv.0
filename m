Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F49CF8854
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 13:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFZqEFyYMNytBaN3pt43UMDdgKQEci4TxNPaSXH9164=; b=sqST0hRm8WF5PF
	D8D3JE8htZ1MGGJF/m1S2raslmZte2QOCFJhWt3bIPTGA30tgzgcZ34qXxkhXdejcwMjEJF04NS6G
	XNmJ5AnfXyicifo6Xged6oGpqCgyNC1GmLd0wEcDXNxrFlfvFsmJ+oeK1T3YDGy9ATBHWm4aawEaI
	9JqK/gtLbJ++sTIFj0spyzmCpbpQSnnmyEpFmgRJX6miDZCok6XvMNcXooKnj8kEYN90yBgcDHqSE
	2KTiSNodFz0hU1PI8GfjJFAlMLYZF/DyelijmkcAxoEXOIluz0qZ4OkLoEscXfBNFG4gvR68vGeWw
	P3SZJIB+mtzhvQQAvZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4VD-00000006hgi-11e0;
	Thu, 20 Nov 2025 13:15:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4VB-00000006hg0-1AwY
	for linux-riscv@bombadil.infradead.org;
	Thu, 20 Nov 2025 13:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9Z97fOFc1Ib7yYCHlO2MT/Ki7C+Zf36BTSSOX+TQoK4=; b=GbY9jCplhtA4rPRd1NQxI2O63Q
	F03NDM57/MESGb5Hlp5Tu7TEH6DZTl+nyMZ7oHjZWWJQaHkKlsj9kmByDEVeYFXkqMgiimHJqpPZw
	mWMEkqYQ4oXqAoESIfd4Vy7NwcEAqB8ZvsCZ6F561Hzqdnaj6JSqS4LmYlXdEzwkBRSd+uMPm3vhB
	Su/I3thmqV9mq0Le8PkqiKTxNdv+SvqAcVlg89EcgqSaoCAqv+jQoRB2TdRAAE5Hk1nwtdzMJ5K67
	rL1uO8ee0glRrXylXTzwVOi3SyxmePGOfY8Zr6AYMT7mwUgy2kRMNIJG3lX+H/tYd5r2HxwlaJYfx
	772WvpOA==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3dV-0000000EXf8-0YmY
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 12:19:43 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E67092617B;
	Thu, 20 Nov 2025 14:14:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBcYb6eqv8Dq; Thu, 20 Nov 2025 14:14:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644495; bh=yRuavE+79rhObkVfJzraR/ld6UeWsLJML/RIv44JkEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IPxJMr3/Lgn6+XBEK3e05FI6gFR6vMzeCDmz8CVAmZhkaaE7Mn9VYuZ/ZPoTN+dAy
	 tkApJIsC2Vp72FqW7ncA3ZeVUD3PmkkIWnmKyns8Yt7aYSkm5rxiSycU81iiHhPCY8
	 0RDtGhiau1UM3rxlrulObpjxNvFmXVT8igkh7g2lvUMEYFB7UQWPt17unz7soIDsWF
	 HPueZXnMBRYmkyelBTAkluery1/COhG3+2vk3yDC3Owey1ajHr7wUR4+g6KKRbt5GL
	 XQ5jP+/0vTB4hkCw27ZFj3raViwC7tE4MGZAz2lkigLvu1ONGKXK0/85qIzhZjduBj
	 oQf9k/ZRrXl0w==
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
Subject: [PATCH 2/7] clk: thead: th1520-ap: Poll for PLL lock and wait for stability
Date: Thu, 20 Nov 2025 13:14:11 +0000
Message-ID: <20251120131416.26236-3-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_121941_400849_02736416 
X-CRM114-Status: GOOD (  15.19  )
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

All PLLs found on TH1520 SoC take 21250ns at maximum to lock, and their
lock status is indicated by register PLL_STS (offset 0x80 inside AP
clock controller). We should poll the register to ensure the PLL
actually locks after enabling it.

Furthermore, a 30us delay is added after enabling the PLL, after which
the PLL could be considered stable as stated by vendor clock code.

Fixes: 56a48c1833aa ("clk: thead: add support for enabling/disabling PLLs")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 34 +++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 71ad03a998e8..d870f0c665f8 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -8,11 +8,14 @@
 #include <dt-bindings/clock/thead,th1520-clk-ap.h>
 #include <linux/bitfield.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#define TH1520_PLL_STS		0x80
+
 #define TH1520_PLL_POSTDIV2	GENMASK(26, 24)
 #define TH1520_PLL_POSTDIV1	GENMASK(22, 20)
 #define TH1520_PLL_FBDIV	GENMASK(19, 8)
@@ -23,6 +26,13 @@
 #define TH1520_PLL_FRAC		GENMASK(23, 0)
 #define TH1520_PLL_FRAC_BITS    24
 
+/*
+ * All PLLs in TH1520 take 21250ns at maximum to lock, let's take its double
+ * for safety.
+ */
+#define TH1520_PLL_LOCK_TIMEOUT_US	44
+#define TH1520_PLL_STABLE_DELAY_US	30
+
 struct ccu_internal {
 	u8	shift;
 	u8	width;
@@ -64,6 +74,7 @@ struct ccu_div {
 
 struct ccu_pll {
 	struct ccu_common	common;
+	u32			lock_sts_mask;
 };
 
 #define TH_CCU_ARG(_shift, _width)					\
@@ -299,9 +310,21 @@ static void ccu_pll_disable(struct clk_hw *hw)
 static int ccu_pll_enable(struct clk_hw *hw)
 {
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+	u32 reg;
+	int ret;
 
-	return regmap_clear_bits(pll->common.map, pll->common.cfg1,
-				 TH1520_PLL_VCO_RST);
+	regmap_clear_bits(pll->common.map, pll->common.cfg1,
+			  TH1520_PLL_VCO_RST);
+
+	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
+					      reg, reg & pll->lock_sts_mask,
+					      5, TH1520_PLL_LOCK_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	udelay(TH1520_PLL_STABLE_DELAY_US);
+
+	return 0;
 }
 
 static int ccu_pll_is_enabled(struct clk_hw *hw)
@@ -389,6 +412,7 @@ static struct ccu_pll cpu_pll0_clk = {
 					      &clk_pll_ops,
 					      CLK_IS_CRITICAL),
 	},
+	.lock_sts_mask		= BIT(1),
 };
 
 static struct ccu_pll cpu_pll1_clk = {
@@ -401,6 +425,7 @@ static struct ccu_pll cpu_pll1_clk = {
 					      &clk_pll_ops,
 					      CLK_IS_CRITICAL),
 	},
+	.lock_sts_mask		= BIT(4),
 };
 
 static struct ccu_pll gmac_pll_clk = {
@@ -413,6 +438,7 @@ static struct ccu_pll gmac_pll_clk = {
 					      &clk_pll_ops,
 					      CLK_IS_CRITICAL),
 	},
+	.lock_sts_mask		= BIT(3),
 };
 
 static const struct clk_hw *gmac_pll_clk_parent[] = {
@@ -433,6 +459,7 @@ static struct ccu_pll video_pll_clk = {
 					      &clk_pll_ops,
 					      CLK_IS_CRITICAL),
 	},
+	.lock_sts_mask		= BIT(7),
 };
 
 static const struct clk_hw *video_pll_clk_parent[] = {
@@ -453,6 +480,7 @@ static struct ccu_pll dpu0_pll_clk = {
 					      &clk_pll_ops,
 					      0),
 	},
+	.lock_sts_mask		= BIT(8),
 };
 
 static const struct clk_hw *dpu0_pll_clk_parent[] = {
@@ -469,6 +497,7 @@ static struct ccu_pll dpu1_pll_clk = {
 					      &clk_pll_ops,
 					      0),
 	},
+	.lock_sts_mask		= BIT(9),
 };
 
 static const struct clk_hw *dpu1_pll_clk_parent[] = {
@@ -485,6 +514,7 @@ static struct ccu_pll tee_pll_clk = {
 					      &clk_pll_ops,
 					      CLK_IS_CRITICAL),
 	},
+	.lock_sts_mask		= BIT(10),
 };
 
 static const struct clk_parent_data c910_i0_parents[] = {
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
