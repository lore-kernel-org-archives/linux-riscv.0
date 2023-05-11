Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93E0C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 00:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vm9U30zewBaMXGXJ5vCOO5TX1Wgs42k69jbPRKcwqiE=; b=tlR/VSPfXWga4R
	qbZp7KyhiB+MaPqKd/QRp/eiQ8NlMUBvXabyd0xg9U+AG3M38U+wP7VXduA5auP/oCccmfAIoonPF
	gcJygXyzFf9FsVE71TXeSOzi+FUSSrZuCM20vQ2aWqqgyBj8GjeGjdxilxT2jb4/6QyHJX60WSJYe
	vOv3h4Rwv8bCjah2QnI9igNBwfkW2aweEaU4POixoVDSUCGZ4vmKdwTE6QKudQ/xpau1vMgoJXFNP
	whFshuiovNH8FcnZ22GCNCJ19kyYv/i3ChS9YYbt69X5dgvkEmdUhJSXFUKCZT/iDeRcqa/si34bd
	Xzh/NB0zaH6WS9c9StAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuHc-007LR6-2W;
	Thu, 11 May 2023 00:35:48 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuHZ-007LQa-1o
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 00:35:47 +0000
Date: Thu, 11 May 2023 08:35:39 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH v2 2/5] riscv: dts: add initial T-HEAD light SoC device
 tree
Message-ID: <ZFw4Ww_hrQ1kOPXI@ofant>
References: <20230510204456.57202-1-frank.li@vivo.com>
 <20230510204456.57202-2-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230510204456.57202-2-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_173545_655495_AE86C997 
