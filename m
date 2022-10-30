Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99134C38A02
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 00:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/ueirSiSMFG5DjwtrzlKp8WbluGrKD+oC6o7m5kbuc=; b=qkmXpE4t2WCHZQ
	LnSQH4whuLLbdIOzwy9Z9umCwnmS8NkESq2/v1a/a+cArGloClWPsGFD93Pc/Fdto+g7s0j76Fd4d
	xtHN4KnHwgx3NldHmn+SiZ77lYNeI1Mw3h8cjdYbEE/67mV8nL2PZIj4KHR0PEZe1mP3Ld5EflqjQ
	RkwFXGU2Ep+3NpeTWy6kwsTPl3jW3sDPAg6+oSSDPLAuTnwKMPWDBb9ouawHXV9zfd3C/CmVX1Raj
	ljGgG76dQZkrNE77h79r/4SKb83PX0W000HzkX1a1B+uFQ3JJwEpLxm+nApwttdR22D1MJ2C59GKA
	7acnMc9oNNPw5KiJwYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oovmb-00AO0U-Sv; Sun, 30 Oct 2022 00:02:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oovmY-00ANyO-Kk
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 00:02:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id EBCFACE0B18
	for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 00:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E1CC433C1
	for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 00:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667088143;
	bh=gd6pC0+bcQjdQw9DyI29fnP4KnEhLlrHdT330jq8glg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ETiwOj1AmurjbpO00zoqLX0FJDUG/TtkJYwIiHUeS/CRvknHA5/eRFkZUVmUF5XwS
	 /CD5TCMi5eMLSRbzuTyXlv14Tv/3IfTYO+T13BeCPmdPD96zMIIrn/pXdarYO8U4Fx
	 bzqIzqjDMAgJgHE287EzDDfe7M91v+gZnpk12swMttRBVh+N/90u1RzeJDINR30Pkx
	 kILWLrOuKbZ8yR0cGNNQpbFvQ96ZZMe/9/2TMLElVRGUY4CHa+pficw8a5Ub0cyCTo
	 4jKgl/IuBPnJ8vBpsPVjSvbF0dlJC4okQsCTSS5yV/SPAOUvcNgR1vqhB/7w6GEkXV
	 8M5G6xfSYlHwg==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-12c8312131fso10190544fac.4
        for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 17:02:23 -0700 (PDT)
X-Gm-Message-State: ACrzQf1X25K4PQ2OUh08+Vjh9bMKDt5vRjhAbOB3hHPEVq5wro+vYFHN
	MHQxqjUTanHK1zC32cj5vNgNiqiewNfen7nQ9V4=
X-Google-Smtp-Source: AMsMyM6XwJ7EwZD1AhYJFW8bBGJayD1vEV1WkaIkqNe08tAfzgSSJH8W8in+jloM19s3/C8NQjK6Zre7bOXAnE8QBtk=
X-Received: by 2002:a05:6870:64a1:b0:13c:d09d:79f9 with SMTP id
 cz33-20020a05687064a100b0013cd09d79f9mr826979oab.112.1667088142326; Sat, 29
 Oct 2022 17:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAJF2gTQPU0FGmeVt9jrNfOAQSA=04Vcm4U_wcC_dGMc5X2Bo7w@mail.gmail.com> <CA+V-a8vBkHhTtq6Veb2vn-6o4S5Ter==yN6TFhYQvxko_Bk2LQ@mail.gmail.com>
In-Reply-To: <CA+V-a8vBkHhTtq6Veb2vn-6o4S5Ter==yN6TFhYQvxko_Bk2LQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Oct 2022 08:02:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSQH0q4PoucBgr3abWWA+XCdxm1tk1j8Sqydt_XyCq2RA@mail.gmail.com>
Message-ID: <CAJF2gTSQH0q4PoucBgr3abWWA+XCdxm1tk1j8Sqydt_XyCq2RA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_170231_067002_C20D5E99 
X-CRM114-Status: GOOD (  31.47  )
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

