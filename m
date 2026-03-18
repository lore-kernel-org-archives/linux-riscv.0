Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663DCFED9E9
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 00:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9MnyPV6tpiufoAG7oa3anJh+VvZl30XYnF2aTcwukdI=; b=OJSdKoLzZrHIwy
	Gf0NM1C/harDp+flpwBV5Q1qYMMruKbq8E46cmBiKWYjSTzuFnJdEMy4FdM6NJnWu6VO8lwqjA2GD
	lsxox3cT7PbZz83yVfd3lP9b2yx8GdD93g+TR0ArhfxTpnwx+6AgkDWTXQn89ta5OqrFM6sPjwcme
	Z3WMoJA8TpRimnbBao12QDVtzmi4MKPZwRMtBcT9KDtasgP6DNc7PEFsH0batMgeLNGO40dOIXYH+
	XMZrFdq8jG5LD5YK6VRs65y7cKQlXxaFu/upxcCBxS+whM1JOgul+5uPUXQqJvHwc1dk4Hfp7IIDc
	bUV1AeTwwXx6aKnrhY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2exU-00000007W3n-23tT;
	Wed, 18 Mar 2026 00:40:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2exS-00000007W3b-3OhL
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Mar 2026 00:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=GYJnfTk/WU/OSIp15gViBGkvIsXEEApvFtBwjk2nW+U=; b=AbDd/2qxxlrjPlwNVL2h/4E6/X
	QK+Y5DQM4fX/gKrhgTVhThbOBAXg4Kd3hNUs9uef1QiMwcfdHgOjx7HB8LU3AmkYgb+LNOX817EYR
	CW4oMSpsc3RhODHboNsZs58zy+Hd+7bi6r8oA8Id0ppIctz9luohb3EMRzXGdTBJ12w8wlfaRFpoK
	/4bjNbE5qv6XYLbY0z1yeBfTSDOzykJonyuZru1Yaq2aeI3pt8mVTnEr/J2NZmapwAUn6JTQXdVbI
	+GIMcmJQW3yZbyzGuBcTmqBidF7OxfsRXLQoSmfh/g1rasIt5EKH0av09z8D0gXJ4i8uJGuRzbQWt
	VKg/Qh0w==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2exH-0000000ADCv-3hsh
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 00:40:20 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-35a1cc6e478so3400475a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 17:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773794408; x=1774399208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GYJnfTk/WU/OSIp15gViBGkvIsXEEApvFtBwjk2nW+U=;
        b=dh5/q8Yu3Uew9Mj6THHYWW5eNkDIwmd2htbKwATOlfqZD8zpM+rG11eH759kifefqY
         wKcUZC9AH0kXc/5c/jKMA7nEMwtWNa22sq8C31mSCY7oo+wSWqlkyxOmG6naXxmy4YJp
         SyUd+/kiPwcFvFrwk2cqnq7duVVa2AorQuECcwFjIo4NTMiBpQKqcU3NUPPe19PGCSzP
         e6GBWl9VuKtxxL9QCpTxKExeyodIBqA+07m4qCy8JoBCccp56m4tr5YlakJraMr+EXEu
         Z5/+xsX9NzKA8UZIPRMRAhtnCmSfRA6URyG7U5NFMqJRNAbQaaWVfUKh61uwAw89YeY2
         jDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773794408; x=1774399208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYJnfTk/WU/OSIp15gViBGkvIsXEEApvFtBwjk2nW+U=;
        b=jTotggbRTJCEp8CAmA7DPYACjflOKK378tIK+ykYw7+LfeaAyUxlYti5+msSAo2ik7
         YWJPH3e8BTg1RS9DiZqKgAroOUJV+CJENGrIEL0hNUsRINXBKdGsZIuoTgyeIGF6eA/R
         qXVQbAScFwDeev0dyPhI64Q6Bdkjeyi0qy46+uBV0REfqA97Ypfp++LEOi9rkpotrEx7
         aLV+iYQkRUOqIACtq/PpRxZyfr2lNR0wvhs+hYMT4/R7BNv3YDqL23kgfgs88cJO7X61
         6NM73lUPbCzqMjl3nSiLj2ZkIaafldHzZc+FlUkLbdh5KIeYtQXRkdYAjrRt3gCOkIn1
         l9Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUB5smPnO1YJuCy4aGGmlnQCUuNgvaRBtbHuW2nAgxnHIxu3Y5S6AfxjqUFiH4fM2U9rmfuRtfXOZifAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyT3kbNwKDYkZUDdNcCp74CMQ7f6PPHuKIu5FQLpaRH08QrmcVX
	IJSM2MmGewf1J2oL8xaxA+rVH9eRorEcGSijslxIYuhpnezqC8qRMZiQ
X-Gm-Gg: ATEYQzzHupgKYtlzrKTf7BFNvHkKB/8ce72MigOs1lNuyx05vBdmyDaMHs9yNfDu+/l
	cfG63CbQDUQPqjd8oIAiWREkC2hOJ1iWdBvQM5bwd9PtRmpng0/nxF/SeKy/V9B5IbnS37scppY
	1m8lnD9N5F4zSn045ycIQIxm5t0SXEDxiUFbT4s9N0uZjI4Zz8lDqpvB16EgfTxkEFsAC4auqoS
	Ppf3gnsFEpxnVltblJYbim+JKpkl6+TFIZwZ+tRXSVWDJwfWCogX/KFVhNIvI9C209chti2d5yz
	ECnSu2MzykZu+DXqrxECWH7X+igIPF/ewOOsVQiUPeZKeCr9szN/bjwxM9XbPFC5tqEyvzhJbfx
	w4VPMZ1eq7Nj/VWA9+4Y0tR0NFER6fmKy1FVQ3NLNFIg053QzR0UDUXioNhvfRX0etJAMI4EoSN
	FB6t/zy+2Cwm+tPuGjguVyKbQ=
X-Received: by 2002:a17:90b:4b:b0:35b:93d8:6aaf with SMTP id 98e67ed59e1d1-35bb9f31500mr1034173a91.19.1773794408245;
        Tue, 17 Mar 2026 17:40:08 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badb90d55sm4274122a91.12.2026.03.17.17.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 17:40:07 -0700 (PDT)
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
Subject: [PATCH v2] riscv: dts: spacemit: Add ethernet device for K3
Date: Wed, 18 Mar 2026 08:39:51 +0800
Message-ID: <20260318003952.205854-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_004018_149273_272B82AC 
X-CRM114-Status: GOOD (  14.33  )
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
index b691304d4b74..c19d6ee51702 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -4,7 +4,10 @@
  * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
  */

+#include <dt-bindings/gpio/gpio.h>
+
 #include "k3.dtsi"
+#include "k3-pinctrl.dtsi"

 / {
 	model = "SpacemiT K3 Pico-ITX";
@@ -12,6 +15,9 @@ / {

 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
+		ethernet2 = &eth2;
 	};

 	chosen {
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
