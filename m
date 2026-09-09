Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C8DC88E41
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NR48ywBpddkVOdWjnopyN5XvvuBUuIZGc3g1U5Qo4bs=; b=EOuZxoYXCZlCZH
	hnzAczGEQo2HGX7EJD6aUVMKjwPDGgDFtWCkypetOOWK/elmn5NIjmwHzuYiL9mOF5/WHfvEK8lUi
	XwH3ErzoYbtjJcWHmycKaNswnfS78jk1ojB1+hNgTBdolRzDkqDbGYMvsJdyvQpiSp5RWmXikyUHB
	u4Zn1cCweht0atY+yj12aQCxiomsay3EpNPMGMy21m/kZKfN++h7cA/vspcetUueMdjIsbytQRw4A
	nh55iwpg2RblAjHYNL+TR5zrP5UO018dPWbnJaUlkqT6hlsEFAe8eFPnF+aEWRNhsEbS68E4tCKRR
	NJcMpGiS8MF1iOqnVRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IyA-0000000BtyM-1qBs;
	Wed, 09 Sep 2026 14:08:10 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Iy5-0000000Btsn-4A9C
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 14:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788962842;
	bh=nKAq6RetJp6ZFR2CRDPWMZ27CnaeKTaTs4jXaZMXCHY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Q0XALssrm30B6ZiVFK2KiagmkqO+g/PezyvvyoAxar9PVGaHWEh88r8wtOb+jUR6A
	 Y+OK9ZveX1ZKTktDwi0rrOscMnyAB15KlNaQQBfD5GGu/z3fpzQaHfTRS69jf2T6tl
	 4nfnMv0vOmD4UsxaANi+/qQDUxgWzBY8PMuE/Y6A=
X-QQ-mid: esmtpsz11t1788962840tc0335ed2
X-QQ-Originating-IP: AgpmG5w8G+w7oi58LYPI+uQCHoCX373EEv/NMTsxbek=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 22:07:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7195780411193005217
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 09 Sep 2026 22:07:02 +0800
Subject: [PATCH 2/5] clk: spacemit: make MIX rate selection consistent
MIME-Version: 1.0
Message-Id: <20260909-spacemit-pll-init-v1-2-b3065ad5a4ac@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3117;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=vxttLKkfUwd27JQRHStfdT7Y0lW42eEikPZgsnpxuJo=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkLMzjinlz8Xrvua+CsDF8X54L1XMcWLS51+5MvauSbY
 rG4wqSgo5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCLWFxj+Z1xWOjtp++QX31J6
 vzTOXmu35MP3jIwZ/C+MFW6JXS4SbWT4K5FqvJp15uINP6pven1Pcj60OWIPQ2bDsxULfu6dem6
 FLxcA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OO8MlCOzVkkWHL//EhhvLE+P2VGPEbu/LYy11ZhJtS+pZxm7+w5rH2O/
	LtziPtFX/rTX8k6cFP0qZZ2CWrR8IptgJObZw3YkijYM9E88yRrsZ7fb3KsDFpaRlEYC6Mt
	MFk9ZdfCv6ygT4eFbkvOpmKqI62Ln/iDvmM1grkFqI6g/f3sdLyv+IpjfY1U048gaJbnmct
	ZmhYX/XQ6qWpw4VNPyGPTqTKDuxlSbGFUUvf/L2Nh0d1RNLwh7b5iIn6JFqG2+vxnrlyR6X
	7MAmlJRQS0tswFyz9NQukCi0ezaFs4zcMZUmbS10GQKdpQwpOmdYyyFCzDQ4ZSc+nIr0mh6
	OxG8ypvYt4t7fBoJL9v7AaykzaoGDpvCq1oosqG4W/BMkQiGtEsiv8xtpvCeYOkIi5P036a
	vMB+/y28wsnx5OVyjsQmqG4L8/a2+KFs572Bb6BKe+l25XypcdbqOy5i3Lvtm+luWD/8r3O
	sDvSJ0Tt4/0Lk49BV6X/p5+ksbUYLognJkQwRUzXIr2Z0Bau6VRK7ev6t0S437KtBkUuGDB
	9Q/X/DtvsUIHt/RnM7yYQZDMwLj4SQqnPitBJ+wco7XVtX3h1xUS7u38EaiHgHLiq/cIKHN
	Pj+C2Ue9XyCJYxmnNzXiwmjemifN/uJYimC0k9tPdXZrVZvbYGHCI7Y306TqYYWMxAT1uuS
	WVKzjjl6mqsSW+Kf/by1ZBSiBS+/6x4pncW/X84G2VcykRMplnzxCvHMIas4RamDFQU7RhG
	9qhxy+1ZdlAsKLbNqQ5e4KZTMoC8yoTlmMKbbjex+QSjCLba7yBQ8Lc9O5lK4i824N1S2n8
	bBMrnO7As1me7G4k+hm4Ii8ji15k972SZogPaciMepxoYnQhIkMeTT1RWBJg4cU9LIUJyqH
	9co3lMakOaHN4UCSJupApCRJ9bVdnKOSqL2dEVqTqAtjdhot3ENayT6TnEK47OiEeL2Mh1W
	MY3PvY13M/M9WKObMpcbBizMHSBj2P8t0NnAZFYaCn5mrJ9zll8ApSdHFAWwIdj3UoflboS
	IMjHh3uprYBPFYb/UDz9lmo+MUwfX7cuENFEd6obH6D/Vw1164sb5F8gEgj+54IfvtQmE0z
	oEg6jBDp9/TB2M74efqj09YJJxeOnRExMDpNbC8c3w8BYYeJV8mludEdzaNmAgTVqpIek+a
	kMV+/+KFxy0f314=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_070806_513014_8059F025 
