Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C6DC531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 04:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8xrmxgE7//rhR66kObjQX/N6q3PeYeFGZFvTHH0zpU=; b=Vee/px5ivURHNP
	JoMePk8U8XNfatdNXHg6xwDNV2FhTGDyxGqjZHxOWmQJ5oaGUbIPQkrRPWx2isqDJypA4YCqR6asu
	GB0FO2d0ycR8KMyIMopkLj6bhTiRY7i2m2jWS19TMHdzZg0Z7dIp89cQTICMKBtD/5SW6nJqqiP46
	9IKzaRszb90hANDJiQh3FB77e7cqGn6FlRkuuUD6SIVok1jkJntke/H2q3zDc8QQlvCdgM/Wlqs0+
	yYCHVswOwXrxy6xSUxokoG/jWMMtrFX6hiVMwWSuuaghFMVxoRg/YKTJPqknJOGhcFZw9msVDGVJu
	PSy+jG+16Zlm9HC9N2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUMJ-000000000hY-0bTi;
	Sat, 25 Jul 2026 04:51:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUMB-000000000U2-0iUW;
	Sat, 25 Jul 2026 04:51:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76E7E60AB1;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DD4CC4AF50;
	Sat, 25 Jul 2026 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784955085;
	bh=9qrfSi0dqpKDAFRV2RbducxzGp3eRK+ai4x/64wkHRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nteoxp0Ph/UGytwGxmdgheDn6Z60XWNJ5gD5IDzONV1EgRGSIRibgfZ3BvWsvplQ+
	 Xt3vAsgPOM7PXp6hEXd/Rd1j1jhYqEsrokm3LvcLy2qzFYHmzOx9efGbfeJnGkEj6I
	 /Yf37A4LQymOfPkDcYx6/ueTbZGpzQ73L1yGBWSoq9jU+8NKl8lnPB6ejgQg+v04SL
	 nqnbVsvTiuNMqybhwIYT5iBxC/usRSmwdwjppoQY4Ghc/y+oDohpyh6pFlXhzVut8e
	 gG7EFA9antMaaKrbRJBpGVa8mMi4QLWbUOSs9/bhZuVQbl8kWrmS1WeOyrAdE1lzUP
	 OuHBiCiYDv4Kw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FD1C531C9;
	Sat, 25 Jul 2026 04:51:24 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 25 Jul 2026 00:51:23 -0400
Subject: [PATCH RESEND 14/17] riscv: dts: spacemit: k3: add display nodes
MIME-Version: 1.0
Message-Id: <20260725-k3-display-v1-14-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
In-Reply-To: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784955080; l=5154;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=Grthmsr7K7t1VnCPujULIM8MkKQHBQfZ26CPMfOLQdI=;
 b=xzN0JYKMSL4bNrCX8DbfHJ6cepxRnukELKks2PFQ3Bg0Qq9WrmhOaoJADUesuiDpWJFdBrRp/
 MbT4h2/IkwYDTm2n/zy/uYm05y3gZ/rHmC5a48/bOXFgmE8FI01gxLP
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
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
Reply-To: codykang.hk@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Cody Kang <codykang.hk@gmail.com>

Add the SoC-level display nodes: the two Saturn DPUs, the two DP/eDP
controllers with their PHY children.

