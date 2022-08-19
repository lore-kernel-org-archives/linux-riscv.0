Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B5EC32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 11:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXjSDbHSZ5dTkHiliQ6kwxgEqL9UvvmtZM7j5w775nk=; b=uDR7MikoYIogPo
	xYpQgigv06KzoQmYv0OrDeaA2N3pWU6/f6vrKp12EwhJsoH4VKwU1t7tlG0p9xIdLYa0cI9z0MCeU
	tqBg+CIrMUfW6xUPgsFrTYxlCzPx5AScAD5AC2l0Y+OdyYlxfCCJ9c09vZEJ9E9vlTFS1MKKqR9Ni
	o0xbduXIA36RKQUw4p703DL4CpjcTm2FOhQPU2mOFpm1OccZ7hsrOJOnwDxoGOhzenS3hvk6ln2ch
	Y03AWQ3Y8VEs3Wg1KnvptXx3P/hOAvI2sFBUSVZkkUaMNOmKZQHvzvkmUSc2dDmTsCJAcElV6kVjq
	dsplGkX0t8+n9eQrZxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP0Ok-006zh8-0U; Fri, 19 Aug 2022 11:42:46 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP0Og-006zfk-Io
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 11:42:44 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-335624d1e26so114271557b3.4
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=JsbjkAc9nKBUwo2BV+lJuV+9wDAaqVtP+AYnXddE06M=;
        b=iDTh499ntFuBhmhm7+PjOS+kN6/En/kCc/a8vA9tl2w1O8cLjE/Ir/vKAbzKCX8Or8
         jpBlUTLJMWCEtu9bqL4nJsIEUdcZlmXlHj28PE1T5Smwz/+PEyhw5wOmR+kLaM0dyp+W
         4mdXmFzMYFGg7GZbHh/eTn1fkvR1nGjW54Cmm/gTZpn0cxmmFZiVi2Czj9xL/AwAWTok
         d3V84hpqoxNbYkA1fWOJjcObObcoKJ9N0JLDLBPzHzosukWEM/iAjGHZ79P+1AYS7uRl
         kkRhHe0WScPj/Yn/mXzBUrdMm4u57g0Q12rYS4n47Uvg+Iv7EY6MWYLWeRxnzsUdEvt6
         XzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=JsbjkAc9nKBUwo2BV+lJuV+9wDAaqVtP+AYnXddE06M=;
        b=4mhi9Sp78dVbWn77GU9P6+Jwy03ZRCFjrefr9vNNN3BjNMyzJSmiNAFLh1O7H9V3pA
         3xNc7OJBT6+uZC3akFXV2L0jbb8NDfi2mbV6MbLrQmO2JBmZIOUhumB6EaT//0sS9MPC
         b+eUEbwkbClUmWVSOeB4wfYqIrnII7/d4geqt5IaCisa8rybAyiHwjZWUfLNAPQpErP/
         C9ALI0H88AhrEb+9S/y1h38JWL/BIZKNRO2xg6+2Si5lBL40EhYG5NlZXDGd3yyGDu+h
         bZW64RIamorTqGitesw1w1dfWH5PHLEJb1LFrwD3Q5/gljJYIEw1wv1pQoTt1Wc62Gus
         mCNw==
X-Gm-Message-State: ACgBeo3qvt210+d4V0/AifC3APPmPStyd749B6F6upxGcad44wiFfaZm
	QAuWeg4OVI3Z4z5hfKxIb9XQc4vpBPOvNzzZf3w=
X-Google-Smtp-Source: AA6agR64CGhHuJItOoEwYlI4Q1qKbjkazebB6e8Fjy2TxN3npFljabqR+ivGNTyMVFhoyPJuhYFBJHKQURNW/HRyAmA=
X-Received: by 2002:a25:4689:0:b0:671:6d4f:c974 with SMTP id
 t131-20020a254689000000b006716d4fc974mr7342816yba.354.1660909359543; Fri, 19
 Aug 2022 04:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMcFisGxHMBPUEa8nTMFpzw@mail.gmail.com>
In-Reply-To: <CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMcFisGxHMBPUEa8nTMFpzw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 19 Aug 2022 12:42:12 +0100
Message-ID: <CA+V-a8tyvoVPctQU4Gz3FEQSCk0DBZ9=83qvh3P2UENJ5FSHAA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <Conor.Dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_044242_662668_6F4F01CA 
X-CRM114-Status: GOOD (  35.70  )
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

Hi Geert,

On Fri, Aug 19, 2022 at 9:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhalar,
>
> On Mon, Aug 15, 2022 at 5:17 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
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
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> > @@ -0,0 +1,121 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/Five SoC
>
> My first thought was:
>
>     This should be arch/riscv/boot/dts/renesas/r9a07g043f01.dtsi,
>      including the common r9a07g043.dtsi, shared by
>      arch/arm64/boot/dts/renesas/r9a07g043u11.dtsi.
>
> Then I realized this is harder than it sounds, due:
>
Indeed, my initial thought after the comments from Conor was we could
share the SoC dtsi, but that would be to messey due to PLIC.

Cheers,
Prabhakar

> > +       soc: soc {
> > +               compatible = "simple-bus";
> > +               interrupt-parent = <&plic>;
>
> vs. "interrupt-parent = <&plic>;" for r9a07g043u11, but mostly
> due to
>
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges;
> > +
> > +               scif0: serial@1004b800 {
> > +                       compatible = "renesas,scif-r9a07g043",
> > +                                    "renesas,scif-r9a07g044";
> > +                       reg = <0 0x1004b800 0 0x400>;
> > +                       interrupts = <412 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <414 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <415 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <413 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <416 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <416 IRQ_TYPE_LEVEL_HIGH>;
>
> vs. "interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH> ..." on
> r9a07g043u11.
> Interestingly, the actual hardware interrupt numbers are the same,
> but the GIC DT bindings abstracts the offset of 32 by using a second
> cell and GIC_SPI.  Unfortunately this cannot be handled by some CPP
> magic, as dtc does not support arithmetic operations yet.
>
> I expect this or similar issues to pop up everywhere, when more
> RISCV-V SoCs will appear that share the non-CPU parts with ARM SoCs.
>
> Ignoring this issue, which we probably can solve only later:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
