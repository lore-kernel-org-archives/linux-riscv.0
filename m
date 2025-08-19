Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7C5CA0EF5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 01:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/6Ht9QEjSQyvjBRgdMVtQE+vB9LST+zDFyFcQtr3JY=; b=Tl3uQRNdQtLByP
	Mv70dWwynIQ20eRyMZJ229snxDrnnmddGZOLg6d4hcJc7oNUtEf7737bqMs5w6aht59+cyxMZQJl2
	jQOJ45XuV6O70APIh7EAPj2tsKuEJpEQeVhMg8rHdA7ppdJS5axaeh/eWEfsfdLJbexFWugGPIlbK
	kJSwI95s/FYN+vM1slUoiUsHXe5rF3LQn2DEpc1Ao6LIr7KW2LspeAuZhpkvt2e6B5+nq1Qu0Aml5
	DjI1i9yHl2an1g1mSUAs+r7XTkuRVkNcHTT2a9s8scs/poZtt7CB+vBLW1BQyZUSNLaMbGRkXAAqk
	T/hsXxjgE0B4OE3ZEe/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBGv-000000097Bs-2o1B;
	Tue, 19 Aug 2025 01:36:21 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBGs-0000000976P-3OjD
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 01:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755567326;
	bh=fgMPbHla/RHj3NVfFAEZIZq6Vq/k5kuht5xvr+kXOT0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=w/4W7oEY0DNwpX0ZEesegVK5fy+wR1UGPYgN0w9xyGHThLrPe62rzh3tMM2Ac8s1m
	 XmAQRJaR+OXAovoYUDpF8Cd9pqp+vuBnUAMjIlGoqhQr2A/T1cCOjsUR4UrCiU4OSP
	 pSxqJgDlBexZvVKGYZI3jhZy6Iqv9p4svyNOt4pQ=
X-QQ-mid: zesmtpgz9t1755567324tc7ddb23a
X-QQ-Originating-IP: A3TFw07MyzdE9155DEy/FetY79CGxV5ka6P9joBSQeA=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 19 Aug 2025 09:35:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4631062309127417572
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 19 Aug 2025 09:35:10 +0800
Subject: [PATCH v4 2/3] clk: spacemit: introduce pre-div for ddn clock
MIME-Version: 1.0
Message-Id: <20250819-k1-clk-i2s-generation-v4-2-80174edd04eb@linux.spacemit.com>
References: <20250819-k1-clk-i2s-generation-v4-0-80174edd04eb@linux.spacemit.com>
In-Reply-To: <20250819-k1-clk-i2s-generation-v4-0-80174edd04eb@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567312; l=4272;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=wdMPiVIeJsJzFwdu5LLU9FO4SL7n/gJ/QmRKRGDI5Co=;
 b=Q96ug52EU2Of0CxnUDnM1QxIBiIB6dMVI3LNmdn95jtmBy6J49sjtf0UQlZIK6LCsXkS7hvlT
 GShMocafTUADz1shi8qPp6VGkCF/l6kJst+nFIuet3CgGN9G0euqG2j
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M2+XtCuIGUlWtIrBjXawux1LlF19yHUNFMmGV6O+mJ28z/HN8x/FIJkG
	gXKmuPeNrsTj1pKAqKUpsE1VS6MBykaLBLbrERFpJtz+fIGKkoPBSZzcNFezdS/coXewgnb
	qLtVT5Os4O9yxqEQqaHzX+kdhERzvyU/lpbPebvK3zG9qxZEEO9wiUHBr/MxAJGhTCybcbA
	fHAGB3atp1XSMNPFk9qbADJYntBB6DVTEIGm8s97+I6a03/jtmZKUPWBHIVCmBpSVRZ7ERM
	Zhx/nlSnaL+zxsxi893qiuMM+43+4oYQOpHuZwj4Kv48a485GPtSEtDlVqIC094ytNJxsJg
	L/4/yPTPsbZsNJ8oH1k2xepQAqqaTmuPhvkGAxrAPiQiEkHMSAoZ/++y/wvoH0mPNyzjIRJ
	e7VWo3pzGxyw1Inf2M7hzoOUzIuByEuzj6kp5lDUe6pAAay4SemEQQckrchnQwd9qalR/fw
	iiRgdaGfOpQQNBpp3yW7+YdksNyJj1DykpHk+UbJUaNmkapnzSIpZpK16cSfVI9r2KEpujt
	hVIFQxGMZeMjWvmQz3AiJU1+wVPx//m08Z+1mzWpGEMdEiAhgGxfFtXQGXKRKQAcg0NRpTp
	N51mmWmJQ1j3fazKUU3juhnN/sR03JNKwu1GwyKXt+p2JxMxxOkg1nsfFwzcZ7nlqoc7tHH
	2x+6lENlDItjq2JvF2eCUOnVHU/XqGG7nvyZB3mDXY2qUSXPThCOjtaU88ELJIOjkGMfFyl
	C35Ug7KokppxJ223LD56JAQv9XJps3iuC+h4vR7z9yLTjhR8CIDshysBaV7bq2I9sNAsAkM
	bwMqIAOJgU7jCYLEbWP0n2/Ya88TkjdMAk7CYPb0+011K5xSDnVBbLGyRfNZT8E/jkGreRr
	FC6ZuyCR/0Bmvk/pPG1Jq5JzNEVj9bcGFaOUJ2rV8y9/4f6VkKQsaRf92HmxaRiywQeVoto
	tdIV52+jzpvscaOyL72GPQFibc5bjnvGLiqatnXP3DBAEPzPST9avdQqXxx6Z5f44SlvE4W
	U7ZntEjzEeXGyCsv2I403U0vChx+oXpSzQYZoppJuqY5Cx/LJrJCFxSTMuSp73rOHJE4K+z
	4iIXIkjpq5CVhaQHjrIlWKQT/Xr+NTZqu2fP83KDreWTJhdstEi0jTxKi+cE/z4E5wtTKhj
	TCbMQevBCekfcW8/cFs2UMy00IKUCW0zc5R8Y81nU27wlXs=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_183619_618563_6D783500 
