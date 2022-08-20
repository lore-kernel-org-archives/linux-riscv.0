Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AA8C25B08
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdgTPx5vMiv6fGEgVYR47xb+3QAfheOlWZlOVns63QQ=; b=YwI6hsorLywVIg
	hLQcqOzuRaCEMrYsWq3C+TFOKppfXWek40cGe7tb+q2di4Pkypw/ax4n0Mx7GMUPWcHDQYp3nwzSS
	Z0bZK3CP6YjC6EpXKlGXvB1V+DhpNi+2kg6c2XtJqZjIY3Re1l1Zc3efM+vRkbY0suPFQoLc/0bB8
	fgvR2Yf2EHWHr+zzu/5x0qXdlDyrjguf6F9D+sM7Mug4SmgK5N1Um/ZSZ9kqqealoXH0ib+CgvMqV
	8DmgnMDL/jzPMPN98p1okvifeJiqD2t0e9pV53T7/774kb+W/RJz2A0u+82kpDFr9p6UMoGFsmllV
	hf2fpOaZDN7Dg6twjmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPK7a-005DVA-Ic; Sat, 20 Aug 2022 08:46:22 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPK7Q-005DGn-Mi
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 08:46:21 +0000
Received: by mail-qk1-f170.google.com with SMTP id b2so4776700qkh.12
        for <linux-riscv@lists.infradead.org>; Sat, 20 Aug 2022 01:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+63cIhFEKX0WHLgxrd4PCpndBl/dsPSE8S7dwhcfFNs=;
        b=u5mhHXo2WdfDBPe2j+3r4RMx8ZxMnMHxmYrUDKAb16KWPwD2LelTLZGG5rvEF+UaeZ
         a8GAEUimqRSwz1jI08Nwm+IwLX1+wnAXGgBz2ZRhzHSdC0kXR5vxj/BhU9ZyetN0IMJW
         lapSoFvOg6dqy3/DmRqizjkY0ouRPAkevWc8oKnOSLRzfm9eIPiGXnfhi9jcCnRh5m1V
         it6zREP0PUBjjXBgtWt9tpqEg5YEaAjTfFhKeZlXOsChPl1F+3musiklXkn7Cj7PilHn
         WuxB1o80LSlbdvvvjvs880QInLXsogLnM4oTIxnyEWpHP4peZcIwfMulLHclEoVtFsYj
         9pEQ==
X-Gm-Message-State: ACgBeo3D+Ls3YB2ucTUoaZu5odsigECobIY1GF1UQ05IcAW79AVPIpuF
	yzKHMBjOf0priWVwVHva82eeR95J4adO5g==
X-Google-Smtp-Source: AA6agR4V16s71pQPK8ub0zySEf/8UgxzsXuuheiFuqI4dTYXX1jKIwmLSbZcyofUd9oGjXMioDXxbw==
X-Received: by 2002:a05:620a:1a13:b0:6b8:bd72:a0b2 with SMTP id bk19-20020a05620a1a1300b006b8bd72a0b2mr7322754qkb.229.1660985169190;
        Sat, 20 Aug 2022 01:46:09 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id k13-20020ac8604d000000b0034300e35487sm4614801qtm.54.2022.08.20.01.46.08
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Aug 2022 01:46:08 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-334dc616f86so176035167b3.8
        for <linux-riscv@lists.infradead.org>; Sat, 20 Aug 2022 01:46:08 -0700 (PDT)
X-Received: by 2002:a81:f47:0:b0:31f:434b:5ee with SMTP id 68-20020a810f47000000b0031f434b05eemr11598577ywp.383.1660985168100;
 Sat, 20 Aug 2022 01:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <e9b00bb5-bb78-091f-9c10-96c156690469@microchip.com>
In-Reply-To: <e9b00bb5-bb78-091f-9c10-96c156690469@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 20 Aug 2022 10:45:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGttswcSGeOdrJLeoZLmoeKhm7R82L-3wLJnagmZ4dBA@mail.gmail.com>
Message-ID: <CAMuHMdUGttswcSGeOdrJLeoZLmoeKhm7R82L-3wLJnagmZ4dBA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_014612_776931_4434802E 
X-CRM114-Status: GOOD (  33.38  )
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

Hi Conor,

On Fri, Aug 19, 2022 at 8:40 PM <Conor.Dooley@microchip.com> wrote:
> On 15/08/2022 16:14, Lad Prabhakar wrote:
> > Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> > Single).
> >
> > Below is the list of IP blocks added in the initial SoC DTSI which can be
> > used to boot via initramfs on RZ/Five SMARC EVK:
> > - AX45MP CPU
> > - CPG
> > - PINCTRL
> > - PLIC
> > - SCIF0
> > - SYSC
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > * Dropped including makefile change
> > * Updated ndev count
> > ---
> >  arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 121 +++++++++++++++++++++
> >  1 file changed, 121 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> >
> > diff --git a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> > new file mode 100644
> > index 000000000000..b288d2607796
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> > @@ -0,0 +1,121 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/Five SoC
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/clock/r9a07g043-cpg.h>
> > +
> > +/ {
> > +     compatible = "renesas,r9a07g043";
> > +     #address-cells = <2>;
> > +     #size-cells = <2>;
> > +
> > +     /* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
> > +     extal_clk: extal-clk {
> > +             compatible = "fixed-clock";
> > +             #clock-cells = <0>;
> > +             /* This value must be overridden by the board */
> > +             clock-frequency = <0>;
>
> What's the value in having the clock-frequency here if the board .dtsi
> overwrites it? dtbs_check will complain if someone forgets to fill it
> IIUC & what the missing frequency means is also kinda obvious, no?

Some external clocks may be optional. Hence "dtbs_check" will complain
if no "clock-frequency" is missing.

>
> That aside, by convention so far we have put things like extals or
> reference clocks below the /cpus node. Could you do the same here too
> please?

Really? We've been putting them at the root node for a long time,
since the separate "clocks" grouping subnode was deprecated.
The extal-clk is not even part of the SoC, so it should definitely
not be under the /cpus node.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
