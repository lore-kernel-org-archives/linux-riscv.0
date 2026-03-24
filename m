Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ECBF532E5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KFg3NhZFkwlmPbc0WKkBPv8KV1AIWEaW1qu8e5vl7+c=; b=bQ382sW4U6A4Ll
	ZiuSMkYNF6GBFY/pVK4X4bAiOK7K+bFjCuEN2d6II2VT7n1nWn1Ee8OvO/CDFVA4CWw6F18OF2z4J
	SvoyzhSZTIu/FSioeAFSyMOd5a1/6xxsFvkTBr9mH1sUc4VhfLrKsQQi++R9g3vGxtzMG/HDH4NOX
	xmB+B5S6FAdqVmneRoXByI6R8DVQJ0Fk7rV9FOkFPX5qL+mQ4cpxJYF600XeM35KePMZ5heRzSBBh
	QfFshlaDISjET1h6CS8ai51C6TmjFZ46i1gKboHdkMRIajbqurCsMXNth+kEy/ucvs8NLSvJ2Xj2Z
	FO2XauHLuKgpC2j7GQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vOT-00000000lfF-32Iu;
	Tue, 24 Mar 2026 06:37:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vOR-00000000led-2K5M
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:37:37 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so698877a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 23:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774334255; x=1774939055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xr2Xvg/OPWBnkqCroXt5ZloR5SRa9i++m1RbwL+Orr8=;
        b=HNbxAW2VDMY8S3iQGzssojZA0prEC0ZC2GMyG1rppMMsCUU44fy6M3zSkXeD/pn5Rk
         O/KsMCH1GWxCUG/37TrEAMZ9txJ1la53Qk5hbIdI9ZiDSiGR7BMsZLwzulMSPUbqOBuj
         yPU0XhW7rhkksxNI3lZaX8Z/EyfmITWGvHdUOac1Q58opS7JAc5+tEEjVdPGD41C3Op0
         yTKMQmHK0bGJx8zgWQNrJakxP50raNbnJSz22rbWSUJcjV/fNN+/GxmhjS5/A3/G6wQx
         GQKydVXGG1Bcvq8JelwF/OxU5Fg47JwhqdQpsLGxg5H/+5GW9/RSGoUTQJyHVLYixiNQ
         o9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334255; x=1774939055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr2Xvg/OPWBnkqCroXt5ZloR5SRa9i++m1RbwL+Orr8=;
        b=ZzfxIwy2194uY3k/3kbsdf/yvLqB02vNCdHy8OEuLveKwI6cMOJdYCAflByfjZcCb0
         2rdvRryIzrymzXO/efjwgsNqwHZJfRHrR+jZ3uTumVY/0TPpJb9SYeC9CKGZHH7Ov1qp
         xzAAzoytY3KcLjDMiijqpiNLf5nruwdQTHlSa+XGiCSXufHD9bSg3Uc1iKX23anwqA0s
         YfQL2BtF0c1wrIsGGdxqX/AOObxTvby+5BmWYcbS8BPI5kzenPxXS5nJ5xTt2GG/8CUt
         sqI2+Mx5SOIDJMW1LDHWC/dFqC8O1ryfrVe7h9r6jvqQ+hn4kY1de0lvB/VvWAJPxs7t
         S2sA==
X-Forwarded-Encrypted: i=1; AJvYcCWPlzB8KCaS9SUs+lFiAqlU3mtZrwUK/l3FzaGSduNY327I2xWReMkknmNayaaAeWRTag+xSn1R+JRVOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwsc9cZyh9oasvPdtcCB0CLKSbtpU20ViJNgBe7+faTnLbOlYM
	fydxTIduJJP1GFfp8zF5zORv4+c4vgCD/rrinQMkfyhhINqfMFg0l1Oi
X-Gm-Gg: ATEYQzwmOprxXKgDBb+D6OqlnwsCPCd3Z42yBy6JvAMelgtWr4eiZKqeFoTT0Sig3gE
	n5kwnUObUbBr/xYtDOoqaS4XGB+F2L+1mn08jbS4k/DvaKbkIesP8bSvJ3qqqMIKo6NCJ2nehQp
	p73JQwRQKThXPDCCZMgC4G635PKy5mSsS7bGh8aUgbTkgVl32KlDtJXXp5+CkGU34MOMVDH42/r
	CLRa9yeCmJwWYjDk2OCpOPueyIxaszC03FLfB8+7pFbd/cw3CVKm7GrCqah3Jnj0j3LiZ7RngbA
	mXvV2weTO3Ze1GuznQEi/M7nBqi0g21MNf/Gqf7FAJExXD13zhc2dhKXr/Ba5Fm7f5EiblZ+ZGk
	pPJNsd15BC5Bae8h1je+ikLk9vQhp6TAr9CZWVOBo2e+gtjO3+oXp+Hk7gEo3rklTD1navdmeDC
	kANR2hDnNobyJyKRbEzpVjkbE=
