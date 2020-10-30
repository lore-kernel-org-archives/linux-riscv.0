Return-Path: <SRS0=IYIb=EF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3119C6369E
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 07:11:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD2E20723
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 07:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G4/jflMk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="OfSrZcIv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FD2E20723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g4pK5qDb6CjehbQt7yqww9s9vaKiOJb2rbR8QRN8VYA=; b=G4/jflMkmpWiuD9hx8Ca04rWg
	OPXJO7eg880j7dHMlBj5v5yv1FUxOut3DkxYmm165LfBN38jx+Q0qlqoWsfVznAQTR6StaM2jqJi5
	Q+9ojJb4N/vZG6nAHAHaxNnhT7EgTFqRwATH2dTewVsKopt59dOonxxWmdwg4vEYm3MXb2QDfKOqp
	ka8GgviBZIAazpfaKzvckAsFLRi0tQjxWB57ZpD+RTb7/9ERaq/xldWc4QqDAKmDQr+mpmWm00jAX
	MeICErKklJNQeHdDwEMKJ9i7ikuSv+u7cGRiEAJx2kZ0ToP1w+N00cgp87GPE2rRTjHUKhHuMZQOZ
	aTEhvAySg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYOZG-00036b-TK; Fri, 30 Oct 2020 07:11:22 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYOZC-00035K-Uo
 for linux-riscv@lists.infradead.org; Fri, 30 Oct 2020 07:11:21 +0000
Received: by mail-io1-xd43.google.com with SMTP id u19so6507542ion.3
 for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2020 00:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lCDu4YJEI+q9a2OpMirtjxhLxtnBQw3CAKzIexy7ftU=;
 b=OfSrZcIv5CT9u8kr0FCatES7KaXo/rTKyMvTz+Y3S4cIOJmgbNJucV4PGs9M0Bw4dT
 /newLtGLA8z0DkuLbX2k/rTDUQn8wqYmmL/FsQzH504jzpyUqKede0nCJPXw7uHNjsaz
 FiBmSXyVGtw+jGK48DgxRfO77/6WcVycNI2a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lCDu4YJEI+q9a2OpMirtjxhLxtnBQw3CAKzIexy7ftU=;
 b=co6bJeuAfUCj9DPwa5iGg8L/pS0g25D/dBKogpqjUJc9syLj9wmoST4cGn+SwAArAs
 I3ZRO21mg29sI0ChPFFRJaey0L7E72n5qKQxUXVggN+7ND9LwuSLAMxmgaNajaCWk09Q
 2yHHnnCF28VqO4UCihSxvfhNsSpfHXY0VMPZPhb0NGHPBk2ST4N4Bb+DFoahZanC0RtB
 yfjtSFiNUqx0iBJJSXJJue7WPpqlHepy+mRsTcjU2aYcwGJLcZOSdJJjzGPLQEGbtxn+
 f4UdtxDbNRniIslrNsSNvQSxJsRoTVtEJOmSXHVnOuWU5cGovuOTePDNucE2YhtFUfo2
 WMqg==
X-Gm-Message-State: AOAM5334t6S/kr5r7CV6bSUVb7JhOZ6UHdLVxYog3NotPwprt4706JM8
 kgm7D03zrTDmtj9RMuM9FwQDaOKFuPMDw3dmQZcT
X-Google-Smtp-Source: ABdhPJzhV12emgquuh/faM9LcKz6FglfK3ez3AVbqeCjH53Oo6frLWUWXoN0iCa9+pL863stDszhf6WpMYrMoIo1LNc=
X-Received: by 2002:a05:6638:2b3:: with SMTP id
 d19mr882266jaq.141.1604041875672; 
 Fri, 30 Oct 2020 00:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <41f1248b-78c6-bac1-410b-9e222368c5f6@codethink.co.uk>
In-Reply-To: <41f1248b-78c6-bac1-410b-9e222368c5f6@codethink.co.uk>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 30 Oct 2020 00:11:04 -0700
Message-ID: <CAOnJCUJhQ=Zv0S4iCK4CDzQr_dfkw3J6ycdM=p6=5B2_sL1Ekg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
To: Ben Dooks <ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_031119_196540_62A2A103 
X-CRM114-Status: GOOD (  24.46  )
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

