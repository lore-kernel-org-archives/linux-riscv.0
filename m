Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5AAC07E98
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 06:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/m85YuWMHaWl4oLOBfOV0c/1QA8jQGOnjpxb7+iTN8=; b=EQ+vOlZ4cyfQl1
	+TKgRnZwLuesW5hkoBlYLKHhY1iofYBzpEd7FmO2dZtHVfwgMVPfcXBR4XA7Pf9Y2xI7U7Kjr5Hxg
	BJXIU/gEA1w0x9/1bJzLiwoXx0ad2NF/HHHorFHcw2sEAFYLzMoUblhshaCXx9jPrOprcX4+H2w+K
	jHzJpOaODLKASgg6+NX0bb+j1mXoqyYyWPXfYW30mgFkIM/QBwQpEX/3wljcQ8zUZoNQDUoW/Dzic
	dHtG35mn7N/RvNWTLprnWBn+1oVyhHj7hrydcaUnNGAGROoPrrtSTWVpL8khCg7ci//49WyU98sX3
	CnMNHNj0yviigQ0rG8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Df6-0079do-1L;
	Wed, 29 Nov 2023 06:03:04 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Def-0079Ez-1X
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 06:02:40 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id ACE6124DD82;
	Wed, 29 Nov 2023 14:02:20 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 14:02:20 +0800
Received: from jsia-virtual-machine.localdomain (60.54.3.230) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 29 Nov 2023 14:02:09 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <kernel@esmil.dk>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <krzk@kernel.org>,
	<conor+dt@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<conor@kernel.org>, <anup@brainfault.org>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>, <michal.simek@amd.com>,
	<michael.zhu@starfivetech.com>, <drew@beagleboard.org>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <jeeheng.sia@starfivetech.com>,
	<leyfoon.tan@starfivetech.com>
Subject: [PATCH v2 6/6] riscv: dts: starfive: Add initial StarFive JH8100 device tree
Date: Wed, 29 Nov 2023 14:00:43 +0800
Message-ID: <20231129060043.368874-7-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [60.54.3.230]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_220237_984342_65222E8D 
X-CRM114-Status: GOOD (  12.36  )
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

