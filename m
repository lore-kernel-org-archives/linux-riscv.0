Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CBDC388F7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 23:28:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A97AA20796
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 23:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zyUcKRLP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="BxPv8DSc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A97AA20796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r9ydAY3yi5jNyPDYwVBbaXmUC0RphYHdQUDSWvhz71c=; b=zyUcKRLPjq8y7093RsQV/VgSs
	fM+7U1ols0jFL+VuXhQJhYKwhREHGh+npQ38u6kwPOqH0Btz4VuYmrGMeR4JhgW8ehbTEKuioLgiT
	NVK3H6bZW0AUD7O2hv1QtLUqNY9ewTlGQbwsDAhPh4D4a0De/Ef8PGasG4XE45I4Iv5SbpxLCOKca
	dr2l88uIHdIOa3Zrlu6RnTqVlMsWn6xDnimwSu/cQG071TTydfBw6ITRb6Hv9BETvxS+ivlP/tmkr
	3hlBS51S1jSN07JfbD0ywzVnnbmDjKuPHwm6k3RX3+VJ3nXA5QZMQ/iPrXHhkSRgdjy2n0bQrnAuY
	X0KSamIrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXurV-0002rs-Vp; Wed, 28 Oct 2020 23:28:14 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXurS-0002q9-2f
 for linux-riscv@lists.infradead.org; Wed, 28 Oct 2020 23:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603927690; x=1635463690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T95q1agPzK7zFnEUCbXsVyLrVC6P4VV5jmkHNG9b3Jw=;
 b=BxPv8DScuv/zTSGZD8ez1tt577rS2B4sr0ThB0NOVQxI4u38nQxiA2C+
 dNd+y1sbCJ7EbK+CKX0mSIK2jd56IsZen0vuJzt5Uq8ZgNqMvqWtqIwHg
 pifBQJ8ijL+qR9qOHOHcXM34hbHcybaTup4Vv/a0a01xKRVaQIRaWkGo9
 SS5OJw1OQlU6mWUOeKm5geYHmx8WmPMVYewEiOKQYvZj8hWNe0FGv/uO2
 boBhN627v9SpwKOglQXn+cGcCohxuq9+748UofRDTDOM+yeseTHEGBZ7h
 EqRTp5DZY7lagOiT7XhYFxayDhYk4EjEtfF19Xc3POhBfEYyN8u7GLckM w==;
IronPort-SDR: o/sjs7Si5IOr18M3VH6Cb5/nSjN4j1qfelHD109f3L6gs8mB0KawdcEoJopXnZ4xuOkVYhvkQG
 PxDyvgsfeD7+e2irfd2kHKX15HNuqZdjwKm46T6mKKY540PxdcPcIZ5H2LdiS+E205eycRUl/3
 BooMLhjWkAjrEvGTQXrpcd0ccHiUzU+0Yq9vmEjC97tN7voeimLgGTbK6EMdNM4FJ3izFXaGx4
 wbbA1Rgpd1f9KoDohJHpfCCcyIpwT06MMq5ZAJ5SqQNnhkHjp4rjq81wBHRymJd7buYT8oiQv0
 XJU=
X-IronPort-AV: E=Sophos;i="5.77,428,1596470400"; d="scan'208";a="152388620"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2020 07:28:07 +0800
IronPort-SDR: 7FIkiSQ8V4ubUb2+yGJFg37ZWE+3K59pFixq/OwWFBIm7I2o+H4p4ofvWuNKZT8IFDM846ijkK
 ED+FcvIKSP2rzKiy399oeYK4Br36KyMhs1CQLNgB1BrmAc0TPVknoJSLsSEML/iJaYzRfANgxZ
 UiK7HtH0AztIDEKbjGhN2iSaoAMq/+UFEIJ0NJ+2TRZMM6AmiKl2XKl52rdEiifVrffcYGXMll
 TfnqOhVr7ASl+gmmqdAQpKpBuPfZucowZzeVgs8ktyznF8OsHXvNHjRdOfmYDdYM5ZQocOhA3G
 X3rlwCV2EiaB1G1MhKbBhDTo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 16:13:15 -0700