The PHY PLLs are fed back into the APMU as pixel-clock mux parents, so
updated the &syscon_apmu node in the display dtsi.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-display.dtsi | 156 +++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-display.dtsi b/arch/riscv/boot/dts/spacemit/k3-display.dtsi
new file mode 100644
index 000000000000..4892ee6acda2
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-display.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * SpacemiT K3 display subsystem (DPU0/eDP0 + DPU1/DP1) shared
+ * device-tree definitions for inclusion alongside k3.dtsi.
+ *
+ * Copyright (C) 2026 SpacemiT Co., Ltd.
+ */
+
+#include <dt-bindings/clock/spacemit,k3-clocks.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&soc {
+	dpu0_crtc0: dpu@c0340000 {
+		compatible = "spacemit,k3-saturn-dpu";
+		reg = <0x0 0xc0340000 0x0 0x54000>;
+		interrupts = <90 IRQ_TYPE_LEVEL_HIGH>,
+			     <89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "online", "offline";
+		clocks = <&syscon_apmu CLK_APMU_LCD_PXCLK>,
+			 <&syscon_apmu CLK_APMU_LCD_MCLK>,
+			 <&syscon_apmu CLK_APMU_DPU_ACLK>,
+			 <&syscon_apmu CLK_APMU_DSI_ESC>,
+			 <&syscon_apmu CLK_APMU_LCD_DSC>;
+		clock-names = "pxclk", "mclk", "aclk", "escclk", "dscclk";
+		resets = <&syscon_apmu RESET_APMU_LCD_MCLK>,
+			 <&syscon_apmu RESET_APMU_LCD>,
+			 <&syscon_apmu RESET_APMU_DSI_ESC>,
+			 <&syscon_apmu RESET_APMU_DPU_ACLK>,
+			 <&syscon_apmu RESET_APMU_LCD_DSCCLK>;
+		reset-names = "mclk", "lcd", "esc",
+			      "aclk", "dsc";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dpu0_out: endpoint {
+					remote-endpoint = <&edp0_in>;
+				};
+			};
+		};
+	};
+
+	edp0: edp@cac84000 {
+		compatible = "spacemit,k3-inno-dp";
+		reg = <0x0 0xcac84000 0x0 0x4000>;
+		interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&syscon_apmu CLK_APMU_EDP0_PXCLK>, <&edp0_phy>;
+		clock-names = "pxclk", "pll";
+		resets = <&syscon_apmu RESET_APMU_EDP0>;
+		phys = <&edp0_phy>;
+		phy-names = "dp";
+		status = "disabled";
+
+		edp0_phy: phy {
+			compatible = "spacemit,k3-inno-dp-phy";
+			#phy-cells = <0>;
+			#clock-cells = <0>;
+			clock-output-names = "edp0_pll_pxclk";
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				edp0_in: endpoint {
+					remote-endpoint = <&dpu0_out>;
+				};
+			};
+			/* port@1 (panel output) is added by boards fitting an eDP panel */
+		};
+	};
+
+	dpu1_crtc0: dpu@c0440000 {
+		compatible = "spacemit,k3-saturn-dpu";
+		reg = <0x0 0xc0440000 0x0 0x54000>;
+		interrupts = <139 IRQ_TYPE_LEVEL_HIGH>,
+			     <138 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "online", "offline";
+		clocks = <&syscon_apmu CLK_APMU_DSI4LN2_LCD_PXCLK>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_LCD_MCLK>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_DPU_ACLK>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_DSI_ESC>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_LCD_DSC>;
+		clock-names = "pxclk", "mclk", "aclk", "escclk", "dscclk";
+		resets = <&syscon_apmu RESET_APMU_DSI4LN2_LCD_MCLK>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_LCD_SW>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_ESCCLK>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_DPU_ACLK>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_LCD_DSCCLK>;
+		reset-names = "mclk", "lcd", "esc",
+			      "aclk", "dsc";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dpu1_out: endpoint {
+					remote-endpoint = <&dp1_in>;
+				};
+			};
+		};
+	};
+
+	dp1: dp@cac88000 {
+		compatible = "spacemit,k3-inno-dp";
+		reg = <0x0 0xcac88000 0x0 0x4000>;
+		interrupts = <140 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&syscon_apmu CLK_APMU_EDP1_PXCLK>, <&dp1_phy>;
+		clock-names = "pxclk", "pll";
+		resets = <&syscon_apmu RESET_APMU_EDP1>;
+		phys = <&dp1_phy>;
+		phy-names = "dp";
+		status = "disabled";
+
+		dp1_phy: phy {
+			compatible = "spacemit,k3-inno-dp-phy";
+			#phy-cells = <0>;
+			#clock-cells = <0>;
+			clock-output-names = "edp1_pll_pxclk";
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dp1_in: endpoint {
+					remote-endpoint = <&dpu1_out>;
+				};
+			};
+			/* no port@1: the DP TX drives the external connector directly */
+		};
+	};
+};
+
+/*
+ * Feed the PHY PLL pixel clocks back in as the APMU mux parents. This lives
+ * here, not in k3.dtsi: the PHYs only exist where this file is included.
+ */
+&syscon_apmu {
+	clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>,
+		 <&edp0_phy>, <&dp1_phy>;
+	clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m",
+		      "edp0_pll_pxclk", "edp1_pll_pxclk";
+};

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
