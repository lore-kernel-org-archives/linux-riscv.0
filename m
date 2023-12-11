Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E54DC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 01:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBTW67wlh9gKoS6xgN3zOme96E7sdflFLJGU9HcVhMw=; b=ZcPHz4CHBIXgqe
	dEULh0r+xOpuJi9ao4LKYeSN8GIqUe6HkQf4u8n1YJznJwvqmqU1wDKjd8b4A88Gt/haLhlaZO85D
	JGBUIzhLXoR7dTMd+RWGjmxKkDXWWQiE19vbe3X0QVK/9JnM1r2bovSBVAwXk1wLEfIn8EIG5YErq
	FStucMeGCRz2x6evF7q9tJpPtjDWrp6DrA9tZs3wyZHmuwFOyP0ahDwEV3VZ0hXuzMh5FTDWmrTzC
	IFLLlPoDwusyGbOO5KwI4l4sn0ocg4jpQEr4IkYWUEFtYSVt0vUvDV8FBfs6w8To94BRRtEFFrdH7
	wLDewjrvdbPFDFUiIRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCVFw-003jaj-04;
	Mon, 11 Dec 2023 01:38:48 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCVFq-003jYV-0t
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 01:38:46 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9030A7F8A;
	Mon, 11 Dec 2023 09:38:07 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 09:38:07 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 09:38:07 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Mon, 11 Dec 2023 09:38:06 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Shengyu Qu <wiagn233@outlook.com>, "kernel@esmil.dk" <kernel@esmil.dk>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"krzk@kernel.org" <krzk@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"conor@kernel.org" <conor@kernel.org>, "anup@brainfault.org"
	<anup@brainfault.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>, Michael Zhu
	<michael.zhu@starfivetech.com>, "drew@beagleboard.org" <drew@beagleboard.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Thread-Topic: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Thread-Index: AQHaJFAfN2r53q/6u0mikZZoJRWxOLCez+mAgASMRMA=
Date: Mon, 11 Dec 2023 01:38:06 +0000
Message-ID: <358bcdb3f0ab4a7b9d6bbe17ca1a696d@EXMBX066.cuchost.com>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
 <20231201121410.95298-7-jeeheng.sia@starfivetech.com>
 <TY3P286MB2611F70A3D61788E556C8A30988AA@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TY3P286MB2611F70A3D61788E556C8A30988AA@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_173842_871196_F2C6724E 
X-CRM114-Status: GOOD (  18.79  )
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