Add initial device tree for the StarFive JH8100 RISC-V SoC.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/Makefile       |   1 +
 arch/riscv/boot/dts/starfive/jh8100-evb.dts |  28 ++
 arch/riscv/boot/dts/starfive/jh8100.dtsi    | 378 ++++++++++++++++++++
 3 files changed, 407 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh8100-evb.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh8100.dtsi

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 0141504c0f5c..fbb0dc619102 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -10,3 +10,4 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
 
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh8100-evb.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh8100-evb.dts b/arch/riscv/boot/dts/starfive/jh8100-evb.dts
new file mode 100644
index 000000000000..39a11226731c
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh8100-evb.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+#include "jh8100.dtsi"
+
+/ {
+	model = "StarFive JH8100 EVB";
+	compatible = "starfive,jh8100-evb", "starfive,jh8100";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0x2 0x00000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh8100.dtsi b/arch/riscv/boot/dts/starfive/jh8100.dtsi
new file mode 100644
index 000000000000..f26aff5c1ddf
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh8100.dtsi
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+/ {
+	compatible = "starfive,jh8100";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <4000000>;
+
+		cpu0: cpu@0 {
+			compatible = "starfive,dubhe-80", "riscv";
+			capacity-dmips-mhz = <768>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <48>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <48>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2c0>;
+			reg = <0x0>;
+			riscv,isa = "rv64imafdch";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
+					       "zicsr", "zifencei", "zihintpause", "zihpm",
+					       "zba", "zbb", "zbs", "sscofpmf";
+			tlb-split;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "starfive,dubhe-80", "riscv";
+			capacity-dmips-mhz = <768>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <48>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <48>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2c1>;
+			reg = <0x1>;
+			riscv,isa = "rv64imafdch";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
+					       "zicsr", "zifencei", "zihintpause", "zihpm",
+					       "zba", "zbb", "zbs", "sscofpmf";
+			tlb-split;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu2: cpu@2 {
+			compatible = "starfive,dubhe-90", "riscv";
+			capacity-dmips-mhz = <1024>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <1024>;
+			d-cache-size = <65536>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <48>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <1024>;
+			i-cache-size = <65536>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <48>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2c2>;
+			reg = <0x2>;
+			riscv,isa = "rv64imafdch";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
+					       "zicsr", "zifencei", "zihintpause", "zihpm",
+					       "zba", "zbb", "zbs", "sscofpmf";
+			tlb-split;
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu3: cpu@3 {
+			compatible = "starfive,dubhe-90", "riscv";
+			capacity-dmips-mhz = <1024>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <1024>;
+			d-cache-size = <65536>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <48>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <1024>;
+			i-cache-size = <65536>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <48>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2c2>;
+			reg = <0x3>;
+			riscv,isa = "rv64imafdch";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
+					       "zicsr", "zifencei", "zihintpause", "zihpm",
+					       "zba", "zbb", "zbs", "sscofpmf";
+			tlb-split;
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu4: cpu@4 {
+			compatible = "starfive,dubhe-90", "riscv";
+			capacity-dmips-mhz = <1024>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <1024>;
+			d-cache-size = <65536>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <48>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <1024>;
+			i-cache-size = <65536>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <48>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2c2>;
+			reg = <0x4>;
+			riscv,isa = "rv64imafdch";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
+					       "zicsr", "zifencei", "zihintpause", "zihpm",
+					       "zba", "zbb", "zbs", "sscofpmf";
+			tlb-split;
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu5: cpu@5 {
+			compatible = "starfive,dubhe-90", "riscv";
+			capacity-dmips-mhz = <1024>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <1024>;
+			d-cache-size = <65536>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <48>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <1024>;
+			i-cache-size = <65536>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <48>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2c2>;
+			reg = <0x5>;
+			riscv,isa = "rv64imafdch";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
+					       "zicsr", "zifencei", "zihintpause", "zihpm",
+					       "zba", "zbb", "zbs", "sscofpmf";
+			tlb-split;
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu1>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cpu2>;
+				};
+
+				core1 {
+					cpu = <&cpu3>;
+				};
+
+				core2 {
+					cpu = <&cpu4>;
+				};
+
+				core3 {
+					cpu = <&cpu5>;
+				};
+			};
+		};
+
+		l2c0: cache-controller-0 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <512>;
+			cache-size = <0x40000>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2c1: cache-controller-1 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <512>;
+			cache-size = <0x40000>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2c2: cache-controller-2{
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <4096>;
+			cache-size = <0x200000>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l3_cache: cache-controller-3 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <3>;
+			cache-sets = <8192>;
+			cache-size = <0x400000>;
+			cache-unified;
+		};
+	};
+
+	clk_uart: clk-uart {
+		compatible = "fixed-clock"; /* Initial clock handler for UART */
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&plic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		clint: clint@2000000 {
+			compatible = "starfive,jh8100-clint", "sifive,clint0";
+			reg = <0x0 0x2000000 0x0 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>,
+					      <&cpu2_intc 3>, <&cpu2_intc 7>,
+					      <&cpu3_intc 3>, <&cpu3_intc 7>,
+					      <&cpu4_intc 3>, <&cpu4_intc 7>,
+					      <&cpu5_intc 3>, <&cpu5_intc 7>;
+		};
+
+		plic: interrupt-controller@c000000 {
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			compatible = "starfive,jh8100-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0x0c000000 0x0 0x4000000>;
+			riscv,ndev = <200>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>,
+					      <&cpu0_intc 9>, <&cpu1_intc 9>,
+					      <&cpu2_intc 11>, <&cpu3_intc 11>,
+					      <&cpu4_intc 11>, <&cpu5_intc 11>,
+					      <&cpu2_intc 9>, <&cpu3_intc 9>,
+					      <&cpu4_intc 9>, <&cpu5_intc 9>;
+		};
+
+		uart0: serial@12160000 {
+			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
+			reg = <0x0 0x12160000 0x0 0x10000>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&clk_uart>, <&clk_uart>;
+			interrupts = <67>;
+			status = "disabled";
+		};
+
+		uart1: serial@12170000  {
+			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
+			reg = <0x0 0x12170000 0x0 0x10000>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&clk_uart>, <&clk_uart>;
+			interrupts = <68>;
+			status = "disabled";
+		};
+
+		uart2: serial@12180000  {
+			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
+			reg = <0x0 0x12180000 0x0 0x10000>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&clk_uart>, <&clk_uart>;
+			interrupts = <69>;
+			status = "disabled";
+		};
+
+		uart3: serial@12190000  {
+			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
+			reg = <0x0 0x12190000 0x0 0x10000>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&clk_uart>, <&clk_uart>;
+			interrupts = <70>;
+			status = "disabled";
+		};
+
+		uart4: serial@121a0000  {
+			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
+			reg = <0x0 0x121a0000 0x0 0x10000>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&clk_uart>, <&clk_uart>;
+			interrupts = <71>;
+			status = "disabled";
+		};
+
+		uart5: serial@127d0000  {
+			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
+			reg = <0x0 0x127d0000 0x0 0x10000>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&clk_uart>, <&clk_uart>;
+			interrupts = <72>;
+			status = "disabled";
+		};
+
+		uart6: serial@127e0000  {
+			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
+			reg = <0x0 0x127e0000 0x0 0x10000>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&clk_uart>, <&clk_uart>;
+			interrupts = <73>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
