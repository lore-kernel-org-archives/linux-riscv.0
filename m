Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15F6C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 19:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K61O2iS+0l8/PVnOHAubqv1hSplV10KL0CUxm8sqmQQ=; b=y8vdrz8zvtfyMl
	xaMhIP+YFdTKHVqVhvTMwNirda1eo3rCQFWFKsaP54lfxCr3mdBBQAzo7QRWdteRf3qfEEYqJ4Lmi
	l9SwhdjmWlC6F3PB/0xvXZgl2cmtz1/mmKyu0LpHzWcpGpc6vKsiNuwSjiZ/jQ9zIy8mXczh2sG4n
	utOg//CXCCvVaItupmvM2kZ3Z7EEC/S9DnlZzOf6UnAKKfnWdvhwT738/9LxQa2Aiv/NCV/p0Kaks
	8Icw7pugsETcAyDhXR01ZxsDFyhMEg5j8nVR1UO5tOl9nvUvyNCx+PWpTxYoK0SQQwxfpL5BpoyOc
	l5fxG53ziZIvmVTg7IBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oorEz-008QlB-5D; Sat, 29 Oct 2022 19:11:33 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oorEw-008Qj3-A0
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 19:11:32 +0000
Received: by mail-ed1-x52d.google.com with SMTP id u24so3047274edd.13
        for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 12:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PRcfJjVWjUUCXuQLSgCtokoLV52Uo/1p54GmWdUxlxE=;
        b=AqSzAKPt/WgwH/l+UhyyMFHbN//vXUHpriUQNAChkKr/jFm88XDrVo5VyBpK6qw4pa
         ghqAlC07wuGwI0RJSP4HqUmwvtnVe2jdogWf8hGk1MXNO1+KqrXYeWRyaZexkzIvr1RS
         2JH11l+KfNMnTiJwDKsdVdSXKr82kSTzgT6pbXltpu7kRcfzP80bbXhCQ60bJOtdPBB0
         R2cn82cWpBsvRssXDravsaEwWQSOVm0G3c/vU2SxCZvEzK0mJrPkeFTNpkZ0O1djg5pF
         yoMC2S4ga9qhSOXrBduzVzHbon3HIbt9Gk9cqD26bRrKQoQSUxUF/o8+aphULW5DsHH7
         oNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRcfJjVWjUUCXuQLSgCtokoLV52Uo/1p54GmWdUxlxE=;
        b=p5BGcGr0UttQjuv9KkcaxeUP4mIr3mJCUo1FzvaYvUIU5PyEQ2TcG2NHO8JwQvu923
         OqmAZfLJhdR/xqbwPZUJgDfVAtymFu3qFkmRNQZglfjDLphuIdZmGWkifUFeUC2nc5yF
         jMMr4SesN1YQasL6TbcKoQXGHUrZvBD+D3KX6mD7TvdxOejGLTaHbSl/aWWKehMSD95L
         ttBHEevmmwfdGcThjO05H9tK+gO0wnHhVzf74o/59q6fe9Ouq2yzYcAg3SyZxqdLnvWR
         vlrO4jbajOcuvtLVl/fGIK9huGUQGcSBBUrrt5XUSsjEFnEQ9OXst+uEfRR9fHALRdIy
         puXQ==
X-Gm-Message-State: ACrzQf1j3tRB1DtyYgE2vVYXOvMXgfJIOIyO/WDBq3/5yLNF79P76unG
	9Xt60BOxK5O+vu16TW9CsdgCA3+hAPqBjxm3Rq8=
X-Google-Smtp-Source: AMsMyM6a7g81JSx2zMQbQzMFHs2TLJQDp3aKLZtgcj3D1f9JQ9/PyvQnuCicyExcHIaMv5IiPqJKUX7cpyCiuf8BRhw=
X-Received: by 2002:a05:6402:3217:b0:461:d6d7:7f19 with SMTP id
 g23-20020a056402321700b00461d6d77f19mr5591355eda.109.1667070683837; Sat, 29
 Oct 2022 12:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAJF2gTQPU0FGmeVt9jrNfOAQSA=04Vcm4U_wcC_dGMc5X2Bo7w@mail.gmail.com>
