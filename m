Return-Path: <SRS0=n1sQ=GK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727C1C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 19:26:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECBB523443
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 19:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECBB523443
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kwidFINmEIJv83D7w7Z7GBNA2PWyfDBSP557oaa2RQI=; b=gS2q6cbPnItpIVvTiQpOeasjx
	h3BzcN6yNcgsguhSnlWx1j+S0cB2zeRMXbwNNzAy4xhblUtjFHNYpi3S53hiu0Lk6k0rV8TvC/jjC
	H5TkDFeiAdCYF3T/vd1mqr+/JJN4sXVf96vtwuUdWTW6h/w7/n3tVPY7HvgKC/aSgaws9yvHUvLma
	51xhzwTGI46rsHCUsTwSQA7DFjDxbIwkQbHGmYsYxhFV2M/NdOAJ6+jrLC+5rNm3klV3PzOzFyQIf
	7HKMi0dzTsr2sIgFB1sVSdUieZ1t2UyLeAedsGLeVAho5fuaD5WTf3a3u0Mo/AEaU2PREVcw9Kfdl
	8l1UGiH9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxavO-0001wf-Q3; Thu, 07 Jan 2021 19:26:22 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxavL-0001vr-9S
 for linux-riscv@lists.infradead.org; Thu, 07 Jan 2021 19:26:20 +0000
Received: by mail-io1-xd36.google.com with SMTP id t8so7263130iov.8
 for <linux-riscv@lists.infradead.org>; Thu, 07 Jan 2021 11:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R9ec2rorXNKpnB5tpr0X0coC8E+Od//lfBeIjHtucUw=;
 b=pxXetlPiVN82xE9Utf2DOeuVkOUHkb5PYQc5m2LypbJEFviN56Xg3SZLkjEI6wOaeH
 9dwZoCz6hO/sjs3RBoCQwSvbVERozi+jq4q0/Afk1nhVDyu5ekCQfGCAzscsEkPAS2Pl
 +FQCrFrTN4pBNcvA8eCe728iBQSPDnS6qpXks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R9ec2rorXNKpnB5tpr0X0coC8E+Od//lfBeIjHtucUw=;
 b=BTbLW+MjDop5NDKcAbrmAbomLrMvsosDkxWASsW39fbF4s1Gbj2IuMyoE7cMR3IU2k
 F9x4Is6kMLABGuPL8XpqEzEKpCLSsk7KAslCbjWNtaGLRiqVVSv5sBBkzuOBZLAgsm9/
 IOwtxpcjmEJ+IJz2k1xUgR8WxGUtZYV4II6N2O/Cpj8jBH2E4709skKLFfsZFvq5cty/
 RK5+V+r0eQhgzHr4r/SVR48rMTqWCj8W7HX3jf3FoKDg6M0xP0+6MnhILZdJY7ECY1Pm
 VGolO3CVkRiafZ4BVValjUOuMY7ANcX2gF/x4yv7n9kfBqDZYh0J+6p8S/WatQqkM9bw
 r/nw==
X-Gm-Message-State: AOAM531Mkdh/uboOsLkwo1p1FvGrW0KskS8D1vOF+GNSetnY3o3h8bGr
 T4u1e+PMIf1qzDfxlcrHRbaHAxjTgy4lfyNfe9U6
X-Google-Smtp-Source: ABdhPJwKo2RBLquH5L0hmkYQd7dKygceqZfrhZIYn3DOjHOnBNzT/Lrjc4dDYo/97VNS147443mS5MBdvvmroK0dvpM=
X-Received: by 2002:a02:cd84:: with SMTP id l4mr35876jap.141.1610047576807;
 Thu, 07 Jan 2021 11:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20201204085835.2406541-1-atish.patra@wdc.com>
 <20201204085835.2406541-4-atish.patra@wdc.com>
 <3d13a678-f804-245b-696e-400f128658c5@microchip.com>
