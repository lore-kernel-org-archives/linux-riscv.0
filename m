Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C5CCA0EEB
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Aug 2025 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCyImLi2xqsD5g9EeCvBuDWMWR9fExM5mVDgghBJD/A=; b=2qOCuSfcx3aXNC
	qWk7ScKJYLiMCBs9mfUD4NC7OMmBZ4Xi75aZdd/ZkyEnx0vDZaEDbdYPyoEieCXUkzbf6B0EauMUP
	nF6WbSVz9iKbNGjZvj2x8KsNH11FTLsbrdAs52KUegQMCzveVdNVbssrr18wEPndey7MtdO/QO4T1
	kRzphClalX1HZk39HM/BzCj01opNRYINTVMCD86qgwQBkSdbxN2kk6RkRpYK3lb0eGBYICpNAjkwB
	K2BnyxraGObwC4n0wAVbwxqrlIWmoSxT/XIKjfGn2h2iPvayGcqqHTqvUvB0hy2foyZClsFDxIPui
	fFQFoyj4p1ueproIgEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6Ij-00000005soT-3cia;
	Sun, 24 Aug 2025 08:42:09 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6Ig-00000005sht-1hbS
	for linux-riscv@lists.infradead.org;
	Sun, 24 Aug 2025 08:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756024845;
	bh=+0D/xtSyclY9YeXodV2ESPW/VNymBxUPSTcmaRsZFQk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=SkYYVD8E4ltoualxi1RvcD5FWAuTAvbcDlEPXpDNjjN+kJkp1QeiTIzExn1DY9nSa
	 c9UWheD3XWgBCuAiV+ai9Z0zTpptEDRVs1EUcdu+bE2Lztj8q2HF51CvmZF605JoHl
	 oZjNgEmxsUCsxIHJQOviBKxGD2mwcJ/9pVjoYeLM=
X-QQ-mid: zesmtpip4t1756024837t616a7bdf
X-QQ-Originating-IP: PUsKbz+++SlMt/xebBO1hY0S118liMczPg+o1fjZI/g=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 24 Aug 2025 16:40:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9689889897890366230
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Sun, 24 Aug 2025 16:40:01 +0800
Subject: [PATCH RESEND v5 2/2] clk: spacemit: fix sspax_clk
MIME-Version: 1.0
Message-Id: <20250824-k1-clk-i2s-v5-2-217b6b7cea06@linux.spacemit.com>
References: <20250824-k1-clk-i2s-v5-0-217b6b7cea06@linux.spacemit.com>
In-Reply-To: <20250824-k1-clk-i2s-v5-0-217b6b7cea06@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756024814; l=3086;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=EwKVSE+xlhWtppMsIC0wFkFKY+Ek8JZOdL9HhV7w8qQ=;
 b=Glx1thNAZLGwZF+ZRevm8+R6O87PYXOxfak/RqijosoYktJgN4SadVOOB7TzA7d15sqnpnFNj
 OAy5yz77XPgBXfWp/q1GWBFbmWDkYKOX2ioCS3c+xwdTaqoRyC+np7p
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MQ7i6Ib+DYfjH2lCYvgT0bZu51wi0pYgcn1zlE/7V9vHh1nGRaWtLRpP
	tzeHox4hAdYCjR7C7e2Yp/I4r6YcqzxE2urOAWFE6G0MRwpMiYo57ZKGQwWs40fS4htDFG5
	k2D/nq4TtUjLI7pX5O1S5BGwqQpjUeqZKl8vddVh6HtDNA+yiOP9VEYTXtinvwNwOaPoOSr
	8dqKWggrdmqHKJxPKeJHCkjvqrkxpqOi3ny6jtUkeYOBv4OGCQ1T6J2RYU/QiaWYOizAxKc
	Bx/uKg6iivbUKbK3HlxusFzpv56Ask1MRkNIncJgOdcZrhypXOrPMDBT4wSZwOoKpUhFylo
	zqbr3GRDXtI5TQHiG+Xc7Afh5nbB6zHIYjcgmhvyTaoBwRa4jlCz5ROoIrg84OOL3dUD4xF
	gO8YSgyzL/j0gkShKaQnYFa43SdCwoPIXB0qXJtqCRimhiXhoFtlsjKVjxgwgHk8fWzF2uR
	WjXEqdpaId9hUPziTa5luz9vDv6rJHltdNxvMmqrG/O+tuJffpRdaqYftOit+YkcJbbfXqD
	0mQNKaVL+nKkfOp1DAXrv06+EDBnYAJBqEVlajhBiT9Qj7hhLRJUf+vlnWD7XtYnLtmZ/Cb
	tGFZcz8hhovjuJ9aLqj1WQ7y2obPTp4oUWvXgaXdxzYU1uvS+Xt3RoAIAy9FeGJ2dshhCf5
	a46spIOhVAxVWHJvVTXtjfuTqIriJE6JYaaTPisDUXHk9ok4Db3qCVAEk2TmUwnhlDJjV5y
	fL7EDAG4FzGKXnxYbF+W5Ic+xjA3t3u4g6GOjEOhp+Gtkp5Qz01cbN/Iin2vyMxlJ8Qzu3C
	X7Hfuk9t9TK3Bunmz3TPB+E1U48zD2cIra/R8Vj47ywl4FpDWkn9Iz1rFCk+2RsW0ERsZwK
	SWUHb0UURjEApfuvjUPZ+A69KrSlPtrcLjuvQvzFpO0ZHQWHJktOIdZKxNtAbbz0q8huyIA
	JlFUfOLhpzQHwd5Qo4v71A1kex/4PrvQd7gIzC6Pe6AHneP8eTxa55mNpOSnRPcd1GIF83N
	euB7dBB8aKZMfwXJF3OLd8ymQDQYZf71ytq2ACRAsHjh9GmOa8pZ+rePKC3vKYleWNoe01/
	WcVULX4ovskhb/mcwbOf2NMlMlTcpJYZyVgN9QV+P5a
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_014206_981295_02F271EB 
X-CRM114-Status: UNSURE (   9.45  )
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
