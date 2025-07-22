Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02491C83F25
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 08:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwdMepyLfPK+VK/XXx4UVI82USUrq5xhuBUZrE6iNsQ=; b=EJyVNUXwyRIi0x
	GenYaiLqPJuvzE2pWfwS9oe09+W7+X0343KtDqLpkoTNu1fQTAIqBJDq3HVQfi5CKEtsxcIZ0iZtx
	706CLu2jsI8hJyf1UXOM2rD26uWNwoiSRql/YRJBIYXwUri5ltyTFVxWKMZtFXIv9bXRnRcahR0Ca
	EQnY+H0wVKwEk82vntquIUUG0KcsaADL5TaMn7gusUS41KiyVElQZGYOUwtlfcGIh3dcn2SQRfsUg
	vhp7jhCti93NYoRkzxuo7Y7xxjIdYcT8pjCxcqCriWuzdW+6r3GGLrmJjrPX30qFQ7NjkeW3gncmj
	/aW5aTuAGfIwkQEeLv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8gc-00000001t1S-2fSg;
	Tue, 22 Jul 2025 08:49:22 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7a5-00000001hIW-3qfp
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 07:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1753169834;
	bh=U/IeCJBKYW1Wm6ZiUsTtlOZr4Se61tE+GVaKJQJHMuQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Xn06n3H48vbQ2AKhWAnF3++jHP8geIQ/+qpTyuQ4fJPTzG3ETkBJx94XhLlUG92jD
	 Ea4ZiMXbbL6OURbEcDeQoAh0LP4zQHEIGig9XlWuHwrgJWikByzCFaLeDg/7dc95Ke
	 q7O1jTdltyWVN4MzvYFs6uVPzVIMUyCU3l0Wn7Bg=
X-QQ-mid: esmtpsz18t1753169826taac6f3b8
X-QQ-Originating-IP: oZcVhibqva3zbqveutq/trZ1Ic0hqyjny9OSGk6T3xE=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Jul 2025 15:37:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8049329439976532994
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 22 Jul 2025 15:36:30 +0800
Subject: [PATCH v2 1/2] clk: spacemit: fix sspax_clk
MIME-Version: 1.0
Message-Id: <20250722-k1-clk-i2s-v2-1-2f8edfe3dab4@linux.spacemit.com>
References: <20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com>
In-Reply-To: <20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753169819; l=2972;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=mh8kXUN6Mr5mFWd7+ckjj2inOSEDYAbx/F4sl0Cobz4=;
 b=u3k9A0c5VudprDeGutHEbdky0Y1M0CkiBqO+KAIgTgZH/3pBaY0jP3qOQgvzqzv9cpVobH3sC
 FED+3WKOFBEBPu0fEgUkt3v4gDSNYkvkmjEe/BxXSmC82H1esdyBHUv
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OC/Kt9Tg2xfZiaLHYVkkD/Bmoooxb++yEUfU+6rvxMCB193l9MeareAa
	3scJNnZNaZYb/4rpVrgryPu7/hRBkNYxSGjCHN+qJ4J29u2D/4rjW5cYCxcg8oKaYj+CvcZ
	9SNwJBnMCIjAEGrvEiiqLF7U+q/tsrqZuCtrfwSTsb0zp1PA4hr42nx5TRSXAXsuf4RQlPP
	vWQhsSDdv6zmii02ze1MdW5HGy2tzIVJ1YVjP8RYezAi7Bmn+dnb/xC8qBvluVT2Iac3swO
	3rCXfjQkVo2mPiOQDlgvFgs95lh0sz8Ga+hYtkGTYVZp24TLm7v8YaJTB+FbzLzHPaxgH0M
	HPmhIrJX737YLZqfEM7egbDlJ6VOzrgTp0bq8+4SpW+pl7QwPd0Rw5UG8xPjXPE5iRyYhfe
	Wm5Cp5uZbeD/Xvp5HPc6CulqhxPfVyWh4luFiKR62eEcBLC22+mN6KTRx23YRRjT7vmjgJO
	X+iRq4WXSJ1BgX7NLGdSWA57PD4eULq+VNtRPRwrTT2h/f0OdsyQR3XamCnxm9Qz5OUlRrm
	9ZInlwpdMr/8cnxyAmqKAMuQNGpAvhuzmyH3OvQyCSjjdqXfRgEB6k3UW1olIG2ZDyB3JZX
	Za9UwE4YzNbmVy6khMY+m04purI5/V5+Z+VmKkc44Bt69GTouEy2kEq3e3SrOLgVB4T7TH6
	zUIpDmkRYgjEqDVmG/9RlO3edP1l/vpBhq8ScvzP0U6eaA82btbMbDl4U8GmEU/W4qL4UQ4
	3XfNDOw/6CGpSx1lW5MB6aHStqBVY1SIq1jqlyC0ux6FHIJW4tLVCovZf0KcxJE7jW8iev0
	8Jwl0ZI1rSvgWag2E0SOFeKqXQsRukul+v/nL8A9Yzvi4Iq2saKbNk7l85valWl1ASs/UG7
	8nsW3WY3bUd4WH15ntgU2W09SfYKNX5eeHK1KEYuoXSycf+QzXBWLjAW9ixWuYLJ2NZAHmb
	yoq5Bxf9n9bbYckFfjapQnDVMzByEU+iW5RNlF81+cMzgajsmvB9A4LY9T9M7bMaOvlaV1P
	joOFRDGjEFO18uLY3kDPksObPbo+o2EiVAw1JsO715Ragkr9k0hzkpXcQilSnctJg8CNTMm
	g==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_003834_863981_3F37150D 
