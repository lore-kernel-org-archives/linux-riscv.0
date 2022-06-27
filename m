Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE59C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 14:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFnN95cxmHIiTMkuPnPFLEZZ5x6NXHVg8/CRyYe9Lpw=; b=i4+gEzE8igI3/q
	Gy65uDoMkcyUt9OhxK4kQQL6uhs8InGfH3v/n9oJ0IKY7PEcJmNa5wP0q5YLvg4fd+fLUVKwdgH2M
	HcW3BStZxQA07NQ1hsCpmkSKTvKPXDRh2dpomPRewUTftT/Dke9YKl5dc7+3aG1qUpWDJ4pwi584/
	Rt6R+/BWRJEj0+yDc9y/fie2yg4EAp5rVErQ4+9IZFS82KI45XxjsCMB0uzuElIVYbdI32LhTWvYg
	HJ5TRyHHL6rRfCfei19DkYkxgXh0wk/tqtGLZVB5akwmUY0r0QTRS9wIeR4fZ+tzCVFRG9IuBjD6A
	U7JKztXF0HH1L+O7irDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5pY1-001MrM-5l; Mon, 27 Jun 2022 14:17:05 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5pXx-001Mo7-QP
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 14:17:03 +0000
Received: by mail-ed1-x52b.google.com with SMTP id fd6so13252021edb.5
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 07:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mxDYyaY89H5EEfQVpEFxonV022j7M6z20MFWKjTlNFg=;
        b=Qk0/EglqTX5KDRowJv35NcK7NDq76PkEU72HzKvwT77kpEL65fNlFFuC8njT9TUmVv
         oprUM/cV0SpRVAwIqHxCIfR3jTxTN2rheZ75ZX4i1Fbt6sylkGae3VDGg6zLxLRYVDOQ
         UIoHYKzRCM3jY1kUFzsWyiGkveLVr2u43nyoEhxTV00D1aKwPyzyjSdpIadRfqtowDqd
         HcYTrrbNUK+JGJrcYh2KzAOf/iKYc2oCPrPZJUK36KBQiPZe9CoAJiP4q1z+eEqOFyWw
         T1bgSkFTgCUqLunj0XMMO0gvldNMl09Ib9pKcPhbi6Tz0UU8DhLKBym8dJEOWlcQkKnZ
         73Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mxDYyaY89H5EEfQVpEFxonV022j7M6z20MFWKjTlNFg=;
        b=Ews22eXqs+3S4UrYo+Ltk9UE6Ny/fMI2gk6HAgsexOCSoZ1nPjk9cw1r3h+C9ObFBR
         NN0gmMWMBRqLdWzwWdtaqbs0VvqtoPPMD3eVk4rnyRmsYU0YzHJBwwZRCO705meTqL4L
         Q6vs2JbH9IVh/KX6esPy+8wcmDyCsVptdQsRnx/QULHBjM3pg37MSGR7ZDn8BdeooM+F
         YnS2JminF/nDJPa/QJEGHV0F7I5EU5AlwgH3cYIsJxYOzWybwz1VBVBu58S2YqntDG0B
         PkmJZ3Na7NYf2M9e9rAii6YyYOHH9kskFtMvea4XUYsXpVRLJ051d97K4IUfwgR4iBYz
         4X8w==
X-Gm-Message-State: AJIora+KoXHyNJqlfD+juKabSW5UZjy97oHIH8ol4K5mhcssKJT4z4fF
	XCNYhbA0JsHhVyrXBvmtP+HSpppOK6A4T3WBMyc=
X-Google-Smtp-Source: AGRyM1smieOYkbwkdYTJgUqEsMZQclsTD1DaOkAuXXPHKDskOVgnam8GfZY8mVRNQRLOv4PDHfacH1xT6lu8DV40k4s=
X-Received: by 2002:a05:6402:42d3:b0:435:2c49:313d with SMTP id
 i19-20020a05640242d300b004352c49313dmr16224916edc.86.1656339418100; Mon, 27
 Jun 2022 07:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87wnd3erab.wl-maz@kernel.org> <CA+V-a8tcxj_N0sBHhgAZAN8WSJ12JnDzAvUUnCXto3wHLqNVwg@mail.gmail.com>
 <87v8snehwi.wl-maz@kernel.org> <CAMuHMdVt9FjCtvMgJcCh=g2b+8b-fgabGbOLDcXNrrPMpC+3jQ@mail.gmail.com>
 <CA+V-a8uLzLJ=wB6oUu0b2oZO=FPSCTSrqb=3m9=BJxATFKmjMw@mail.gmail.com>
 <CAMuHMdUWC_7MPnP6LcOqi96FAhrAENC4iwtv2ksZVnvR8BC4ww@mail.gmail.com> <0fdbfdd0ee1c7ca39f8d3e2f86af1194@kernel.org>
