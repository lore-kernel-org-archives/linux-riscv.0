Return-Path: <SRS0=Y+49=E4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACE5C388F9
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2020 00:57:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C71DF207D3
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2020 00:57:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UmfarXiR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="i1uxd4qQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C71DF207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v7SrWBofnpy9lcw987nF+r6ensrRKiQrgK3GsQBNn4o=; b=UmfarXiRGabrnXFVR9QebaJp7
	5P8LkKFlcSzxWjRHBKRaMn23Pf77QgjsifNe3A1f18546Hf9W85FOo/AUFezKtwo4njnIWFeuxbwd
	/WG8Vb/GrsK8757+ZhH+8WqFVoQdE/kreEyiwrQUXs5oaaVlhAR/ezz7KHcdE4+3udbY8Wg8jS3TT
	q5YRtLOpgfwMh0tmE3Mq1AZezLdhwTxQSNiODMjJLlWtRW9pgi7h8q86mHFFZXlJZi3tsx2YAhmxa
	fmElo4QHcF/NwoV2X+JHxocenK4/i0pb7VnRAhg7iYGz3S90esIv5qhVEvuqN5dRrKNQmteInWqS9
	GGb3adFYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgdhJ-0004ve-LB; Sun, 22 Nov 2020 00:57:45 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgdhG-0004ub-7r
 for linux-riscv@lists.infradead.org; Sun, 22 Nov 2020 00:57:43 +0000
Received: by mail-ej1-x643.google.com with SMTP id f20so18250763ejz.4
 for <linux-riscv@lists.infradead.org>; Sat, 21 Nov 2020 16:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cceQRmZEgjB9fx3i/wk5DdJOjTvr1pgKhs4f6j6i9LY=;
 b=i1uxd4qQg92tKfPLqPef+CiOf8ixdWMhQK6jPYXdsBlYDLFdMpNDw7/UFxukr6BMP4
 UN60/qmpxEaQ/opjC8ovR/EQcLypGuxfQeJ2ni7fKkHOQ63HTuerIR+HWC7WQh5uT9ax
 3kyVJUPc6Vm+AelTq6MnUGO1wezMQQwIOxMwq4XqY4g0BTgsvDWIxeRcXZZBEsrqsmYd
 wouk93y4c8rBvL6kUkWirZwRLOPefqgQtFK9hja2j0LNFiuQMY5NUPs6DDkla8j+9kJo
 CFWup8jk/Ipzo3ti0Ub3FVFTevSDbSgOazWzaSOXN2pnoezcgEp2F15+D6dZvVH/PeYF
 ff7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cceQRmZEgjB9fx3i/wk5DdJOjTvr1pgKhs4f6j6i9LY=;
 b=BIWbYCJnnZapWYeCE+piMHZ5xcX3r0ZXMluUISoELLucz2+yH5vxYYXnR/phg9BLGz
 xkw5iRgJMPqdSOD40jdfYxypy85FEa6zrLICi/T5Vg3srWJDM4kRekHykqSbb8LYesHn
 rSlioNT7kO8703Vn0229x0Vt14hxSse2EAxjhBQlVqq3vMT0pAp11bcttwrfED4C7N4V
 +lJX+U+aioDKCCmDVhGAAR8lLR9sOXaQVPnTdLHx4xWs6Yp/q6Vpd/Sxw+CsKorF49LQ
 7X7bdMRFDT7P8c8hsoK4JWcEUjy2WuBayI2hpuCrSTXrYRI+yEPu70uL4e5KHcDgwLSn
 +1QQ==
X-Gm-Message-State: AOAM530zFRUL5roNtFCh3CTobFM+2XwbXBgkeBrX1mJIrt6nRi8aH4Ye
 Y6pkjMMFUhLzvSg+Q5GX3tbmFtcUXRNu6nByJo0nTZnYYhk=
X-Google-Smtp-Source: ABdhPJz/zJTaVxXF9/YBjuyutYaxGa0Xtsj4FU46ZkgGV4y4/g3qais1Etq65IUucdhd7hXSu2B8WgnFhQl32yX8dac=
X-Received: by 2002:a19:2389:: with SMTP id
 j131mr10068188lfj.324.1605948782994; 
 Sat, 21 Nov 2020 00:53:02 -0800 (PST)
MIME-Version: 1.0
References: <20201113202550.3693323-1-atish.patra@wdc.com>
 <20201113202550.3693323-4-atish.patra@wdc.com>
