Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E871109E538
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 01:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uvXXNZhZ+b+i8v5xp7q4+801dtOGJuDGhqULp67Yi+Q=; b=pnrIFuGOOT2d8f
	LGf2OaU0och/XTVN1UyBF9VeQoCbFJpOgTHv3N54n/7Tsjvd5ttmTA9e+uDNiaKtb2Wo3Qkxaa92Y
	AtbWTnt8q/Fu/ryyJaqCB+XDKzO0+/mBDeXMbWKog/pyPK7CfdxhlVKEgoUMtWZpdZm/noRfaBfZg
	x36QLkUlvdjVcJQz0DIS8cfQ5OSt9838QAjDs7YTVbcp5BTTe4QXJQxjyHMxdecJRofAYyo3cTycJ
	71TIHtNalNA4rx49H0u8m3oh+Lg5GhbgvSUX/51J1Ctcs5gRi2l+COuV5tn503FGv+kUKtwuo/+fE
	hSJ8MldrXIFNmPd8f7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Znz-00000004XW6-0vvh;
	Thu, 26 Mar 2026 01:46:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Znw-00000004XVY-1SOK
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 01:46:37 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35a094cc3e9so291446a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Mar 2026 18:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774489595; x=1775094395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FvrpaPMv4wQW9rLV6Y/lNvOSwC23X2i4bR0ncVYXo34=;
        b=lEvVgzjtJYmZyQSvEZKDGaeqaY6YbWdk5jZcW2n2f2XOfCG2W0mXpWB0WJV5qxCBLm
         uihdMEUIXP8TACVJSIIbfzSuakYGufgu6UchmZGBzyitOoQNI9j103lX51jT2rHp8Y8q
         cLbibhSpRiyoN2eHTvjx0kp5Vjq497LI6RFXY0MIf/H+PWus+YTymYEqbNbce70PhuJx
         1xpIrLtgZsHWa7K/Gr5y9iUsH8H9F8+ZEZW9LDqovOT/VFSjcu3fnaQQsFL7F6N7VpYm
         FbbBubkxf5siYnZSMK7lKXIgTqC5qyJDTJ/t59CwL6nX5AWQixKvtewfkUy7F1ih1TWf
         XagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489595; x=1775094395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvrpaPMv4wQW9rLV6Y/lNvOSwC23X2i4bR0ncVYXo34=;
        b=aFIa4Fn54EA4KaiqAj5Sk9eC0wU/fHIA7znod5TWYt10G3yQdXJ5UKUWafJd+OSGbc
         846YtZZa9y711XLOe+xTGUXhMiAtcmN8X3m4OyouSNZUl9/0hVAjDcAU03iXBF6Ps0WW
         wCZzzpP02PxjqPlShple2b6wb0lRmoQ/wGdL8nnbPwnOf6gQf474r0mWVTfQ2P/AU3Ga
         dsJ2X17ovwPo2Z9Ygs+bUSZgom3qE5belkPOmY4NtxlAWWjSR36henPuXrlxNwpet0/N
         fVh6zJE+FOQKjFeuRnlNIZwt18Z8wFuOx5hbSkoOGdXWcjhm5z87lhNWnqhQN1mvyE9Q
         skLw==
X-Forwarded-Encrypted: i=1; AJvYcCXv8dx/aoKeBrMfcCpnQYgZ4R+317blNAJvNSW/46gJqRYQsrj1fHtjOKwzPZDAGEW5055fyEczQPEx7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ1Sx97ChySW6sXgvIst82xCiYjRshxaiiULqSz3KEc0eR/kzc
	vXSRayF3WD4j048weBuhrNQ5ImCt5if57gL8RvIx7T6e5dr7+AjmMd6Q
X-Gm-Gg: ATEYQzwDs8BhNE0QVxUDjabvm2RRMhyGX1fK4u0sosBOEKNACPTY6e64H74a5mEAyDq
	lfJpR3gXGjiW0UcSpYZQJZwAU9aBC7SiavL7uMjFjXvTk4cNXokxqRNMhmLBPrzs70dowmTlMWw
	XhB92uofEW67DR1Bf7p2vSqaDra/kWVPCFz1xmsxiTRZQ5o5boqhR/6EyrGeHHiIG9ead0mBWug
	5RfJL458dCUbNMERGeEGFCRE8aft3HLGjQVD8L8gPCye/nL1KBENXUgw3q5GoGSXSwQLgNqfMwZ
	eTG/qpjDp/tzJ9cgGVEdr7Px7ljuVrT1dwOaDKTDjvFFfeNmjb9Nz9JkawLEXNSBCkvMgFZ62IT
	S0DT8+jWY5GiRVvORFm1Kj94hQDFU8NuVHjUor7UGF5zHUhm+TVD0m75B4A47Bkqb3Z/SdhAmYO
	9kxQ5i9T3TNpFKMhN4MgHtuZQ=
X-Received: by 2002:a17:90b:518e:b0:35b:e56e:a17e with SMTP id 98e67ed59e1d1-35c0dd7ac8amr5444206a91.17.1774489595082;
        Wed, 25 Mar 2026 18:46:35 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1dd3800bsm569329a91.1.2026.03.25.18.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:46:34 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6] riscv: dts: spacemit: Add ethernet device for K3
Date: Thu, 26 Mar 2026 09:46:17 +0800
Message-ID: <20260326014617.1011732-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_184636_410171_C2F790E7 
X-CRM114-Status: GOOD (  11.15  )
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

Changed from v5:
1. Fix DT warning cause by stmmac-axi-config.

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
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  20 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  34 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 117 +++++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b098dbd0e7a1..504fe6bd46b2 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -3,6 +3,7 @@
  * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
  * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
  */
+#include <dt-bindings/gpio/gpio.h>

 #include "k3.dtsi"
 #include "k3-pinctrl.dtsi"
@@ -12,6 +13,7 @@ / {
 	compatible = "spacemit,k3-pico-itx", "spacemit,k3";

 	aliases {
+		ethernet0 = &eth0;
 		serial0 = &uart0;
 	};

@@ -25,6 +27,24 @@ memory@100000000 {
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
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index efb0f1572188..a7b5d10c332e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -11,6 +11,40 @@
 #define K3_GPIO(x)	(x / 32) (x % 32)

 &pinctrl {
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
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a3a8ceddabec..5f4818cd5d6d 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -438,6 +438,123 @@ soc: soc {
 		dma-noncoherent;
 		ranges;

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
+			snps,axi-config = <&gmac0_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3e4 0x3e8>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac0_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <0xf>;
+				snps,rd_osr_lmt = <0xf>;
+				/* max axi burst len is 256 */
+				snps,blen = <256 128 64 32 16 0 0>;
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
+			snps,axi-config = <&gmac1_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3ec 0x3f0>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac1_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <0xf>;
+				snps,rd_osr_lmt = <0xf>;
+				/* max axi burst len is 256 */
+				snps,blen = <256 128 64 32 16 0 0>;
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
+			snps,axi-config = <&gmac2_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x248 0x24c>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac2_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <0xf>;
+				snps,rd_osr_lmt = <0xf>;
+				/* max axi burst len is 256 */
+				snps,blen = <256 128 64 32 16 0 0>;
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
