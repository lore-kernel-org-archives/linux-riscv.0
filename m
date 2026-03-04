Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F13EB7EA0
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NCOA/cV62hDT3QgIo/Y0ts4tIm93D1RlZ9Iu69oxY+w=; b=F/bcQHGhKOE1bw
	Sii+MbV99i78HYIZ08LjH2d8Z3zKb7IB8a50vQ6dxocknRiBjnNkYuM6Zd1aNYVx83mWC3agZW95D
	Fk9SVRPGSP/1RjjARoF0qzBvQjv0zCOoE2jY2YVxgmWqZLuj3rdEoAhxwsoNENgf3LHkNdhdrj0g0
	7zBlGv8sPgonrCgjqGoqdltP6nII6qPrHLBQyNdDEpShXuMmiDz797bbHob6xvcx5Mepf/CWHIJwZ
	GP8elwi5wuTU7XKWAOhtvhSny6GB8ES3g7CCemC/toQ+LaLuuaj0G+74PQUDnMUZA6f7ZrLUSCGjA
	iPsUDfrToI/n/b1gQ0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhYf-0000000GkAD-0P8j;
	Wed, 04 Mar 2026 08:26:17 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhYb-0000000Gk93-3YqW
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 08:26:15 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8297310ce0aso187289b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 00:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772612773; x=1773217573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+0Gl/6jsm6dp6ffbeXLRnGklOmDo7AmQYEeUc9n0f0=;
        b=bv+4sPrAZziJSAqJZTV3l9043OlkPTAcZXZinfm8gQ+228jCVW4aY/tRE/8RyizkQj
         //g+KMQj73eviAcl6788xkSNtW/3yHzHrqh3VZKNVmF2vczAiRKcvinVrkMgfNfosIpH
         35Tuitum01w3jG+31IyGb6ezMOtPXlcPUDfp+pIQC9JSsodyRtnlNDOeW0FYOFaZBo6t
         XJx7EP/tYVCEnxCRBlVbkHACi+ZI57MwOrZHyKYu0FEIunHCC4bFCxsRipGjX3ZTBaiT
         CiTG6SgZZ+AQQ+dpzHdCu8qeIzzNYz3KyVGrgoMc057tWN4dRJpBiorBpmVgCXLkVfpA
         Q8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612773; x=1773217573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+0Gl/6jsm6dp6ffbeXLRnGklOmDo7AmQYEeUc9n0f0=;
        b=VLK52iw9kZR8mfWY0gAn7WT/VWEVphxnlDvklqnYIPuJJvuyAQEAlVdjwN4amErD72
         fZZl74fD6VPjAGTQaz8SLH9yHwuRLKY4o8kpSHp2uykf+cNJDv82wZiu8IQjfOUqF7ri
         liXJrWdFQlfQAU835vuPwjCWtPdFTp+wfDE9ar5188+AWOffwfVWib1IZw9bsBDzkgx0
         SzovJrMAZi8DF3VD3v73cJmTeFNN7qxYdxRyi+IY2DzkB5TzXnQl2e8lAyWSzAXS/PBF
         v4laYzbmAGp58OtZVqQzxnSKeojFjMb57CeosWabG7RhAvKeYUOm3R7fLY72qr3TR+uj
         PEig==
X-Forwarded-Encrypted: i=1; AJvYcCUUZio2HiOrP4VCaetKvMT3qXIVAlnUQjcBW/t6la1dH5YVnT6+xzvpx8p89PdBBH+k9TIvc+gIPjj+4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwooO8j/oRHWhwgW4fx92/Gug6Zf0Vvfq9WCWV4+E5D3TMBdyNs
	2mRELo0BGewy1Vuq0/E7Ejr9j5eo/ZIlSBkoBP7KD1D5L2V4cStFUNQY
