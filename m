Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E59C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 03:38:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D8F64E07
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 03:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49D8F64E07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U6QaXI+bVAvM1lggPbdpXoHQHNN5bo+aMSHCM2wSBxA=; b=JcSSy1PxvQwi1RawBXpiVCGT+
	Dw/wF99CEGfwZb9ufW0RY719VbGJ9tYucHY26okNlr1G3Kl/61rNVGJRs57phXVTekvz6OwKqTM1M
	mN8lupP9Fvf0At8yZOxO/9HG+n1OkCqStYdPKrXtaHSEG+D6g1PQ5qGCqPo6m+IYVmmP3FAtSY3oK
	Aw3LunIARE7GX6QmldkRBjcT02PeOL1XZciWz0e3odE2XoKmAyQ7ddt5mtbo+c83jRsjKuws2/nSj
	S2qtf+p/UIzNkEiQ06RZLac9qRt1QkZQGw4tnCEHXNPLBnwrflDzvZ+1X/5qiHjsfvuc7RpEME+hr
	BszoSG5fQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8xN5-0004y1-IQ; Mon, 08 Feb 2021 03:37:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8xN1-0004xc-HE
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 03:37:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id m13so15448477wro.12
 for <linux-riscv@lists.infradead.org>; Sun, 07 Feb 2021 19:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MT07Ip4QLl1t4rX4O2tOO4t73+g/Yn4D87glJn17SwE=;
 b=pqyKIBrn7k/RMwLJGW9Ne5O0EtF1gAGae6ToJGit6EOiJjxeWpSZEW9owTnqnazQWX
 hpIQ0IbknY22ptfcr/1nF+ft0bOXy8NAnqzOOXQ17CnHcFbG+K2CMYiJsgO/IsfDAKYi
 Zld8qnFWnYjM+yQ+7FL2/iYf9UFEdXmI/EYlA4vUZFENtGEIwBrYOEFHoFQOPn07KDyq
 AWLMqU9a1S1OwErfFkDbyyd4L1w6ep12QTzrfn2ZAOxTeHRh6l11yO0apzsk1gSMtZyh
 6fiinY6Y46+LCDGWibSSFisnmTIUYKw94bITyFXvntXGUP0mbBonQC385u9Op+UHLcsA
 AivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MT07Ip4QLl1t4rX4O2tOO4t73+g/Yn4D87glJn17SwE=;
 b=OwkgOTnuwW3n0b8pA3XDOlkN14zcXjR9E7HJrWZImHuFETFz+0LAU7uBj4395UhCW7
 z5iADjGc1cs46Usp8HoXygL3JpRUn+XJtevfNJOZc0KbfaaAiFlKSYSw2CdkcCEnPH98
 p3AnEwW6J8WkUisc/chah2u3FP6w3UE2zxAj4ISJQZLuJUjF7+akBR7tXruKn6FKzPpJ
 7v/eYXSh811fN2VwyE0BAHDapyFaDnTzc4rGuEf64KWpRAgnbhNjt1/W+iVagaEJcC2L
 mCMBHrTJKFOhcK3deAEjVvm9Cxz60ae2l1NiZKScD4n+WbHSUgL5bnHyxtOR8n38FLXP
 qS+g==
X-Gm-Message-State: AOAM533R0alXhv//FsScDCrbADRdsHJPWCMpl7XvzSknYK6Sm/JBKxY0
 SrSh2a/kb/TRq93DR5dR11Vqxp5KA9JnN0mX4GC87Q==
X-Google-Smtp-Source: ABdhPJyJ2e/pUlnZHoWEzUaWPtIR1lw7KJGD+ouCyDH/7tbC8HV62sBJCJ7P8g8TU006+KFG8G22sGb704ntgrhXSvE=
X-Received: by 2002:a05:6000:1542:: with SMTP id
 2mr17723457wry.356.1612755468190; 
 Sun, 07 Feb 2021 19:37:48 -0800 (PST)
