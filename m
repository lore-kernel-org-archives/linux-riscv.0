Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86061C79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqyiQMuL27oUdv+hhKzOcVwtEYQz3YNi6I/QPWTqyCs=; b=t0K8AIBXM7W/8u
	xjzqQ7Y30lRc9YN5Lr2kShINEI7GOOtavTQCWzkSNRhirojAo7HVoL8hkFjYVHMLHGljbMUM3Dfua
	oePFbBCkAB6Da3nySGS1qiO4Nxksfv8r8dCKd5uTFP+QmAxu22Jwpu6R4HML1Hy7a4BUcG13dglRm
	lFZC07IP9r4OOcK9LORJJHvdne6dk60vqxDykXJZYQAUD4HGztkhkSSauXdygNylUWWHImIm8dNHT
	ZhSiZPrAmKdMqABfnlULPSfGIX4KgXwV6JNlspG2Z7jTtLSFB+XQnV7dVtok2yK6STAmcZu8bTNz8
	GZtEj6n9ZNmOUj8okNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IyB-0000000Btyl-0Sr0;
	Wed, 09 Sep 2026 14:08:11 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Iy7-0000000BtsC-2zNE
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 14:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788962851;
	bh=GrJe/zGuOLChEqPY2kuCKE1B/uVgBajiPVFz4of7w88=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Reht52MlX1g/aikIbTNg8mO/J9uOhN/YIcl2L/Z4CtMtvRa+ZXzft1Rq2q00FgspL
	 t34ziIlbXEUkvjHIPZb9Xn1FJn8naJsvC4zWLKEY6VCbqJLm3MH/e30rdn931sb4Wk
	 22OlYUjSp/PB6g46XqAk6X1eVdzbunWUIOxolcBQ=
X-QQ-mid: zesmtpsz9t1788962849t68360cbb
X-QQ-Originating-IP: sLsoD0HDmN9VygtU83mXe6+BU5Tsu8vKAe2RTOBchSU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 22:07:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8200674829812587946
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 09 Sep 2026 22:07:04 +0800
Subject: [PATCH 4/5] clk: spacemit: reject rate changes to running firmware
 PLLs
MIME-Version: 1.0
Message-Id: <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
In-Reply-To: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6831;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=HcMGpQWFpVaKN+ZuQCSNEuXR6Mis65bMQ5jbV2jMtaI=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkLM7iyma+a6QW+OX3FSd/C/ITI7E4VrjTBulW9Fw8eU
 dhwc21PRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwEQsbRgZplZNLpqx2vrxtj2N
 XL0XixmCVbxC6neeNGTlUuedtSMwheEPXxBfXrVr+IeSyy88n96Y/eBW3eydn6IOn1ggu3VR/Ro
 tHgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OFelQXFBryTbxi/HmdjrW4ddW3zF9yvTZXPMATgbRonHZK1lm/veoRrD
	fJsnb7Um4k8hm1QRlqXIMlFrv9zH15Vz0Q8hsTlrzcPY9J39r0p8KmFNrAdcGO1wLsmh6/c
	X4pFyP6fbhkp5W37nxKBKmT4Lkk4T2HkaBHLAOq7zN0dB1eX34eAB8jDKutkcTWkzFOMisM
	1D2HbFTGlUkZS+vVuTGmhTyThxxpQqZieIoFx+R0pbQOXmlr5yzKjYw4k5XE/1adOYlBcml
	6pKRBAuNY31L7X2gj329328MgLNufWDAZQpOE1tb3hCKy2VdiV26cMAlCaqnHTaZA7u+9Lm
	xclNxUi5pD/JCCHxl7yETd+xVoKgCI5Am24bu50ry4W5cCBqn8aB82aldbU7bjceIr3Mh6l
	5hxPB4Zj48ohnrr3lOGs8kEkCXOMkiBJmZt4QjMTM+8pdHsrt89sKGxv8oNXEtl3ZXmmcfY
	t7Qa2l+8ayB+2DP6NVHGzZi24iKg1Szrllv/lYSH5fTtbTsTZa0Q7Bo797xJHJS9GIpLLjA
	ve+8iegsNC8odtSHVVc99XnEFI8t9BEcOEyMpA+gqYbi+JDs1OKc67EuZBki4gshnwR3Kie
	Mkv1FqlVZT4KojP/CfyL/xCeOHbi2CfgOBrW+YTjG6TDFg7XCnaOERbxbao4VFrGdKiv57K
	DPnvWLnJDQwiE2TVUWPzVfcSvGXYOgT7RoPX8VpAObTOPC74aIzIQ3d70eA2xIXWXDM8qgn
	USOfHTLOgvUG7E8Fha9gTO1AxBtosLuTN2I60VaQET7V2hyTGopeUUM8S/dMb5e4f5QSJKD
	9a1Uynja3CgIRnAglVrXN9XoZzaCIRWMJ0dxFB7UG6fpHCE0a2c1N9O0urvdfzpPz+8EmHT
	PODb0htWVYQajGHhlS0kjpHkHiqyTLaAXw6v8bXcU2iXKe1XFvVfekUb31gVrhqp/jaDDFm
	eRHzciwe9x1QmRa5PpH3oyv1e2t6ShGZpE3++veY1ZK/Sd73aVHPBEX/Ka5t7EymadEhDgc
	ZFwn+jtk/mpDrS8wKPfzIkUIRXo/TzYNAQJ+s9JLzu7ibRt9Jff8GLfe06AOBxyJbIWwnsT
	tmheaVAo796tpdMBbePrIYYv7++ThvUdOAjI6pkHu50USjPunxpcDmjrOPceqRUyFe2orra
	Z0jLaBu1fRAZTFV9kHsi0qYg4w==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_070808_261215_D6E4417F 
