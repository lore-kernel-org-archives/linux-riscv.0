Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D94CA1016
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 03:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RjWR5z04jjANmEd+LhxTb/GfTLfj4Za/hSVmI/7gCE=; b=K/l2bp1eoVaFOY
	z053nMBXw4ACf7i/3oDkXfa/YgHgQfdTTAB3W4eQ/Y3f10luO2aWsny1lY4ooTvO2Rah7TxR19GJg
	i7keLdmRoWNqyB/Vp8gFLLcZNrXVhKcy99FneATC9Cla5u5GW/I93j764oFYPb+YTnamv5Xij4xBe
	GuOjkDz5MG9ScZDWsEe72t+Ckl21IOuP2GsU+z8I2Xu2z3/MsxWHLFLuyvVlsF7uzRAwvisQcUR1k
	K0UsMAkgXJHabqOBLbPqDqPYzU6j7iKZHUokEyxHYu4/dHfskQfc/3OvVhjfQjdn3e6ZXg1203gLA
	eVLa72UXyEI0HlA9Ll/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwY5h-00000000cY1-2X1P;
	Thu, 11 Sep 2025 03:35:21 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwY5f-00000000cQa-0BwF
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 03:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1757561658;
	bh=6dv7CsMYSMIwRgfQgFkuw6XwJ6YSMwlWfwNLaJZz9VU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=SGJu44LTkeobZJOHSxoXXJZqzgBl1pbm3qzi4KPNbOvM2M6mO4NFA9B5YbuX7yBn7
	 DGCT90m7TROWvcyd68hs11PofwpXxu7i8gOB54aFZgfL2WjxEP/mAfqLngOZZIH1vv
	 x0OhCGsvGAJRpzODoJdS6SiB+RsM86Q9PkIwt3gU=
X-QQ-mid: zesmtpsz8t1757561656t73c75677
X-QQ-Originating-IP: atI6jdhOTO99dK0qo4mLzd5Ax7YIXq4ZclxUwACk0GM=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Sep 2025 11:34:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11099552558053467934
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 11 Sep 2025 11:34:04 +0800
Subject: [PATCH RESEND v4 2/3] clk: spacemit: introduce pre-div for ddn
 clock
MIME-Version: 1.0
Message-Id: <20250911-k1-clk-i2s-generation-v4-2-cba204a50d48@linux.spacemit.com>
References: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com>
In-Reply-To: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757561644; l=4272;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=um/BmDrcrL0kuow4Mg9YUsckGkNepV1kSLVg1UlzI78=;
 b=z1OFKwF+QDZ8bs6TETX7P1vRlSxis+A8oFuHuR8uWEkspKrqdM5HtNAflp/q3Caesb+NZ4VCC
 2mRA2Y3Z890DxgfO37pcYRwxZBERKDeqLbN/s0p/Im+sPeHcAL8fo2d
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OV5xRVowR16SUzOxg8PoyXr5U4uV9Dvc/ZWlK1rk7t8j2A+qw6TciN//
	6422Cjs0AIAyjHrBscqVe1euazkajxRWOUUSA4MGfUlMboll9d3Q3aIhQjawoPxzDxG1AeN
	MPboGlCj+cxQ8IzO997JaiNs3naU+LSCevJFs6k+qaXSlJpaWvyko4ClLR8Vf1QXXyuyF4m
	Jtkcjpctdm9Kh78Vosfx1x+14pZUKuIrDNFuDix9d+z9kHcuHvdX1oJGHFbBIkfhPUska88
	OvcTd23rtN7MOgrOF+wHWR0U7iz0Tbh2S0klNRbTBAZ13tmyf5En81K07ziQdIql0tYb5ZL
	v6bMPglGHatlD2vtpXG+HivlpLXm+5nBez2SXF3j0OiPJriP04Z9Q34IvGvi/Nh2y1I5UdS
	oQZthgGcDaLED7zXT58TT7B+zLt5zkrGZ/r7zNLK2IcnWUcvOUi4xUrqHOh/ciPzenhzj5q
	GmKjF91dxtgHnXDm/DGjqwiJZSjjI9y0Cezxy0kVRAkH3gLcl55VKZxR4Bp8w0xKmfT768o
	hNwMwrCCWUS0W/P1+YP0rEp4VW6LqbCR50Uu+/jRQDDvsV3xXIkqRTygqMxtN64+YdqoATM
	ZMW34VhMbw0/bt4bfXsy5Do5enn4/zOxl+Qyd2tro3razv/NAoD65+SE8gosmQ7O5HEiJtu
	l4Azqch7/v4XLIiBztnn+FQSSAEScPKswrKggo4yCGp4aZqDjyZVZtF9CfRHYeFVu9YSSNx
	sBWI+E5RAmnOINqpnAODW6G3udFJEucuXp3A1ZcOjd/Y/m2DsEJ5XuxjW2SwDX+Buv1ebEq
	elfr6vMz3hAhRlnhPcXBrbtrXa9da7iKJfl9qvxuMphvd8r/gPDFH4sjDH880i5+ColnXBC
	iZfdxyAxMGEaqTMHCt3W9rWJdBwG92TppJo8XpmsImjMlHkKwB5MaBnpxWa05RUoRf5X4Rx
	W5qPCcaAcOcnh/6fdCOmRdW3mk/jtbAvEHQB0ny2rI/4ZapPQ0atkFHrMNrX9E1ltndlJLG
	OkvzZUXDcpa8TS3XgPSZ72O4+JFVRtUyD/6UyZkoRTAKSgYmRMOGBU6CcIKmsRG/QxbZxDy
	FFDYuwR+iF1385gYXtL/4D2rDYJnRCP2JHn5nSWloxe
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_203519_606365_9D899FC2 
X-CRM114-Status: GOOD (  10.57  )
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