IronPort-SDR: sdRoHQdPlyCEHZmgp8+a3JWtc/prLV6e8i85ZXglbSwulbo4SA+7TdtLwTiZ/xFLGk9GHzYAat
 7ymi/80XcAZUkEwRsW3YcaCbzb7udiSB6YtB2QajVBilIxPeVcEJLJ6zeFHQ9pMlqb7i7StsZK
 m8byTaakphoH56tRhCTUF/+mgJ4XRz74nO8Q9rkf/jeCJpo/tsERC3RKNu2h062jABLSkQWFIP
 Kzy9M3CUAQnrZzEAxakgwl+uiheDdLvVUJWC7F4AeSTDd/DCdRqvyT7ZrWHzVp5gjcz7kebcQw
 Cbg=
WDCIronportException: Internal
Received: from myd002180.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.107])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Oct 2020 16:28:07 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
Date: Wed, 28 Oct 2020 16:27:58 -0700
Message-Id: <20201028232759.1928479-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028232759.1928479-1-atish.patra@wdc.com>
References: <20201028232759.1928479-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_192810_258287_5DFCC7F4 
X-CRM114-Status: GOOD (  16.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, padmarao.begari@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add initial DTS for Microchip ICICLE board having only
essential devcies (clocks, sdhci, ethernet, serial, etc).

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/microchip/Makefile        |   2 +
 .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
 3 files changed, 316 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/Makefile
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index ca1f8cbd78c0..3ea94ea0a18a 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
 subdir-y += kendryte
+subdir-y += microchip
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
new file mode 100644
index 000000000000..55ad77521304
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-icicle-kit-a000.dtb
diff --git a/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts b/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
new file mode 100644
index 000000000000..5848920af55c
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2020 Microchip Technology Inc */
+
+/dts-v1/;
+
+/* Clock frequency (in Hz) of the rtcclk */
+#define RTCCLK_FREQ		1000000
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "Microchip PolarFire-SoC";
+	compatible = "microchip,polarfire-soc";
+
+	chosen {
+		stdout-path = &serial0;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <RTCCLK_FREQ>;
+
+		cpu@0 {
+			clock-frequency = <0>;
+			compatible = "sifive,rocket0", "riscv";
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <16384>;
+			reg = <0>;
+			riscv,isa = "rv64imac";
+			status = "disabled";
+
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu@1 {
+			clock-frequency = <0>;
+			compatible = "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <1>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			status = "okay";
+
+			cpu1_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu@2 {
+			clock-frequency = <0>;
+			compatible = "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <2>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			status = "okay";
+
+			cpu2_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu@3 {
+			clock-frequency = <0>;
+			compatible = "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <3>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			status = "okay";
+
+			cpu3_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu@4 {
+			clock-frequency = <0>;
+			compatible = "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <4>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			status = "okay";
+			cpu4_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x40000000>;
+		clocks = <&clkcfg 26>;
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		cache-controller@2010000 {
+			compatible = "sifive,fu540-c000-ccache", "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <1024>;
+			cache-size = <2097152>;
+			cache-unified;
+			interrupt-parent = <&plic>;
+			interrupts = <1 2 3>;
+			reg = <0x0 0x2010000 0x0 0x1000>;
+		};
+
+		clint@2000000 {
+			compatible = "riscv,clint0";
+			reg = <0x0 0x2000000 0x0 0xC000>;
+			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
+						&cpu1_intc 3 &cpu1_intc 7
+						&cpu2_intc 3 &cpu2_intc 7
+						&cpu3_intc 3 &cpu3_intc 7
+						&cpu4_intc 3 &cpu4_intc 7>;
+		};
+
+		plic: interrupt-controller@c000000 {
+			#interrupt-cells = <1>;
+			compatible = "sifive,plic-1.0.0";
+			reg = <0x0 0xc000000 0x0 0x4000000>;
+			riscv,ndev = <53>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11
+					&cpu1_intc 11 &cpu1_intc 9
+					&cpu2_intc 11 &cpu2_intc 9
+					&cpu3_intc 11 &cpu3_intc 9
+					&cpu4_intc 11 &cpu4_intc 9>;
+		};
+
+		dma@3000000 {
+			compatible = "sifive,fu540-c000-pdma";
+			reg = <0x0 0x3000000 0x0 0x8000>;
+			interrupt-parent = <&plic>;
+			interrupts = <23 24 25 26 27 28 29 30>;
+			#dma-cells = <1>;
+		};
+
+		refclk: refclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <600000000>;
+			clock-output-names = "msspllclk";
+		};
+
+		clkcfg: clkcfg@20002000 {
+			compatible = "microchip,pfsoc-clkcfg";
+			reg = <0x0 0x20002000 0x0 0x1000>;
+			reg-names = "mss_sysreg";
+			clocks = <&refclk>;
+			#clock-cells = <1>;
+			clock-output-names = "cpuclk", "axiclk", "ahbclk", "ENVMclk", "MAC0clk", "MAC1clk", "MMCclk", "TIMERclk", "MMUART0clk", "MMUART1clk", "MMUART2clk", "MMUART3clk", "MMUART4clk", "SPI0clk", "SPI1clk", "I2C0clk", "I2C1clk", "CAN0clk", "CAN1clk", "USBclk", "RESERVED", "RTCclk", "QSPIclk", "GPIO0clk", "GPIO1clk", "GPIO2clk", "DDRCclk", "FIC0clk", "FIC1clk", "FIC2clk", "FIC3clk", "ATHENAclk", "CFMclk";
+		};
+
+		serial0: serial@20000000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20000000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <90>;
+			current-speed = <115200>;
+			clocks = <&clkcfg 8>;
+			status = "okay";
+		};
+
+		serial1: serial@20100000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20100000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <91>;
+			current-speed = <115200>;
+			clocks = <&clkcfg 9>;
+			status = "okay";
+		};
+
+		serial2: serial@20102000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20102000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <92>;
+			current-speed = <115200>;
+			clocks = <&clkcfg 10>;
+			status = "okay";
+		};
+
+		serial3: serial@20104000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20104000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <93>;
+			current-speed = <115200>;
+			clocks = <&clkcfg 11>;
+			status = "okay";
+		};
+
+		sdcard: sdhc@20008000 {
+			compatible = "cdns,sd4hc";
+			reg = <0x0 0x20008000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <88>;
+			pinctrl-names = "default";
+			clocks = <&clkcfg 6>;
+			bus-width = <4>;
+			disable-wp;
+			no-1-8-v;
+			cap-mmc-highspeed;
+			cap-sd-highspeed;
+			card-detect-delay = <200>;
+			sd-uhs-sdr12;
+			sd-uhs-sdr25;
+			sd-uhs-sdr50;
+			sd-uhs-sdr104;
+			max-frequency = <200000000>;
+			status = "okay";
+		};
+
+		emac1: ethernet@20112000 {
+			compatible = "cdns,macb";
+			reg = <0x0 0x20112000 0x0 0x2000>;
+			interrupt-parent = <&plic>;
+			interrupts = <70 71 72 73>;
+			mac-address = [56 34 12 00 FC 00];
+			phy-mode = "sgmii";
+			clocks = <&clkcfg 5>, <&clkcfg 2>;
+			clock-names = "pclk", "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			phy1: ethernet-phy@9 {
+				reg = <9>;
+				ti,fifo-depth = <0x01>;
+			};
+		};
+
+		uio_axi_lsram@2030000000 {
+			compatible = "generic-uio";
+			reg = <0x20 0x30000000 0 0x80000000 >;
+			status = "okay";
+		};
+	};
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
