Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF50C56202
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 20:26:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C3962078B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 20:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YYcwqewR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="QKItkePT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C3962078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1m8xnv3bZqhQnh5uq8SDpOqPgOQvxoFMtSxy6WJ/M/g=; b=YYcwqewRcH8WV2czKI2imcsue
	xfAKKWoyqQXe3dDqPs0fmrvbfoRhNfA9twZzIHyRMxXX1Wz8vWkhsYtLJtIha6a4TF2TnbkajFibY
	cQ5ks1qLIHqivUaXlGtvWMI8rA3R4MNxAkqscS40gWl9o0/eoLLYMvNSw/msSm80hZj8OPMb3pUO7
	6v/3EtzHyTim5U+WMFUHHX05Lo0V5rqDmz8zuPbqDwMIkwCeXOJ4fO5K4scOkUae/6NnzLzPEjKnA
	xIF3+WkJPn0ub4C+x1OpvNLfUt8/DVpla3JaJfvQ26v3xFq1chqpqr8xR++rQcN4ALT77y1SrtF4q
	v7kQKXO3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdfeb-0004xx-UG; Fri, 13 Nov 2020 20:26:42 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdfeG-0004qa-AI
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 20:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605299180; x=1636835180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FMk3GJh6GLOKhmCzjEnTNiYeWbZUVSoitIVCLoGIgAU=;
 b=QKItkePTxtCAkSY0FPbkR+7YKYr4L6vb2cWo1KphF8udK9aqulhxroyl
 DNlSpzJKn0Ke1PTSFNnZPNPiY5WqmcDEU26jiuzOhZo9usNRNFfY3rRyU
 ULEV/VIpKkIUXs/QGnhe2AJI2A4Z18iUQpMx6h0VIVn3ZcbfZcz8vgxmS
 cG/NgqNVUrMSsGV3nRnqbHq00BJQCwNthvIt+LMgGWRfa37Hc1glWTcMp
 zVVWkOYsRYhzx60bfPYia/84J/zBcRHoDLTuTvoDKDWvr+E6+pICWRYXa
 Q2kY+64KKFhe1qj3w7r6Y81DKkFKvnsVj35KGs+JQO7aYI2yo0njii6vR A==;
IronPort-SDR: A4zOXDh5N76OoX7WYbnhdk+jQubWX0CTVH3gMam/ij3pMJGZ+bA7aP3/O/KU65hOZPyCujWgy4
 2Qv0miZ32xzMqd1k/UYcO5FPUtHiOMKn7CHu0cMBCVpO1U5z745G4djwjE+B4rD1EP0qxo4AOe
 jxiIYsmm1+bp+3Zx/WPGTUzXkvjQYeRBjpcr9rK7wvSpgjJSXbRkakFuAYbAXNq5/xq0vRtuDa
 lmumQl+yhh6ML1U+2dX5B3u1Je0KQVbPKkFHjHvKise6u/enBL/HKwzuunr1mhVab2+9PwJGly
 YGQ=
X-IronPort-AV: E=Sophos;i="5.77,476,1596470400"; d="scan'208";a="152497378"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2020 04:26:13 +0800
IronPort-SDR: h3DK4fKZ4pXsHQAgDHVS8PusjtghXsQuKMw88JvilZkmKtYmEQ4DfLRERCTMWTxSyKeszN131U
 iynX164AT+6It/bA/yGVKiO80SnxT5ArH9nfzZtAekykuPAQtsocBkPBYEIk4dydFqQs98TaCJ
 Vq3jtxfxYO1qO03k4a6IPmPh3QJlzT6c9JIatdMsHltmK4VphiyR6iimMmAt9N5KjZkLMSQd99
 MCgTZHORefRrtY8v7w5EZ8Fcepl0IlRdJgrh+nn4MSoYkuOVO0mM9P87kFW5b5roh4F+zIppVp
 SJ1kYRZ1SlfOm5a+H+soSm4M
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 12:12:10 -0800
IronPort-SDR: 5YFuQySbepNhbsikDIBUGove5qdcrLukJ+z0GESpvvcKYmEukgGHfZQQLmUjLDBl6yRNrupQSS
 YtEOoVzPkViw/lrmK8WdMDpiFVaT5pyxoOvlVCbTF3hW6Zk1RNbVFXDcVezkMcD50DbQzekjEy
 ISRLYQHgAgbkFl9mXjBDP566jjc2DcKeK+gcWcL1AmBJHG3XFxd6j4rGjfS8D3W0vbCXhx2hcg
 BQGXJioDu4t5Bt8Dts8TDheRis75NbF1xqrt+u27KxnjppzmAnQmRSNLqYWILl+WVGWoKE1PLF
 0bM=