In-Reply-To: <20201113202550.3693323-4-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 21 Nov 2020 14:22:51 +0530
Message-ID: <CAAhSdy1vgfnxgnqa50OmxzNsa47r03e=41fxwX7kkwtL4N1FAA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] RISC-V: Initial DTS for Microchip ICICLE board
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_195742_426804_4D85A7E5 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: devicetree@vger.kernel.org, Conor.Dooley@microchip.com,
 Albert Ou <aou@eecs.berkeley.edu>, Cyril.Jean@microchip.com,
 Daire McNamara <daire.mcnamara@microchip.com>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ivan.Griffin@microchip.com, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 14, 2020 at 1:56 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Add initial DTS for Microchip ICICLE board having only
> essential devcies (clocks, sdhci, ethernet, serial, etc).
> The device tree is based on the U-Boot patch.
>
> https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-padmarao.begari@microchip.com/
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/microchip/Makefile        |   2 +
>  .../microchip/microchip-mpfs-icicle-kit.dts   |  54 +++
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 342 ++++++++++++++++++
>  4 files changed, 399 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ca1f8cbd78c0..3ea94ea0a18a 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  subdir-y += sifive
>  subdir-y += kendryte
> +subdir-y += microchip
>
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
> new file mode 100644
> index 000000000000..622b12771fd3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-mpfs-icicle-kit.dtb
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> new file mode 100644
> index 000000000000..9a382ab0a799
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright (c) 2020 Microchip Technology Inc */
> +
> +/dts-v1/;
> +
> +#include "microchip-mpfs.dtsi"
> +
> +/* Clock frequency (in Hz) of the rtcclk */
> +#define RTCCLK_FREQ            1000000
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       model = "Microchip PolarFire-SoC Icicle Kit";
> +       compatible = "microchip,mpfs-icicle-kit", "microchip,polarfire-soc";
> +
> +       chosen {
> +               stdout-path = &serial0;
> +       };
> +
> +       cpus {
> +               timebase-frequency = <RTCCLK_FREQ>;
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x80000000 0x0 0x40000000>;
> +               clocks = <&clkcfg 26>;
> +       };
> +
> +       soc {
> +       };
> +};
> +
> +&serial0 {
> +       status = "okay";
> +};
> +
> +&serial1 {
> +       status = "okay";
> +};
> +
> +&serial2 {
> +       status = "okay";
> +};
> +
> +&serial3 {
> +       status = "okay";
> +};
> +
> +&sdcard {
> +       status = "okay";
> +};
> +
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> new file mode 100644
> index 000000000000..63ac60f345d8
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -0,0 +1,342 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright (c) 2020 Microchip Technology Inc */
> +
> +/dts-v1/;
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       model = "Microchip PolarFire-SoC";
> +       compatible = "microchip,polarfire-soc";
> +
> +       chosen {
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu@0 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <16384>;
> +                       reg = <0>;
> +                       riscv,isa = "rv64imac";
> +                       status = "disabled";
> +
> +                       cpu0_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@1 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <1>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +
> +                       cpu1_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@2 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <2>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +
> +                       cpu2_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@3 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <3>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +
> +                       cpu3_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@4 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <4>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +                       cpu4_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +       };
> +
> +       soc {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               compatible = "simple-bus";
> +               ranges;
> +
> +               cache-controller@2010000 {
> +                       compatible = "sifive,fu540-c000-ccache", "cache";
> +                       cache-block-size = <64>;
> +                       cache-level = <2>;
> +                       cache-sets = <1024>;
> +                       cache-size = <2097152>;
> +                       cache-unified;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <1 2 3>;
> +                       reg = <0x0 0x2010000 0x0 0x1000>;
> +               };
> +
> +               clint@2000000 {
> +                       compatible = "riscv,clint0";
> +                       reg = <0x0 0x2000000 0x0 0xC000>;
> +                       interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> +                                               &cpu1_intc 3 &cpu1_intc 7
> +                                               &cpu2_intc 3 &cpu2_intc 7
> +                                               &cpu3_intc 3 &cpu3_intc 7
> +                                               &cpu4_intc 3 &cpu4_intc 7>;
> +               };
> +
> +               plic: interrupt-controller@c000000 {
> +                       #interrupt-cells = <1>;
> +                       compatible = "sifive,plic-1.0.0";
> +                       reg = <0x0 0xc000000 0x0 0x4000000>;
> +                       riscv,ndev = <53>;
> +                       interrupt-controller;
> +                       interrupts-extended = <&cpu0_intc 11
> +                                       &cpu1_intc 11 &cpu1_intc 9
> +                                       &cpu2_intc 11 &cpu2_intc 9
> +                                       &cpu3_intc 11 &cpu3_intc 9
> +                                       &cpu4_intc 11 &cpu4_intc 9>;
> +               };
> +
> +               dma@3000000 {
> +                       compatible = "sifive,fu540-c000-pdma";
> +                       reg = <0x0 0x3000000 0x0 0x8000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <23 24 25 26 27 28 29 30>;
> +                       #dma-cells = <1>;
> +               };
> +
> +               refclk: refclk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <600000000>;
> +                       clock-output-names = "msspllclk";
> +               };
> +
> +               clkcfg: clkcfg@20002000 {
> +                       compatible = "microchip,pfsoc-clkcfg";
> +                       reg = <0x0 0x20002000 0x0 0x1000>;
> +                       reg-names = "mss_sysreg";
> +                       clocks = <&refclk>;
> +                       #clock-cells = <1>;
> +                       clock-output-names = "cpuclk", "axiclk", "ahbclk", "ENVMclk",   /* 0-3   */
> +                                "MAC0clk", "MAC1clk", "MMCclk", "TIMERclk",            /* 4-7   */
> +                               "MMUART0clk", "MMUART1clk", "MMUART2clk", "MMUART3clk", /* 8-11  */
> +                               "MMUART4clk", "SPI0clk", "SPI1clk", "I2C0clk",          /* 12-15 */
> +                               "I2C1clk", "CAN0clk", "CAN1clk", "USBclk",              /* 16-19 */
> +                               "RESERVED", "RTCclk", "QSPIclk", "GPIO0clk",            /* 20-23 */
> +                               "GPIO1clk", "GPIO2clk", "DDRCclk", "FIC0clk",           /* 24-27 */
> +                               "FIC1clk", "FIC2clk", "FIC3clk", "ATHENAclk", "CFMclk"; /* 28-32 */
> +               };
> +
> +               serial0: serial@20000000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20000000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <90>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 8>;
> +                       status = "disabled";
> +               };
> +
> +               serial1: serial@20100000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20100000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <91>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 9>;
> +                       status = "disabled";
> +               };
> +
> +               serial2: serial@20102000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20102000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <92>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 10>;
> +                       status = "disabled";
> +               };
> +
> +               serial3: serial@20104000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20104000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <93>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 11>;
> +                       status = "disabled";
> +               };
> +
> +               emmc: mmc@20008000 {
> +                       compatible = "cdns,sd4hc";
> +                       reg = <0x0 0x20008000 0x0 0x1000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <88 89>;
> +                       pinctrl-names = "default";
> +                       clocks = <&clkcfg 6>;
> +                       bus-width = <4>;
> +                       cap-mmc-highspeed;
> +                       mmc-ddr-3_3v;
> +                       max-frequency = <200000000>;
> +                       non-removable;
> +                       no-sd;
> +                       no-sdio;
> +                       voltage-ranges = <3300 3300>;
> +                       status = "disabled";
> +               };
> +
> +               sdcard: sdhc@20008000 {
> +                       compatible = "cdns,sd4hc";
> +                       reg = <0x0 0x20008000 0x0 0x1000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <88>;
> +                       pinctrl-names = "default";
> +                       clocks = <&clkcfg 6>;
> +                       bus-width = <4>;
> +                       disable-wp;
> +                       no-1-8-v;
> +                       cap-mmc-highspeed;
> +                       cap-sd-highspeed;
> +                       card-detect-delay = <200>;
> +                       sd-uhs-sdr12;
> +                       sd-uhs-sdr25;
> +                       sd-uhs-sdr50;
> +                       sd-uhs-sdr104;
> +                       max-frequency = <200000000>;
> +                       status = "disabled";
> +               };
> +
> +               emac0: ethernet@20110000 {
> +                       compatible = "cdns,macb";
> +                       reg = <0x0 0x20110000 0x0 0x2000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <64 65 66 67>;
> +                       local-mac-address = [00 00 00 00 00 00];
> +                       phy-mode = "sgmii";
> +                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> +                       clock-names = "pclk", "hclk";
> +                       status = "disabled";
> +
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       phy-handle = <&phy0>;
> +                       phy0: ethernet-phy@8 {
> +                               reg = <8>;
> +                               ti,fifo-depth = <0x01>;
> +                       };

Ethernet PHYs are generally on-board devices.

Keep the "#address-cells" and "#size-cells" here but
move the PHY related details to board DTS files.

> +               };
> +
> +               emac1: ethernet@20112000 {
> +                       compatible = "cdns,macb";
> +                       reg = <0x0 0x20112000 0x0 0x2000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <70 71 72 73>;
> +                       mac-address = [00 00 00 00 00 00];
> +                       phy-mode = "sgmii";
> +                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> +                       clock-names = "pclk", "hclk";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       phy1: ethernet-phy@9 {
> +                               reg = <9>;
> +                               ti,fifo-depth = <0x01>;
> +                       };
> +               };

Same comments as emac0.

In addition, disable emac1 by default in the SOC DTS file
and enable it in the board DTS file.

> +
> +       };
> +};
> --
> 2.25.1
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
