Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50E8C38A02
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FllLowxc1lGnuQLU1uLX4/SOjE0Cqo/mpcSk02G37I0=; b=UvYTXbJk1/wgI3
	w1MEJVw7w3TAQy7VM00yZjtsyOy9HNLN5jvMmwKUt95Eb1o8t+FmMFb8DwRxuSY+vUNutBomu2oWZ
	3zAM1gM3+I1hH+iPc1y+9cvH4S2PC1xlQOE/chMzeZIkE8mSfZmpkOd0zSk9UmcOdLKDWtMpt1wCw
	z+DEpLQhHMYn+zkX9MVuESc0lTzXYXZRl6m/IkT/3prA3eKGaNAK4k+9lsXZh8AnVE/aSQuqYspbH
	w/OC7dwIbwOx7XP2SPA62cMJOjfIeXfAn1ZxHA1/VGbqh71Tpq+mYfpjUkRpZQoT45DGbfujF0EfI
	GIRUp9V6T8oz/LT6L5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opCr0-001gev-32; Sun, 30 Oct 2022 18:16:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opCqw-001gd2-U1
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 18:16:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0950E60F0F;
	Sun, 30 Oct 2022 18:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1D5C433D6;
	Sun, 30 Oct 2022 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667153768;
	bh=GcWNx03b0Xzk2l/0+XEDO3/WrjKqXL6Ez2UIT1I3zu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ik8Fd5DP4EyZ+odez6N3eOw7eRcaFuAeAy4meWzAHvwmLOCNZs7W5KCUHPfcmuyLF
	 MbUvBiyfwuEXRVUdCKDTzHP+AQvMvnKLmAwLJve8qqG/koeHxKYkK2Srk3bDs3dEGt
	 yn+XSYBf7ULQyaC1/JR82Hv+a+h93D0oFxua87mHBXqdleJ4YFzzxb+yBaooEqYgNb
	 LTbOZiAwKtAYK5AAnM2cIy8hlfqZKksBLLguAbCeDghZ1o2eFjojb1SeTu8FaUJzzM
	 Wsqk5C0MHSk9pa+o7lhJ5sQ6tSI2BDzz4bfgOPA5ZdRanQhirI+CYFaW5as4+/AHvl
	 +vOb0tpYzBdcw==
Date: Sun, 30 Oct 2022 18:16:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 4/7] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Message-ID: <Y16/YQTOW3DuQvo9@spud>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAJF2gTQPU0FGmeVt9jrNfOAQSA=04Vcm4U_wcC_dGMc5X2Bo7w@mail.gmail.com>
 <CA+V-a8vBkHhTtq6Veb2vn-6o4S5Ter==yN6TFhYQvxko_Bk2LQ@mail.gmail.com>
 <CAJF2gTSQH0q4PoucBgr3abWWA+XCdxm1tk1j8Sqydt_XyCq2RA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSQH0q4PoucBgr3abWWA+XCdxm1tk1j8Sqydt_XyCq2RA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_111611_853434_D9200A66 
X-CRM114-Status: GOOD (  34.86  )
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