X-Gm-Gg: ATEYQzyzIjsIOkUlh2fTA1+PODkV1dbJn1qi7pHkdp0li0SHd01c4GKtbv3+GrSLC/f
	ZLsllPonPvo8PRQqaYyqtl48u4NS2v96jb+8ZiPmx+OvJ/0gI8tIZHjbWFJjJCoYxXR74ApRdYB
	SvYiXOmDWKgeqp0qFkQf6CIha6btR46zUPoXef17Di9LCKFh+ASwE5uNHzoYH4U5SXJp7Zfy0VX
	b419Q6jGMbIHvDXnLK3oDLBchQElKcj82QIHZhDnLxt7uVz7UN85Lf28v/j+tQyRveSM9bYIasd
	MNDqstQp9OhpTz7/OxfFvtXTnA7/tAfs+bcH1OxzwFZvXQW+6adlOHm3lidFnkX106+3tJ0ouPP
	FdoJh3AyVl3rmFMJgvwl2M6Jk41ci3r7peaktKoMb5ClDM/7HbvEHfhbc8xcz77qVvI1JC7AdJO
	K5CE+5wh2yJQiXGoozkToU3/0bdQCnOADjWw==
X-Received: by 2002:a05:6a20:26aa:b0:394:5ac7:8ffa with SMTP id adf61e73a8af0-3982ded341amr1286519637.16.1772612772757;
        Wed, 04 Mar 2026 00:26:12 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7377062904sm1274642a12.30.2026.03.04.00.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:26:12 -0800 (PST)
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
Subject: [PATCH] riscv: dts: spacemit: k3: Add ethernet device node
Date: Wed,  4 Mar 2026 16:25:41 +0800
Message-ID: <20260304082541.1786223-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_002613_891409_25EB33F7 
X-CRM114-Status: UNSURE (   9.56  )
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

Add all ethernet device nodes for K3 SoC. And enable the available
ethernet device for the PICO ITX board.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
Require the following patch series:
1. Basic DT device patch
https://lore.kernel.org/spacemit/20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org
2. Ethernet driver patch
https://lore.kernel.org/spacemit/20260304080721.1658224-1-inochiama@gmail.com
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  20 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  38 +++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 106 +++++++++++++++++++
 3 files changed, 164 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b098dbd0e7a1..47e4fa824417 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -6,6 +6,7 @@

 #include "k3.dtsi"
 #include "k3-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>

 / {
 	model = "SpacemiT K3 Pico-ITX";
@@ -25,6 +26,25 @@ memory@100000000 {
 	};
 };

+&eth0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
+
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
index efb0f1572188..256880192846 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -21,4 +21,42 @@ uart0-0-pins {
 			drive-strength = <25>;
 		};
 	};
+
+	gmac0_cfg: gmac0-cfg {
+		gmac0_base_pins: gmac0-0-pins {
+			pinmux = <K3_PADCONF(0, 1)>,
+				 <K3_PADCONF(1, 1)>,
+				 <K3_PADCONF(2, 1)>,
+				 <K3_PADCONF(3, 1)>,
+				 <K3_PADCONF(6, 1)>,
+				 <K3_PADCONF(7, 1)>,
+				 <K3_PADCONF(11, 1)>,
+				 <K3_PADCONF(12, 1)>,
+				 <K3_PADCONF(13, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		gmac0_rgmii_add_pins: gmac0-1-pins {
+			pinmux = <K3_PADCONF(4, 1)>,
+				 <K3_PADCONF(5, 1)>,
+				 <K3_PADCONF(8, 1)>,
+				 <K3_PADCONF(9, 1)>,
+				 <K3_PADCONF(10, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		gmac0_int_pins: gmac0-3-pins {
+			pinmux = <K3_PADCONF(14, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a3a8ceddabec..237fb00e4bc4 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -438,6 +438,112 @@ soc: soc {
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
+			interrupt-parent = <&saplic>;
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
+			interrupt-parent = <&saplic>;
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
+			interrupt-parent = <&saplic>;
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

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
prerequisite-patch-id: 68c4d869548687dc115dd91e2ffb8f4c11482d86
prerequisite-patch-id: fdadcf964c2cb3406160edb579d99a8d5695f8e6
prerequisite-patch-id: 73b9e745338b0499b849fa4f7f9508987ab39a59
prerequisite-patch-id: cd26770c2160c3c31a406bd8a6b01ab666180ae0
prerequisite-patch-id: 93a515969fca3b15f827b3507979422dda14db8b
prerequisite-patch-id: a637cffacb823aa7ae91e03ed42831ef8fbd0d1f
prerequisite-patch-id: 40c49afe4eb71457913c45ddb720a9c8917aa827
--
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