On Sun, Oct 30, 2022 at 3:11 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Guo,
>
> Thank you for the review.
>
> On Sat, Oct 29, 2022 at 5:25 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Sat, Oct 29, 2022 at 12:59 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > >
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> > > Single).
> > >
> > > RZ/Five SoC is almost identical to RZ/G2UL Type-1 SoC (ARM64) hence we
> > > will be reusing r9a07g043.dtsi [0] as a base DTSI for both the SoC's.
> > > r9a07g043f.dtsi includes RZ/Five SoC specific blocks.
> > >
> > > Below are the RZ/Five SoC specific blocks added in the initial DTSI which
> > > can be used to boot via initramfs on RZ/Five SMARC EVK:
> > > - AX45MP CPU
> > > - PLIC
> > >
> > > [0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > v4 -> v5
> > > * Fixed riscv,ndev value (should be 511)
> > > * Reworked completely (sort of new patch)
> > >
> > > v3 -> v4
> > > * No change
> > >
> > > v2 -> v3
> > > * Fixed clock entry for CPU core
> > > * Fixed timebase frequency to 12MHz
> > > * Fixed sorting of the nodes
> > > * Included RB tags
> > >
> > > v1 -> v2
> > > * Dropped including makefile change
> > > * Updated ndev count
> > > ---
> > >  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 57 +++++++++++++++++++++
> > >  1 file changed, 57 insertions(+)
> > >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > >
> > > diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > new file mode 100644
> > > index 000000000000..50134be548f5
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > @@ -0,0 +1,57 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +/*
> > > + * Device Tree Source for the RZ/Five SoC
> > > + *
> > > + * Copyright (C) 2022 Renesas Electronics Corp.
> > > + */
> > > +
> > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +#define SOC_PERIPHERAL_IRQ(nr) (nr + 32)
> > > +
> > > +#include <arm64/renesas/r9a07g043.dtsi>
> > The initial patch shouldn't be broken. Combine them together with the
> > minimal components and add others late. Don't separate the DTS files.
> >
> r9a07g043.dtsi [0] already exists in the kernel. r9a07g043.dtsi is
> shared with the RZ/G2UL SoC (ARM64) and the RZ/Five SoC. There are two
> more patches [1] which are required and are currently queued up in the
> Renesas tree for v6.2 (Ive mentioned the dependencies in the cover
> letter).

You could just move the below part to the second dtsi patch. Then
compile won't be broken.

            clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
            power-domains = <&cpg>;
            resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;

>
> [0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> > > +
> > > +/ {
> > > +       cpus {
> > > +               #address-cells = <1>;
> > > +               #size-cells = <0>;
> > > +               timebase-frequency = <12000000>;
> > > +
> > > +               cpu0: cpu@0 {
> > > +                       compatible = "andestech,ax45mp", "riscv";
> > > +                       device_type = "cpu";
> > > +                       reg = <0x0>;
> > > +                       status = "okay";
> > > +                       riscv,isa = "rv64imafdc";
> > > +                       mmu-type = "riscv,sv39";
> > > +                       i-cache-size = <0x8000>;
> > > +                       i-cache-line-size = <0x40>;
> > > +                       d-cache-size = <0x8000>;
> > > +                       d-cache-line-size = <0x40>;
> > > +                       clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
> > > +
> > > +                       cpu0_intc: interrupt-controller {
> > > +                               #interrupt-cells = <1>;
> > > +                               compatible = "riscv,cpu-intc";
> > > +                               interrupt-controller;
> > > +                       };
> > > +               };
> > > +       };
> > > +};
> > > +
> > > +&soc {
> > > +       interrupt-parent = <&plic>;
> > > +
> > > +       plic: interrupt-controller@12c00000 {
> > > +               compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
> > > +               #interrupt-cells = <2>;
> > > +               #address-cells = <0>;
> > > +               riscv,ndev = <511>;
> > > +               interrupt-controller;
> > > +               reg = <0x0 0x12c00000 0 0x400000>;
> > > +               clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
> > > +               power-domains = <&cpg>;
> > > +               resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
> > Ditto, Where is cpg? in r9a07g043.dtsi?
> >
> Yes CPG node is in r9a07g043.dtsi.
>
> Cheers,
> Prabhakar



--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
