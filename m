Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00E8C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:50:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D2B764E6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D2B764E6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FccbWAG/itCu7//q0A7kf2AvwBqACdcp+TenzUCXVjg=; b=VTPTvynTTBRiRNSntcS2wa9Bd
	MCpg8fsXy+iHGGDUzdtV/lZookYBvHg5hhln7E67VxjGx03sn6Fu5KK/qWYDt1SvscNsQsj8gYGTv
	PMugT3xEpZQw8Nd3/8x//hVfO+zQnA46z6FLvz5zRGKvsW2NgOGFETc24B/NcaQ+vEHJZwcJsoX3F
	/Fr6pRvdFFBPKetibi2xDzmHXIgq4vCn3x7wgN1TZb3Myrd9EfFiGy156jxGQowjtw2XTOKIiq1ul
	rXYO63u+OsveYzg45E7YxMbkw/PpdtbdVP9/t/XUQ41eGfKL3bYVugSz6dJkLUWEbxjCn7N2mWZBv
	NzSKqjjqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9CY1-0000fz-Q8; Mon, 08 Feb 2021 19:50:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9CXy-0000fB-4s
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 19:50:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52A3364E6E
 for <linux-riscv@lists.infradead.org>; Mon,  8 Feb 2021 19:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612813808;
 bh=p6ZtiUUGi+wlIZGCosnTh8nn9TvK63i9IuWPN3Oh/jQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KDk6kdtDwL+FjVg3KuFpoXVKtmuc3yX/uxatlSlXlL9cEZMi8WWqBY7WMw1p0poPS
 dXI6b96GRrEFirqQouknM3d3hxzQjtg6PTX9krRd76HYzH3om+h14kJ1bTEoafCUFZ
 6hIqdQ8iHz6vLgQkxfbmhLBq1H4fLweGEffQ0eDlcsENdmg3/ZL/EWVdiC8Q8OKtbd
 PbBtGh2QUKpsJWjgUv6MtqjZZVzldwhvbpIF2qlBRkxpqR+AMsY6tWbG3wXb1bcJ7b
 aJbeKWuQJzU5mA4A45Sx9JfNBfd23da37qN5cYCW0rj12Q2sjOsI1s9O5ZyhxhEV0k
 u00EjqsfoVoIg==
Received: by mail-qk1-f173.google.com with SMTP id a12so15670828qkh.10
 for <linux-riscv@lists.infradead.org>; Mon, 08 Feb 2021 11:50:08 -0800 (PST)
X-Gm-Message-State: AOAM532r031SQsFALRyQt1mQpkrpuMjBpFR4LUIDQqHbj35eWSvcJsy3
 CMkUWOAHY69CAPKTYsyKtUNj3F+VRq4eljv8Gw==
X-Google-Smtp-Source: ABdhPJzE4Z4JX4XwB/pdH3EevowsTU1MqLUeNNyBmz0VRLy/6eX6hqHgMXciNyYy+HfP3eeeVDGuA0U/pp3Qt3C5DQg=
X-Received: by 2002:a37:90c5:: with SMTP id
 s188mr19102900qkd.128.1612813807313; 
 Mon, 08 Feb 2021 11:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
 <20210205065827.577285-10-damien.lemoal@wdc.com>
 <20210205202505.GA3625674@robh.at.kernel.org>
 <52dc2537-7668-4409-f35b-bfddfd09059b@gmail.com>
