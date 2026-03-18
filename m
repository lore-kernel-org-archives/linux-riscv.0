Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31465FCD0A1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 03:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CpPJU4zlA4/JN1Hvgcl4g4d4+maPyJNOR6or2U2dv/Y=; b=E232X5a5OPDRPC
	SjeO4Zg9ZVn5G+9wHdsuv89JapAiWIidv57YV9c15GFFefikLOtOpQZceZ448P+mkziWbNWqZdDP/
	ZN/4r4U9lEAWIWaUsTc+PpKUr55bSrx7fzc7y9eJrymqhm+3t+A6A2MInToN6HrZZkbGI1g74B+Oz
	vhp00ssbNB/T0Z40Gjf7praWDn22dS3pGzUT4hK9cZljGOPMs9v/geL3z5+6uQxY1X8Bn8Gaefxa1
	FCG9kVD1+KmrXvi3POaysp1F1xK1WdVAm8VnXjBsYk4U9gJuedUPJN3QFg9B2V6P6FNKUNkYoZ51a
	yICsLOjenmVe5yWPocTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2i0j-00000007jTP-2FNk;
	Wed, 18 Mar 2026 03:55:57 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2i0e-00000007jSq-0gyF
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 03:55:55 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c73d7c8d2daso1759844a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 20:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773806151; x=1774410951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGg8UMXiibHicTB4X6nMgZmWgmaItFkW8YY/rwE261o=;
        b=BQYDlQaoGJJu8bLC47vkfPIYGnrKwxpXHgGt5R5UCLYpQJK5nZBi/g9Tiqq+DnCVme
         2x1+Q5YtGdx3r2jesO7mj/z+20xpXoVv7Hbms43Z/L91xG7ySoEUKtsmz3r7ew/SxE+u
         2ZFjHM0FHPIj3qcc2NmvgSyzhySc+vWzsM9Jn2wz5LK1GmNvJjD0d3GHzfFS6fgVeUCG
         o2xsUQG3HpbCaEi4gN0acG4ZfWDpTuN9gWtNo0I3eEQSf6sY4g3e8owkHersGJQgsKPx
         a+gMUWyud3LRLBMgldk2YBjWSn3IL7X8L486awOc/fOgmLsmi8RWKsQW04qeXZHzQOXT
         mAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806151; x=1774410951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGg8UMXiibHicTB4X6nMgZmWgmaItFkW8YY/rwE261o=;
        b=FYqN5h3FLmcG1LMZ/qOFn4mX7R8B6kgzVvY3UU6hZEvoNnY+kLH7uCAHZxL2SMVXry
         pdUxZU6hHeRPbvNpwaEjTPUSrWXSNMoQ3v1b+yXDPso7FfEeKT18IccRmkAOybhziHKy
         hmodxHzCcWlHJgBfVw+CHGAcQ0EblxFdapIu9f0v9Y6dBf+isNMvVrEpG2HTrDQZiP4Q
         bEZp7fqCuYQCTeNjUENCnRlWviVtPEZNpz6xIsM8/l6XA7+sBIqOIp6i+FNRtJhOMwwm
         uUOQJyyDLN949tO2BUPQKQt8CecxYCiIc6l1HOFuiUlFwurpdzxSr0Uo0dE3vPd4eEfn
         2ylQ==
X-Forwarded-Encrypted: i=1; AJvYcCU580uUEnnJBxqwMK4BDjG0w/8AauzV/TsMV8rNYhHPSLVzWNyNHlcDV6PN1LWEnjt+Nco2xgNbOVRMuA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2WR7gDXKo9AU4QtojWG4Ea3UZ8n84KgxEo3xYCWcorlVA/XyN
	DGvByCY5rpJlDeyVhfTyl1MZ/266IIIzMU9w0CnKqCAzk0R9WWtoK5MR
X-Gm-Gg: ATEYQzxIxeO+/zuCuFkeHL/H2ScrY73AabNV+QubG2Uz9rip4O9cWur0nqVbD8ArMh5
	g/HbDKwfLL1WAx8Y75ZYdf58iOLrsNA7OgdPOkaXQISyS4ZKYk9uHiGJxK+zRTlrT3/pWNQfi4I
	+k/TzVSUs87hdLLLKck6uTH8BW2WW5r4kG1cFwGF9FS/s8OhF7nxtSnAKV62mV1CcNFfGAOrNQl
	rZ9Ugirdkx7sV3J+f2cS9L2RNEPkZVX8Xj6Ft6QYg8QJyCXGTtyfvt8eso+DYsP0B2clN7jNdqC
	EAtHraXdcvsfhTq1PAK1btzf7Z28mYROh+TWXe93W9cpjnIVNYP4gXrY2fZPQIypal4g+ukA+Ji
	en63G3ZoBEjo8XDvZLVxvIlTCsT6BqHYRhbUjnc5xWX9uv5MjxQ81eGJOIcBiKLhc1fPpkjVl2S
	f1piC9DJ+4nXOQ4gWobfWT0FE=
X-Received: by 2002:a05:6a20:2d2b:b0:398:9ae9:7112 with SMTP id adf61e73a8af0-39b99ca188cmr1709226637.1.1773806151105;
        Tue, 17 Mar 2026 20:55:51 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e587078sm928140a12.32.2026.03.17.20.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 20:55:50 -0700 (PDT)
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
Subject: [PATCH v3] riscv: dts: spacemit: Add ethernet device for K3
Date: Wed, 18 Mar 2026 11:55:41 +0800
Message-ID: <20260318035542.517554-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_205553_977539_9EF22F8B 
X-CRM114-Status: GOOD (  13.77  )
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

Changed from v2:
1. keep aliases in alphabetical order.

Changed from v1:
1. remove interrupt-parents property
2. add aliases for ethernet node
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  25 +++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  48 +++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 104 +++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b691304d4b74..28e86e8df4d3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -4,13 +4,19 @@
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
+		ethernet1 = &eth1;
+		ethernet2 = &eth2;
 		serial0 = &uart0;
 	};

@@ -24,6 +30,25 @@ memory@100000000 {
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
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
new file mode 100644
index 000000000000..414ee221d3d7
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -0,0 +1,48 @@
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
