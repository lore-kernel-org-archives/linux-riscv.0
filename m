Return-Path: <SRS0=IYIb=EF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A3BC55178
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 09:06:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BACA320704
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 09:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QP1osvZ2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="h7pf6DdO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BACA320704
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f2gfzniJOM7yliS/Ld2ix6iPDT7pXHOEl2M7TcIMIMU=; b=QP1osvZ2/pJNaoXMPDzlbvJfn
	6zTexO26fgAZcTXf0PnYGZVJ2jvttiwxUwP/fR1tsCUM3Ckh7AS+fkE8DugxZcKv9qXyXwH8usnCD
	GlOcGod5TLqR4mxzRCxrHs+s/Yp6k66rlfARBNeEjv3ertLnQifOLBwn57yvBYZo/VWVlE/RxgsC+
	j625VteyAo2BtDMVi7soS1aGkIaC3wDEat6owChOeD4PrKQTRB+Yyi0hzsbsvfgH24eWGb63Wncia
	qlXnPgAWnxZK6FqqaRhj1NRpez9Jz/JwFJkUxrdPhepdXiWm34ZL9m4wb2zR1IHs64SyMiqaWBBYq
	TfQP6WQwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYQM0-0003Dh-G2; Fri, 30 Oct 2020 09:05:48 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYQLx-0003CJ-Mw
 for linux-riscv@lists.infradead.org; Fri, 30 Oct 2020 09:05:46 +0000
Received: by mail-lf1-x144.google.com with SMTP id b1so6871579lfp.11
 for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2020 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wuS5u1doYgwJMrQ1HQaz2hiwPQ/dACD5OsCQyigRClI=;
 b=h7pf6DdOD7RmWd3oL0OMKqO3VA+HHBjIglyYGHiJrbDITIQrZ+7BxOU3+eFBXamPCG
 myV/ZOuma7t7c/O3TiEZYHI26M+uyiDZloylZcBu7sMYX3498wCBhv9AE63XwPIC40Qm
 F3NBmr1gO71vYwXqHA33XaBtWYHC2ca1ct14MQpYJ15itobbxe9A6Luz4h1W3KT9+JcO
 goBGIl3MSLgCfqcuxfxn45h1m2zd1vVdfMnRpIM8No2h+mycIVHWkMX9Rp6SegRjLIqP
 QlBbddpowxyvdrsjNlCtanZALX9uOMjawC3F430supnuLtBeptC0gUQbu247TCGiRrde
 JNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wuS5u1doYgwJMrQ1HQaz2hiwPQ/dACD5OsCQyigRClI=;
 b=FoV8afqVO96kYfblSAT9XGVJ+s4SLZnNsTjJ/dpfNUkalAAP7tpEzYsF2kSNeeQFSb
 45tXeRCeBBeKpBAKk4i16DFY3GllAT0PqjKVm+OeHwgsFf8MSzwHx86NwLbJ7RyBA/1F
 wqqDqqaxg6/moyM1nYT3ONN2Vjg+5nZS1QeCypdCtInegtIStTwIsz4HZ2WCXi2X4ZFI
 bCkEPwqbkMeAxtyk2ostCxFTsytBB3QC+n8ZZMq9z8MRnOE5euI8/fUXbMrdLBMwN61q
 DBI0lQnlUrCIm21U/Sj56lYiTmQvC/386O0aEw/cw9DlBjma1hVPpXkTQ75t2a6DsYz+
 irMA==
X-Gm-Message-State: AOAM5313bIvQ97xmb+aNxS/E/fhB/f+A0jhF3admRjT9j06E2GVZ/GTO
 h1sKfAAMsNifwhipvrSkuWUkmQX/qQ71vY+cdZEdFg==
X-Google-Smtp-Source: ABdhPJyy29DKvlmhSGLrkaffIQCfwSejXh+C1NwBmK26auf6nYDHNgTcUdxbrM+XOi2UCmABu6cU0zzmKdonhvYu018=
X-Received: by 2002:a19:6a04:: with SMTP id u4mr543814lfu.493.1604048742501;
 Fri, 30 Oct 2020 02:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
In-Reply-To: <20201028232759.1928479-3-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 30 Oct 2020 14:35:30 +0530
Message-ID: <CAAhSdy0pW8AFCDtFkEO_4zjg8Exp+XTb09AjhErdX9u-Jw3OuQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_050545_798328_CAB8DD29 
X-CRM114-Status: GOOD (  15.37  )
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
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Padmarao Begari <padmarao.begari@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 4:58 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Add initial DTS for Microchip ICICLE board having only
> essential devcies (clocks, sdhci, ethernet, serial, etc).
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/microchip/Makefile        |   2 +
>  .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++

I suggest we split this DTS into two parts:
1. SOC (microchip-polarfire.dtsi)
2. Board (microchip-icicle-kit-a000.dts)

This will be much cleaner and aligned with what is done
on other architectures.

>  3 files changed, 316 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
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
> index 000000000000..55ad77521304
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-icicle-kit-a000.dtb
> diff --git a/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts b/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
> new file mode 100644
> index 000000000000..5848920af55c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright (c) 2020 Microchip Technology Inc */
> +
> +/dts-v1/;
> +
> +/* Clock frequency (in Hz) of the rtcclk */
> +#define RTCCLK_FREQ            1000000
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       model = "Microchip PolarFire-SoC";
> +       compatible = "microchip,polarfire-soc";
> +
> +       chosen {
> +               stdout-path = &serial0;
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               timebase-frequency = <RTCCLK_FREQ>;
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
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x80000000 0x0 0x40000000>;
> +               clocks = <&clkcfg 26>;
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
> +                       clock-output-names = "cpuclk", "axiclk", "ahbclk", "ENVMclk", "MAC0clk", "MAC1clk", "MMCclk", "TIMERclk", "MMUART0clk", "MMUART1clk", "MMUART2clk", "MMUART3clk", "MMUART4clk", "SPI0clk", "SPI1clk", "I2C0clk", "I2C1clk", "CAN0clk", "CAN1clk", "USBclk", "RESERVED", "RTCclk", "QSPIclk", "GPIO0clk", "GPIO1clk", "GPIO2clk", "DDRCclk", "FIC0clk", "FIC1clk", "FIC2clk", "FIC3clk", "ATHENAclk", "CFMclk";
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
> +                       status = "okay";
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
> +                       status = "okay";
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
> +                       status = "okay";
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
> +                       status = "okay";
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
> +                       status = "okay";
> +               };
> +
> +               emac1: ethernet@20112000 {
> +                       compatible = "cdns,macb";
> +                       reg = <0x0 0x20112000 0x0 0x2000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <70 71 72 73>;
> +                       mac-address = [56 34 12 00 FC 00];
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
> +
> +               uio_axi_lsram@2030000000 {
> +                       compatible = "generic-uio";
> +                       reg = <0x20 0x30000000 0 0x80000000 >;
> +                       status = "okay";
> +               };
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