X-CRM114-Status: GOOD (  11.52  )
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

CCF passes the selected parent's rate to set_rate(). Searching other
parents at that point can produce a divider for a different source,
making the programmed rate disagree with CCF's selection.

Restrict divider selection to the supplied parent rate and use the same
rounding as divider_recalc_rate(). Track the best error separately so
low-rate requests do not leave the initial zero-Hz candidate selected.
Skip zero-rate parents and have determine_rate() reject requests when no
usable parent exists.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu_mix.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index a8b407049bf4d..da3c5685d4f65 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -107,22 +107,27 @@ ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate,
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
 	unsigned int parent_num = clk_hw_get_num_parents(hw);
 	struct ccu_div_config *div = &mix->div;
-	u32 div_max = 1 << div->width;
 	unsigned long best_rate = 0;
+	unsigned long best_delta = ULONG_MAX;
 
 	for (int i = 0; i < parent_num; i++) {
 		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
 		unsigned long parent_rate;
+		u32 div_max = 1 << div->width;
 
 		if (!parent)
 			continue;
 
 		parent_rate = clk_hw_get_rate(parent);
+		if (!parent_rate)
+			continue;
 
 		for (int j = 1; j <= div_max; j++) {
-			unsigned long tmp = DIV_ROUND_CLOSEST_ULL(parent_rate, j);
+			unsigned long tmp = DIV_ROUND_UP_ULL(parent_rate, j);
+			unsigned long delta = abs_diff(tmp, rate);
 
-			if (abs(tmp - rate) < abs(best_rate - rate)) {
+			if (delta < best_delta) {
+				best_delta = delta;
 				best_rate = tmp;
 
 				if (div_val)
@@ -146,7 +151,7 @@ static int ccu_mix_determine_rate(struct clk_hw *hw,
 					   &req->best_parent_hw,
 					   &req->best_parent_rate,
 					   NULL);
-	return 0;
+	return req->rate ? 0 : -EINVAL;
 }
 
 static int ccu_mix_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,9 +160,19 @@ static int ccu_mix_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
 	struct ccu_common *common = &mix->common;
 	struct ccu_div_config *div = &mix->div;
-	u32 current_div, target_div, mask;
+	u32 current_div, target_div = 0, mask;
+	unsigned long best_delta = ULONG_MAX;
+
+	/* set_rate must use the parent selected by CCF, not search other parents. */
+	for (u32 i = 1; i <= BIT(div->width); i++) {
+		unsigned long divided = DIV_ROUND_UP_ULL(parent_rate, i);
+		unsigned long delta = abs_diff(divided, rate);
 
-	ccu_mix_calc_best_rate(hw, rate, NULL, NULL, &target_div);
+		if (delta < best_delta) {
+			best_delta = delta;
+			target_div = i - 1;
+		}
+	}
 
 	current_div = ccu_read(common, ctrl) >> div->shift;
 	current_div &= (1 << div->width) - 1;

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