X-CRM114-Status: GOOD (  17.80  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yangtao:

On 04:44 Thu 11 May     , Yangtao Li wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Add initial device tree for the TH1520 RISC-V SoC by
> T-HEAD.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -remove reset-sample
> -convert to use thead,c900-plic
> -add pvt node
> -add thermal-zones
>  arch/riscv/boot/dts/thead/th1520.dtsi | 491 ++++++++++++++++++++++++++
>  1 file changed, 491 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/thead/th1520.dtsi
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> new file mode 100644
> index 000000000000..d1d94098b6bf
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -0,0 +1,491 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Alibaba Group Holding Limited.
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Yangtao Li <frank.li@vivo.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	compatible = "thead,th1520";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <3000000>;
> +
> +		c910_0: cpu@0 {
> +			compatible = "thead,c910", "riscv";
> +			device_type = "cpu";
> +			riscv,isa = "rv64imafdc";
> +			reg = <0>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <512>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <512>;
> +			next-level-cache = <&l2_cache>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		c910_1: cpu@1 {
> +			compatible = "thead,c910", "riscv";
> +			device_type = "cpu";
> +			riscv,isa = "rv64imafdc";
> +			reg = <1>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <512>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <512>;
> +			next-level-cache = <&l2_cache>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu1_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		c910_2: cpu@2 {
> +			compatible = "thead,c910", "riscv";
> +			device_type = "cpu";
> +			riscv,isa = "rv64imafdc";
> +			reg = <2>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <512>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <512>;
> +			next-level-cache = <&l2_cache>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu2_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		c910_3: cpu@3 {
> +			compatible = "thead,c910", "riscv";
> +			device_type = "cpu";
> +			riscv,isa = "rv64imafdc";
> +			reg = <3>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <512>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <512>;
> +			next-level-cache = <&l2_cache>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu3_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&c910_0>;
> +				};
> +
> +				core1 {
> +					cpu = <&c910_1>;
> +				};
> +
> +				core2 {
> +					cpu = <&c910_2>;
> +				};
> +
> +				core3 {
> +					cpu = <&c910_3>;
> +				};
> +			};
> +		};
> +
> +		l2_cache: l2-cache {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-size = <1048576>;
> +			cache-sets = <1024>;
> +			cache-unified;
> +		};
> +	};
> +
> +	osc: oscillator {
> +		compatible = "fixed-clock";
> +		clock-output-names = "osc_24m";
> +		#clock-cells = <0>;
> +	};
> +
> +	osc_32k: 32k-oscillator {
> +		compatible = "fixed-clock";
> +		clock-output-names = "osc_32k";
> +		#clock-cells = <0>;
> +	};
> +
> +	apb_clk: apb-clk-clock {
is this a real "fixed-clock" according to hardware spec, or written intentional? e.g before common clk is implemented..

I'd suggest at least document the dummy/fake fixed clocks, so people will know
things need to do in the future?

> +		compatible = "fixed-clock";
> +		clock-output-names = "apb_clk";
> +		#clock-cells = <0>;
> +	};
> +
> +	uart_sclk: uart-sclk-clock {
> +		compatible = "fixed-clock";
> +		clock-output-names = "uart_sclk";
> +		#clock-cells = <0>;
> +	};
> +
> +	pvt_clk: pvt-clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <73728000>;
> +		clock-output-names = "pvt_clk";
> +		#clock-cells = <0>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		interrupt-parent = <&plic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		plic: interrupt-controller@ffd8000000 {
> +			compatible = "thead,c900-plic";
> +			reg = <0xff 0xd8000000 0x0 0x01000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
> +					      <&cpu1_intc 11>, <&cpu1_intc 9>,
> +					      <&cpu2_intc 11>, <&cpu2_intc 9>,
> +					      <&cpu3_intc 11>, <&cpu3_intc 9>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <240>;
> +
> +		};
> +
> +		clint: timer@ffdc000000 {
> +			compatible = "thead,c900-clint";
> +			reg = <0xff 0xdc000000 0x0 0x00010000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> +					      <&cpu3_intc 3>, <&cpu3_intc 7>;
> +		};
> +
> +		uart0: serial@ffe7014000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0xff 0xe7014000 0x0 0x4000>;
> +			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&uart_sclk>;
> +			clock-names = "baudclk";
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@ffe7f00000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0xff 0xe7f00000 0x0 0x4000>;
> +			interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&uart_sclk>;
> +			clock-names = "baudclk";
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@ffe7f04000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0xff 0xe7f04000 0x0 0x4000>;
> +			interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&uart_sclk>;
> +			clock-names = "baudclk";
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		gpio2: gpio@ffe7f34000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff 0xe7f34000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			portc: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		gpio3: gpio@ffe7f38000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff 0xe7f38000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			portd: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <59 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		gpio0: gpio@ffec005000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff 0xec005000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			porta: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		gpio1: gpio@ffec006000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff 0xec006000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			portb: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		uart2: serial@ffec010000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0xff 0xec010000 0x0 0x4000>;
> +			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&uart_sclk>;
> +			clock-names = "baudclk";
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		dmac0: dma-controller@ffefc00000 {
> +			compatible = "snps,axi-dma-1.01a";
> +			reg = <0xff 0xefc00000 0x0 0x1000>;
> +			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&apb_clk>, <&apb_clk>;
> +			clock-names = "core-clk", "cfgr-clk";
> +			#dma-cells = <1>;
> +			dma-channels = <4>;
> +			snps,block-size = <65536 65536 65536 65536>;
> +			snps,priority = <0 1 2 3>;
> +			snps,dma-masters = <1>;
> +			snps,data-width = <4>;
> +			snps,axi-max-burst-len = <16>;
> +			status = "disabled";
> +		};
> +
> +		timer0: timer@ffefc32000 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0xff 0xefc32000 0x0 0x14>;
> +			clocks = <&apb_clk>;
> +			clock-names = "timer";
> +			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		timer1: timer@ffefc32014 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0xff 0xefc32014 0x0 0x14>;
> +			clocks = <&apb_clk>;
> +			clock-names = "timer";
> +			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		timer2: timer@ffefc32028 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0xff 0xefc32028 0x0 0x14>;
> +			clocks = <&apb_clk>;
> +			clock-names = "timer";
> +			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		timer3: timer@ffefc3203c {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0xff 0xefc3203c 0x0 0x14>;
> +			clocks = <&apb_clk>;
> +			clock-names = "timer";
> +			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@fff7f08000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0xff 0xf7f08000 0x0 0x4000>;
> +			interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&uart_sclk>;
> +			clock-names = "baudclk";
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart5: serial@fff7f0c000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0xff 0xf7f0c000 0x0 0x4000>;
> +			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&uart_sclk>;
> +			clock-names = "baudclk";
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		timer4: timer@ffffc33000 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0xff 0xffc33000 0x0 0x14>;
> +			clocks = <&apb_clk>;
> +			clock-names = "timer";
> +			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		timer5: timer@ffffc33014 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0xff 0xffc33014 0x0 0x14>;
> +			clocks = <&apb_clk>;
> +			clock-names = "timer";
> +			interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		timer6: timer@ffffc33028 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0xff 0xffc33028 0x0 0x14>;
> +			clocks = <&apb_clk>;
> +			clock-names = "timer";
> +			interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		timer7: timer@ffffc3303c {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0xff 0xffc3303c 0x0 0x14>;
> +			clocks = <&apb_clk>;
> +			clock-names = "timer";
> +			interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		ao_gpio0: gpio@fffff41000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff 0xfff41000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			porte: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <76 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		pvt: pvt@fffff4e000 {
> +			compatible = "moortec,mr75203";
> +			reg = <0xff 0xfff4e000 0x0 0x80>,
> +			      <0xff 0xfff4e080 0x0 0x100>,
> +			      <0xff 0xfff4e180 0x0 0x680>,
> +			      <0xff 0xfff4e800 0x0 0x600>;
> +			reg-names = "common", "ts", "pd", "vm";
> +			clocks = <&pvt_clk>;
> +			/* TODO: add reset */
> +			#thermal-sensor-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ao_gpio1: gpio@fffff52000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff 0xfff52000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			portf: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +	};
> +
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <2000>;
> +			thermal-sensors = <&pvt 0>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <110000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +};
> -- 
> 2.34.1
> 
How about keeping this patch mininal? e.g only provide basic DT, cpu, clint, plic and
everything up to a working serial console?

Then, we probably can move out dmac, ao_gpio? thermal part, better this will easy maintainer's review
job

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
