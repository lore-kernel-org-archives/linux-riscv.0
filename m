Return-Path: <SRS0=+x6g=IZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF00C433C1
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 17:22:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D79946196C
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 17:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D79946196C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qh5pB2lCtQp7LCVjoHAMREEDPio00IgmAeS42X87Iic=; b=gAtShyNwSTFwkqctRAUJdH4rC
	RsBBccBeMjZWFD+2opZwJPJzws2u8U8tMivIuJmL2HS4w4ZpuqpGcPOJ0U04rfq81ytsf1Sdyb4tt
	MwXiENZMIqe1NM4o/g3gsmAmFlVBjslmQ72R5yE/aEQM1n3DFJDAKY7RSxp9Yeci3cZLaaBFkoQ98
	eviPiQwcA/0ebT6MAVQeJHMXjnOKzvv2hLaRBV0bk/qxOQx6FABdIzy0g6KVxX4JXtkAX832usiTZ
	AgmjZFm094RfoXijE5Aio6P5vyUwWI88foK+x7bRh2TnYxiIedAUcJMC8g+/nRfJ303T4Bj3gKBWT
	H/zNn286Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQCdq-005LDa-Ju; Sat, 27 Mar 2021 17:22:30 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQCdk-005LDA-M3
 for linux-riscv@lists.infradead.org; Sat, 27 Mar 2021 17:22:27 +0000
X-Originating-IP: 90.112.180.199
Received: from [192.168.1.36] (lfbn-gre-1-220-199.w90-112.abo.wanadoo.fr
 [90.112.180.199]) (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id AE15FE0003;
 Sat, 27 Mar 2021 17:22:14 +0000 (UTC)
Subject: Re: [PATCH v4 3/5] RISC-V: Initial DTS for Microchip ICICLE board
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>, Anup Patel
 <anup.patel@wdc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Conor.Dooley@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
References: <20210303200253.1827553-1-atish.patra@wdc.com>
 <20210303200253.1827553-4-atish.patra@wdc.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <7eb2b954-6b0a-b143-9107-57f4dd90d0cf@ghiti.fr>
Date: Sat, 27 Mar 2021 13:22:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210303200253.1827553-4-atish.patra@wdc.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_172224_845479_47E55CF5 
X-CRM114-Status: GOOD (  18.89  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

Le 3/3/21 =E0 3:02 PM, Atish Patra a =E9crit=A0:
> Add initial DTS for Microchip ICICLE board having only
> essential devices (clocks, sdhci, ethernet, serial, etc).
> The device tree is based on the U-Boot patch.
> =

> https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-p=
admarao.begari@microchip.com/
> =

> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>   arch/riscv/boot/dts/Makefile                  |   1 +
>   arch/riscv/boot/dts/microchip/Makefile        |   2 +
>   .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
>   .../boot/dts/microchip/microchip-mpfs.dtsi    | 329 ++++++++++++++++++
>   4 files changed, 404 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>   create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-=
kit.dts
>   create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> =

> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 7ffd502e3e7b..fe996b88319e 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   subdir-y +=3D sifive
>   subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) +=3D canaan
> +subdir-y +=3D microchip
>   =

>   obj-$(CONFIG_BUILTIN_DTB) :=3D $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts=
/microchip/Makefile
> new file mode 100644
> index 000000000000..622b12771fd3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) +=3D microchip-mpfs-icicle-kit.dtb

I'm playing (or trying to...) with XIP_KERNEL and I had to add the =

following to have the device tree actually builtin the kernel:

diff --git a/arch/riscv/boot/dts/microchip/Makefile =

b/arch/riscv/boot/dts/microchip/Makefile
index 622b12771fd3..855c1502d912 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -1,2 +1,3 @@
  # SPDX-License-Identifier: GPL-2.0
  dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) +=3D microchip-mpfs-icicle-kit.dtb
+obj-$(CONFIG_BUILTIN_DTB) +=3D $(addsuffix .o, $(dtb-y))

Alex

> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts =
b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> new file mode 100644
> index 000000000000..ec79944065c9
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020 Microchip Technology Inc */
> +
> +/dts-v1/;
> +
> +#include "microchip-mpfs.dtsi"
> +
> +/* Clock frequency (in Hz) of the rtcclk */
> +#define RTCCLK_FREQ		1000000
> +
> +/ {
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +	model =3D "Microchip PolarFire-SoC Icicle Kit";
> +	compatible =3D "microchip,mpfs-icicle-kit";
> +
> +	chosen {
> +		stdout-path =3D &serial0;
> +	};
> +
> +	cpus {
> +		timebase-frequency =3D <RTCCLK_FREQ>;
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x80000000 0x0 0x40000000>;
> +		clocks =3D <&clkcfg 26>;
> +	};
> +
> +	soc {
> +	};
> +};
> +
> +&serial0 {
> +	status =3D "okay";
> +};
> +
> +&serial1 {
> +	status =3D "okay";
> +};
> +
> +&serial2 {
> +	status =3D "okay";
> +};
> +
> +&serial3 {
> +	status =3D "okay";
> +};
> +
> +&sdcard {
> +	status =3D "okay";
> +};
> +
> +&emac0 {
> +	phy-mode =3D "sgmii";
> +	phy-handle =3D <&phy0>;
> +	phy0: ethernet-phy@8 {
> +		reg =3D <8>;
> +		ti,fifo-depth =3D <0x01>;
> +	};
> +};
> +
> +&emac1 {
> +	status =3D "okay";
> +	phy-mode =3D "sgmii";
> +	phy-handle =3D <&phy1>;
> +	phy1: ethernet-phy@9 {
> +		reg =3D <9>;
> +		ti,fifo-depth =3D <0x01>;
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/ris=
cv/boot/dts/microchip/microchip-mpfs.dtsi
> new file mode 100644
> index 000000000000..b9819570a7d1
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020 Microchip Technology Inc */
> +
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +	model =3D "Microchip MPFS Icicle Kit";
> +	compatible =3D "microchip,mpfs-icicle-kit";
> +
> +	chosen {
> +	};
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu@0 {
> +			clock-frequency =3D <0>;
> +			compatible =3D "sifive,e51", "sifive,rocket0", "riscv";
> +			device_type =3D "cpu";
> +			i-cache-block-size =3D <64>;
> +			i-cache-sets =3D <128>;
> +			i-cache-size =3D <16384>;
> +			reg =3D <0>;
> +			riscv,isa =3D "rv64imac";
> +			status =3D "disabled";
> +
> +			cpu0_intc: interrupt-controller {
> +				#interrupt-cells =3D <1>;
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu@1 {
> +			clock-frequency =3D <0>;
> +			compatible =3D "sifive,u54-mc", "sifive,rocket0", "riscv";
> +			d-cache-block-size =3D <64>;
> +			d-cache-sets =3D <64>;
> +			d-cache-size =3D <32768>;
> +			d-tlb-sets =3D <1>;
> +			d-tlb-size =3D <32>;
> +			device_type =3D "cpu";
> +			i-cache-block-size =3D <64>;
> +			i-cache-sets =3D <64>;
> +			i-cache-size =3D <32768>;
> +			i-tlb-sets =3D <1>;
> +			i-tlb-size =3D <32>;
> +			mmu-type =3D "riscv,sv39";
> +			reg =3D <1>;
> +			riscv,isa =3D "rv64imafdc";
> +			tlb-split;
> +			status =3D "okay";
> +
> +			cpu1_intc: interrupt-controller {
> +				#interrupt-cells =3D <1>;
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu@2 {
> +			clock-frequency =3D <0>;
> +			compatible =3D "sifive,u54-mc", "sifive,rocket0", "riscv";
> +			d-cache-block-size =3D <64>;
> +			d-cache-sets =3D <64>;
> +			d-cache-size =3D <32768>;
> +			d-tlb-sets =3D <1>;
> +			d-tlb-size =3D <32>;
> +			device_type =3D "cpu";
> +			i-cache-block-size =3D <64>;
> +			i-cache-sets =3D <64>;
> +			i-cache-size =3D <32768>;
> +			i-tlb-sets =3D <1>;
> +			i-tlb-size =3D <32>;
> +			mmu-type =3D "riscv,sv39";
> +			reg =3D <2>;
> +			riscv,isa =3D "rv64imafdc";
> +			tlb-split;
> +			status =3D "okay";
> +
> +			cpu2_intc: interrupt-controller {
> +				#interrupt-cells =3D <1>;
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu@3 {
> +			clock-frequency =3D <0>;
> +			compatible =3D "sifive,u54-mc", "sifive,rocket0", "riscv";
> +			d-cache-block-size =3D <64>;
> +			d-cache-sets =3D <64>;
> +			d-cache-size =3D <32768>;
> +			d-tlb-sets =3D <1>;
> +			d-tlb-size =3D <32>;
> +			device_type =3D "cpu";
> +			i-cache-block-size =3D <64>;
> +			i-cache-sets =3D <64>;
> +			i-cache-size =3D <32768>;
> +			i-tlb-sets =3D <1>;
> +			i-tlb-size =3D <32>;
> +			mmu-type =3D "riscv,sv39";
> +			reg =3D <3>;
> +			riscv,isa =3D "rv64imafdc";
> +			tlb-split;
> +			status =3D "okay";
> +
> +			cpu3_intc: interrupt-controller {
> +				#interrupt-cells =3D <1>;
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu@4 {
> +			clock-frequency =3D <0>;
> +			compatible =3D "sifive,u54-mc", "sifive,rocket0", "riscv";
> +			d-cache-block-size =3D <64>;
> +			d-cache-sets =3D <64>;
> +			d-cache-size =3D <32768>;
> +			d-tlb-sets =3D <1>;
> +			d-tlb-size =3D <32>;
> +			device_type =3D "cpu";
> +			i-cache-block-size =3D <64>;
> +			i-cache-sets =3D <64>;
> +			i-cache-size =3D <32768>;
> +			i-tlb-sets =3D <1>;
> +			i-tlb-size =3D <32>;
> +			mmu-type =3D "riscv,sv39";
> +			reg =3D <4>;
> +			riscv,isa =3D "rv64imafdc";
> +			tlb-split;
> +			status =3D "okay";
> +			cpu4_intc: interrupt-controller {
> +				#interrupt-cells =3D <1>;
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +			};
> +		};
> +	};
> +
> +	soc {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		compatible =3D "simple-bus";
> +		ranges;
> +
> +		cache-controller@2010000 {
> +			compatible =3D "sifive,fu540-c000-ccache", "cache";
> +			cache-block-size =3D <64>;
> +			cache-level =3D <2>;
> +			cache-sets =3D <1024>;
> +			cache-size =3D <2097152>;
> +			cache-unified;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <1 2 3>;
> +			reg =3D <0x0 0x2010000 0x0 0x1000>;
> +		};
> +
> +		clint@2000000 {
> +			compatible =3D "sifive,clint0";
> +			reg =3D <0x0 0x2000000 0x0 0xC000>;
> +			interrupts-extended =3D <&cpu0_intc 3 &cpu0_intc 7
> +						&cpu1_intc 3 &cpu1_intc 7
> +						&cpu2_intc 3 &cpu2_intc 7
> +						&cpu3_intc 3 &cpu3_intc 7
> +						&cpu4_intc 3 &cpu4_intc 7>;
> +		};
> +
> +		plic: interrupt-controller@c000000 {
> +			#interrupt-cells =3D <1>;
> +			compatible =3D "sifive,plic-1.0.0";
> +			reg =3D <0x0 0xc000000 0x0 0x4000000>;
> +			riscv,ndev =3D <186>;
> +			interrupt-controller;
> +			interrupts-extended =3D <&cpu0_intc 11
> +					&cpu1_intc 11 &cpu1_intc 9
> +					&cpu2_intc 11 &cpu2_intc 9
> +					&cpu3_intc 11 &cpu3_intc 9
> +					&cpu4_intc 11 &cpu4_intc 9>;
> +		};
> +
> +		dma@3000000 {
> +			compatible =3D "sifive,fu540-c000-pdma";
> +			reg =3D <0x0 0x3000000 0x0 0x8000>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <23 24 25 26 27 28 29 30>;
> +			#dma-cells =3D <1>;
> +		};
> +
> +		refclk: refclk {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <600000000>;
> +			clock-output-names =3D "msspllclk";
> +		};
> +
> +		clkcfg: clkcfg@20002000 {
> +			compatible =3D "microchip,mpfs-clkcfg";
> +			reg =3D <0x0 0x20002000 0x0 0x1000>;
> +			reg-names =3D "mss_sysreg";
> +			clocks =3D <&refclk>;
> +			#clock-cells =3D <1>;
> +			clock-output-names =3D "cpu", "axi", "ahb", "envm",	/* 0-3   */
> +				 "mac0", "mac1", "mmc", "timer",		/* 4-7   */
> +				"mmuart0", "mmuart1", "mmuart2", "mmuart3",	/* 8-11  */
> +				"mmuart4", "spi0", "spi1", "i2c0",		/* 12-15 */
> +				"i2c1", "can0", "can1", "usb",			/* 16-19 */
> +				"rsvd", "rtc", "qspi", "gpio0",			/* 20-23 */
> +				"gpio1", "gpio2", "ddrc", "fic0",		/* 24-27 */
> +				"fic1", "fic2", "fic3", "athena", "cfm";	/* 28-32 */
> +		};
> +
> +		serial0: serial@20000000 {
> +			compatible =3D "ns16550a";
> +			reg =3D <0x0 0x20000000 0x0 0x400>;
> +			reg-io-width =3D <4>;
> +			reg-shift =3D <2>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <90>;
> +			current-speed =3D <115200>;
> +			clocks =3D <&clkcfg 8>;
> +			status =3D "disabled";
> +		};
> +
> +		serial1: serial@20100000 {
> +			compatible =3D "ns16550a";
> +			reg =3D <0x0 0x20100000 0x0 0x400>;
> +			reg-io-width =3D <4>;
> +			reg-shift =3D <2>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <91>;
> +			current-speed =3D <115200>;
> +			clocks =3D <&clkcfg 9>;
> +			status =3D "disabled";
> +		};
> +
> +		serial2: serial@20102000 {
> +			compatible =3D "ns16550a";
> +			reg =3D <0x0 0x20102000 0x0 0x400>;
> +			reg-io-width =3D <4>;
> +			reg-shift =3D <2>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <92>;
> +			current-speed =3D <115200>;
> +			clocks =3D <&clkcfg 10>;
> +			status =3D "disabled";
> +		};
> +
> +		serial3: serial@20104000 {
> +			compatible =3D "ns16550a";
> +			reg =3D <0x0 0x20104000 0x0 0x400>;
> +			reg-io-width =3D <4>;
> +			reg-shift =3D <2>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <93>;
> +			current-speed =3D <115200>;
> +			clocks =3D <&clkcfg 11>;
> +			status =3D "disabled";
> +		};
> +
> +		emmc: mmc@20008000 {
> +			compatible =3D "cdns,sd4hc";
> +			reg =3D <0x0 0x20008000 0x0 0x1000>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <88 89>;
> +			pinctrl-names =3D "default";
> +			clocks =3D <&clkcfg 6>;
> +			bus-width =3D <4>;
> +			cap-mmc-highspeed;
> +			mmc-ddr-3_3v;
> +			max-frequency =3D <200000000>;
> +			non-removable;
> +			no-sd;
> +			no-sdio;
> +			voltage-ranges =3D <3300 3300>;
> +			status =3D "disabled";
> +		};
> +
> +		sdcard: sdhc@20008000 {
> +			compatible =3D "cdns,sd4hc";
> +			reg =3D <0x0 0x20008000 0x0 0x1000>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <88>;
> +			pinctrl-names =3D "default";
> +			clocks =3D <&clkcfg 6>;
> +			bus-width =3D <4>;
> +			disable-wp;
> +			cap-sd-highspeed;
> +			card-detect-delay =3D <200>;
> +			sd-uhs-sdr12;
> +			sd-uhs-sdr25;
> +			sd-uhs-sdr50;
> +			sd-uhs-sdr104;
> +			max-frequency =3D <200000000>;
> +			status =3D "disabled";
> +		};
> +
> +		emac0: ethernet@20110000 {
> +			compatible =3D "cdns,macb";
> +			reg =3D <0x0 0x20110000 0x0 0x2000>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <64 65 66 67>;
> +			local-mac-address =3D [00 00 00 00 00 00];
> +			clocks =3D <&clkcfg 4>, <&clkcfg 2>;
> +			clock-names =3D "pclk", "hclk";
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		emac1: ethernet@20112000 {
> +			compatible =3D "cdns,macb";
> +			reg =3D <0x0 0x20112000 0x0 0x2000>;
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <70 71 72 73>;
> +			mac-address =3D [00 00 00 00 00 00];
> +			clocks =3D <&clkcfg 5>, <&clkcfg 2>;
> +			status =3D "disabled";
> +			clock-names =3D "pclk", "hclk";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +	};
> +};
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