X-CRM114-Status: GOOD (  10.66  )
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
When FNCLKSEL in APBC_SSPAX_CLK_RST is set to 7 (3'b111),
BIT3 must be set to 1 for the SSPAx parent clock to be I2S_BCLK.

This patch introduces SSPAx_I2S_BCLK as a dummy gate to enable BIT3.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Suggested-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/spacemit/ccu-k1.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a0523537c2f436e481ae8d6ec5a581b87e..3b1a861729c6e7ef64bd42b975688058610d8c1c 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -349,7 +349,10 @@ CCU_GATE_DEFINE(aib_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_AIB_CLK_RST, BIT(1),
 
 CCU_GATE_DEFINE(onewire_clk, CCU_PARENT_NAME(vctcxo_24m), APBC_ONEWIRE_CLK_RST, BIT(1), 0);
 
-static const struct clk_parent_data sspa_parents[] = {
+CCU_GATE_DEFINE(sspa0_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA0_CLK_RST, BIT(3), 0);
+CCU_GATE_DEFINE(sspa1_i2s_bclk, CCU_PARENT_HW(i2s_bclk), APBC_SSPA1_CLK_RST, BIT(3), 0);
+
+static const struct clk_parent_data sspa0_parents[] = {
 	CCU_PARENT_HW(pll1_d384_6p4),
 	CCU_PARENT_HW(pll1_d192_12p8),
 	CCU_PARENT_HW(pll1_d96_25p6),
@@ -357,10 +360,22 @@ static const struct clk_parent_data sspa_parents[] = {
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
@@ -909,6 +924,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 	[CLK_TIMERS2]		= &timers2_clk.common.hw,
 	[CLK_AIB]		= &aib_clk.common.hw,
 	[CLK_ONEWIRE]		= &onewire_clk.common.hw,
+	[CLK_SSPA0_I2S_BCLK]	= &sspa0_i2s_bclk.common.hw,
+	[CLK_SSPA1_I2S_BCLK]	= &sspa1_i2s_bclk.common.hw,
 	[CLK_SSPA0]		= &sspa0_clk.common.hw,
 	[CLK_SSPA1]		= &sspa1_clk.common.hw,
 	[CLK_DRO]		= &dro_clk.common.hw,

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
