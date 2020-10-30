Return-Path: <SRS0=IYIb=EF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA93C4741F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 20:28:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E18F2076D
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 20:28:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S/1nceLN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="I0o9pEVf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E18F2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4zwR13goyP5UARjHHDUa4PDigRx6n8Rc3nCL5WFex/E=; b=S/1nceLNx0B+yO6IWRUyooHZL
	NUbgOlj8yMxbYhKyHpCZDuyUDDtKk4Yu43DPStngqC38fynYDlVDdgNlpe/Bmz5Jc49+eBC5Cc2Xo
	2KGDzCJgRziUaKkvZkWKKLTvA6iEnynjbn7aQRIbKXWoin6z524thNDhNY/4ED0JdIp2jXqIPW7Ow
	DnirADRH7tYnxvLn/ZfRNEZMGIWD31D45fuEPwog+gYYZoI0PqcWrEljfufbvrekzYKRoV6eYHgNY
	QCa8uOuHhWRjtfeuQLy8COi6yqkMbPJv+1Tz3qI3Q/5bFjWHfsq/P8x88JgBpJ+wW9FnMYTgGbsM1
	1Pa7KuRjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYazt-00020j-0e; Fri, 30 Oct 2020 20:27:41 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYazq-00020Q-Gb
 for linux-riscv@lists.infradead.org; Fri, 30 Oct 2020 20:27:39 +0000
Received: by mail-io1-xd41.google.com with SMTP id z17so8808283iog.11
 for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2020 13:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l6L8J7TQpQGj95Z9RtLis5s5Qg/ko8Slww2VXzzAiqE=;
 b=I0o9pEVfno/qU6ovogWT0mVU0HoCIwOih+sYM6Jj7FK+yqZaGtD5SLDnLBth1ZlIPB
 QYaWgqrjJYNveW7gsAFUHOL4d9tTqHSp4uRleK4pNihBNQkwJJ2YxvRUplT2YZVJI0Bw
 J5TSaGFKo5l4ynbDoEFiSmZflisB4Ju9ieX34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l6L8J7TQpQGj95Z9RtLis5s5Qg/ko8Slww2VXzzAiqE=;
 b=HhsD3AzvjyadzJvaiLYT/Prd4f6ShKbh+q+ZXOMsY66shsVqCg9tCs+mJ0bhOhEMOi
 UzyQULtFFPSNXd27kKUGFfyLa7srRBV/FAK1RRA31MG7i4ek6CSKXkqtLPlcF7/CQXl+
 r4SYWY4dMRjVnQZEBXv+os1T/KBxLa0APa+SBnhZyLVh4gKamZabhTbVwPBQ0c1bb4kx
 Es5Vs5+pweD4EsIy61XkgrPdWhUmA8D0Vj4Ge7UmaeMRDcaORplXrSLHb92/G8vA8T0c
 7bMCagjVWGWNnXwhWkaOmG4rccoG61qSZE7tzEQDpOYxGjjTJt1if2JezQAJl0IOqjud
 d5Kg==
X-Gm-Message-State: AOAM531mad6cEOkXLDn43EKYMpUKiT2i/C0Gu4Hd2zEKAuuohPUKYRbZ
 m1ewD5mhEyfTh4sTj+8lqkhpBp0a67BZ5tx21iLAsfSZtxYd
X-Google-Smtp-Source: ABdhPJww/GufaQPAUwS+RKiwGlDwkQ00YiyMdyxjD9vGebY3gk/dJGLRmNoQiWo9NSuozqUjnhYhSaoZg+iVzuaV96k=
X-Received: by 2002:a5d:9842:: with SMTP id p2mr3166678ios.113.1604089656337; 
 Fri, 30 Oct 2020 13:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <CAAhSdy0pW8AFCDtFkEO_4zjg8Exp+XTb09AjhErdX9u-Jw3OuQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0pW8AFCDtFkEO_4zjg8Exp+XTb09AjhErdX9u-Jw3OuQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 30 Oct 2020 13:27:25 -0700
Message-ID: <CAOnJCUKCbkZVGX5Rjputs9QQAHCvH6Fikt7kVGsyCkNjbdMv=Q@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_162738_711293_4B032F87 
X-CRM114-Status: GOOD (  19.85  )
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
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Padmarao Begari <padmarao.begari@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 30, 2020 at 2:05 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Oct 29, 2020 at 4:58 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > Add initial DTS for Microchip ICICLE board having only
> > essential devcies (clocks, sdhci, ethernet, serial, etc).
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/boot/dts/Makefile                  |   1 +
> >  arch/riscv/boot/dts/microchip/Makefile        |   2 +
> >  .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
>
> I suggest we split this DTS into two parts:
> 1. SOC (microchip-polarfire.dtsi)
> 2. Board (microchip-icicle-kit-a000.dts)
>
> This will be much cleaner and aligned with what is done
> on other architectures.
>