WDCIronportException: Internal
Received: from usa003372.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.22])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2020 12:26:13 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 3/4] RISC-V: Initial DTS for Microchip ICICLE board
Date: Fri, 13 Nov 2020 12:25:49 -0800
Message-Id: <20201113202550.3693323-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113202550.3693323-1-atish.patra@wdc.com>
References: <20201113202550.3693323-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_152621_266863_F9D90BED 
X-CRM114-Status: GOOD (  15.71  )
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
 Anup Patel <anup.patel@wdc.com>, Conor.Dooley@microchip.com,
 Atish Patra <atish.patra@wdc.com>, Ivan.Griffin@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add initial DTS for Microchip ICICLE board having only
essential devcies (clocks, sdhci, ethernet, serial, etc).
The device tree is based on the U-Boot patch.

https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-padmarao.begari@microchip.com/

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/microchip/Makefile        |   2 +
 .../microchip/microchip-mpfs-icicle-kit.dts   |  54 +++
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 342 ++++++++++++++++++
 4 files changed, 399 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/Makefile
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi

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
index 000000000000..622b12771fd3
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-mpfs-icicle-kit.dtb
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
new file mode 100644
index 000000000000..9a382ab0a799
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2020 Microchip Technology Inc */
+
+/dts-v1/;
+
+#include "microchip-mpfs.dtsi"
+
+/* Clock frequency (in Hz) of the rtcclk */
+#define RTCCLK_FREQ		1000000
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "Microchip PolarFire-SoC Icicle Kit";
+	compatible = "microchip,mpfs-icicle-kit", "microchip,polarfire-soc";
+
+	chosen {
+		stdout-path = &serial0;
+	};
+
+	cpus {
+		timebase-frequency = <RTCCLK_FREQ>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x40000000>;
+		clocks = <&clkcfg 26>;
+	};
+
+	soc {
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&serial1 {
+	status = "okay";
+};
+
+&serial2 {
+	status = "okay";
+};
+
+&serial3 {
+	status = "okay";
+};
+
+&sdcard {
+	status = "okay";
+};
+
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
new file mode 100644
index 000000000000..63ac60f345d8
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2020 Microchip Technology Inc */
+
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "Microchip PolarFire-SoC";
+	compatible = "microchip,polarfire-soc";
+
+	chosen {
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
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
+			clock-output-names = "cpuclk", "axiclk", "ahbclk", "ENVMclk",	/* 0-3   */
+				 "MAC0clk", "MAC1clk", "MMCclk", "TIMERclk",		/* 4-7   */
+				"MMUART0clk", "MMUART1clk", "MMUART2clk", "MMUART3clk",	/* 8-11  */
+				"MMUART4clk", "SPI0clk", "SPI1clk", "I2C0clk",		/* 12-15 */
+				"I2C1clk", "CAN0clk", "CAN1clk", "USBclk",		/* 16-19 */
+				"RESERVED", "RTCclk", "QSPIclk", "GPIO0clk",		/* 20-23 */
+				"GPIO1clk", "GPIO2clk", "DDRCclk", "FIC0clk",		/* 24-27 */
+				"FIC1clk", "FIC2clk", "FIC3clk", "ATHENAclk", "CFMclk";	/* 28-32 */
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
+			status = "disabled";
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
+			status = "disabled";
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
+			status = "disabled";
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
+			status = "disabled";
+		};
+
+		emmc: mmc@20008000 {
+			compatible = "cdns,sd4hc";
+			reg = <0x0 0x20008000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <88 89>;
+			pinctrl-names = "default";
+			clocks = <&clkcfg 6>;
+			bus-width = <4>;
+			cap-mmc-highspeed;
+			mmc-ddr-3_3v;
+			max-frequency = <200000000>;
+			non-removable;
+			no-sd;
+			no-sdio;
+			voltage-ranges = <3300 3300>;
+			status = "disabled";
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
+			status = "disabled";
+		};
+
+		emac0: ethernet@20110000 {
+			compatible = "cdns,macb";
+			reg = <0x0 0x20110000 0x0 0x2000>;
+			interrupt-parent = <&plic>;
+			interrupts = <64 65 66 67>;
+			local-mac-address = [00 00 00 00 00 00];
+			phy-mode = "sgmii";
+			clocks = <&clkcfg 5>, <&clkcfg 2>;
+			clock-names = "pclk", "hclk";
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			phy-handle = <&phy0>;
+			phy0: ethernet-phy@8 {
+				reg = <8>;
+				ti,fifo-depth = <0x01>;
+			};
+		};
+
+		emac1: ethernet@20112000 {
+			compatible = "cdns,macb";
+			reg = <0x0 0x20112000 0x0 0x2000>;
+			interrupt-parent = <&plic>;
+			interrupts = <70 71 72 73>;
+			mac-address = [00 00 00 00 00 00];
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
+	};
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
