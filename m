Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B19CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/UkgqqDnAKSBhL8N8n3VmjEyONtv7cIP8DKJlNLvT0=; b=EEvbbXDOrRNoMx
	hN3Kai0JIhHIG+MloQl4+KBlk3q2TwwPpVcQj/SB0xwNKrDePE60/eMWiXNxe6JjA9UFBRgncs1oK
	vfUgzeM8cJpovprUzMw94L3XLxFaKtt1GMr3jMu/wrK5C+2wj2RbZqi8M3Zdq5rEBrfQG+pJf3R6j
	hNjtEuvEmggZNU+tfmF4XHt1b1gtBTpzPSPFBZDgJ+ugwKNMOFTeenYrKnQvpFXg9rSI7eHtmfD1v
	O4jDoaTtaLGb8lneg1W7Z0pCakoh5Cit6uSTof1gk819/sUwoTTsyZHt5EQsZxJvbfDKhfD3vWkkJ
	uurHavlNV8J/y9Vw1BMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo06S-00000007ZGB-09np;
	Mon, 18 Aug 2025 13:40:48 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwBQ-000000073eX-3Tti
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 09:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755509323;
	bh=SK3FakjrDopXlK4b5FMuZJRoz8l5i/5MUhXQJMfoKCo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Oo7FZL1I95o3WPd0/0ENEFRzwqhgTepThuKOV7zJmtmcILk5LpuCnAl0QK5BJvg94
	 buWj1fLZW4h8DLif6YE0v6v5HGA3AYNOETgag28eXLiov5JwODje3BuZvpYPvNkTHa
	 7GIy8TegxKznopLO9s2wVD7YbblRTuYpILdn61rI=
X-QQ-mid: esmtpsz21t1755509314tc4b3f005
X-QQ-Originating-IP: L38W9V9/NIsHLDRox8+OFBX7sY7Zm9fj9dMmiK4F+k0=
Received: from = ( [14.123.254.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 17:28:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2456046681612972940
EX-QQ-RecipientCnt: 17
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 18 Aug 2025 17:28:20 +0800
Subject: [PATCH v3 1/3] dt-bindings: clock: spacemit: introduce i2s
 pre-clock to fix i2s clock
MIME-Version: 1.0
Message-Id: <20250818-k1-clk-i2s-generation-v3-1-8139b22ae709@linux.spacemit.com>
References: <20250818-k1-clk-i2s-generation-v3-0-8139b22ae709@linux.spacemit.com>
In-Reply-To: <20250818-k1-clk-i2s-generation-v3-0-8139b22ae709@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755509307; l=1199;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=/hJv0mzHXIS6bEs1DcXOmRFXRROo56LNrivXaAlRwYY=;
 b=ZtadIMTCPcMoagONLw2fcK0RfQQmIg9zoCpUCUgEN+CJ8bCi+82+iMoYoG1qE3w4cjauBbzxA
 HfHdrwxXtpDAGFvrB4k/veMHhwIUHtM5WEzH7JMVsKAH+BPEXvNtw2Z
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MPRzOxUHFxuwCPq5HbOmX4JTrcV36O+w2ru4UpHsgWDEi4CLKqHhPo2f
	6SOfOv7GikXIsmd1Ne3r2jrkJnI3mnO37OZ0Hf0aqJ8bjub7/tQJIT0gVfTCEj1boLvz9EB
	h8/phjY0d6w0VHA8PHYxAE60+trKzq4q9mk8cTbgqwPuK1xuJG/mwdZstVq1Wbd4La0DT/h
	h1kV7A70lYMGtqNzbsqNPmUW+KkZWkg6PLPxQE/NK7lY7q0hZ58pV8xWkgNhT+3xHPHxXXb
	55mZCWcbMEx6U013UEwN+w7m7MA1Fi99TT1cQ1U9Z7e5CwPSDLDxU4uYdYCUL7sAGT1/bWr
	OnFe4o47yuB1IN6FVRqT/2NsuZ4H8QytT5I1YVRfzb1ObL3ce85CNKxCT8O/Wd+ohUqGAWc
	B7yABLR0ICv8X8I0Wz77JWoDIuYRAuKgDRG/I9kOG1weApy2UxlgfyTfo6w+/IcsN6Urv3x
	vQ64Q4eU8b7fY+jnkbcDkVxH6Di3femC8nvlfzR8rrJl7CI2eGG6qWlYa26cklGAY3LhubF
	N8bXo0B534fBO/K/ikBSRWqqM7rlPZBU/Z1ypbiBzQ53wDlwC/AL4PWbmbBcS0mTS/JxyDo
	R+l2SSRGEcC7Wr47YXH6I0SVPwCsHtioajbK11mkOiYxbrBpEzZGgbkpHbinwmep8ogIeGC
	TqLsQbHWZXD/NE3tENHsMtlDgbiLG4XTqw2UGAILTnwD/EPsjYqX8MA6BefDB5We+tD0MeK
	17B9XzVqAhdjw25LO9Eivt98166hNz3MWU8ewxhI1keQoh6NxkGSvfA8APOMF0DUhTRmd9u
	EuVTrGoyVIT8QghGi4wdCND5mXgeMaFsJCmzYpKSFTlJWM/5hn3CSgcTSSCA3763nYzMtly
	FIScSXsGXBeB7vVec977fZ+jELycK0gXTxuQhoPMPW33BAP+NpoIgjBfOi0te8Ln90oqhTj
	YLllcBmlcP+1lCvFxU5PpmxiRDnL/FaG+iyZ14sPLSyp9tbIRWlUwF4aeN2VMETHS/8r1Oh
	/M7e9NlV0jyqkCipu0zh0rptxgSaVtWh3BGyYVCIkYyPvvWKZ305JbVt7l6matSjkY/JLYc
	vhGp36TnAm8nCisZRs6kn/7q5pH20xpHboZYr27G9CDJQS89nXH6+s=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_022941_750697_B54EE499 
X-CRM114-Status: UNSURE (   9.43  )
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

Previously, the K1 clock driver did not include the parent clocks of
the I2S sysclk.

Introduce pre-clock to fix I2S clock.

Otherwise, the I2S clock may not work as expected.

This patch adds their definitions to allow proper registration
in the driver and usage in the device tree.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/clock/spacemit,k1-syscon.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 2714c3fe66cd5b49e12c8b20689f5b01da36b774..ad62525be43a909633f8d3a65ece1acd60ba8052 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -77,6 +77,10 @@
 #define CLK_I2S_BCLK		30
 #define CLK_APB			31
 #define CLK_WDT_BUS		32
+#define CLK_I2S_153P6		33
+#define CLK_I2S_153P6_BASE	34
+#define CLK_I2S_SYSCLK_SRC	35
+#define CLK_I2S_BCLK_FACTOR	36
 
 /* MPMU resets */
 #define RESET_WDT		0

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