In-Reply-To: <3d13a678-f804-245b-696e-400f128658c5@microchip.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 7 Jan 2021 11:26:05 -0800
Message-ID: <CAOnJCUKz-5hFBL1_XEUOdfnvpgMmBFKJHVEJ_vwx_+puHa483A@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Initial DTS for Microchip ICICLE board
To: Cyril.Jean@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_142619_359999_CCC6A96C 
X-CRM114-Status: GOOD (  18.24  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Daire McNamara <Daire.McNamara@microchip.com>,
 Bin Meng <bin.meng@windriver.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Conor.Dooley@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Ivan.Griffin@microchip.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 7, 2021 at 3:44 AM <Cyril.Jean@microchip.com> wrote:
>
> Hi Atish,
>
> On 12/4/20 8:58 AM, Atish Patra wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Add initial DTS for Microchip ICICLE board having only
> > essential devices (clocks, sdhci, ethernet, serial, etc).
> > The device tree is based on the U-Boot patch.
> >
> > https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-padmarao.begari@microchip.com/
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >   arch/riscv/boot/dts/Makefile                  |   1 +
> >   arch/riscv/boot/dts/microchip/Makefile        |   2 +
> >   .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
> >   .../boot/dts/microchip/microchip-mpfs.dtsi    | 331 ++++++++++++++++++
> >   4 files changed, 406 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/microchip/Makefile
> >   create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> >   create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
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
> > index 000000000000..622b12771fd3
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/microchip/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-mpfs-icicle-kit.dtb
> > diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> > new file mode 100644
> > index 000000000000..5b51dad13c72
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> > @@ -0,0 +1,72 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/* Copyright (c) 2020 Microchip Technology Inc */
> > +
> > +/dts-v1/;
> > +
> > +#include "microchip-mpfs.dtsi"
> > +
> > +/* Clock frequency (in Hz) of the rtcclk */
> > +#define RTCCLK_FREQ            1000000
> > +
> > +/ {
> > +       #address-cells = <2>;
> > +       #size-cells = <2>;
> > +       model = "Microchip PolarFire-SoC Icicle Kit";
> > +       compatible = "microchip,mpfs-icicle-kit", "microchip,polarfire-soc";
> > +
> > +       chosen {
> > +               stdout-path = &serial0;
> > +       };
> > +
> > +       cpus {
> > +               timebase-frequency = <RTCCLK_FREQ>;
> > +       };
> > +
> > +       memory@80000000 {
> > +               device_type = "memory";
> > +               reg = <0x0 0x80000000 0x0 0x40000000>;
> > +               clocks = <&clkcfg 26>;
> > +       };
> > +
> > +       soc {
> > +       };
> > +};
> > +
> > +&serial0 {
> > +       status = "okay";
> > +};
> > +
> > +&serial1 {
> > +       status = "okay";
> > +};
> > +
> > +&serial2 {
> > +       status = "okay";
> > +};
> > +
> > +&serial3 {
> > +       status = "okay";
> > +};
> > +
> > +&sdcard {
> > +       status = "okay";
> > +};
> > +
> > +&emac0 {
> > +       phy-mode = "sgmii";
> > +       phy-handle = <&phy0>;
> > +       phy0: ethernet-phy@8 {
> > +               reg = <8>;
> > +               ti,fifo-depth = <0x01>;
> > +       };
> > +};
> > +
> > +&emac1 {
> > +       status = "okay";
> > +       phy-mode = "sgmii";
> > +       phy-handle = <&phy1>;
> > +       phy1: ethernet-phy@9 {
> > +               reg = <9>;
> > +               ti,fifo-depth = <0x01>;
> > +       };
> > +};
> > diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > new file mode 100644
> > index 000000000000..7a076aa4c78d
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > @@ -0,0 +1,331 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/* Copyright (c) 2020 Microchip Technology Inc */
> > +
> > +/dts-v1/;
> > +
> > +/ {
> > +       #address-cells = <2>;
> > +       #size-cells = <2>;
> > +       model = "Microchip PolarFire-SoC";
> > +       compatible = "microchip,polarfire-soc";
> > +
> > +       chosen {
> > +       };
> > +
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
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
> > +                       riscv,ndev = <186>;
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
>
> Can you please change "microchip,pfsoc-clkcfg" to
> "microchip,mpfs-clkcfg" to align with the v2 clock driver?
>

Sure.

>
> > +                       reg = <0x0 0x20002000 0x0 0x1000>;
> > +                       reg-names = "mss_sysreg";
> > +                       clocks = <&refclk>;
> > +                       #clock-cells = <1>;
> > +                       clock-output-names = "cpu", "axi", "ahb", "envm",       /* 0-3   */
> > +                                "mac0", "mac1", "mmc", "timer",                /* 4-7   */
> > +                               "mmuart0", "mmuart1", "mmuart2", "mmuart3",     /* 8-11  */
> > +                               "mmuart4", "spi0", "spi1", "i2c0",              /* 12-15 */
> > +                               "i2c1", "can0", "can1", "usb",                  /* 16-19 */
> > +                               "rsvd", "rtc", "qspi", "gpio0",                 /* 20-23 */
> > +                               "gpio1", "gpio2", "ddrc", "fic0",               /* 24-27 */
> > +                               "fic1", "fic2", "fic3", "athena", "cfm";        /* 28-32 */
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
> > +                       status = "disabled";
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
> > +                       status = "disabled";
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
> > +                       status = "disabled";
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
> > +                       status = "disabled";
> > +               };
> > +
> > +               emmc: mmc@20008000 {
> > +                       compatible = "cdns,sd4hc";
> > +                       reg = <0x0 0x20008000 0x0 0x1000>;
> > +                       interrupt-parent = <&plic>;
> > +                       interrupts = <88 89>;
> > +                       pinctrl-names = "default";
> > +                       clocks = <&clkcfg 6>;
> > +                       bus-width = <4>;
> > +                       cap-mmc-highspeed;
> > +                       mmc-ddr-3_3v;
> > +                       max-frequency = <200000000>;
> > +                       non-removable;
> > +                       no-sd;
> > +                       no-sdio;
> > +                       voltage-ranges = <3300 3300>;
> > +                       status = "disabled";
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
> > +                       status = "disabled";
> > +               };
> > +
> > +               emac0: ethernet@20110000 {
> > +                       compatible = "cdns,macb";
> > +                       reg = <0x0 0x20110000 0x0 0x2000>;
> > +                       interrupt-parent = <&plic>;
> > +                       interrupts = <64 65 66 67>;
> > +                       local-mac-address = [00 00 00 00 00 00];
> > +                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> > +                       clock-names = "pclk", "hclk";
> > +                       status = "disabled";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +               };
> > +
> > +               emac1: ethernet@20112000 {
> > +                       compatible = "cdns,macb";
> > +                       reg = <0x0 0x20112000 0x0 0x2000>;
> > +                       interrupt-parent = <&plic>;
> > +                       interrupts = <70 71 72 73>;
> > +                       mac-address = [00 00 00 00 00 00];
> > +                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> > +                       status = "disabled";
> > +                       clock-names = "pclk", "hclk";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +               };
> > +
> > +       };
> > +};
> > --
> > 2.25.1
> >
> Regards,
>
> Cyril
>
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
