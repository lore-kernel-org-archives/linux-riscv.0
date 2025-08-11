Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12614C87FD2
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCyImLi2xqsD5g9EeCvBuDWMWR9fExM5mVDgghBJD/A=; b=KNgn0aMOp0zviO
	wN+4dtmAn1AwkKjGm4cq8ww1dCx5X4KsCS7fe/LpIfP1K4bXxH3GM+ufSqkG0MUduXZvh2whRiBfY
	/lSwrHqmwPSOTp+wThJlOcTmcHdDnAeMmY1lwsBM46EwqKZ58Cfru6oKiLeH+DjhhjPNOM6Bw4XqX
	mTEAkNDcDYknZ9eU7GjvlKZxKj80e3R9wyohnpJnUaEZLomV1SJtND4gBR2Nw+xn4YQtmA3ygxvHi
	eJ60apxHhV5XyG5UosODsYVmotx/2tA3nMdWY5oBJ+46Zc8qvKqiGKC5LPWrgAvx3SHIYWtQwvnVF
	1PfnQGAovlbnmZlvcOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSpE-00000007rw7-3k4R;
	Mon, 11 Aug 2025 13:44:32 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSnP-00000007re9-1Ide
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 13:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754919654;
	bh=+0D/xtSyclY9YeXodV2ESPW/VNymBxUPSTcmaRsZFQk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=M0usUtG6h7BB1JM6MR3r1PP2bA4sPuyjI59AvFdmwMhzYL7afb2o4UF+V+mO7ujdL
	 jekI/1n6dIu/+44ffJCwYCCMh+GjMGH2yBoMkj4/kdPW4pCW8horjC/2PgsEHM5xda
	 yLrup3bKrizidadwU3ghmjH2EjI5el7ua1dvy/QQ=
X-QQ-mid: zesmtpip3t1754919646t750cf849
X-QQ-Originating-IP: 1I4WHGqpVJrS9nwcYnSEwg1mh0FiNErlU+HTTj7t5Cs=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Aug 2025 21:40:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5142891819712798634
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 11 Aug 2025 21:40:34 +0800
Subject: [PATCH v5 2/2] clk: spacemit: fix sspax_clk
MIME-Version: 1.0
Message-Id: <20250811-k1-clk-i2s-v5-2-ebadd06e1e91@linux.spacemit.com>
References: <20250811-k1-clk-i2s-v5-0-ebadd06e1e91@linux.spacemit.com>
In-Reply-To: <20250811-k1-clk-i2s-v5-0-ebadd06e1e91@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754919637; l=3086;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=EwKVSE+xlhWtppMsIC0wFkFKY+Ek8JZOdL9HhV7w8qQ=;
 b=26/O+mjSBSWiF1/RhGR5NKfnNd1X96Hv85kfc7sUe88X6jtIL1refAZMItUiZxCo6aDVLlSi8
 mDIipJ33GBXBecTM/a5QKi/6ALjLFFRctjm69TMpYQYR2DNm7YZuZgs
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MdoRYM9mYryd8QLng9Lmw8tJhAWBVQXuuvQU7Q5YbFdarVh95fBuMtgG
	yatlD2bi3tqj4JGFJYYRkP5WGOAhZn8Dhhem/PxCaEZja2bzUaLs7e8utQtSWFIod9uwQqV
	Cxxo56trF4DcUzrKgU40oPH0Nua/WRu8JIzd6QY1PC4Pp4IEkCsXOk8leVgPKnvC+AxW+bL
	0u90AItitGJUUk7Ib5gq0u7FqFdF5PuNcIfQ+TMWeiIM0m/pqxcJgwXC4sHzPqaB8zGuGIU
	0EWdIOQTRpQFiDSR5NVo6Cc5mm8XOuClpnPF+bsvpvt1ttm3aV0pr7J43ZDTZKs5eINfGel
	itiRuYTe4QpigqalW2WSWtWc5IC3DCglUq3hus9S6fCU6VTxwGo158jSzFSHmUngtVUh4kE
	SLo/Dd9jVy0/QM4tGDrWGJ701DLF7aNRaDCthCdjzzIt/n6mVYOmTW32LswXhwrgYBPusGT
	xtlUxTNBZ3fWeCidLq7PjXIXDCF3o7FLAO8Cb9JFHkrPXPRZ9OJWieMZGzGvzebL/myA+Hr
	2X50wSoNBC/OLRThaApYXpe9EqsidDdbaJHp1VFO70oY37MdGg6kJd+DHDwKE1ewakOVvai
	sO34fsV6fQN38tLnYAPpOh8wdRhrNQjeTp4jqOT1HP4wLkVIJMe0O++aiBB04b2i4Swu/8K
	8KKXbNwHP2jnyIp4ZLbYuPlLHtxtN/8r5/nUGrk49N7s5oZYFzU/8W+Gq/ArjRe0QZp0Vey
	w0i0Xb2NzqyVE7AXN1m9ROImveL/b8o2wfufjfq7e6FRrpKX3qRybqCQ+0MLiTBUdAPaFjH
	j8iE87BTyrQMlUambz4xCdlEq1Q1KdqnitQ/SgaZN+7QalI9aRAvd7dyJa12zn9ISB2u4DM
	iesOQJs5rMVIUhqMy2GI5JX7wWVFriTiXO3ehhvakFqkoaj4wIzZGqegRB6dQIykepSwJPW
	FFOieWTsw9DD19hP6wR9U0/yPJWP97gF0l0wIviJgziAsSuDWjz72oZRIB1qdYm0C1My0Vh
	UwTUy+9Fnyfxrgu8Z3dqCZJ5f0pE/GOuWr58N1YCaq2EFUOqeHilDyOke0+WUd62xyDiYjp
	A==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_064239_915390_3C45C520 