In-Reply-To: <CAJF2gTQPU0FGmeVt9jrNfOAQSA=04Vcm4U_wcC_dGMc5X2Bo7w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 29 Oct 2022 20:10:56 +0100
Message-ID: <CA+V-a8vBkHhTtq6Veb2vn-6o4S5Ter==yN6TFhYQvxko_Bk2LQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: Guo Ren <guoren@kernel.org>
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
X-CRM114-CacheID: sfid-20221029_121130_370931_4C7FD7B7 
X-CRM114-Status: GOOD (  25.96  )
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

Hi Guo,

Thank you for the review.

On Sat, Oct 29, 2022 at 5:25 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Sat, Oct 29, 2022 at 12:59 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> > Single).
> >
> > RZ/Five SoC is almost identical to RZ/G2UL Type-1 SoC (ARM64) hence we
> > will be reusing r9a07g043.dtsi [0] as a base DTSI for both the SoC's.
> > r9a07g043f.dtsi includes RZ/Five SoC specific blocks.
> >
> > Below are the RZ/Five SoC specific blocks added in the initial DTSI which
> > can be used to boot via initramfs on RZ/Five SMARC EVK:
> > - AX45MP CPU
> > - PLIC
> >
> > [0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4 -> v5
> > * Fixed riscv,ndev value (should be 511)
> > * Reworked completely (sort of new patch)
> >
> > v3 -> v4
> > * No change
> >
> > v2 -> v3
> > * Fixed clock entry for CPU core
> > * Fixed timebase frequency to 12MHz
> > * Fixed sorting of the nodes
> > * Included RB tags
> >
> > v1 -> v2
> > * Dropped including makefile change
> > * Updated ndev count
> > ---
> >  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 57 +++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> >
> > diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > new file mode 100644
> > index 000000000000..50134be548f5
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > @@ -0,0 +1,57 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/Five SoC
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +#define SOC_PERIPHERAL_IRQ(nr) (nr + 32)
> > +
> > +#include <arm64/renesas/r9a07g043.dtsi>
> The initial patch shouldn't be broken. Combine them together with the
> minimal components and add others late. Don't separate the DTS files.
>
r9a07g043.dtsi [0] already exists in the kernel. r9a07g043.dtsi is
shared with the RZ/G2UL SoC (ARM64) and the RZ/Five SoC. There are two
more patches [1] which are required and are currently queued up in the
Renesas tree for v6.2 (Ive mentioned the dependencies in the cover
letter).

[0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
[1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

> > +
> > +/ {
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +               timebase-frequency = <12000000>;
> > +
> > +               cpu0: cpu@0 {
> > +                       compatible = "andestech,ax45mp", "riscv";
> > +                       device_type = "cpu";
> > +                       reg = <0x0>;
> > +                       status = "okay";
> > +                       riscv,isa = "rv64imafdc";
> > +                       mmu-type = "riscv,sv39";
> > +                       i-cache-size = <0x8000>;
> > +                       i-cache-line-size = <0x40>;
> > +                       d-cache-size = <0x8000>;
> > +                       d-cache-line-size = <0x40>;
> > +                       clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
> > +
> > +                       cpu0_intc: interrupt-controller {
> > +                               #interrupt-cells = <1>;
> > +                               compatible = "riscv,cpu-intc";
> > +                               interrupt-controller;
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> > +&soc {
> > +       interrupt-parent = <&plic>;
> > +
> > +       plic: interrupt-controller@12c00000 {
> > +               compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
> > +               #interrupt-cells = <2>;
> > +               #address-cells = <0>;
> > +               riscv,ndev = <511>;
> > +               interrupt-controller;
> > +               reg = <0x0 0x12c00000 0 0x400000>;
> > +               clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
> > +               power-domains = <&cpg>;
> > +               resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
> Ditto, Where is cpg? in r9a07g043.dtsi?
>
Yes CPG node is in r9a07g043.dtsi.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
