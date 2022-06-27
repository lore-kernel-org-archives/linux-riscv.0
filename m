Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623A5C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 08:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+k7QXPyFS8Y0OCQ8pK+zHg7MfLkAFCih65QCAE9rVFU=; b=o88YYEWWJsfXi/
	6paQCOuuMBrDxw2XGgJ6EKkLWt3euNrToJR04Z/CfPFSRhJgXvy+zhRX0dPtJw4lLyz8m8sEfmYU7
	CtNhqI8Gfjg5adRSuqO0PkMYVXmEbFm2LFYofXUoWQPUOPjxNyhidAYxxN57J0ObY+j2cUX/HW4ZC
	w040Z+5J6+5Cv4apLX6lUaH/B0V6rY/aIshbEgq8N+cy2phpueq02CbRe2irIJxUNyNb9oMbi5htO
	sY8p6rj5whwX04et+HsuGpOes9WibFYa5V0Pr30gDdIXbtv7G/RI2+woRVC5RQOQQ8DT7IXPHZzA4
	LcDZs6YYXTnnm02tbumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kUv-00H0et-In; Mon, 27 Jun 2022 08:53:33 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kUs-00H0bs-9Q
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 08:53:31 +0000
Received: by mail-qv1-f45.google.com with SMTP id 43so11874qva.9
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 01:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ruOoryFdJTYSwm98bFwmI1FC+X3Sx2AY+/obbwRbEE=;
        b=jwZSh3nTDW8Tk7k7RYxnnTjuoqe72w5QSkgo3pDI8sTp6xBBI46xv1XmYwuug+98Ic
         J2Ay/08Ead46wg03D3RHXH+xQmrjYwS4V6FQj4zmwrVvZDieI/V4IC9Td4UT/Ux5OP6K
         wec7IkruJ+SA9aQ5MtOdIf6em14ylbRwlD2HP3hSL6Xxh9fzqZrjWgk2n6Gkr3txTnxb
         LDwujwap3TM9qOWCkMtKijP8pafUCf6Fm7Om1uDEunw3JKdgDkHa/W63hTbks59CMeYw
         Idmi9tfhAaxc19TkyXw0P7GEsBgrs3GbgXeJoIVvIi2lnIB81UTVdmEl40exgxFlZoWL
         FsTg==
X-Gm-Message-State: AJIora/rHejm5qjyAmD00YdQs5tPEjWSXqTvyjqY+n4AimpflGbejULt
	ZLrJHWxSYFno4cfD5p/zuHF+81YZJEPr5A==
X-Google-Smtp-Source: AGRyM1uxRQd2EP5iZe6tKhyYYgsfMxLADA8WtYu+JxNljAFQ4Nha0SM9lpMLvRCJFFSPJ6kcHAyMbQ==
X-Received: by 2002:ac8:7f49:0:b0:305:3392:6eb7 with SMTP id g9-20020ac87f49000000b0030533926eb7mr8467160qtk.84.1656320007883;
        Mon, 27 Jun 2022 01:53:27 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id o16-20020a05620a2a1000b006a68fdc2d18sm3383631qkp.130.2022.06.27.01.53.26
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:53:26 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-317741c86fdso78576847b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 01:53:26 -0700 (PDT)
X-Received: by 2002:a81:574c:0:b0:317:7c3a:45be with SMTP id
 l73-20020a81574c000000b003177c3a45bemr13161209ywb.316.1656320006319; Mon, 27
 Jun 2022 01:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87wnd3erab.wl-maz@kernel.org> <CA+V-a8tcxj_N0sBHhgAZAN8WSJ12JnDzAvUUnCXto3wHLqNVwg@mail.gmail.com>
 <87v8snehwi.wl-maz@kernel.org>
In-Reply-To: <87v8snehwi.wl-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jun 2022 10:53:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVt9FjCtvMgJcCh=g2b+8b-fgabGbOLDcXNrrPMpC+3jQ@mail.gmail.com>
Message-ID: <CAMuHMdVt9FjCtvMgJcCh=g2b+8b-fgabGbOLDcXNrrPMpC+3jQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
To: Marc Zyngier <maz@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_015330_384948_F38F19F0 
X-CRM114-Status: GOOD (  41.12  )
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

On Sun, Jun 26, 2022 at 2:19 PM Marc Zyngier <maz@kernel.org> wrote:
> On Sun, 26 Jun 2022 10:38:18 +0100,
> "Lad, Prabhakar" <prabhakar.csengg@gmail.com> wrote:
> > On Sun, Jun 26, 2022 at 9:56 AM Marc Zyngier <maz@kernel.org> wrote:
> > > On Sun, 26 Jun 2022 01:43:26 +0100,
> > > Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
> > > > NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
> > > > case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
> > > > edge until the previous completion message has been received and
> > > > NCEPLIC100 doesn't support pending interrupt counter, hence losing the
> > > > interrupts if not acknowledged in time.
> > > >
> > > > So the workaround for edge-triggered interrupts to be handled correctly
> > > > and without losing is that it needs to be acknowledged first and then
> > > > handler must be run so that we don't miss on the next edge-triggered
> > > > interrupt.
> > > >
> > > > This patch adds a new compatible string for Renesas RZ/Five SoC and adds
> > > > support to change interrupt flow based on the interrupt type. It also
> > > > implements irq_ack and irq_set_type callbacks.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > > > +     if (of_device_is_compatible(node, "renesas,r9a07g043-plic")) {
> > > > +             priv->of_data = RENESAS_R9A07G043_PLIC;
> > > > +             plic_chip.name = "Renesas RZ/Five PLIC";
> > >
> > > NAK. The irq_chip structure isn't the place for platform marketing.
> > > This is way too long anyway (and same for the edge version), and you
> > > even sent me a patch to make that structure const...
> > >
> > My bad will drop this.
>
> And why you're at it, please turn this rather random 'of_data' into
> something like:
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index bb87e4c3b88e..cd1683b77caf 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -64,6 +64,10 @@ struct plic_priv {
>         struct cpumask lmask;
>         struct irq_domain *irqdomain;
>         void __iomem *regs;
> +       enum {
> +               VANILLA_PLIC,
> +               RENESAS_R9A07G043_PLIC,
> +       } flavour;
>  };
>
>  struct plic_handler {
>
> to give some structure to the whole thing, because I'm pretty sure
> we'll see more braindead implementations as time goes by.

What about using a feature flag (e.g. had_edge_irqs) instead?

> It almost feels like I've written this whole patch. Oh wait...

> Without deviation from the norm, progress is not possible.

How applicable ;-)

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