MIME-Version: 1.0
References: <20210207231256.115130-1-damien.lemoal@wdc.com>
 <20210207231256.115130-10-damien.lemoal@wdc.com>
In-Reply-To: <20210207231256.115130-10-damien.lemoal@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Feb 2021 09:07:36 +0530
Message-ID: <CAAhSdy0EOdmswm89z2qYkMyxd25QCQXTzTyRM+GFu8SXv_E8pg@mail.gmail.com>
Subject: Re: [PATCH v17 09/16] riscv: Update Canaan Kendryte K210 device tree
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_223751_747763_5856820A 
X-CRM114-Status: GOOD (  25.73  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 8, 2021 at 4:43 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
> all peripherals of the SoC, their clocks and reset lines. The device
> tree file k210.dts is renamed to k210_generic.dts and becomes the
> default value selection of the SOC_CANAAN_K210_DTB_BUILTIN_SOURCE
> configuration option. No device beside the serial console is defined by
> this device tree. This makes this generic device tree suitable for use
> with a builtin initramfs with all known K210 based boards.
>
> These changes result in the K210_CLK_ACLK clock ID to be unused and
> removed from the dt-bindings k210-clk.h header file.
>
> Most updates to the k210.dtsi file come from Sean Anderson's work on
> U-Boot support for the K210.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
> ---
>  arch/riscv/Kconfig.socs                     |   2 +-
>  arch/riscv/boot/dts/canaan/k210.dts         |  23 -
>  arch/riscv/boot/dts/canaan/k210.dtsi        | 493 ++++++++++++++++++--
>  arch/riscv/boot/dts/canaan/k210_generic.dts |  46 ++
>  include/dt-bindings/clock/k210-clk.h        |   1 -
>  5 files changed, 512 insertions(+), 53 deletions(-)
>  delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 6402746c68f3..7efcece8896c 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -51,7 +51,7 @@ config SOC_CANAAN_K210_DTB_SOURCE
>         string "Source file for the Canaan Kendryte K210 builtin DTB"
>         depends on SOC_CANAAN
>         depends on SOC_CANAAN_K210_DTB_BUILTIN
> -       default "k210"
> +       default "k210_generic"
>         help
>           Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
>           for the DTS file that will be used to produce the DTB linked into the
> diff --git a/arch/riscv/boot/dts/canaan/k210.dts b/arch/riscv/boot/dts/canaan/k210.dts
> deleted file mode 100644
> index 0d1f28fce6b2..000000000000
> --- a/arch/riscv/boot/dts/canaan/k210.dts
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> - */
> -
> -/dts-v1/;
> -
> -#include "k210.dtsi"
> -
> -/ {
> -       model = "Kendryte K210 generic";
> -       compatible = "kendryte,k210";
> -
> -       chosen {
> -               bootargs = "earlycon console=ttySIF0";
> -               stdout-path = "serial0";
> -       };
> -};
> -
> -&uarths0 {
> -       status = "okay";
> -};
> -
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index 354b263195a3..05a12255ed3e 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -1,9 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * Copyright (C) 2019 Sean Anderson <seanga2@gmail.com>
> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
>   * Copyright (C) 2020 Western Digital Corporation or its affiliates.
>   */
>  #include <dt-bindings/clock/k210-clk.h>
> +#include <dt-bindings/pinctrl/k210-fpioa.h>
> +#include <dt-bindings/reset/k210-rst.h>
>
>  / {
>         /*
> @@ -12,14 +14,17 @@ / {
>          */
>         #address-cells = <1>;
>         #size-cells = <1>;
> -       compatible = "kendryte,k210";
> +       compatible = "canaan,kendryte-k210";
>
>         aliases {
>                 serial0 = &uarths0;
> +               serial1 = &uart1;
> +               serial2 = &uart2;
> +               serial3 = &uart3;
>         };
>
>         /*
> -        * The K210 has an sv39 MMU following the priviledge specification v1.9.
> +        * The K210 has an sv39 MMU following the privileged specification v1.9.
>          * Since this is a non-ratified draft specification, the kernel does not
>          * support it and the K210 support enabled only for the !MMU case.
>          * Be consistent with this by setting the CPUs MMU type to "none".
> @@ -30,14 +35,14 @@ cpus {
>                 timebase-frequency = <7800000>;
>                 cpu0: cpu@0 {
>                         device_type = "cpu";
> +                       compatible = "canaan,k210", "riscv";
>                         reg = <0>;
> -                       compatible = "kendryte,k210", "sifive,rocket0", "riscv";
>                         riscv,isa = "rv64imafdc";
> -                       mmu-type = "none";
> -                       i-cache-size = <0x8000>;
> +                       mmu-type = "riscv,none";
>                         i-cache-block-size = <64>;
> -                       d-cache-size = <0x8000>;
> +                       i-cache-size = <0x8000>;
>                         d-cache-block-size = <64>;
> +                       d-cache-size = <0x8000>;
>                         cpu0_intc: interrupt-controller {
>                                 #interrupt-cells = <1>;
>                                 interrupt-controller;
> @@ -46,14 +51,14 @@ cpu0_intc: interrupt-controller {
>                 };
>                 cpu1: cpu@1 {
>                         device_type = "cpu";
> +                       compatible = "canaan,k210", "riscv";
>                         reg = <1>;
> -                       compatible = "kendryte,k210", "sifive,rocket0", "riscv";
>                         riscv,isa = "rv64imafdc";
> -                       mmu-type = "none";
> -                       i-cache-size = <0x8000>;
> +                       mmu-type = "riscv,none";
>                         i-cache-block-size = <64>;
> -                       d-cache-size = <0x8000>;
> +                       i-cache-size = <0x8000>;
>                         d-cache-block-size = <64>;
> +                       d-cache-size = <0x8000>;
>                         cpu1_intc: interrupt-controller {
>                                 #interrupt-cells = <1>;
>                                 interrupt-controller;
> @@ -64,10 +69,15 @@ cpu1_intc: interrupt-controller {
>
>         sram: memory@80000000 {
>                 device_type = "memory";
> +               compatible = "canaan,k210-sram";
>                 reg = <0x80000000 0x400000>,
>                       <0x80400000 0x200000>,
>                       <0x80600000 0x200000>;
>                 reg-names = "sram0", "sram1", "aisram";
> +               clocks = <&sysclk K210_CLK_SRAM0>,
> +                        <&sysclk K210_CLK_SRAM1>,
> +                        <&sysclk K210_CLK_AI>;
> +               clock-names = "sram0", "sram1", "aisram";
>         };
>
>         clocks {
> @@ -81,40 +91,467 @@ in0: oscillator {
>         soc {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> -               compatible = "kendryte,k210-soc", "simple-bus";
> +               compatible = "simple-bus";
>                 ranges;
>                 interrupt-parent = <&plic0>;
>
> -               sysctl: sysctl@50440000 {
> -                       compatible = "kendryte,k210-sysctl", "simple-mfd";
> -                       reg = <0x50440000 0x1000>;
> -                       #clock-cells = <1>;
> +               rom0: nvmem@1000 {
> +                       reg = <0x1000 0x1000>;
> +                       read-only;
>                 };
>
> -               clint0: clint@2000000 {
> -                       #interrupt-cells = <1>;
> -                       compatible = "riscv,clint0";
> +               clint0: timer@2000000 {
> +                       compatible = "canaan,k210-clint", "sifive,clint0";
>                         reg = <0x2000000 0xC000>;
> -                       interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
> -                                               &cpu1_intc 3 &cpu1_intc 7>;
> +                       interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> +                                             &cpu1_intc 3 &cpu1_intc 7>;
>                 };
>
>                 plic0: interrupt-controller@c000000 {
>                         #interrupt-cells = <1>;
> -                       interrupt-controller;
> -                       compatible = "kendryte,k210-plic0", "riscv,plic0";
> +                       #address-cells = <0>;
> +                       compatible = "canaan,k210-plic", "sifive,plic-1.0.0";
>                         reg = <0xC000000 0x4000000>;
> -                       interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 0xffffffff>,
> -                                             <&cpu1_intc 11>, <&cpu1_intc 0xffffffff>;
> +                       interrupt-controller;
> +                       interrupts-extended = <&cpu0_intc 11 &cpu1_intc 11>;
>                         riscv,ndev = <65>;
> -                       riscv,max-priority = <7>;
>                 };
>
>                 uarths0: serial@38000000 {
> -                       compatible = "kendryte,k210-uarths", "sifive,uart0";
> +                       compatible = "canaan,k210-uarths", "sifive,uart0";
>                         reg = <0x38000000 0x1000>;
>                         interrupts = <33>;
> -                       clocks = <&sysctl K210_CLK_CPU>;
> +                       clocks = <&sysclk K210_CLK_CPU>;
> +               };
> +
> +               gpio0: gpio-controller@38001000 {
> +                       #interrupt-cells = <2>;
> +                       #gpio-cells = <2>;
> +                       compatible = "canaan,k210-gpiohs", "sifive,gpio0";
> +                       reg = <0x38001000 0x1000>;
> +                       interrupt-controller;
> +                       interrupts = <34 35 36 37 38 39 40 41
> +                                     42 43 44 45 46 47 48 49
> +                                     50 51 52 53 54 55 56 57
> +                                     58 59 60 61 62 63 64 65>;
> +                       gpio-controller;
> +                       ngpios = <32>;
> +               };
> +
> +               kpu0: kpu@40800000 {
> +                       compatible = "canaan,k210-kpu";
> +                       reg = <0x40800000 0xc00000>;
> +                       interrupts = <25>;
> +                       clocks = <&sysclk K210_CLK_AI>;
> +                       status = "disabled";
> +               };
> +
> +               fft0: fft@42000000 {
> +                       compatible = "canaan,k210-fft";
> +                       reg = <0x42000000 0x400000>;
> +                       interrupts = <26>;
> +                       clocks = <&sysclk K210_CLK_FFT>;
> +                       resets = <&sysrst K210_RST_FFT>;
> +                       status = "disabled";
> +               };
> +
> +               dmac0: dma-controller@50000000 {
> +                       compatible = "snps,axi-dma-1.01a";
> +                       reg = <0x50000000 0x1000>;
> +                       interrupts = <27 28 29 30 31 32>;
> +                       #dma-cells = <1>;
> +                       clocks = <&sysclk K210_CLK_DMA>, <&sysclk K210_CLK_DMA>;
> +                       clock-names = "core-clk", "cfgr-clk";
> +                       resets = <&sysrst K210_RST_DMA>;
> +                       dma-channels = <6>;
> +                       snps,dma-masters = <2>;
> +                       snps,priority = <0 1 2 3 4 5>;
> +                       snps,data-width = <5>;
> +                       snps,block-size = <0x200000 0x200000 0x200000
> +                                          0x200000 0x200000 0x200000>;
> +                       snps,axi-max-burst-len = <256>;
> +               };
> +
> +               apb0: bus@50200000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       compatible = "simple-pm-bus";
> +                       ranges;
> +                       clocks = <&sysclk K210_CLK_APB0>;
> +
> +                       gpio1: gpio@50200000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               compatible = "snps,dw-apb-gpio";
> +                               reg = <0x50200000 0x80>;
> +                               clocks = <&sysclk K210_CLK_APB0>,
> +                                        <&sysclk K210_CLK_GPIO>;
> +                               clock-names = "bus", "db";
> +                               resets = <&sysrst K210_RST_GPIO>;
> +
> +                               gpio1_0: gpio-port@0 {
> +                                       #gpio-cells = <2>;
> +                                       #interrupt-cells = <2>;
> +                                       compatible = "snps,dw-apb-gpio-port";
> +                                       reg = <0>;
> +                                       interrupt-controller;
> +                                       interrupts = <23>;
> +                                       gpio-controller;
> +                                       ngpios = <8>;
> +                               };
> +                       };
> +
> +                       uart1: serial@50210000 {
> +                               compatible = "snps,dw-apb-uart";
> +                               reg = <0x50210000 0x100>;
> +                               interrupts = <11>;
> +                               clocks = <&sysclk K210_CLK_UART1>,
> +                                        <&sysclk K210_CLK_APB0>;
> +                               clock-names = "baudclk", "apb_pclk";
> +                               resets = <&sysrst K210_RST_UART1>;
> +                               reg-io-width = <4>;
> +                               reg-shift = <2>;
> +                               dcd-override;
> +                               dsr-override;
> +                               cts-override;
> +                               ri-override;
> +                       };
> +
> +                       uart2: serial@50220000 {
> +                               compatible = "snps,dw-apb-uart";
> +                               reg = <0x50220000 0x100>;
> +                               interrupts = <12>;
> +                               clocks = <&sysclk K210_CLK_UART2>,
> +                                        <&sysclk K210_CLK_APB0>;
> +                               clock-names = "baudclk", "apb_pclk";
> +                               resets = <&sysrst K210_RST_UART2>;
> +                               reg-io-width = <4>;
> +                               reg-shift = <2>;
> +                               dcd-override;
> +                               dsr-override;
> +                               cts-override;
> +                               ri-override;
> +                       };
> +
> +                       uart3: serial@50230000 {
> +                               compatible = "snps,dw-apb-uart";
> +                               reg = <0x50230000 0x100>;
> +                               interrupts = <13>;
> +                               clocks = <&sysclk K210_CLK_UART3>,
> +                                        <&sysclk K210_CLK_APB0>;
> +                               clock-names = "baudclk", "apb_pclk";
> +                               resets = <&sysrst K210_RST_UART3>;
> +                               reg-io-width = <4>;
> +                               reg-shift = <2>;
> +                               dcd-override;
> +                               dsr-override;
> +                               cts-override;
> +                               ri-override;
> +                       };
> +
> +                       spi2: spi@50240000 {
> +                               compatible = "canaan,k210-spi";
> +                               spi-slave;
> +                               reg = <0x50240000 0x100>;
> +                               #address-cells = <0>;
> +                               #size-cells = <0>;
> +                               interrupts = <3>;
> +                               clocks = <&sysclk K210_CLK_SPI2>,
> +                                        <&sysclk K210_CLK_APB0>;
> +                               clock-names = "ssi_clk", "pclk";
> +                               resets = <&sysrst K210_RST_SPI2>;
> +                               spi-max-frequency = <25000000>;
> +                       };
> +
> +                       i2s0: i2s@50250000 {
> +                               compatible = "snps,designware-i2s";
> +                               reg = <0x50250000 0x200>;
> +                               interrupts = <5>;
> +                               clocks = <&sysclk K210_CLK_I2S0>;
> +                               clock-names = "i2sclk";
> +                               resets = <&sysrst K210_RST_I2S0>;
> +                       };
> +
> +                       apu0: sound@50250200 {
> +                               compatible = "canaan,k210-apu";
> +                               reg = <0x50250200 0x200>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2s1: i2s@50260000 {
> +                               compatible = "snps,designware-i2s";
> +                               reg = <0x50260000 0x200>;
> +                               interrupts = <6>;
> +                               clocks = <&sysclk K210_CLK_I2S1>;
> +                               clock-names = "i2sclk";
> +                               resets = <&sysrst K210_RST_I2S1>;
> +                       };
> +
> +                       i2s2: i2s@50270000 {
> +                               compatible = "snps,designware-i2s";
> +                               reg = <0x50270000 0x200>;
> +                               interrupts = <7>;
> +                               clocks = <&sysclk K210_CLK_I2S2>;
> +                               clock-names = "i2sclk";
> +                               resets = <&sysrst K210_RST_I2S2>;
> +                       };
> +
> +                       i2c0: i2c@50280000 {
> +                               compatible = "snps,designware-i2c";
> +                               reg = <0x50280000 0x100>;
> +                               interrupts = <8>;
> +                               clocks = <&sysclk K210_CLK_I2C0>,
> +                                        <&sysclk K210_CLK_APB0>;
> +                               clock-names = "ref", "pclk";
> +                               resets = <&sysrst K210_RST_I2C0>;
> +                       };
> +
> +                       i2c1: i2c@50290000 {
> +                               compatible = "snps,designware-i2c";
> +                               reg = <0x50290000 0x100>;
> +                               interrupts = <9>;
> +                               clocks = <&sysclk K210_CLK_I2C1>,
> +                                        <&sysclk K210_CLK_APB0>;
> +                               clock-names = "ref", "pclk";
> +                               resets = <&sysrst K210_RST_I2C1>;
> +                       };
> +
> +                       i2c2: i2c@502a0000 {
> +                               compatible = "snps,designware-i2c";
> +                               reg = <0x502A0000 0x100>;
> +                               interrupts = <10>;
> +                               clocks = <&sysclk K210_CLK_I2C2>,
> +                                        <&sysclk K210_CLK_APB0>;
> +                               clock-names = "ref", "pclk";
> +                               resets = <&sysrst K210_RST_I2C2>;
> +                       };
> +
> +                       fpioa: pinmux@502b0000 {
> +                               compatible = "canaan,k210-fpioa";
> +                               reg = <0x502B0000 0x100>;
> +                               clocks = <&sysclk K210_CLK_FPIOA>,
> +                                        <&sysclk K210_CLK_APB0>;
> +                               clock-names = "ref", "pclk";
> +                               resets = <&sysrst K210_RST_FPIOA>;
> +                               canaan,k210-sysctl-power = <&sysctl 108>;
> +                       };
> +
> +                       sha256: sha256@502c0000 {
> +                               compatible = "canaan,k210-sha256";
> +                               reg = <0x502C0000 0x100>;
> +                               clocks = <&sysclk K210_CLK_SHA>;
> +                               resets = <&sysrst K210_RST_SHA>;
> +                               status = "disabled";
> +                       };
> +
> +                       timer0: timer@502d0000 {
> +                               compatible = "snps,dw-apb-timer";
> +                               reg = <0x502D0000 0x100>;
> +                               interrupts = <14 15>;
> +                               clocks = <&sysclk K210_CLK_TIMER0>,
> +                                        <&sysclk K210_CLK_APB0>;
> +                               clock-names = "timer", "pclk";
> +                               resets = <&sysrst K210_RST_TIMER0>;
> +                       };
> +
> +                       timer1: timer@502e0000 {
> +                               compatible = "snps,dw-apb-timer";
> +                               reg = <0x502E0000 0x100>;
> +                               interrupts = <16 17>;
> +                               clocks = <&sysclk K210_CLK_TIMER1>,
> +                                        <&sysclk K210_CLK_APB0>;
> +                               clock-names = "timer", "pclk";
> +                               resets = <&sysrst K210_RST_TIMER1>;
> +                       };
> +
> +                       timer2: timer@502f0000 {
> +                               compatible = "snps,dw-apb-timer";
> +                               reg = <0x502F0000 0x100>;
> +                               interrupts = <18 19>;
> +                               clocks = <&sysclk K210_CLK_TIMER2>,
> +                                        <&sysclk K210_CLK_APB0>;
> +                               clock-names = "timer", "pclk";
> +                               resets = <&sysrst K210_RST_TIMER2>;
> +                       };
> +               };
> +
> +               apb1: bus@50400000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       compatible = "simple-pm-bus";
> +                       ranges;
> +                       clocks = <&sysclk K210_CLK_APB1>;
> +
> +                       wdt0: watchdog@50400000 {
> +                               compatible = "snps,dw-wdt";
> +                               reg = <0x50400000 0x100>;
> +                               interrupts = <21>;
> +                               clocks = <&sysclk K210_CLK_WDT0>,
> +                                        <&sysclk K210_CLK_APB1>;
> +                               clock-names = "tclk", "pclk";
> +                               resets = <&sysrst K210_RST_WDT0>;
> +                       };
> +
> +                       wdt1: watchdog@50410000 {
> +                               compatible = "snps,dw-wdt";
> +                               reg = <0x50410000 0x100>;
> +                               interrupts = <22>;
> +                               clocks = <&sysclk K210_CLK_WDT1>,
> +                                        <&sysclk K210_CLK_APB1>;
> +                               clock-names = "tclk", "pclk";
> +                               resets = <&sysrst K210_RST_WDT1>;
> +                       };
> +
> +                       otp0: nvmem@50420000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               compatible = "canaan,k210-otp";
> +                               reg = <0x50420000 0x100>,
> +                                     <0x88000000 0x20000>;
> +                               reg-names = "reg", "mem";
> +                               clocks = <&sysclk K210_CLK_ROM>;
> +                               resets = <&sysrst K210_RST_ROM>;
> +                               ranges;
> +                               read-only;
> +                               status = "disabled";
> +
> +                               /* Bootloader */
> +                               firmware@0 {
> +                                       reg = <0x00000 0xC200>;
> +                               };
> +
> +                               /*
> +                                * config string as described in RISC-V
> +                                * privileged spec 1.9
> +                                */
> +                               config-1-9@1c000 {
> +                                       reg = <0x1C000 0x1000>;
> +                               };
> +
> +                               /*
> +                                * Device tree containing only registers,
> +                                * interrupts, and cpus
> +                                */
> +                               fdt@1d000 {
> +                                       reg = <0x1D000 0x2000>;
> +                               };
> +
> +                               /* CPU/ROM credits */
> +                               credits@1f000 {
> +                                       reg = <0x1F000 0x1000>;
> +                               };
> +                       };
> +
> +                       dvp0: camera@50430000 {
> +                               compatible = "canaan,k210-dvp";
> +                               reg = <0x50430000 0x100>;
> +                               interrupts = <24>;
> +                               clocks = <&sysclk K210_CLK_DVP>;
> +                               resets = <&sysrst K210_RST_DVP>;
> +                               canaan,k210-misc-offset = <&sysctl 84>;
> +                               status = "disabled";
> +                       };
> +
> +                       sysctl: syscon@50440000 {
> +                               compatible = "canaan,k210-sysctl",
> +                                            "syscon", "simple-mfd";
> +                               reg = <0x50440000 0x100>;
> +                               clocks = <&sysclk K210_CLK_APB1>;
> +                               clock-names = "pclk";
> +
> +                               sysclk: clock-controller {
> +                                       #clock-cells = <1>;
> +                                       compatible = "canaan,k210-clk";
> +                                       clocks = <&in0>;
> +                               };
> +
> +                               sysrst: reset-controller {
> +                                       compatible = "canaan,k210-rst";
> +                                       #reset-cells = <1>;
> +                               };
> +
> +                               reboot: syscon-reboot {
> +                                       compatible = "syscon-reboot";
> +                                       regmap = <&sysctl>;
> +                                       offset = <48>;
> +                                       mask = <1>;
> +                                       value = <1>;
> +                               };
> +                       };
> +
> +                       aes0: aes@50450000 {
> +                               compatible = "canaan,k210-aes";
> +                               reg = <0x50450000 0x100>;
> +                               clocks = <&sysclk K210_CLK_AES>;
> +                               resets = <&sysrst K210_RST_AES>;
> +                               status = "disabled";
> +                       };
> +
> +                       rtc: rtc@50460000 {
> +                               compatible = "canaan,k210-rtc";
> +                               reg = <0x50460000 0x100>;
> +                               clocks = <&in0>;
> +                               resets = <&sysrst K210_RST_RTC>;
> +                               interrupts = <20>;
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               apb2: bus@52000000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       compatible = "simple-pm-bus";
> +                       ranges;
> +                       clocks = <&sysclk K210_CLK_APB2>;
> +
> +                       spi0: spi@52000000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               compatible = "canaan,k210-spi";
> +                               reg = <0x52000000 0x100>;
> +                               interrupts = <1>;
> +                               clocks = <&sysclk K210_CLK_SPI0>,
> +                                        <&sysclk K210_CLK_APB2>;
> +                               clock-names = "ssi_clk", "pclk";
> +                               resets = <&sysrst K210_RST_SPI0>;
> +                               reset-names = "spi";
> +                               spi-max-frequency = <25000000>;
> +                               num-cs = <4>;
> +                               reg-io-width = <4>;
> +                       };
> +
> +                       spi1: spi@53000000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               compatible = "canaan,k210-spi";
> +                               reg = <0x53000000 0x100>;
> +                               interrupts = <2>;
> +                               clocks = <&sysclk K210_CLK_SPI1>,
> +                                        <&sysclk K210_CLK_APB2>;
> +                               clock-names = "ssi_clk", "pclk";
> +                               resets = <&sysrst K210_RST_SPI1>;
> +                               reset-names = "spi";
> +                               spi-max-frequency = <25000000>;
> +                               num-cs = <4>;
> +                               reg-io-width = <4>;
> +                       };
> +
> +                       spi3: spi@54000000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               compatible = "snps,dwc-ssi-1.01a";
> +                               reg = <0x54000000 0x200>;
> +                               interrupts = <4>;
> +                               clocks = <&sysclk K210_CLK_SPI3>,
> +                                        <&sysclk K210_CLK_APB2>;
> +                               clock-names = "ssi_clk", "pclk";
> +                               resets = <&sysrst K210_RST_SPI3>;
> +                               reset-names = "spi";
> +                               /* Could possibly go up to 200 MHz */
> +                               spi-max-frequency = <100000000>;
> +                               num-cs = <4>;
> +                               reg-io-width = <4>;
> +                       };
>                 };
>         };
>  };
> diff --git a/arch/riscv/boot/dts/canaan/k210_generic.dts b/arch/riscv/boot/dts/canaan/k210_generic.dts
> new file mode 100644
> index 000000000000..396c8ca4d24d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/k210_generic.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
> + * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> + */
> +
> +/dts-v1/;
> +
> +#include "k210.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +       model = "Kendryte K210 generic";
> +       compatible = "canaan,kendryte-k210";
> +
> +       chosen {
> +               bootargs = "earlycon console=ttySIF0";
> +               stdout-path = "serial0:115200n8";
> +       };
> +};
> +
> +&fpioa {
> +       pinctrl-0 = <&jtag_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       jtag_pins: jtag-pinmux {
> +               pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
> +                        <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
> +                        <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
> +                        <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
> +       };
> +
> +       uarths_pins: uarths-pinmux {
> +               pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>,
> +                        <K210_FPIOA(5, K210_PCF_UARTHS_TX)>;
> +       };
> +};
> +
> +&uarths0 {
> +       pinctrl-0 = <&uarths_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/clock/k210-clk.h
> index a48176ad3c23..b2de702cbf75 100644
> --- a/include/dt-bindings/clock/k210-clk.h
> +++ b/include/dt-bindings/clock/k210-clk.h
> @@ -9,7 +9,6 @@
>  /*
>   * Kendryte K210 SoC clock identifiers (arbitrary values).
>   */
> -#define K210_CLK_ACLK  0
>  #define K210_CLK_CPU   0
>  #define K210_CLK_SRAM0 1
>  #define K210_CLK_SRAM1 2
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
