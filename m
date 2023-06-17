Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A27EB64DD
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 16:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0E7OdDuBZlpsLB/7lPrAf0TQPEbJ2YIBIkxJ/yLGGU=; b=rN8zX9mu3kjqIc
	1jux9S8tezERPNJDzxA0UI6mH8+YvTxiFCFZMx7Z5XuaNdSDNxvJtTkr1Aq+rQKFyoh6RniNnVbEH
	sdOVqNIbDEGBxOaJX6cka6B4kC9CVNsULWorq1xicbd3BG1QUyHo1wwgUEvAO06T3R+nkCiuyisWF
	JjeNJcImjx/oh/rz51PNFwi1gzEDrpgzaG6bfIu7NY7y8Ahc3NJ1ByqimsK6WYuLhyTcRxpntB0fI
	KyOkSWrEfILgprHvG1LJ4CjvyiyaI9UhAVJrYsnY01s/wnXAxms37RSbD724cqSHR38mhyB6jRoHv
	otDEqP/WfL1H0HIBawTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlg-003tY5-0L;
	Sat, 17 Jun 2023 16:27:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlc-003tWz-31
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 16:27:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DBFD60F94;
	Sat, 17 Jun 2023 16:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D5CC43142;
	Sat, 17 Jun 2023 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687019231;
	bh=/rpzt+cUra4ehzWl29wluUAHECrIIYSnbeZnS5OIyCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FJpZFN2jPlnVGf7NIimQwVFz179vyVzGudt8mvNWuUkWEpFNXQF0UVyNBwBp0Kv6B
	 LUDpc+MF6M6AGfoWUivIcrctyPGr/LPM3mncyXYpQDpI/OroymaiJ2gOtutTB1uBP2
	 SNZZbBrsAZC8cz2m3WgjDBOlse0UnRM7iVlTVf9iH2bnz6jq691tPGqBknVBnGb0XS
	 RL8vsIaZYoIufhpTBpfGG2vRgx5f1HuQdJgfPgOy2J+3XWVrBSP0VKwT9n9VIny/v9
	 EW90yIawXcL4NWPdqMg+ZK1UrNv9KJzhFxlk/dnembxvDVUzJRhEoih4Thkk7f0tZk
	 nNJAlzIi/RnaQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 5/8] riscv: dts: add initial T-HEAD TH1520 SoC device tree
Date: Sun, 18 Jun 2023 00:15:26 +0800
Message-Id: <20230617161529.2092-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230617161529.2092-1-jszhang@kernel.org>
References: <20230617161529.2092-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_092713_050844_A9600B2B 
X-CRM114-Status: GOOD (  11.36  )
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