X-Received: by 2002:a17:90b:35d0:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35bd2d0dabcmr14417874a91.28.1774334254580;
        Mon, 23 Mar 2026 23:37:34 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03125347sm1166133a91.4.2026.03.23.23.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:37:34 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5] riscv: dts: spacemit: Add ethernet device for K3
Date: Tue, 24 Mar 2026 14:37:13 +0800
Message-ID: <20260324063714.750428-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_233735_609697_B5A8ECC4 
X-CRM114-Status: GOOD (  14.63  )
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

Add all ethernet device nodes for K3 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
Require the following patch series:
1. Basic DT device patch
https://lore.kernel.org/spacemit/20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org
2. Ethernet driver patch
https://lore.kernel.org/spacemit/20260316010041.164360-1-inochiama@gmail.com

Changed from v4:
1. Fix pinctrl pin name
2. Remove alias for disabled node

Changed from v3:
1. Separate the pin as RGMII pin and INT pin.
2. Add comment for pin usage.
3. Rename the ethernet pinctrl node to address it is RGMII node.

Changed from v2:
1. keep aliases in alphabetical order.

Changed from v1:
1. remove interrupt-parents property
2. add aliases for ethernet node
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  22 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  44 ++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 104 +++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b691304d4b74..025ebbd2f91e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -4,13 +4,17 @@
  * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
  */

+#include <dt-bindings/gpio/gpio.h>
+
 #include "k3.dtsi"
+#include "k3-pinctrl.dtsi"

 / {
 	model = "SpacemiT K3 Pico-ITX";
 	compatible = "spacemit,k3-pico-itx", "spacemit,k3";

 	aliases {
+		ethernet0 = &eth0;
 		serial0 = &uart0;
 	};

@@ -24,6 +28,24 @@ memory@100000000 {
 	};
 };

+&eth0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	mdio {
+		phy0: phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
new file mode 100644
index 000000000000..13731f384bde
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define K3_PADCONF(pin, func) (((pin) << 16) | (func))
+
+&pinctrl {
+	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
+		gmac0-rgmii-0-pins {
+			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */
+				 <K3_PADCONF(1, 1)>,	/* gmac0_rx_d0 */
+				 <K3_PADCONF(2, 1)>,	/* gmac0_rx_d1 */
+				 <K3_PADCONF(3, 1)>,	/* gmac0_rx_clk */
+				 <K3_PADCONF(4, 1)>,	/* gmac0_rx_d2 */
+				 <K3_PADCONF(5, 1)>,	/* gmac0_rx_d3 */
+				 <K3_PADCONF(6, 1)>,	/* gmac0_tx_d0 */
+				 <K3_PADCONF(7, 1)>,	/* gmac0_tx_d1 */
+				 <K3_PADCONF(8, 1)>,	/* gmac0_tx_clk */
+				 <K3_PADCONF(9, 1)>,	/* gmac0_tx_d2 */
+				 <K3_PADCONF(10, 1)>,	/* gmac0_tx_d3 */
+				 <K3_PADCONF(11, 1)>,	/* gmac0_tx_en */
+				 <K3_PADCONF(12, 1)>,	/* gmac0_mdc */
+				 <K3_PADCONF(13, 1)>;	/* gmac0_mdio */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+	};
+
+	gmac0_phy_0_cfg: gmac0-phy-0-cfg {
+		gmac0-phy-0-pins {
+			pinmux = <K3_PADCONF(14, 1)>;   /* gmac0_int */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 6cc31e94c13a..4c0cc135dc09 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -5,6 +5,7 @@
  */

 #include <dt-bindings/clock/spacemit,k3-clocks.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>

 /dts-v1/;
@@ -437,6 +438,109 @@ soc: soc {
 		dma-noncoherent;
 		ranges;

+		gmac_axi_setup: stmmac-axi-config {
+			snps,wr_osr_lmt = <0xf>;
+			snps,rd_osr_lmt = <0xf>;
+			/* max axi burst len is 256 */
+			snps,blen = <256 128 64 32 16 0 0>;
+		};
+
+		eth0: ethernet@cac80000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac80000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC0_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC0_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC0_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupts = <131 IRQ_TYPE_LEVEL_HIGH>,
+				     <276 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC0>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3e4 0x3e8>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth1: ethernet@cac82000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac82000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC1_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC1_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC1_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupts = <133 IRQ_TYPE_LEVEL_HIGH>,
+				     <277 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC1>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3ec 0x3f0>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth2: ethernet@cac8e000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac8e000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC2_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC2_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC2_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupts = <130 IRQ_TYPE_LEVEL_HIGH>,
+				     <278 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC2>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x248 0x24c>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
--
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