On Sun, Oct 30, 2022 at 08:02:10AM +0800, Guo Ren wrote:
> On Sun, Oct 30, 2022 at 3:11 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi Guo,
> >
> > Thank you for the review.
> >
> > On Sat, Oct 29, 2022 at 5:25 AM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > On Sat, Oct 29, 2022 at 12:59 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> > > > Single).
> > > >
> > > > RZ/Five SoC is almost identical to RZ/G2UL Type-1 SoC (ARM64) hence we
> > > > will be reusing r9a07g043.dtsi [0] as a base DTSI for both the SoC's.
> > > > r9a07g043f.dtsi includes RZ/Five SoC specific blocks.
> > > >
> > > > Below are the RZ/Five SoC specific blocks added in the initial DTSI which
> > > > can be used to boot via initramfs on RZ/Five SMARC EVK:
> > > > - AX45MP CPU
> > > > - PLIC
> > > >
> > > > [0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v4 -> v5
> > > > * Fixed riscv,ndev value (should be 511)
> > > > * Reworked completely (sort of new patch)
> > > >
> > > > v3 -> v4
> > > > * No change
> > > >
> > > > v2 -> v3
> > > > * Fixed clock entry for CPU core
> > > > * Fixed timebase frequency to 12MHz
> > > > * Fixed sorting of the nodes
> > > > * Included RB tags
> > > >
> > > > v1 -> v2
> > > > * Dropped including makefile change
> > > > * Updated ndev count
> > > > ---
> > > >  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 57 +++++++++++++++++++++
> > > >  1 file changed, 57 insertions(+)
> > > >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > >
> > > > diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > > new file mode 100644
> > > > index 000000000000..50134be548f5
> > > > --- /dev/null
> > > > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > > @@ -0,0 +1,57 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +/*
> > > > + * Device Tree Source for the RZ/Five SoC
> > > > + *
> > > > + * Copyright (C) 2022 Renesas Electronics Corp.
> > > > + */
> > > > +
> > > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > > +
> > > > +#define SOC_PERIPHERAL_IRQ(nr) (nr + 32)
> > > > +
> > > > +#include <arm64/renesas/r9a07g043.dtsi>
> > > The initial patch shouldn't be broken. Combine them together with the
> > > minimal components and add others late. Don't separate the DTS files.
> > >
> > r9a07g043.dtsi [0] already exists in the kernel. r9a07g043.dtsi is
> > shared with the RZ/G2UL SoC (ARM64) and the RZ/Five SoC. There are two
> > more patches [1] which are required and are currently queued up in the
> > Renesas tree for v6.2 (Ive mentioned the dependencies in the cover
> > letter).
> 
> You could just move the below part to the second dtsi patch. Then
> compile won't be broken.
> 
>             clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
>             power-domains = <&cpg>;
>             resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;

The makefile for this directory is not added until the next patch right?
The compile shouldn't be broken here since it therefore cannot be
compiled?

Slightly confused,
Conor.

> 
> >
> > [0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > [1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> >
> > > > +
> > > > +/ {
> > > > +       cpus {
> > > > +               #address-cells = <1>;
> > > > +               #size-cells = <0>;
> > > > +               timebase-frequency = <12000000>;
> > > > +
> > > > +               cpu0: cpu@0 {
> > > > +                       compatible = "andestech,ax45mp", "riscv";
> > > > +                       device_type = "cpu";
> > > > +                       reg = <0x0>;
> > > > +                       status = "okay";
> > > > +                       riscv,isa = "rv64imafdc";
> > > > +                       mmu-type = "riscv,sv39";
> > > > +                       i-cache-size = <0x8000>;
> > > > +                       i-cache-line-size = <0x40>;
> > > > +                       d-cache-size = <0x8000>;
> > > > +                       d-cache-line-size = <0x40>;
> > > > +                       clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
> > > > +
> > > > +                       cpu0_intc: interrupt-controller {
> > > > +                               #interrupt-cells = <1>;
> > > > +                               compatible = "riscv,cpu-intc";
> > > > +                               interrupt-controller;
> > > > +                       };
> > > > +               };
> > > > +       };
> > > > +};
> > > > +
> > > > +&soc {
> > > > +       interrupt-parent = <&plic>;
> > > > +
> > > > +       plic: interrupt-controller@12c00000 {
> > > > +               compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
> > > > +               #interrupt-cells = <2>;
> > > > +               #address-cells = <0>;
> > > > +               riscv,ndev = <511>;
> > > > +               interrupt-controller;
> > > > +               reg = <0x0 0x12c00000 0 0x400000>;
> > > > +               clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
> > > > +               power-domains = <&cpg>;
> > > > +               resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
> > > Ditto, Where is cpg? in r9a07g043.dtsi?
> > >
> > Yes CPG node is in r9a07g043.dtsi.
> >
> > Cheers,
> > Prabhakar
> 
> 
> 
> --
> Best Regards
>  Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