On Thu, Oct 29, 2020 at 3:24 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 28/10/2020 23:27, Atish Patra wrote:
> > Add initial DTS for Microchip ICICLE board having only
> > essential devcies (clocks, sdhci, ethernet, serial, etc).
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >   arch/riscv/boot/dts/Makefile                  |   1 +
> >   arch/riscv/boot/dts/microchip/Makefile        |   2 +
> >   .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
> >   3 files changed, 316 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/microchip/Makefile
> >   create mode 100644 arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
> >
> > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> > index ca1f8cbd78c0..3ea94ea0a18a 100644
> > --- a/arch/riscv/boot/dts/Makefile
> > +++ b/arch/riscv/boot/dts/Makefile
> > @@ -1,5 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >   subdir-y += sifive
> >   subdir-y += kendryte
> > +subdir-y += microchip
> >
> >   obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
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
> > +#define RTCCLK_FREQ          1000000
> > +
> > +/ {
> > +     #address-cells = <2>;
> > +     #size-cells = <2>;
> > +     model = "Microchip PolarFire-SoC";
> > +     compatible = "microchip,polarfire-soc";
> > +
> > +     chosen {
> > +             stdout-path = &serial0;
> > +     };
> > +
> > +     cpus {
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             timebase-frequency = <RTCCLK_FREQ>;
> > +
> > +             cpu@0 {
> > +                     clock-frequency = <0>;
> > +                     compatible = "sifive,rocket0", "riscv";
> > +                     device_type = "cpu";
> > +                     i-cache-block-size = <64>;
> > +                     i-cache-sets = <128>;
> > +                     i-cache-size = <16384>;
> > +                     reg = <0>;
> > +                     riscv,isa = "rv64imac";
> > +                     status = "disabled";
> > +
> > +                     cpu0_intc: interrupt-controller {
> > +                             #interrupt-cells = <1>;
> > +                             compatible = "riscv,cpu-intc";
> > +                             interrupt-controller;
> > +                     };
> > +             };
> > +
> > +             cpu@1 {
> > +                     clock-frequency = <0>;
> > +                     compatible = "sifive,rocket0", "riscv";
> > +                     d-cache-block-size = <64>;
> > +                     d-cache-sets = <64>;
> > +                     d-cache-size = <32768>;
> > +                     d-tlb-sets = <1>;
> > +                     d-tlb-size = <32>;
> > +                     device_type = "cpu";
> > +                     i-cache-block-size = <64>;
> > +                     i-cache-sets = <64>;
> > +                     i-cache-size = <32768>;
> > +                     i-tlb-sets = <1>;
> > +                     i-tlb-size = <32>;
> > +                     mmu-type = "riscv,sv39";
> > +                     reg = <1>;
> > +                     riscv,isa = "rv64imafdc";
> > +                     tlb-split;
> > +                     status = "okay";
> > +
> > +                     cpu1_intc: interrupt-controller {
> > +                             #interrupt-cells = <1>;
> > +                             compatible = "riscv,cpu-intc";
> > +                             interrupt-controller;
> > +                     };
> > +             };
> > +
> > +             cpu@2 {
> > +                     clock-frequency = <0>;
> > +                     compatible = "sifive,rocket0", "riscv";
> > +                     d-cache-block-size = <64>;
> > +                     d-cache-sets = <64>;
> > +                     d-cache-size = <32768>;
> > +                     d-tlb-sets = <1>;
> > +                     d-tlb-size = <32>;
> > +                     device_type = "cpu";
> > +                     i-cache-block-size = <64>;
> > +                     i-cache-sets = <64>;
> > +                     i-cache-size = <32768>;
> > +                     i-tlb-sets = <1>;
> > +                     i-tlb-size = <32>;
> > +                     mmu-type = "riscv,sv39";
> > +                     reg = <2>;
> > +                     riscv,isa = "rv64imafdc";
> > +                     tlb-split;
> > +                     status = "okay";
> > +
> > +                     cpu2_intc: interrupt-controller {
> > +                             #interrupt-cells = <1>;
> > +                             compatible = "riscv,cpu-intc";
> > +                             interrupt-controller;
> > +                     };
> > +             };
> > +
> > +             cpu@3 {
> > +                     clock-frequency = <0>;
> > +                     compatible = "sifive,rocket0", "riscv";
> > +                     d-cache-block-size = <64>;
> > +                     d-cache-sets = <64>;
> > +                     d-cache-size = <32768>;
> > +                     d-tlb-sets = <1>;
> > +                     d-tlb-size = <32>;
> > +                     device_type = "cpu";
> > +                     i-cache-block-size = <64>;
> > +                     i-cache-sets = <64>;
> > +                     i-cache-size = <32768>;
> > +                     i-tlb-sets = <1>;
> > +                     i-tlb-size = <32>;
> > +                     mmu-type = "riscv,sv39";
> > +                     reg = <3>;
> > +                     riscv,isa = "rv64imafdc";
> > +                     tlb-split;
> > +                     status = "okay";
> > +
> > +                     cpu3_intc: interrupt-controller {
> > +                             #interrupt-cells = <1>;
> > +                             compatible = "riscv,cpu-intc";
> > +                             interrupt-controller;
> > +                     };
> > +             };
> > +
> > +             cpu@4 {
> > +                     clock-frequency = <0>;
> > +                     compatible = "sifive,rocket0", "riscv";
> > +                     d-cache-block-size = <64>;
> > +                     d-cache-sets = <64>;
> > +                     d-cache-size = <32768>;
> > +                     d-tlb-sets = <1>;
> > +                     d-tlb-size = <32>;
> > +                     device_type = "cpu";
> > +                     i-cache-block-size = <64>;
> > +                     i-cache-sets = <64>;
> > +                     i-cache-size = <32768>;
> > +                     i-tlb-sets = <1>;
> > +                     i-tlb-size = <32>;
> > +                     mmu-type = "riscv,sv39";
> > +                     reg = <4>;
> > +                     riscv,isa = "rv64imafdc";
> > +                     tlb-split;
> > +                     status = "okay";
> > +                     cpu4_intc: interrupt-controller {
> > +                             #interrupt-cells = <1>;
> > +                             compatible = "riscv,cpu-intc";
> > +                             interrupt-controller;
> > +                     };
> > +             };
> > +     };
> > +
> > +     memory@80000000 {
> > +             device_type = "memory";
> > +             reg = <0x0 0x80000000 0x0 0x40000000>;
> > +             clocks = <&clkcfg 26>;
> > +     };
>
> U-boot doesn't seem to be updating this properly.
>
> The board should have 2GiB, confirmed by looking at the device's
> chip markings. We only see 1GiB memory. The 0x80000000 bus window
> is only capable of dealing with 1GiB memory. The higher 64-bit one
> can have 16GiB mapped.
>
> Do we need a second node for the second GiB of memory?
>
We could just modify the reg size but to allow more memory. I tried
that for Linux but it didn't boot.
Probably, DDR init code in HSS only initialized 1GB of memory.

> > +
> > +     soc {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             compatible = "simple-bus";
> > +             ranges;
> > +
> > +             cache-controller@2010000 {
> > +                     compatible = "sifive,fu540-c000-ccache", "cache";
> > +                     cache-block-size = <64>;
> > +                     cache-level = <2>;
> > +                     cache-sets = <1024>;
> > +                     cache-size = <2097152>;
> > +                     cache-unified;
> > +                     interrupt-parent = <&plic>;
> > +                     interrupts = <1 2 3>;
> > +                     reg = <0x0 0x2010000 0x0 0x1000>;
> > +             };
> > +
> > +             clint@2000000 {
> > +                     compatible = "riscv,clint0";
> > +                     reg = <0x0 0x2000000 0x0 0xC000>;
> > +                     interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> > +                                             &cpu1_intc 3 &cpu1_intc 7
> > +                                             &cpu2_intc 3 &cpu2_intc 7
> > +                                             &cpu3_intc 3 &cpu3_intc 7
> > +                                             &cpu4_intc 3 &cpu4_intc 7>;
> > +             };
> > +
> > +             plic: interrupt-controller@c000000 {
> > +                     #interrupt-cells = <1>;
> > +                     compatible = "sifive,plic-1.0.0";
> > +                     reg = <0x0 0xc000000 0x0 0x4000000>;
> > +                     riscv,ndev = <53>;
> > +                     interrupt-controller;
> > +                     interrupts-extended = <&cpu0_intc 11
> > +                                     &cpu1_intc 11 &cpu1_intc 9
> > +                                     &cpu2_intc 11 &cpu2_intc 9
> > +                                     &cpu3_intc 11 &cpu3_intc 9
> > +                                     &cpu4_intc 11 &cpu4_intc 9>;
> > +             };
> > +
> > +             dma@3000000 {
> > +                     compatible = "sifive,fu540-c000-pdma";
> > +                     reg = <0x0 0x3000000 0x0 0x8000>;
> > +                     interrupt-parent = <&plic>;
> > +                     interrupts = <23 24 25 26 27 28 29 30>;
> > +                     #dma-cells = <1>;
> > +             };
> > +
> > +             refclk: refclk {
> > +                     compatible = "fixed-clock";
> > +                     #clock-cells = <0>;
> > +                     clock-frequency = <600000000>;
> > +                     clock-output-names = "msspllclk";
> > +             };
> > +
> > +             clkcfg: clkcfg@20002000 {
> > +                     compatible = "microchip,pfsoc-clkcfg";
> > +                     reg = <0x0 0x20002000 0x0 0x1000>;
> > +                     reg-names = "mss_sysreg";
> > +                     clocks = <&refclk>;
> > +                     #clock-cells = <1>;
> > +                     clock-output-names = "cpuclk", "axiclk", "ahbclk", "ENVMclk", "MAC0clk", "MAC1clk", "MMCclk", "TIMERclk", "MMUART0clk", "MMUART1clk", "MMUART2clk", "MMUART3clk", "MMUART4clk", "SPI0clk", "SPI1clk", "I2C0clk", "I2C1clk", "CAN0clk", "CAN1clk", "USBclk", "RESERVED", "RTCclk", "QSPIclk", "GPIO0clk", "GPIO1clk", "GPIO2clk", "DDRCclk", "FIC0clk", "FIC1clk", "FIC2clk", "FIC3clk", "ATHENAclk", "CFMclk";
>
> Any chance of making this list multi-line, it is difficult to read as-is.
>

Yes. We can also get rid of a few names that are not used. I will fix it in v2.

> > +             };
> > +
> > +             serial0: serial@20000000 {
> > +                     compatible = "ns16550a";
> > +                     reg = <0x0 0x20000000 0x0 0x400>;
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> > +                     interrupt-parent = <&plic>;
> > +                     interrupts = <90>;
> > +                     current-speed = <115200>;
> > +                     clocks = <&clkcfg 8>;
> > +                     status = "okay";
> > +             };
> > +
> > +             serial1: serial@20100000 {
> > +                     compatible = "ns16550a";
> > +                     reg = <0x0 0x20100000 0x0 0x400>;
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> > +                     interrupt-parent = <&plic>;
> > +                     interrupts = <91>;
> > +                     current-speed = <115200>;
> > +                     clocks = <&clkcfg 9>;
> > +                     status = "okay";
> > +             };
> > +
> > +             serial2: serial@20102000 {
> > +                     compatible = "ns16550a";
> > +                     reg = <0x0 0x20102000 0x0 0x400>;
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> > +                     interrupt-parent = <&plic>;
> > +                     interrupts = <92>;
> > +                     current-speed = <115200>;
> > +                     clocks = <&clkcfg 10>;
> > +                     status = "okay";
> > +             };
> > +
> > +             serial3: serial@20104000 {
> > +                     compatible = "ns16550a";
> > +                     reg = <0x0 0x20104000 0x0 0x400>;
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> > +                     interrupt-parent = <&plic>;
> > +                     interrupts = <93>;
> > +                     current-speed = <115200>;
> > +                     clocks = <&clkcfg 11>;
> > +                     status = "okay";
> > +             };
> > +
> > +             sdcard: sdhc@20008000 {
> > +                     compatible = "cdns,sd4hc";
> > +                     reg = <0x0 0x20008000 0x0 0x1000>;
> > +                     interrupt-parent = <&plic>;
> > +                     interrupts = <88>;
> > +                     pinctrl-names = "default";
> > +                     clocks = <&clkcfg 6>;
> > +                     bus-width = <4>;
> > +                     disable-wp;
> > +                     no-1-8-v;
> > +                     cap-mmc-highspeed;
> > +                     cap-sd-highspeed;
> > +                     card-detect-delay = <200>;
> > +                     sd-uhs-sdr12;
> > +                     sd-uhs-sdr25;
> > +                     sd-uhs-sdr50;
> > +                     sd-uhs-sdr104;
> > +                     max-frequency = <200000000>;
> > +                     status = "okay";
> > +             };
>
> Given eMMC is the default device, shouldn't that be default for the
> device tree too? Even if not, having the emmc node here would be a
> good thing as it is different to the SD node.
>

I tested this device tree with sdcard. That's why, I just picked the
sdcard node.
I am not sure if both eMMC & sdcard node can co-exist. The polar fire
soc github repo
seems to point that both of them have the same address and only 1 can be enabled
at that time. That may not be true now as the github repo has not been
updated in
couple of months.

@Cyril : Can we enable both eMMC & sdcard at the same time ?

> > +
> > +             emac1: ethernet@20112000 {
> > +                     compatible = "cdns,macb";
> > +                     reg = <0x0 0x20112000 0x0 0x2000>;
> > +                     interrupt-parent = <&plic>;
> > +                     interrupts = <70 71 72 73>;
> > +                     mac-address = [56 34 12 00 FC 00];
> > +                     phy-mode = "sgmii";
> > +                     clocks = <&clkcfg 5>, <&clkcfg 2>;
> > +                     clock-names = "pclk", "hclk";
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     phy1: ethernet-phy@9 {
> > +                             reg = <9>;
> > +                             ti,fifo-depth = <0x01>;
> > +                     };
> > +             };
>
> Aren't there two ethernet ports on the board?
>

Yes. I hadn't tested that out. I will test it and add the 2nd one as well.

> Also, at the moment u-boot is not filling the MAC address parameter
> in so we've got at two boards on the network with the same MAC until
> we override it in the device tree for the second.
>

Looking at latest U-Boot patches, it seems it updates the mac address
from the serial number.

> > +
> > +             uio_axi_lsram@2030000000 {
> > +                     compatible = "generic-uio";
> > +                     reg = <0x20 0x30000000 0 0x80000000 >;
> > +                     status = "okay";
> > +             };
> > +     };
> > +};
> >
>
>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html
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