Add initial device tree for the TH1520 RISC-V SoC by T-HEAD.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 422 ++++++++++++++++++++++++++
 1 file changed, 422 insertions(+)
 create mode 100644 arch/riscv/boot/dts/thead/th1520.dtsi

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
new file mode 100644
index 000000000000..56a73134b49e
--- /dev/null
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "thead,th1520";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <3000000>;
+
+		c910_0: cpu@0 {
+			compatible = "thead,c910", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <0>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv39";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		c910_1: cpu@1 {
+			compatible = "thead,c910", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <1>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv39";
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		c910_2: cpu@2 {
+			compatible = "thead,c910", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <2>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv39";
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		c910_3: cpu@3 {
+			compatible = "thead,c910", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <3>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv39";
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+	};
+
+	osc: oscillator {
+		compatible = "fixed-clock";
+		clock-output-names = "osc_24m";
+		#clock-cells = <0>;
+	};
+
+	osc_32k: 32k-oscillator {
+		compatible = "fixed-clock";
+		clock-output-names = "osc_32k";
+		#clock-cells = <0>;
+	};
+
+	apb_clk: apb-clk-clock {
+		compatible = "fixed-clock";
+		clock-output-names = "apb_clk";
+		#clock-cells = <0>;
+	};
+
+	uart_sclk: uart-sclk-clock {
+		compatible = "fixed-clock";
+		clock-output-names = "uart_sclk";
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&plic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		plic: interrupt-controller@ffd8000000 {
+			compatible = "thead,th1520-plic", "thead,c900-plic";
+			reg = <0xff 0xd8000000 0x0 0x01000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
+					      <&cpu1_intc 11>, <&cpu1_intc 9>,
+					      <&cpu2_intc 11>, <&cpu2_intc 9>,
+					      <&cpu3_intc 11>, <&cpu3_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <240>;
+		};
+
+		clint: timer@ffdc000000 {
+			compatible = "thead,th1520-clint", "thead,c900-clint";
+			reg = <0xff 0xdc000000 0x0 0x00010000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>,
+					      <&cpu2_intc 3>, <&cpu2_intc 7>,
+					      <&cpu3_intc 3>, <&cpu3_intc 7>;
+		};
+
+		uart0: serial@ffe7014000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xff 0xe7014000 0x0 0x100>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_sclk>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart1: serial@ffe7f00000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xff 0xe7f00000 0x0 0x100>;
+			interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_sclk>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart3: serial@ffe7f04000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xff 0xe7f04000 0x0 0x100>;
+			interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_sclk>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		gpio2: gpio@ffe7f34000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff 0xe7f34000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portc: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio3: gpio@ffe7f38000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff 0xe7f38000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portd: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <59 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio0: gpio@ffec005000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff 0xec005000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porta: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio1: gpio@ffec006000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff 0xec006000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portb: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		uart2: serial@ffec010000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xff 0xec010000 0x0 0x4000>;
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_sclk>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		dmac0: dma-controller@ffefc00000 {
+			compatible = "snps,axi-dma-1.01a";
+			reg = <0xff 0xefc00000 0x0 0x1000>;
+			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&apb_clk>, <&apb_clk>;
+			clock-names = "core-clk", "cfgr-clk";
+			#dma-cells = <1>;
+			dma-channels = <4>;
+			snps,block-size = <65536 65536 65536 65536>;
+			snps,priority = <0 1 2 3>;
+			snps,dma-masters = <1>;
+			snps,data-width = <4>;
+			snps,axi-max-burst-len = <16>;
+			status = "disabled";
+		};
+
+		timer0: timer@ffefc32000 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0xff 0xefc32000 0x0 0x14>;
+			clocks = <&apb_clk>;
+			clock-names = "timer";
+			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		timer1: timer@ffefc32014 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0xff 0xefc32014 0x0 0x14>;
+			clocks = <&apb_clk>;
+			clock-names = "timer";
+			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		timer2: timer@ffefc32028 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0xff 0xefc32028 0x0 0x14>;
+			clocks = <&apb_clk>;
+			clock-names = "timer";
+			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		timer3: timer@ffefc3203c {
+			compatible = "snps,dw-apb-timer";
+			reg = <0xff 0xefc3203c 0x0 0x14>;
+			clocks = <&apb_clk>;
+			clock-names = "timer";
+			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart4: serial@fff7f08000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xff 0xf7f08000 0x0 0x4000>;
+			interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_sclk>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart5: serial@fff7f0c000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xff 0xf7f0c000 0x0 0x4000>;
+			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uart_sclk>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		timer4: timer@ffffc33000 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0xff 0xffc33000 0x0 0x14>;
+			clocks = <&apb_clk>;
+			clock-names = "timer";
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		timer5: timer@ffffc33014 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0xff 0xffc33014 0x0 0x14>;
+			clocks = <&apb_clk>;
+			clock-names = "timer";
+			interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		timer6: timer@ffffc33028 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0xff 0xffc33028 0x0 0x14>;
+			clocks = <&apb_clk>;
+			clock-names = "timer";
+			interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		timer7: timer@ffffc3303c {
+			compatible = "snps,dw-apb-timer";
+			reg = <0xff 0xffc3303c 0x0 0x14>;
+			clocks = <&apb_clk>;
+			clock-names = "timer";
+			interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ao_gpio0: gpio@fffff41000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff 0xfff41000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <76 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		ao_gpio1: gpio@fffff52000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff 0xfff52000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portf: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+	};
+};
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