X-CRM114-Status: UNSURE (   9.88  )
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

Hardware Requirement:

BIT[3] of this register must be set if need to select i2s_bclk as
SSPA parent clock, to solve this, introduces a new SSPAx_I2S_BCLK
clock as the virtual gate clock.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Suggested-by: Yao Zi <ziyao@disroot.org>
Reviewed-by: Haylen Chu <heylenay@4d2.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k1.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 65e6de030717afa60eefab7bda88f9a13b857650..62cdba516a29f960e15e04642470f55e3d85bfad 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -247,7 +247,14 @@ CCU_GATE_DEFINE(aib_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_AIB_CLK_RST, BIT(1),
 
 CCU_GATE_DEFINE(onewire_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_ONEWIRE_CLK_RST, BIT(1), 0);
 
-static const struct clk_parent_data sspa_parents[] = {
+/*
+ * When i2s_bclk is selected as the parent clock of sspa,
+ * the hardware requires bit3 to be set
+ */
+CCU_GATE_DEFINE(sspa0_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA0_CLK_RST, BIT(3), 0);
+CCU_GATE_DEFINE(sspa1_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA1_CLK_RST, BIT(3), 0);
+
+static const struct clk_parent_data sspa0_parents[] = {
 	CCU_PARENT_HW(pll1_d384_6p4),
 	CCU_PARENT_HW(pll1_d192_12p8),
 	CCU_PARENT_HW(pll1_d96_25p6),
@@ -255,10 +262,22 @@ static const struct clk_parent_data sspa_parents[] = {
 	CCU_PARENT_HW(pll1_d768_3p2),
 	CCU_PARENT_HW(pll1_d1536_1p6),
 	CCU_PARENT_HW(pll1_d3072_0p8),
-	CCU_PARENT_HW(i2s_bclk),
+	CCU_PARENT_HW(sspa0_i2s_bclk),
 };
-CCU_MUX_GATE_DEFINE(sspa0_clk, sspa_parents, APBC_SSPA0_CLK_RST, 4, 3, BIT(1), 0);
-CCU_MUX_GATE_DEFINE(sspa1_clk, sspa_parents, APBC_SSPA1_CLK_RST, 4, 3, BIT(1), 0);
+CCU_MUX_GATE_DEFINE(sspa0_clk, sspa0_parents, APBC_SSPA0_CLK_RST, 4, 3, BIT(1), 0);
+
+static const struct clk_parent_data sspa1_parents[] = {
+	CCU_PARENT_HW(pll1_d384_6p4),
+	CCU_PARENT_HW(pll1_d192_12p8),
+	CCU_PARENT_HW(pll1_d96_25p6),
+	CCU_PARENT_HW(pll1_d48_51p2),
+	CCU_PARENT_HW(pll1_d768_3p2),
+	CCU_PARENT_HW(pll1_d1536_1p6),
+	CCU_PARENT_HW(pll1_d3072_0p8),
+	CCU_PARENT_HW(sspa1_i2s_bclk),
+};
+CCU_MUX_GATE_DEFINE(sspa1_clk, sspa1_parents, APBC_SSPA1_CLK_RST, 4, 3, BIT(1), 0);
+
 CCU_GATE_DEFINE(dro_clk, CCU_PARENT_HW(apb_clk), APBC_DRO_CLK_RST, BIT(1), 0);
 CCU_GATE_DEFINE(ir_clk, CCU_PARENT_HW(apb_clk), APBC_IR_CLK_RST, BIT(1), 0);
 CCU_GATE_DEFINE(tsen_clk, CCU_PARENT_HW(apb_clk), APBC_TSEN_CLK_RST, BIT(1), 0);
@@ -865,6 +884,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 	[CLK_SSPA1_BUS]		= &sspa1_bus_clk.common.hw,
 	[CLK_TSEN_BUS]		= &tsen_bus_clk.common.hw,
 	[CLK_IPC_AP2AUD_BUS]	= &ipc_ap2aud_bus_clk.common.hw,
+	[CLK_SSPA0_I2S_BCLK]	= &sspa0_i2s_bclk.common.hw,
+	[CLK_SSPA1_I2S_BCLK]	= &sspa1_i2s_bclk.common.hw,
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