X-CRM114-Status: GOOD (  14.58  )
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

CLK_SET_RATE_GATE only protects clocks prepared through CCF. A PLL left
running by firmware can have a zero prepare count, so this flag alone
cannot prevent set_rate() from reprogramming a live PLL.

Check the hardware state and reject set_rate() while either the enable
or lock bit is set on K1 PLLs and K3 PLLAs. Propagate register read/write
failures and reject rate requests with no table candidate. Callers must
still move consumers away and stop the PLL before changing its rate.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Fixes: 3a086236c600 ("clk: spacemit: ccu_pll: add plla type clock")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu_pll.c | 92 +++++++++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index c9852fed31017..2573b8396cefa 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -38,9 +38,9 @@ static const struct ccu_pll_rate_tbl *ccu_pll_lookup_best_rate(struct ccu_pll *p
 							       unsigned long rate)
 {
 	struct ccu_pll_config *config = &pll->config;
-	const struct ccu_pll_rate_tbl *best_entry;
+	const struct ccu_pll_rate_tbl *best_entry = NULL;
 	unsigned long best_delta = ULONG_MAX;
-	int i;
+	u32 i;
 
 	for (i = 0; i < config->tbl_num; i++) {
 		const struct ccu_pll_rate_tbl *entry = &config->rate_tbl[i];
@@ -75,19 +75,25 @@ static const struct ccu_pll_rate_tbl *ccu_pll_lookup_matched_entry(struct ccu_pl
 	return NULL;
 }
 
-static void ccu_pll_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
+static int ccu_pll_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
 {
 	struct ccu_common *common = &pll->common;
+	int ret;
 
-	regmap_write(common->regmap, common->reg_swcr1, entry->swcr1);
-	ccu_update(common, swcr3, PLL_SWCR3_MASK, entry->swcr3);
+	ret = regmap_write(common->regmap, common->reg_swcr1, entry->swcr1);
+	if (ret)
+		return ret;
+	return ccu_update(common, swcr3, PLL_SWCR3_MASK, entry->swcr3);
 }
 
 static int ccu_pll_is_enabled(struct clk_hw *hw)
 {
 	struct ccu_common *common = hw_to_ccu_common(hw);
+	u32 val;
+	int ret;
 
-	return ccu_read(common, swcr3) & PLL_SWCR3_EN;
+	ret = regmap_read(common->regmap, common->reg_swcr3, &val);
+	return ret ? ret : !!(val & PLL_SWCR3_EN);
 }
 
 static int ccu_pll_enable(struct clk_hw *hw)
@@ -95,8 +101,11 @@ static int ccu_pll_enable(struct clk_hw *hw)
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
 	struct ccu_common *common = &pll->common;
 	unsigned int tmp;
+	int ret;
 
-	ccu_update(common, swcr3, PLL_SWCR3_EN, PLL_SWCR3_EN);
+	ret = ccu_update(common, swcr3, PLL_SWCR3_EN, PLL_SWCR3_EN);
+	if (ret)
+		return ret;
 
 	/* check lock status */
 	return regmap_read_poll_timeout_atomic(common->lock_regmap,
@@ -113,6 +122,17 @@ static void ccu_pll_disable(struct clk_hw *hw)
 	ccu_update(common, swcr3, PLL_SWCR3_EN, 0);
 }
 
+static int ccu_pll_check_stopped(struct ccu_pll *pll)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read(pll->common.lock_regmap, pll->config.reg_lock, &val);
+	if (ret)
+		return ret;
+	return val & pll->config.mask_lock ? -EBUSY : 0;
+}
+
 /*
  * PLLs must be gated before changing rate, which is ensured by
  * flag CLK_SET_RATE_GATE.
@@ -122,11 +142,20 @@ static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
 	const struct ccu_pll_rate_tbl *entry;
+	int ret;
 
-	entry = ccu_pll_lookup_best_rate(pll, rate);
-	ccu_pll_update_param(pll, entry);
+	/* CLK_SET_RATE_GATE does not account for firmware-only users. */
+	ret = ccu_pll_is_enabled(hw);
+	if (ret)
+		return ret < 0 ? ret : -EBUSY;
+	ret = ccu_pll_check_stopped(pll);
+	if (ret)
+		return ret;
 
-	return 0;
+	entry = ccu_pll_lookup_best_rate(pll, rate);
+	if (!entry)
+		return -EINVAL;
+	return ccu_pll_update_param(pll, entry);
 }
 
 static int ccu_pll_get_params(struct ccu_pll *pll,
@@ -207,8 +236,12 @@ static int ccu_pll_determine_rate(struct clk_hw *hw,
 				  struct clk_rate_request *req)
 {
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
+	const struct ccu_pll_rate_tbl *entry;
 
-	req->rate = ccu_pll_lookup_best_rate(pll, req->rate)->rate;
+	entry = ccu_pll_lookup_best_rate(pll, req->rate);
+	if (!entry)
+		return -EINVAL;
+	req->rate = entry->rate;
 
 	return 0;
 }
@@ -249,20 +282,28 @@ static const struct ccu_pll_rate_tbl *ccu_plla_lookup_matched_entry(struct ccu_p
 	return NULL;
 }
 
-static void ccu_plla_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
+static int ccu_plla_update_param(struct ccu_pll *pll, const struct ccu_pll_rate_tbl *entry)
 {
 	struct ccu_common *common = &pll->common;
+	int ret;
 
-	regmap_write(common->regmap, common->reg_swcr1, entry->swcr1);
-	regmap_write(common->regmap, common->reg_swcr3, entry->swcr3);
-	ccu_update(common, swcr2, PLLA_SWCR2_MASK, entry->swcr2);
+	ret = regmap_write(common->regmap, common->reg_swcr1, entry->swcr1);
+	if (ret)
+		return ret;
+	ret = regmap_write(common->regmap, common->reg_swcr3, entry->swcr3);
+	if (ret)
+		return ret;
+	return ccu_update(common, swcr2, PLLA_SWCR2_MASK, entry->swcr2);
 }
 
 static int ccu_plla_is_enabled(struct clk_hw *hw)
 {
 	struct ccu_common *common = hw_to_ccu_common(hw);
+	u32 val;
+	int ret;
 
-	return ccu_read(common, swcr2) & PLLA_SWCR2_EN;
+	ret = regmap_read(common->regmap, common->reg_swcr2, &val);
+	return ret ? ret : !!(val & PLLA_SWCR2_EN);
 }
 
 static int ccu_plla_enable(struct clk_hw *hw)
@@ -270,8 +311,11 @@ static int ccu_plla_enable(struct clk_hw *hw)
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
 	struct ccu_common *common = &pll->common;
 	unsigned int tmp;
+	int ret;
 
-	ccu_update(common, swcr2, PLLA_SWCR2_EN, PLLA_SWCR2_EN);
+	ret = ccu_update(common, swcr2, PLLA_SWCR2_EN, PLLA_SWCR2_EN);
+	if (ret)
+		return ret;
 
 	/* check lock status */
 	return regmap_read_poll_timeout_atomic(common->lock_regmap,
@@ -297,11 +341,19 @@ static int ccu_plla_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct ccu_pll *pll = hw_to_ccu_pll(hw);
 	const struct ccu_pll_rate_tbl *entry;
+	int ret;
 
-	entry = ccu_pll_lookup_best_rate(pll, rate);
-	ccu_plla_update_param(pll, entry);
+	ret = ccu_plla_is_enabled(hw);
+	if (ret)
+		return ret < 0 ? ret : -EBUSY;
+	ret = ccu_pll_check_stopped(pll);
+	if (ret)
+		return ret;
 
-	return 0;
+	entry = ccu_pll_lookup_best_rate(pll, rate);
+	if (!entry)
+		return -EINVAL;
+	return ccu_plla_update_param(pll, entry);
 }
 
 static unsigned long ccu_plla_recalc_rate(struct clk_hw *hw,

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