X-CRM114-Status: GOOD (  11.19  )
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

The original DDN operations applied an implicit divide-by-2, which should
not be a default behavior.

This patch removes that assumption, letting each clock define its
actual behavior explicitly.

Reviewed-by: Haylen Chu <heylenay@4d2.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k1.c  |  4 ++--
 drivers/clk/spacemit/ccu_ddn.c | 12 ++++++------
 drivers/clk/spacemit/ccu_ddn.h |  6 ++++--
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 65e6de030717afa60eefab7bda88f9a13b857650..7155824673fb450971439873b6b6163faf48c7e5 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -136,8 +136,8 @@ CCU_GATE_DEFINE(pll1_d3_819p2, CCU_PARENT_HW(pll1_d3), MPMU_ACGR, BIT(14), 0);
 CCU_GATE_DEFINE(pll1_d2_1228p8, CCU_PARENT_HW(pll1_d2), MPMU_ACGR, BIT(16), 0);
 
 CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
-CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, 16, 13, 0, 13, 0);
-CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, 16, 13, 0, 13, 0);
+CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, 16, 13, 0, 13, 2, 0);
+CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, 16, 13, 0, 13, 2, 0);
 
 CCU_GATE_DEFINE(wdt_clk, CCU_PARENT_HW(pll1_d96_25p6), MPMU_WDTPCR, BIT(1), 0);
 
diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
index be311b045698e95a688a35858a8ac1bcfbffd2c7..06d86748182bd1959cdab5c18d0a882ee25dcade 100644
--- a/drivers/clk/spacemit/ccu_ddn.c
+++ b/drivers/clk/spacemit/ccu_ddn.c
@@ -22,21 +22,21 @@
 
 #include "ccu_ddn.h"
 
-static unsigned long ccu_ddn_calc_rate(unsigned long prate,
-				       unsigned long num, unsigned long den)
+static unsigned long ccu_ddn_calc_rate(unsigned long prate, unsigned long num,
+				       unsigned long den, unsigned int pre_div)
 {
-	return prate * den / 2 / num;
+	return prate * den / pre_div / num;
 }
 
 static unsigned long ccu_ddn_calc_best_rate(struct ccu_ddn *ddn,
 					    unsigned long rate, unsigned long prate,
 					    unsigned long *num, unsigned long *den)
 {
-	rational_best_approximation(rate, prate / 2,
+	rational_best_approximation(rate, prate / ddn->pre_div,
 				    ddn->den_mask >> ddn->den_shift,
 				    ddn->num_mask >> ddn->num_shift,
 				    den, num);
-	return ccu_ddn_calc_rate(prate, *num, *den);
+	return ccu_ddn_calc_rate(prate, *num, *den, ddn->pre_div);
 }
 
 static long ccu_ddn_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -58,7 +58,7 @@ static unsigned long ccu_ddn_recalc_rate(struct clk_hw *hw, unsigned long prate)
 	num = (val & ddn->num_mask) >> ddn->num_shift;
 	den = (val & ddn->den_mask) >> ddn->den_shift;
 
-	return ccu_ddn_calc_rate(prate, num, den);
+	return ccu_ddn_calc_rate(prate, num, den, ddn->pre_div);
 }
 
 static int ccu_ddn_set_rate(struct clk_hw *hw, unsigned long rate,
diff --git a/drivers/clk/spacemit/ccu_ddn.h b/drivers/clk/spacemit/ccu_ddn.h
index a52fabe77d62eba16426867a9c13481e72f025c0..4838414a8e8dc04af49d3b8d39280efedbd75616 100644
--- a/drivers/clk/spacemit/ccu_ddn.h
+++ b/drivers/clk/spacemit/ccu_ddn.h
@@ -18,13 +18,14 @@ struct ccu_ddn {
 	unsigned int num_shift;
 	unsigned int den_mask;
 	unsigned int den_shift;
+	unsigned int pre_div;
 };
 
 #define CCU_DDN_INIT(_name, _parent, _flags) \
 	CLK_HW_INIT_HW(#_name, &_parent.common.hw, &spacemit_ccu_ddn_ops, _flags)
 
 #define CCU_DDN_DEFINE(_name, _parent, _reg_ctrl, _num_shift, _num_width,	\
-		       _den_shift, _den_width, _flags)				\
+		       _den_shift, _den_width, _pre_div, _flags)		\
 static struct ccu_ddn _name = {							\
 	.common = {								\
 		.reg_ctrl	= _reg_ctrl,					\
@@ -33,7 +34,8 @@ static struct ccu_ddn _name = {							\
 	.num_mask	= GENMASK(_num_shift + _num_width - 1, _num_shift),	\
 	.num_shift	= _num_shift,						\
 	.den_mask	= GENMASK(_den_shift + _den_width - 1, _den_shift),	\
-	.den_shift	= _den_shift,					\
+	.den_shift	= _den_shift,						\
+	.pre_div	= _pre_div,						\
 }
 
 static inline struct ccu_ddn *hw_to_ccu_ddn(struct clk_hw *hw)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
