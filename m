Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA8CC25B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 21:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WkYNP9hc0ZXM5pqF0ZYqi7fyUpjlchy43kkLmgeWcxU=; b=CFENbwZbncG0Qp
	K999tdzv6phcmlryaaOLYLXAHRF8mHKZg/Nfb6CCeO3vPVukIV6GDci7IZxF8clGnXCnPT2QB6xGX
	BfeSsw3FP2Fl/dtiAAozxYLzL4WDeYAJLaVr98UfFEum0DAsGmxGPLUQbeaOVDCj9swmKZpdR9Up5
	RXOhX29dbvtwhg48kmAo3A3TPSE8xJ255OiLpbz+zi0K+T+b8tTteYkcalr+Q2erTbR/3IVKOkoT9
	OVW0/4zM7baM8IlrW+jxce3/nhSH2eqDJAtrxOqh2QUxdGb0rQqd6veSAnEa2yyeXNqyWDqukgWFE
	mZLbfTRvmsx882ufhImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAGPc-00000007Prf-3Etu;
	Thu, 23 May 2024 21:55:48 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAGPZ-00000007Pqx-2yRQ
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 21:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1716501344; x=1716760544;
	bh=CdQtkbL7rZtxuy08orSqaz6hkhLm53eUyRt02+x9f9s=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FuEBXsKZaynkzfG3KX4+IsWH286zWrcMgL8GC0kNoa0n6/Lda4YKEqx42p3kvpmbg
	 bPPvNaeA1IKzeC/CthceuPOMC6Uf1O3ph+Jw2FLiDaZ7xrXU6ycBb/OJol7Z48/VHZ
	 SLInoKcB7S7d8wiaDwVzv11UgKGJ8bVcAhrkqFuL7EgSxNuEOXy4BFayEpsYftCtPe
	 Mr0HP3bSz7gccx1Pnc5KKX4v0AOdCMhtrUHG4q8y6mUzfIXSwV2VUUJs6SIh3ZnV10
	 kWMhzvLEzNfxD+Jl1StffRryKICDz5C/pZ46ULXXtoeqHYvIfjHZR1g15wGOcJf1JX
	 UvM9z76oq51Ng==
Date: Thu, 23 May 2024 21:55:38 +0000
To: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Henry Bell <dmoo_dv@protonmail.com>
Subject: [PATCH 2/2 v2] RISC-V: add Star64 board devicetree
Message-ID: <3Rwq1VegQtSiNjWbBny27eDBw9sCw4cXHBe_3FgihJ1i3dGI6rMS8xI32f2syRXKoa-XZubm7fMr2SED1haIWWygYWJA9azHqRzV6JSmTVo=@protonmail.com>
Feedback-ID: 106097379:user:proton
X-Pm-Message-ID: ae9242ee3f43ecbe40ad82c9cffbc6db9208979f
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_145546_020283_8E470718 
X-CRM114-Status: UNSURE (   9.22  )
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

The Pine64 Star64 is a development board based on the Starfive JH7110 SoC.
The board features:

- JH7110 SoC
- 4/8 GiB LPDDR4 DRAM
- AXP15060 PMIC
- 40 pin GPIO header
- 1x USB 3.0 host port
- 3x USB 2.0 host port
- 1x eMMC slot
- 1x MicroSD slot
- 1x QSPI Flash
- 2x 1Gbps Ethernet port
- 1x HDMI port
- 1x 4-lane DSI
- 1x 2-lane CSI
- 1x PCIe 2.0 x1 lane

Signed-off-by: Henry Bell <dmoo_dv@protonmail.com>
---

Changes since v1:

- Fix indentation and issues with field ordering
- Update Copyright
- Move from patch 1 to patch 2
---
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../dts/starfive/jh7110-pine64-star64.dts     | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 2fa0cd7f31c3..7a163a7d6ba3 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -9,5 +9,6 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
 
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
new file mode 100644
index 000000000000..fe7e5f3f7f23
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 Henry Bell <dmoo_dv@protonmail.com>
+ */
+
+/dts-v1/;
+#include "jh7110-common.dtsi"
+
+/ {
+	model = "Pine64 Star64";
+	compatible = "pine64,star64", "starfive,jh7110";
+		aliases {
+			ethernet1 = &gmac1;
+		};
+};
+
+&gmac0 {
+	starfive,tx-use-rgmii-clk;
+	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
+	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
+};
+
+&gmac1 {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+	starfive,tx-use-rgmii-clk;
+	assigned-clocks = <&syscrg JH7110_SYSCLK_GMAC1_TX>;
+	assigned-clock-parents = <&syscrg JH7110_SYSCLK_GMAC1_RMII_RTX>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy1: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
+
+&phy0 {
+	rx-internal-delay-ps = <1900>;
+	tx-internal-delay-ps = <1500>;
+	motorcomm,rx-clk-drv-microamp = <2910>;
+	motorcomm,rx-data-drv-microamp = <2910>;
+	motorcomm,tx-clk-adj-enabled;
+	motorcomm,tx-clk-10-inverted;
+	motorcomm,tx-clk-100-inverted;
+	motorcomm,tx-clk-1000-inverted;
+};
+
+&phy1 {
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <300>;
+	motorcomm,rx-clk-drv-microamp = <2910>;
+	motorcomm,rx-data-drv-microamp = <2910>;
+	motorcomm,tx-clk-adj-enabled;
+	motorcomm,tx-clk-10-inverted;
+	motorcomm,tx-clk-100-inverted;
+};
-- 
2.44.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
