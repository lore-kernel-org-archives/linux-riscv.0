Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE862C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 19:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7TNy+bjzipqadSNP2QR3q1SyUJbjni6/W4hvP79m3/c=; b=3i4sSfYe8ZYEff
	rxtVrHsxZY9ZrSVZuzzE+7h0LwYCwTGOQhu02eUKXpqMgDH8M8B0SH3nWgi0X1NMI6Q/oSMTKGiJp
	el5/sAcRv5ZZ1LBY6Pdhb7b3dJOKgaCZKbF7Tv8vk94+xwFbonuOVkGkFr8t2gLtNqhDl6bTnHh9v
	fDNiNUHcC9Esu92xlueZ3qnKFWnBd2bfe8dhc2telStMaRQY/spWkGvAW6OF3t4OatB16OXaL8dMq
	+pubwIhaOaBWcc3+JzA+P5KpUG1HMsoawg1kByR8YHlArMvsrWvNz2ujJz6yMNFQ5QHt13kmquC6z
	ZDKhy1zSuFQi0oaKJr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sADlY-000000075o2-3VJk;
	Thu, 23 May 2024 19:06:16 +0000
Received: from mail-4027.protonmail.ch ([185.70.40.27])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sADlV-000000075nK-3Wd1
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 19:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1716491168; x=1716750368;
	bh=nKVtgmNgCPvFw75ETX/ZyMKoiz86YChWiGXW6xRcOCA=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jDxnH/WOznYscoYQtxSgB0KyFrCgko4jGpNbfRU1q6u9PW1fvjaq5ji1tAjO6zsNL
	 S7RENnVYq60wH3vazDTW6Nk18PoptOaJhkm7oEI63LkmUKp43csQUqYvJ+YnzvBqJA
	 lofoN1gpO3vfdrzHEbJWV7bD2JI9D+zWIhsWQFD+wKgH2ZALKDKhK3NUPpFvR1gSDg
	 2FMj32edjwrAfI/Uv+nECX3xxbh1byGyTWAAyH4ryJGAfbZfjMDY5XfX8V6ua1PuE/
	 2fiBcJDQjbKUXQDIriqkxsHOVesBTQuWgg+FmxedLmofS2rw/jnrdLmXwKir4dXkIi
	 kiNByXT99DRFA==
Date: Thu, 23 May 2024 19:06:04 +0000
To: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: H Bell <dmoo_dv@protonmail.com>
Subject: [PATCH] RISC-V: add Star64 board devicetree
Message-ID: <IPHlm5mOKUzYfwGy0auyufx-oPkSrtQjUjiQLbtvspD69UPX9O98iB8P2mqM8ahNaerz0yUa009f4XABRniq7aj2PUp83hbRVVhhKmqT0Ss=@protonmail.com>
Feedback-ID: 106097379:user:proton
X-Pm-Message-ID: b780bb72757bb9f05bb140b9d649e489d2401f2e
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_120614_056126_DB5646AF 
X-CRM114-Status: UNSURE (   8.38  )
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
Cc: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../dts/starfive/jh7110-pine64-star64.dts     | 62 +++++++++++++++++++
 2 files changed, 63 insertions(+)
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
index 000000000000..c70fffd51181
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+* Copyright (C) 2022 StarFive Technology Co., Ltd.
+* Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
+*/
+
+/dts-v1/;
+#include "jh7110-common.dtsi"
+
+/ {
+	model = "Pine64 Star64";
+	compatible = "pine64,star64", "starfive,jh7110";
+		aliases {
+				ethernet1 = &gmac1;
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
+	status = "okay";
+	starfive,tx-use-rgmii-clk;
+	assigned-clocks = <&syscrg JH7110_SYSCLK_GMAC1_TX>;
+	assigned-clock-parents = <&syscrg JH7110_SYSCLK_GMAC1_RMII_RTX>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy1: ethernet-phy@1 {
+			reg = <0>;
+		};
+	};
+};
+
+&phy0 {
+	motorcomm,tx-clk-adj-enabled;
+	motorcomm,tx-clk-10-inverted;
+	motorcomm,tx-clk-100-inverted;
+	motorcomm,tx-clk-1000-inverted;
+	motorcomm,rx-clk-drv-microamp = <2910>;
+	motorcomm,rx-data-drv-microamp = <2910>;
+	rx-internal-delay-ps = <1900>; 
+	tx-internal-delay-ps = <1500>;
+};
+
+&phy1 {
+	motorcomm,tx-clk-adj-enabled;
+	motorcomm,tx-clk-10-inverted;
+	motorcomm,tx-clk-100-inverted;
+	motorcomm,rx-clk-drv-microamp = <2910>;
+	motorcomm,rx-data-drv-microamp = <2910>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <300>;
+};
-- 
2.44.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