Sure. I will do that in v2.

> >  3 files changed, 316 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/microchip/Makefile
> >  create mode 100644 arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
> >
> > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> > index ca1f8cbd78c0..3ea94ea0a18a 100644
> > --- a/arch/riscv/boot/dts/Makefile
> > +++ b/arch/riscv/boot/dts/Makefile
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  subdir-y += sifive
> >  subdir-y += kendryte
> > +subdir-y += microchip
> >
> >  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> > diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
> > new file mode 100644
> > index 000000000000..55ad77521304
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/microchip/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-icicle-kit-a000.dtb
> > diff --git a/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts b/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
> > new file mode 100644
> > index 000000000000..5848920af55c
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
> > @@ -0,0 +1,313 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/* Copyright (c) 2020 Microchip Technology Inc */
> > +
> > +/dts-v1/;
> > +
> > +/* Clock frequency (in Hz) of the rtcclk */
> > +#define RTCCLK_FREQ            1000000
> > +
> > +/ {
> > +       #address-cells = <2>;
> > +       #size-cells = <2>;
> > +       model = "Microchip PolarFire-SoC";
> > +       compatible = "microchip,polarfire-soc";
> > +
> > +       chosen {
> > +               stdout-path = &serial0;
> > +       };
> > +
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +               timebase-frequency = <RTCCLK_FREQ>;
> > +
> > +               cpu@0 {
> > +                       clock-frequency = <0>;
> > +                       compatible = "sifive,rocket0", "riscv";
> > +                       device_type = "cpu";
> > +                       i-cache-block-size = <64>;
> > +                       i-cache-sets = <128>;
> > +                       i-cache-size = <16384>;
> > +                       reg = <0>;
> > +                       riscv,isa = "rv64imac";
> > +                       status = "disabled";
> > +
> > +                       cpu0_intc: interrupt-controller {
> > +                               #interrupt-cells = <1>;
> > +                               compatible = "riscv,cpu-intc";
> > +                               interrupt-controller;
> > +                       };
> > +               };
> > +
> > +               cpu@1 {
> > +                       clock-frequency = <0>;
> > +                       compatible = "sifive,rocket0", "riscv";
> > +                       d-cache-block-size = <64>;
> > +                       d-cache-sets = <64>;
> > +                       d-cache-size = <32768>;
> > +                       d-tlb-sets = <1>;
> > +                       d-tlb-size = <32>;
> > +                       device_type = "cpu";
> > +                       i-cache-block-size = <64>;
> > +                       i-cache-sets = <64>;
> > +                       i-cache-size = <32768>;
> > +                       i-tlb-sets = <1>;
> > +                       i-tlb-size = <32>;
> > +                       mmu-type = "riscv,sv39";
> > +                       reg = <1>;
> > +                       riscv,isa = "rv64imafdc";
> > +                       tlb-split;
> > +                       status = "okay";
> > +
> > +                       cpu1_intc: interrupt-controller {
> > +                               #interrupt-cells = <1>;
> > +                               compatible = "riscv,cpu-intc";
> > +                               interrupt-controller;
> > +                       };
> > +               };
> > +
> > +               cpu@2 {
> > +                       clock-frequency = <0>;
> > +                       compatible = "sifive,rocket0", "riscv";
> > +                       d-cache-block-size = <64>;
> > +                       d-cache-sets = <64>;
> > +                       d-cache-size = <32768>;
> > +                       d-tlb-sets = <1>;
> > +                       d-tlb-size = <32>;
> > +                       device_type = "cpu";
> > +                       i-cache-block-size = <64>;
> > +                       i-cache-sets = <64>;
> > +                       i-cache-size = <32768>;
> > +                       i-tlb-sets = <1>;
> > +                       i-tlb-size = <32>;
> > +                       mmu-type = "riscv,sv39";
> > +                       reg = <2>;
> > +                       riscv,isa = "rv64imafdc";
> > +                       tlb-split;
> > +                       status = "okay";
> > +
> > +                       cpu2_intc: interrupt-controller {
> > +                               #interrupt-cells = <1>;
> > +                               compatible = "riscv,cpu-intc";
> > +                               interrupt-controller;
> > +                       };
> > +               };
> > +
> > +               cpu@3 {
> > +                       clock-frequency = <0>;
> > +                       compatible = "sifive,rocket0", "riscv";
> > +                       d-cache-block-size = <64>;
> > +                       d-cache-sets = <64>;
> > +                       d-cache-size = <32768>;
> > +                       d-tlb-sets = <1>;
> > +                       d-tlb-size = <32>;
> > +                       device_type = "cpu";
> > +                       i-cache-block-size = <64>;
> > +                       i-cache-sets = <64>;
> > +                       i-cache-size = <32768>;
> > +                       i-tlb-sets = <1>;
> > +                       i-tlb-size = <32>;
> > +                       mmu-type = "riscv,sv39";
> > +                       reg = <3>;
> > +                       riscv,isa = "rv64imafdc";
> > +                       tlb-split;
> > +                       status = "okay";
> > +
> > +                       cpu3_intc: interrupt-controller {
> > +                               #interrupt-cells = <1>;
> > +                               compatible = "riscv,cpu-intc";
> > +                               interrupt-controller;
> > +                       };
> > +               };
> > +
> > +               cpu@4 {
> > +                       clock-frequency = <0>;
> > +                       compatible = "sifive,rocket0", "riscv";
> > +                       d-cache-block-size = <64>;
> > +                       d-cache-sets = <64>;
> > +                       d-cache-size = <32768>;
> > +                       d-tlb-sets = <1>;
> > +                       d-tlb-size = <32>;
> > +                       device_type = "cpu";
> > +                       i-cache-block-size = <64>;
> > +                       i-cache-sets = <64>;
> > +                       i-cache-size = <32768>;
> > +                       i-tlb-sets = <1>;
> > +                       i-tlb-size = <32>;
> > +                       mmu-type = "riscv,sv39";
> > +                       reg = <4>;
> > +                       riscv,isa = "rv64imafdc";
> > +                       tlb-split;
> > +                       status = "okay";
> > +                       cpu4_intc: interrupt-controller {
> > +                               #interrupt-cells = <1>;
> > +                               compatible = "riscv,cpu-intc";
> > +                               interrupt-controller;
> > +                       };
> > +               };
> > +       };
> > +
> > +       memory@80000000 {
> > +               device_type = "memory";
> > +               reg = <0x0 0x80000000 0x0 0x40000000>;
> > +               clocks = <&clkcfg 26>;
> > +       };
> > +
> > +       soc {
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               compatible = "simple-bus";
> > +               ranges;
> > +
> > +               cache-controller@2010000 {
> > +                       compatible = "sifive,fu540-c000-ccache", "cache";
> > +                       cache-block-size = <64>;
> > +                       cache-level = <2>;
> > +                       cache-sets = <1024>;
> > +                       cache-size = <2097152>;
> > +                       cache-unified;
> > +                       interrupt-parent = <&plic>;
> > +                       interrupts = <1 2 3>;
> > +                       reg = <0x0 0x2010000 0x0 0x1000>;
> > +               };
> > +
> > +               clint@2000000 {
> > +                       compatible = "riscv,clint0";
> > +                       reg = <0x0 0x2000000 0x0 0xC000>;
> > +                       interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> > +                                               &cpu1_intc 3 &cpu1_intc 7
> > +                                               &cpu2_intc 3 &cpu2_intc 7
> > +                                               &cpu3_intc 3 &cpu3_intc 7
> > +                                               &cpu4_intc 3 &cpu4_intc 7>;
> > +               };
> > +
> > +               plic: interrupt-controller@c000000 {
> > +                       #interrupt-cells = <1>;
> > +                       compatible = "sifive,plic-1.0.0";
> > +                       reg = <0x0 0xc000000 0x0 0x4000000>;
> > +                       riscv,ndev = <53>;
> > +                       interrupt-controller;
> > +                       interrupts-extended = <&cpu0_intc 11
> > +                                       &cpu1_intc 11 &cpu1_intc 9
> > +                                       &cpu2_intc 11 &cpu2_intc 9
> > +                                       &cpu3_intc 11 &cpu3_intc 9
> > +                                       &cpu4_intc 11 &cpu4_intc 9>;
> > +               };
> > +
> > +               dma@3000000 {
> > +                       compatible = "sifive,fu540-c000-pdma";
> > +                       reg = <0x0 0x3000000 0x0 0x8000>;
> > +                       interrupt-parent = <&plic>;
> > +                       interrupts = <23 24 25 26 27 28 29 30>;
> > +                       #dma-cells = <1>;
> > +               };
> > +
> > +               refclk: refclk {
> > +                       compatible = "fixed-clock";
> > +                       #clock-cells = <0>;
> > +                       clock-frequency = <600000000>;
> > +                       clock-output-names = "msspllclk";
> > +               };
> > +
> > +               clkcfg: clkcfg@20002000 {
> > +                       compatible = "microchip,pfsoc-clkcfg";
> > +                       reg = <0x0 0x20002000 0x0 0x1000>;
> > +                       reg-names = "mss_sysreg";
> > +                       clocks = <&refclk>;
> > +                       #clock-cells = <1>;
> > +                       clock-output-names = "cpuclk", "axiclk", "ahbclk", "ENVMclk", "MAC0clk", "MAC1clk", "MMCclk", "TIMERclk", "MMUART0clk", "MMUART1clk", "MMUART2clk", "MMUART3clk", "MMUART4clk", "SPI0clk", "SPI1clk", "I2C0clk", "I2C1clk", "CAN0clk", "CAN1clk", "USBclk", "RESERVED", "RTCclk", "QSPIclk", "GPIO0clk", "GPIO1clk", "GPIO2clk", "DDRCclk", "FIC0clk", "FIC1clk", "FIC2clk", "FIC3clk", "ATHENAclk", "CFMclk";
> > +               };
> > +
> > +               serial0: serial@20000000 {
> > +                       compatible = "ns16550a";
> > +                       reg = <0x0 0x20000000 0x0 0x400>;
> > +                       reg-io-width = <4>;
> > +                       reg-shift = <2>;
> > +                       interrupt-parent = <&plic>;
> > +                       interrupts = <90>;
> > +                       current-speed = <115200>;
> > +                       clocks = <&clkcfg 8>;
> > +                       status = "okay";
> > +               };
> > +
> > +               serial1: serial@20100000 {
> > +                       compatible = "ns16550a";
> > +                       reg = <0x0 0x20100000 0x0 0x400>;
> > +                       reg-io-width = <4>;
> > +                       reg-shift = <2>;
> > +                       interrupt-parent = <&plic>;
> > +                       interrupts = <91>;
> > +                       current-speed = <115200>;
> > +                       clocks = <&clkcfg 9>;
> > +                       status = "okay";
> > +               };
> > +
> > +               serial2: serial@20102000 {
> > +                       compatible = "ns16550a";
> > +                       reg = <0x0 0x20102000 0x0 0x400>;
> > +                       reg-io-width = <4>;
> > +                       reg-shift = <2>;
> > +                       interrupt-parent = <&plic>;
> > +                       interrupts = <92>;
> > +                       current-speed = <115200>;
> > +                       clocks = <&clkcfg 10>;
> > +                       status = "okay";
> > +               };
> > +
> > +               serial3: serial@20104000 {
> > +                       compatible = "ns16550a";
> > +                       reg = <0x0 0x20104000 0x0 0x400>;
> > +                       reg-io-width = <4>;
> > +                       reg-shift = <2>;
> > +                       interrupt-parent = <&plic>;
> > +                       interrupts = <93>;
> > +                       current-speed = <115200>;
> > +                       clocks = <&clkcfg 11>;
> > +                       status = "okay";
> > +               };
> > +
> > +               sdcard: sdhc@20008000 {
> > +                       compatible = "cdns,sd4hc";
> > +                       reg = <0x0 0x20008000 0x0 0x1000>;
> > +                       interrupt-parent = <&plic>;
> > +                       interrupts = <88>;
> > +                       pinctrl-names = "default";
> > +                       clocks = <&clkcfg 6>;
> > +                       bus-width = <4>;
> > +                       disable-wp;
> > +                       no-1-8-v;
> > +                       cap-mmc-highspeed;
> > +                       cap-sd-highspeed;
> > +                       card-detect-delay = <200>;
> > +                       sd-uhs-sdr12;
> > +                       sd-uhs-sdr25;
> > +                       sd-uhs-sdr50;
> > +                       sd-uhs-sdr104;
> > +                       max-frequency = <200000000>;
> > +                       status = "okay";
> > +               };
> > +
> > +               emac1: ethernet@20112000 {
> > +                       compatible = "cdns,macb";
> > +                       reg = <0x0 0x20112000 0x0 0x2000>;
> > +                       interrupt-parent = <&plic>;
> > +                       interrupts = <70 71 72 73>;
> > +                       mac-address = [56 34 12 00 FC 00];
> > +                       phy-mode = "sgmii";
> > +                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> > +                       clock-names = "pclk", "hclk";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       phy1: ethernet-phy@9 {
> > +                               reg = <9>;
> > +                               ti,fifo-depth = <0x01>;
> > +                       };
> > +               };
> > +
> > +               uio_axi_lsram@2030000000 {
> > +                       compatible = "generic-uio";
> > +                       reg = <0x20 0x30000000 0 0x80000000 >;
> > +                       status = "okay";
> > +               };
> > +       };
> > +};
> > --
> > 2.25.1
> >
>
> Regards,
> Anup
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