In-Reply-To: <52dc2537-7668-4409-f35b-bfddfd09059b@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Feb 2021 13:49:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJmpMf-bf=HxfWXLyYxzOH23O50QW6_TdjU0qukCW6Fhw@mail.gmail.com>
Message-ID: <CAL_JsqJmpMf-bf=HxfWXLyYxzOH23O50QW6_TdjU0qukCW6Fhw@mail.gmail.com>
Subject: Re: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
To: Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_145010_350791_0E691A83 
X-CRM114-Status: GOOD (  42.56  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 5, 2021 at 4:52 PM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 2/5/21 3:25 PM, Rob Herring wrote:
> > On Fri, Feb 05, 2021 at 03:58:20PM +0900, Damien Le Moal wrote:
> >> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
> >> all peripherals of the SoC, their clocks and reset lines. The device
> >> tree file k210.dts is renamed to k210_generic.dts and becomes the
> >> default value selection of the SOC_CANAAN_K210_DTB_BUILTIN_SOURCE
> >> configuration option. No device beside the serial console is defined by
> >> this device tree. This makes this generic device tree suitable for use
> >> with a builtin initramfs with all known K210 based boards.
> >>
> >> These changes result in the K210_CLK_ACLK clock ID to be unused and
> >> removed from the dt-bindings k210-clk.h header file.
> >>
> >> Most updates to the k210.dtsi file come from Sean Anderson's work on
> >> U-Boot support for the K210.
> >>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: devicetree@vger.kernel.org
> >> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> >> ---
> >>   arch/riscv/Kconfig.socs                     |   2 +-
> >>   arch/riscv/boot/dts/canaan/k210.dts         |  23 -
> >>   arch/riscv/boot/dts/canaan/k210.dtsi        | 535 +++++++++++++++++++-
> >>   arch/riscv/boot/dts/canaan/k210_generic.dts |  46 ++
> >>   include/dt-bindings/clock/k210-clk.h        |   1 -
> >>   5 files changed, 554 insertions(+), 53 deletions(-)
> >>   delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
> >>   create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
> >>
> >> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> >> index 6402746c68f3..7efcece8896c 100644
> >> --- a/arch/riscv/Kconfig.socs
> >> +++ b/arch/riscv/Kconfig.socs
> >> @@ -51,7 +51,7 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >>      string "Source file for the Canaan Kendryte K210 builtin DTB"
> >>      depends on SOC_CANAAN
> >>      depends on SOC_CANAAN_K210_DTB_BUILTIN
> >> -    default "k210"
> >> +    default "k210_generic"
> >>      help
> >>        Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
> >>        for the DTS file that will be used to produce the DTB linked into the
> >> diff --git a/arch/riscv/boot/dts/canaan/k210.dts b/arch/riscv/boot/dts/canaan/k210.dts
> >> deleted file mode 100644
> >> index 0d1f28fce6b2..000000000000
> >> --- a/arch/riscv/boot/dts/canaan/k210.dts
> >> +++ /dev/null
> >> @@ -1,23 +0,0 @@
> >> -// SPDX-License-Identifier: GPL-2.0+
> >> -/*
> >> - * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> >> - */
> >> -
> >> -/dts-v1/;
> >> -
> >> -#include "k210.dtsi"
> >> -
> >> -/ {
> >> -    model = "Kendryte K210 generic";
> >> -    compatible = "kendryte,k210";
> >> -
> >> -    chosen {
> >> -            bootargs = "earlycon console=ttySIF0";
> >> -            stdout-path = "serial0";
> >> -    };
> >> -};
> >> -
> >> -&uarths0 {
> >> -    status = "okay";
> >> -};
> >> -
> >> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> >> index 354b263195a3..63c1f4c98d6c 100644
> >> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> >> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> >> @@ -1,9 +1,11 @@
> >>   // SPDX-License-Identifier: GPL-2.0+
> >>   /*
> >> - * Copyright (C) 2019 Sean Anderson <seanga2@gmail.com>
> >> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
> >>    * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> >>    */
> >>   #include <dt-bindings/clock/k210-clk.h>
> >> +#include <dt-bindings/pinctrl/k210-fpioa.h>
> >> +#include <dt-bindings/reset/k210-rst.h>
> >>
> >>   / {
> >>      /*
> >> @@ -12,14 +14,33 @@ / {
> >>       */
> >>      #address-cells = <1>;
> >>      #size-cells = <1>;
> >> -    compatible = "kendryte,k210";
> >> +    compatible = "canaan,kendryte-k210";
> >>
> >>      aliases {
> >> +            cpu0 = &cpu0;
> >> +            cpu1 = &cpu1;
> >> +            dma0 = &dmac0;
> >> +            gpio0 = &gpio0;
> >> +            gpio1 = &gpio1_0;
> >> +            i2c0 = &i2c0;
> >> +            i2c1 = &i2c1;
> >> +            i2c2 = &i2c2;
> >> +            pinctrl0 = &fpioa;
> >>              serial0 = &uarths0;
> >> +            serial1 = &uart1;
> >> +            serial2 = &uart2;
> >> +            serial3 = &uart3;
> >> +            spi0 = &spi0;
> >> +            spi1 = &spi1;
> >> +            spi2 = &spi2;
> >> +            spi3 = &spi3;
> >> +            timer0 = &timer0;
> >> +            timer1 = &timer1;
> >> +            timer2 = &timer2;
> >
> > Don't add random aliases. Really, only the serialN ones should be here.
> > cpu, dma, pinctrl, timer are definitely non-standard.
>
>
> All of these except for cpu and dma are already found in the kernel.
> They were primarily added for U-Boot.
>
> >
> >>      };
> >>
> >>      /*
> >> -     * The K210 has an sv39 MMU following the priviledge specification v1.9.
> >> +     * The K210 has an sv39 MMU following the privileged specification v1.9.
> >>       * Since this is a non-ratified draft specification, the kernel does not
> >>       * support it and the K210 support enabled only for the !MMU case.
> >>       * Be consistent with this by setting the CPUs MMU type to "none".
> >> @@ -30,14 +51,14 @@ cpus {
> >>              timebase-frequency = <7800000>;
> >>              cpu0: cpu@0 {
> >>                      device_type = "cpu";
> >> +                    compatible = "canaan,k210", "riscv";
> >>                      reg = <0>;
> >> -                    compatible = "kendryte,k210", "sifive,rocket0", "riscv";
> >>                      riscv,isa = "rv64imafdc";
> >> -                    mmu-type = "none";
> >> -                    i-cache-size = <0x8000>;
> >> +                    mmu-type = "riscv,none";
> >>                      i-cache-block-size = <64>;
> >> -                    d-cache-size = <0x8000>;
> >> +                    i-cache-size = <0x8000>;
> >>                      d-cache-block-size = <64>;
> >> +                    d-cache-size = <0x8000>;
> >>                      cpu0_intc: interrupt-controller {
> >>                              #interrupt-cells = <1>;
> >>                              interrupt-controller;
> >> @@ -46,14 +67,14 @@ cpu0_intc: interrupt-controller {
> >>              };
> >>              cpu1: cpu@1 {
> >>                      device_type = "cpu";
> >> +                    compatible = "canaan,k210", "riscv";
> >>                      reg = <1>;
> >> -                    compatible = "kendryte,k210", "sifive,rocket0", "riscv";
> >>                      riscv,isa = "rv64imafdc";
> >> -                    mmu-type = "none";
> >> -                    i-cache-size = <0x8000>;
> >> +                    mmu-type = "riscv,none";
> >>                      i-cache-block-size = <64>;
> >> -                    d-cache-size = <0x8000>;
> >> +                    i-cache-size = <0x8000>;
> >>                      d-cache-block-size = <64>;
> >> +                    d-cache-size = <0x8000>;
> >>                      cpu1_intc: interrupt-controller {
> >>                              #interrupt-cells = <1>;
> >>                              interrupt-controller;
> >> @@ -64,10 +85,15 @@ cpu1_intc: interrupt-controller {
> >>
> >>      sram: memory@80000000 {
> >>              device_type = "memory";
> >> +            compatible = "canaan,k210-sram";
> >>              reg = <0x80000000 0x400000>,
> >>                    <0x80400000 0x200000>,
> >>                    <0x80600000 0x200000>;
> >>              reg-names = "sram0", "sram1", "aisram";
> >> +            clocks = <&sysclk K210_CLK_SRAM0>,
> >> +                     <&sysclk K210_CLK_SRAM1>,
> >> +                     <&sysclk K210_CLK_AI>;
> >> +            clock-names = "sram0", "sram1", "aisram";
> >>      };
> >>
> >>      clocks {
> >> @@ -81,40 +107,493 @@ in0: oscillator {
> >>      soc {
> >>              #address-cells = <1>;
> >>              #size-cells = <1>;
> >> -            compatible = "kendryte,k210-soc", "simple-bus";
> >> +            compatible = "simple-bus";
> >>              ranges;
> >>              interrupt-parent = <&plic0>;
> >>
> >> -            sysctl: sysctl@50440000 {
> >> -                    compatible = "kendryte,k210-sysctl", "simple-mfd";
> >> -                    reg = <0x50440000 0x1000>;
> >> -                    #clock-cells = <1>;
> >> +            debug0: debug@0 {
> >> +                    compatible = "canaan,k210-debug", "riscv,debug";
> >
> > Not documented.
>
> On 1/14/21 7:06 PM, Sean Anderson wrote:
> > Here it's because "riscv,debug" doesn't exist. This is the "debug"
> > device as described in the debug spec. AFAIK Linux never needs to
> > configure this device. It could probably be removed.
>
> No objections here.
>
> >
> >> +                    reg = <0x0 0x1000>;
> >> +                    status = "disabled";
> >> +            };
> >> +
> >> +            rom0: nvmem@1000 {
> >> +                    reg = <0x1000 0x1000>;
> >> +                    read-only;
> >> +                    status = "disabled";
> >>              };
> >>
> >>              clint0: clint@2000000 {
> >
> > interrupt-controller@...
>
> Yes, this should be changed.
>
> >
> >> -                    #interrupt-cells = <1>;
> >> -                    compatible = "riscv,clint0";
> >> +                    compatible = "canaan,k210-clint", "sifive,clint0";
> >>                      reg = <0x2000000 0xC000>;
> >> -                    interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
> >> -                                            &cpu1_intc 3 &cpu1_intc 7>;
> >> +                    interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> >> +                                          &cpu1_intc 3 &cpu1_intc 7>;
> >>              };
> >>
> >> -            plic0: interrupt-controller@c000000 {
> >> +            plic0: interrupt-controller@C000000 {
> >
> > No, lowercase hex in unit-addresses was correct.
>
> Do you have any authoritative source for this? When I was creating this
> tree, I didn't see anything about what case the addresses should be in
> (and a quick grep for lower-case in Documentation/devicetree doesn't
> have any relevant results).

It's ultimately up to the bus definition, but the DT spec may say
something. I don't recall offhand. For most bus definitions we have a
schema enforcement and dtc has some checks. (Though I just noticed the
simple-bus schema allows uppercase which is an error. dtc does not.)
This case doesn't get caught because there's not a bus definition for
root node. IMO, it should be same as 'simple-bus', but there was some
debate about that when I added the dtc checks.

The other cases should have been flagged by simple-pm-bus.yaml. You
all did run 'make dtbs_check' on this, right?

> >> +                    otp0: nvmem@50420000 {
> >> +                            #address-cells = <1>;
> >> +                            #size-cells = <1>;
> >> +                            compatible = "canaan,k210-otp";
> >> +                            reg = <0x50420000 0x100>,
> >> +                                  <0x88000000 0x20000>;
> >> +                            reg-names = "reg", "mem";
> >> +                            clocks = <&sysclk K210_CLK_ROM>;
> >> +                            resets = <&sysrst K210_RST_ROM>;
> >> +                            read-only;
> >> +                            status = "disabled";
> >
> > Your disabled nodes seem a bit excessive. A device should really only be
> > disabled if it's a board level decision to use or not. I'd assume the
> > OTP is always there and usable.
>
> It's disabled because there is no driver for it (yet). Though see below
> for the reasoning behind this.

No driver is not really a reason to disable. Why force a DT change
when there is a driver?

> >> +
> >> +                            /* Bootloader */
> >> +                            firmware@00000 {
> >
> > Drop leading 0s.
> >
> > Is this memory mapped? If so, you are missing 'ranges' in the parent to
> > make it translateable.
>
> Yes, there should be ranges.
>
> Though I am not sure that the ROM is controllable from this OTP...
>
> Perhaps it should be its own node.
>
> >
> >> +                                    reg = <0x00000 0xC200>;
> >> +                            };
> >> +
> >> +                            /*
> >> +                             * config string as described in RISC-V
> >> +                             * privileged spec 1.9
> >> +                             */
> >> +                            config-1-9@1c000 {
> >> +                                    reg = <0x1C000 0x1000>;
> >> +                            };
> >> +
> >> +                            /*
> >> +                             * Device tree containing only registers,
> >> +                             * interrupts, and cpus
> >> +                             */
> >> +                            fdt@1d000 {
> >> +                                    reg = <0x1D000 0x2000>;
> >> +                            };
> >> +
> >> +                            /* CPU/ROM credits */
> >> +                            credits@1f000 {
> >> +                                    reg = <0x1F000 0x1000>;
> >> +                            };
> >> +                    };
> >> +
> >> +                    dvp0: camera@50430000 {
> >> +                            compatible = "canaan,k210-dvp";
> >
> > No documented. Seems to be several of them.
>
> Correct. At some point there may be drivers. But there is no
> authoritative information (memory map, list of registers, list of
> interrupts) outside of source code for this board.

Then you should just omit it.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