In-Reply-To: <0fdbfdd0ee1c7ca39f8d3e2f86af1194@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Jun 2022 15:16:31 +0100
Message-ID: <CA+V-a8u8X+bne_a3LY13zGTKr-hOWhm=R9gGX1JyE8PzWRNXpQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
To: Marc Zyngier <maz@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_071701_889963_3B77A48D 
X-CRM114-Status: GOOD (  39.05  )
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

Hi Marc,

On Mon, Jun 27, 2022 at 2:53 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2022-06-27 14:12, Geert Uytterhoeven wrote:
> > Hi Prabhakar,
> >
> > On Mon, Jun 27, 2022 at 3:06 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> >> On Mon, Jun 27, 2022 at 9:53 AM Geert Uytterhoeven
> >> <geert@linux-m68k.org> wrote:
> >> > On Sun, Jun 26, 2022 at 2:19 PM Marc Zyngier <maz@kernel.org> wrote:
> >> > > On Sun, 26 Jun 2022 10:38:18 +0100,
> >> > > "Lad, Prabhakar" <prabhakar.csengg@gmail.com> wrote:
> >> > > > On Sun, Jun 26, 2022 at 9:56 AM Marc Zyngier <maz@kernel.org> wrote:
> >> > > > > On Sun, 26 Jun 2022 01:43:26 +0100,
> >> > > > > Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >> > > > > > The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
> >> > > > > > NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
> >> > > > > > case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
> >> > > > > > edge until the previous completion message has been received and
> >> > > > > > NCEPLIC100 doesn't support pending interrupt counter, hence losing the
> >> > > > > > interrupts if not acknowledged in time.
> >> > > > > >
> >> > > > > > So the workaround for edge-triggered interrupts to be handled correctly
> >> > > > > > and without losing is that it needs to be acknowledged first and then
> >> > > > > > handler must be run so that we don't miss on the next edge-triggered
> >> > > > > > interrupt.
> >> > > > > >
> >> > > > > > This patch adds a new compatible string for Renesas RZ/Five SoC and adds
> >> > > > > > support to change interrupt flow based on the interrupt type. It also
> >> > > > > > implements irq_ack and irq_set_type callbacks.
> >> > > > > >
> >> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> >
> >> > > > > > +     if (of_device_is_compatible(node, "renesas,r9a07g043-plic")) {
> >> > > > > > +             priv->of_data = RENESAS_R9A07G043_PLIC;
> >> > > > > > +             plic_chip.name = "Renesas RZ/Five PLIC";
> >> > > > >
> >> > > > > NAK. The irq_chip structure isn't the place for platform marketing.
> >> > > > > This is way too long anyway (and same for the edge version), and you
> >> > > > > even sent me a patch to make that structure const...
> >> > > > >
> >> > > > My bad will drop this.
> >> > >
> >> > > And why you're at it, please turn this rather random 'of_data' into
> >> > > something like:
> >> > >
> >> > > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> >> > > index bb87e4c3b88e..cd1683b77caf 100644
> >> > > --- a/drivers/irqchip/irq-sifive-plic.c
> >> > > +++ b/drivers/irqchip/irq-sifive-plic.c
> >> > > @@ -64,6 +64,10 @@ struct plic_priv {
> >> > >         struct cpumask lmask;
> >> > >         struct irq_domain *irqdomain;
> >> > >         void __iomem *regs;
> >> > > +       enum {
> >> > > +               VANILLA_PLIC,
> >> > > +               RENESAS_R9A07G043_PLIC,
> >> > > +       } flavour;
> >> > >  };
> >> > >
> >> > >  struct plic_handler {
> >> > >
> >> > > to give some structure to the whole thing, because I'm pretty sure
> >> > > we'll see more braindead implementations as time goes by.
> >> >
> >> > What about using a feature flag (e.g. had_edge_irqs) instead?
> >>
> >> diff --git a/drivers/irqchip/irq-sifive-plic.c
> >> b/drivers/irqchip/irq-sifive-plic.c
> >> index 9f16833dcb41..247c3c98b655 100644
> >> --- a/drivers/irqchip/irq-sifive-plic.c
> >> +++ b/drivers/irqchip/irq-sifive-plic.c
> >> @@ -60,13 +60,13 @@
> >>  #define        PLIC_DISABLE_THRESHOLD          0x7
> >>  #define        PLIC_ENABLE_THRESHOLD           0
> >>
> >> +#define PLIC_QUIRK_EDGE_INTERRUPT      BIT(0)
> >>
> >>  struct plic_priv {
> >>         struct cpumask lmask;
> >>         struct irq_domain *irqdomain;
> >>         void __iomem *regs;
> >> +       u32 plic_quirks;
> >>  };
> >>
> >> What about something like above?
> >
> > LGTM.
> >
> > Marc suggested to make this unsigned long, but TBH, that won't make
> > much of a difference.  PLICs are present on RV32 SoCs, too, so you
> > cannot rely on having more than 32 bits anyway.
>
> But it will make a difference on a 64bit platform, as we want to
> use test_bit() and co to check for features.
>
Ok will change that to unsigned long and use the test_bit/set_bit instead.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