> -----Original Message-----
> From: Shengyu Qu <wiagn233@outlook.com>
> Sent: Friday, December 8, 2023 8:09 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> krzk@kernel.org; conor+dt@kernel.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> daniel.lezcano@linaro.org; tglx@linutronix.de; conor@kernel.org; anup@brainfault.org; gregkh@linuxfoundation.org;
> jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu <michael.zhu@starfivetech.com>; drew@beagleboard.org
> Cc: wiagn233@outlook.com; devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100 device tree
> 
> Hello Sia,
Hi Shengyu
> 
> Does the dubhe-80 cores actually support vector? Or vector support
> 
> doesn't exist on actual silicon?
We don't have a use case for vector application in JH8100
> 
> Best regards,
> 
> Shengyu
> 
> > Add initial device tree for the StarFive JH8100 RISC-V SoC.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > ---
> >   arch/riscv/boot/dts/starfive/Makefile       |   2 +
> >   arch/riscv/boot/dts/starfive/jh8100-evb.dts |  28 ++
> >   arch/riscv/boot/dts/starfive/jh8100.dtsi    | 378 ++++++++++++++++++++
> >   3 files changed, 408 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/starfive/jh8100-evb.dts
> >   create mode 100644 arch/riscv/boot/dts/starfive/jh8100.dtsi
> >
> > diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> > index 0141504c0f5c..ef5c7331c7ec 100644
> > --- a/arch/riscv/boot/dts/starfive/Makefile
> > +++ b/arch/riscv/boot/dts/starfive/Makefile
> > @@ -10,3 +10,5 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
> >
> >   dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
> >   dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> > +
> > +dtb-$(CONFIG_ARCH_STARFIVE) += jh8100-evb.dtb
> > diff --git a/arch/riscv/boot/dts/starfive/jh8100-evb.dts b/arch/riscv/boot/dts/starfive/jh8100-evb.dts
> > new file mode 100644
> > index 000000000000..c16bc25d8988
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh8100-evb.dts
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (c) 2021-2023 StarFive Technology Co., Ltd.
> > + */
> > +
> > +#include "jh8100.dtsi"
> > +
> > +/ {
> > +	model = "StarFive JH8100 EVB";
> > +	compatible = "starfive,jh8100-evb", "starfive,jh8100";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	memory@40000000 {
> > +		device_type = "memory";
> > +		reg = <0x0 0x40000000 0x2 0x00000000>;
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/riscv/boot/dts/starfive/jh8100.dtsi b/arch/riscv/boot/dts/starfive/jh8100.dtsi
> > new file mode 100644
> > index 000000000000..f26aff5c1ddf
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh8100.dtsi
> > @@ -0,0 +1,378 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (c) 2021-2023 StarFive Technology Co., Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +/ {
> > +	compatible = "starfive,jh8100";
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		timebase-frequency = <4000000>;
> > +
> > +		cpu0: cpu@0 {
> > +			compatible = "starfive,dubhe-80", "riscv";
> > +			capacity-dmips-mhz = <768>;
> > +			d-cache-block-size = <64>;
> > +			d-cache-sets = <512>;
> > +			d-cache-size = <32768>;
> > +			d-tlb-sets = <1>;
> > +			d-tlb-size = <48>;
> > +			device_type = "cpu";
> > +			i-cache-block-size = <64>;
> > +			i-cache-sets = <512>;
> > +			i-cache-size = <32768>;
> > +			i-tlb-sets = <1>;
> > +			i-tlb-size = <48>;
> > +			mmu-type = "riscv,sv48";
> > +			next-level-cache = <&l2c0>;
> > +			reg = <0x0>;
> > +			riscv,isa = "rv64imafdch";
> > +			riscv,isa-base = "rv64i";
> > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> > +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> > +					       "zba", "zbb", "zbs", "sscofpmf";
> > +			tlb-split;
> > +
> > +			cpu0_intc: interrupt-controller {
> > +				compatible = "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells = <1>;
> > +			};
> > +		};
> > +
> > +		cpu1: cpu@1 {
> > +			compatible = "starfive,dubhe-80", "riscv";
> > +			capacity-dmips-mhz = <768>;
> > +			d-cache-block-size = <64>;
> > +			d-cache-sets = <512>;
> > +			d-cache-size = <32768>;
> > +			d-tlb-sets = <1>;
> > +			d-tlb-size = <48>;
> > +			device_type = "cpu";
> > +			i-cache-block-size = <64>;
> > +			i-cache-sets = <512>;
> > +			i-cache-size = <32768>;
> > +			i-tlb-sets = <1>;
> > +			i-tlb-size = <48>;
> > +			mmu-type = "riscv,sv48";
> > +			next-level-cache = <&l2c1>;
> > +			reg = <0x1>;
> > +			riscv,isa = "rv64imafdch";
> > +			riscv,isa-base = "rv64i";
> > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> > +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> > +					       "zba", "zbb", "zbs", "sscofpmf";
> > +			tlb-split;
> > +
> > +			cpu1_intc: interrupt-controller {
> > +				compatible = "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells = <1>;
> > +			};
> > +		};
> > +
> > +		cpu2: cpu@2 {
> > +			compatible = "starfive,dubhe-90", "riscv";
> > +			capacity-dmips-mhz = <1024>;
> > +			d-cache-block-size = <64>;
> > +			d-cache-sets = <1024>;
> > +			d-cache-size = <65536>;
> > +			d-tlb-sets = <1>;
> > +			d-tlb-size = <48>;
> > +			device_type = "cpu";
> > +			i-cache-block-size = <64>;
> > +			i-cache-sets = <1024>;
> > +			i-cache-size = <65536>;
> > +			i-tlb-sets = <1>;
> > +			i-tlb-size = <48>;
> > +			mmu-type = "riscv,sv48";
> > +			next-level-cache = <&l2c2>;
> > +			reg = <0x2>;
> > +			riscv,isa = "rv64imafdch";
> > +			riscv,isa-base = "rv64i";
> > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> > +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> > +					       "zba", "zbb", "zbs", "sscofpmf";
> > +			tlb-split;
> > +
> > +			cpu2_intc: interrupt-controller {
> > +				compatible = "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells = <1>;
> > +			};
> > +		};
> > +
> > +		cpu3: cpu@3 {
> > +			compatible = "starfive,dubhe-90", "riscv";
> > +			capacity-dmips-mhz = <1024>;
> > +			d-cache-block-size = <64>;
> > +			d-cache-sets = <1024>;
> > +			d-cache-size = <65536>;
> > +			d-tlb-sets = <1>;
> > +			d-tlb-size = <48>;
> > +			device_type = "cpu";
> > +			i-cache-block-size = <64>;
> > +			i-cache-sets = <1024>;
> > +			i-cache-size = <65536>;
> > +			i-tlb-sets = <1>;
> > +			i-tlb-size = <48>;
> > +			mmu-type = "riscv,sv48";
> > +			next-level-cache = <&l2c2>;
> > +			reg = <0x3>;
> > +			riscv,isa = "rv64imafdch";
> > +			riscv,isa-base = "rv64i";
> > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> > +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> > +					       "zba", "zbb", "zbs", "sscofpmf";
> > +			tlb-split;
> > +
> > +			cpu3_intc: interrupt-controller {
> > +				compatible = "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells = <1>;
> > +			};
> > +		};
> > +
> > +		cpu4: cpu@4 {
> > +			compatible = "starfive,dubhe-90", "riscv";
> > +			capacity-dmips-mhz = <1024>;
> > +			d-cache-block-size = <64>;
> > +			d-cache-sets = <1024>;
> > +			d-cache-size = <65536>;
> > +			d-tlb-sets = <1>;
> > +			d-tlb-size = <48>;
> > +			device_type = "cpu";
> > +			i-cache-block-size = <64>;
> > +			i-cache-sets = <1024>;
> > +			i-cache-size = <65536>;
> > +			i-tlb-sets = <1>;
> > +			i-tlb-size = <48>;
> > +			mmu-type = "riscv,sv48";
> > +			next-level-cache = <&l2c2>;
> > +			reg = <0x4>;
> > +			riscv,isa = "rv64imafdch";
> > +			riscv,isa-base = "rv64i";
> > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> > +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> > +					       "zba", "zbb", "zbs", "sscofpmf";
> > +			tlb-split;
> > +
> > +			cpu4_intc: interrupt-controller {
> > +				compatible = "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells = <1>;
> > +			};
> > +		};
> > +
> > +		cpu5: cpu@5 {
> > +			compatible = "starfive,dubhe-90", "riscv";
> > +			capacity-dmips-mhz = <1024>;
> > +			d-cache-block-size = <64>;
> > +			d-cache-sets = <1024>;
> > +			d-cache-size = <65536>;
> > +			d-tlb-sets = <1>;
> > +			d-tlb-size = <48>;
> > +			device_type = "cpu";
> > +			i-cache-block-size = <64>;
> > +			i-cache-sets = <1024>;
> > +			i-cache-size = <65536>;
> > +			i-tlb-sets = <1>;
> > +			i-tlb-size = <48>;
> > +			mmu-type = "riscv,sv48";
> > +			next-level-cache = <&l2c2>;
> > +			reg = <0x5>;
> > +			riscv,isa = "rv64imafdch";
> > +			riscv,isa-base = "rv64i";
> > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> > +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> > +					       "zba", "zbb", "zbs", "sscofpmf";
> > +			tlb-split;
> > +
> > +			cpu5_intc: interrupt-controller {
> > +				compatible = "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells = <1>;
> > +			};
> > +		};
> > +
> > +		cpu-map {
> > +			cluster0 {
> > +				core0 {
> > +					cpu = <&cpu0>;
> > +				};
> > +			};
> > +
> > +			cluster1 {
> > +				core0 {
> > +					cpu = <&cpu1>;
> > +				};
> > +			};
> > +
> > +			cluster2 {
> > +				core0 {
> > +					cpu = <&cpu2>;
> > +				};
> > +
> > +				core1 {
> > +					cpu = <&cpu3>;
> > +				};
> > +
> > +				core2 {
> > +					cpu = <&cpu4>;
> > +				};
> > +
> > +				core3 {
> > +					cpu = <&cpu5>;
> > +				};
> > +			};
> > +		};
> > +
> > +		l2c0: cache-controller-0 {
> > +			compatible = "cache";
> > +			cache-block-size = <64>;
> > +			cache-level = <2>;
> > +			cache-sets = <512>;
> > +			cache-size = <0x40000>;
> > +			cache-unified;
> > +			next-level-cache = <&l3_cache>;
> > +		};
> > +
> > +		l2c1: cache-controller-1 {
> > +			compatible = "cache";
> > +			cache-block-size = <64>;
> > +			cache-level = <2>;
> > +			cache-sets = <512>;
> > +			cache-size = <0x40000>;
> > +			cache-unified;
> > +			next-level-cache = <&l3_cache>;
> > +		};
> > +
> > +		l2c2: cache-controller-2{
> > +			compatible = "cache";
> > +			cache-block-size = <64>;
> > +			cache-level = <2>;
> > +			cache-sets = <4096>;
> > +			cache-size = <0x200000>;
> > +			cache-unified;
> > +			next-level-cache = <&l3_cache>;
> > +		};
> > +
> > +		l3_cache: cache-controller-3 {
> > +			compatible = "cache";
> > +			cache-block-size = <64>;
> > +			cache-level = <3>;
> > +			cache-sets = <8192>;
> > +			cache-size = <0x400000>;
> > +			cache-unified;
> > +		};
> > +	};
> > +
> > +	clk_uart: clk-uart {
> > +		compatible = "fixed-clock"; /* Initial clock handler for UART */
> > +		#clock-cells = <0>;
> > +		clock-frequency = <24000000>;
> > +	};
> > +
> > +	soc {
> > +		compatible = "simple-bus";
> > +		interrupt-parent = <&plic>;
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		clint: clint@2000000 {
> > +			compatible = "starfive,jh8100-clint", "sifive,clint0";
> > +			reg = <0x0 0x2000000 0x0 0x10000>;
> > +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> > +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> > +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> > +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> > +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> > +					      <&cpu5_intc 3>, <&cpu5_intc 7>;
> > +		};
> > +
> > +		plic: interrupt-controller@c000000 {
> > +			#interrupt-cells = <1>;
> > +			#address-cells = <0>;
> > +			compatible = "starfive,jh8100-plic", "sifive,plic-1.0.0";
> > +			reg = <0x0 0x0c000000 0x0 0x4000000>;
> > +			riscv,ndev = <200>;
> > +			interrupt-controller;
> > +			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>,
> > +					      <&cpu0_intc 9>, <&cpu1_intc 9>,
> > +					      <&cpu2_intc 11>, <&cpu3_intc 11>,
> > +					      <&cpu4_intc 11>, <&cpu5_intc 11>,
> > +					      <&cpu2_intc 9>, <&cpu3_intc 9>,
> > +					      <&cpu4_intc 9>, <&cpu5_intc 9>;
> > +		};
> > +
> > +		uart0: serial@12160000 {
> > +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> > +			reg = <0x0 0x12160000 0x0 0x10000>;
> > +			clock-names = "uart_clk", "pclk";
> > +			clocks = <&clk_uart>, <&clk_uart>;
> > +			interrupts = <67>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uart1: serial@12170000  {
> > +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> > +			reg = <0x0 0x12170000 0x0 0x10000>;
> > +			clock-names = "uart_clk", "pclk";
> > +			clocks = <&clk_uart>, <&clk_uart>;
> > +			interrupts = <68>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uart2: serial@12180000  {
> > +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> > +			reg = <0x0 0x12180000 0x0 0x10000>;
> > +			clock-names = "uart_clk", "pclk";
> > +			clocks = <&clk_uart>, <&clk_uart>;
> > +			interrupts = <69>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uart3: serial@12190000  {
> > +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> > +			reg = <0x0 0x12190000 0x0 0x10000>;
> > +			clock-names = "uart_clk", "pclk";
> > +			clocks = <&clk_uart>, <&clk_uart>;
> > +			interrupts = <70>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uart4: serial@121a0000  {
> > +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> > +			reg = <0x0 0x121a0000 0x0 0x10000>;
> > +			clock-names = "uart_clk", "pclk";
> > +			clocks = <&clk_uart>, <&clk_uart>;
> > +			interrupts = <71>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uart5: serial@127d0000  {
> > +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> > +			reg = <0x0 0x127d0000 0x0 0x10000>;
> > +			clock-names = "uart_clk", "pclk";
> > +			clocks = <&clk_uart>, <&clk_uart>;
> > +			interrupts = <72>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uart6: serial@127e0000  {
> > +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> > +			reg = <0x0 0x127e0000 0x0 0x10000>;
> > +			clock-names = "uart_clk", "pclk";
> > +			clocks = <&clk_uart>, <&clk_uart>;
> > +			interrupts = <73>;
> > +			status = "disabled";
> > +		};
> > +	};
> > +};
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
