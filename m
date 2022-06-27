Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C014DC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 13:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zH/cW9nIVHKB39ZwjmF6HmRNvy5250W91snx12Cp1Aw=; b=xohMrLHl5RYu7B
	VRaycocSSHAs3YPw/cl1dlgNECMyra+lzcp1XpqYWjkl8xSxTCkDpckpoD7K7liK21PGvJFpn7ysy
	+D0p5Lz28Mm5qc0BfvhouhuH7NRZHoN+3jk9DqHh0nzvCwEw2qCPUVXwd5dB+Bvbxi9d8OE0npzuj
	rZulJnk8l7yk0wlnnRHw52Hw6BFdA0PjdlKDPW5AvqiuaU/I2lqSJ2b9xjII8h2FVnTp9mUfCd6e2
	ZAGjnvU3HFj4l0v2ZBB+DxUccF6d1iRMGQUclC6tUtN757caN3mgtJOjO/5YE2duGtrMNaBjw8ANO
	+JcMWIeJcVQPMoVevpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oXq-0015nS-Li; Mon, 27 Jun 2022 13:12:50 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oXn-0015mY-MH
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 13:12:49 +0000
Received: by mail-qk1-f176.google.com with SMTP id z16so1928115qkj.7
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 06:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JxlerhPV4IshYu4oVBQQfkBjlxEmLypIX65zQRQHmm0=;
        b=FONF6u0e/5XzhHGcPFc0lKvImY/itLYp0EHu1Cqn1EDS9XANfDURBy0XAM4Ov7rFY/
         TKbOF8VnIjZ4CWei0fVWO3oEiVwdQmRVX82dLFOURUwEj6yyj1NQSGK54cF2o+EAsxWy
         8A521xZRF1ha+Xubc90dHtb9YHJwL7w1A9hq0VFxwJgx4hIimtjdaumpttQ7lY8ns2Qk
         CFboFAA0GbO300JlDuRL9ShhjP9WNi5rno6EgWVJZDFEKWR8dMvRRPvJTsINhTMZaU/s
         nECV2dYAniO0r17ci7f4dIb9Sl4fFCimQ5Itlg3vqjVYPrNrvBgeUsKHrOWMM3MEPY+x
         tqRA==
X-Gm-Message-State: AJIora/B+1dt8MmRLe586X2Vu0DsP0UF6q05Lhtb1e5HN8cwoHIJI5/R
	B9VrySMmDRgPOyE08gAQksI1GtS2qRVqtw==
X-Google-Smtp-Source: AGRyM1v2uOurXoH9bwkyGoE0VmtBMXHYjV17fwiwxxdGsZbTCb2qxGAJSxVLGiZfIhI2DXW047gokA==
X-Received: by 2002:a37:95c7:0:b0:6af:2b47:78a3 with SMTP id x190-20020a3795c7000000b006af2b4778a3mr2759783qkd.311.1656335566106;
        Mon, 27 Jun 2022 06:12:46 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id l13-20020a05620a28cd00b006a6bbc2725esm8921399qkp.118.2022.06.27.06.12.45
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:12:45 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-317741c86fdso85018137b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 06:12:45 -0700 (PDT)
X-Received: by 2002:a81:574c:0:b0:317:7c3a:45be with SMTP id
 l73-20020a81574c000000b003177c3a45bemr14359795ywb.316.1656335564838; Mon, 27
 Jun 2022 06:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87wnd3erab.wl-maz@kernel.org> <CA+V-a8tcxj_N0sBHhgAZAN8WSJ12JnDzAvUUnCXto3wHLqNVwg@mail.gmail.com>
 <87v8snehwi.wl-maz@kernel.org> <CAMuHMdVt9FjCtvMgJcCh=g2b+8b-fgabGbOLDcXNrrPMpC+3jQ@mail.gmail.com>
 <CA+V-a8uLzLJ=wB6oUu0b2oZO=FPSCTSrqb=3m9=BJxATFKmjMw@mail.gmail.com>
In-Reply-To: <CA+V-a8uLzLJ=wB6oUu0b2oZO=FPSCTSrqb=3m9=BJxATFKmjMw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jun 2022 15:12:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWC_7MPnP6LcOqi96FAhrAENC4iwtv2ksZVnvR8BC4ww@mail.gmail.com>
Message-ID: <CAMuHMdUWC_7MPnP6LcOqi96FAhrAENC4iwtv2ksZVnvR8BC4ww@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_061247_768593_45EB48E1 
X-CRM114-Status: GOOD (  44.07  )
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

Hi Prabhakar,

On Mon, Jun 27, 2022 at 3:06 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Jun 27, 2022 at 9:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, Jun 26, 2022 at 2:19 PM Marc Zyngier <maz@kernel.org> wrote:
> > > On Sun, 26 Jun 2022 10:38:18 +0100,
> > > "Lad, Prabhakar" <prabhakar.csengg@gmail.com> wrote:
> > > > On Sun, Jun 26, 2022 at 9:56 AM Marc Zyngier <maz@kernel.org> wrote:
> > > > > On Sun, 26 Jun 2022 01:43:26 +0100,
> > > > > Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > > The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
> > > > > > NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
> > > > > > case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
> > > > > > edge until the previous completion message has been received and
> > > > > > NCEPLIC100 doesn't support pending interrupt counter, hence losing the
> > > > > > interrupts if not acknowledged in time.
> > > > > >
> > > > > > So the workaround for edge-triggered interrupts to be handled correctly
> > > > > > and without losing is that it needs to be acknowledged first and then
> > > > > > handler must be run so that we don't miss on the next edge-triggered
> > > > > > interrupt.
> > > > > >
> > > > > > This patch adds a new compatible string for Renesas RZ/Five SoC and adds
> > > > > > support to change interrupt flow based on the interrupt type. It also
> > > > > > implements irq_ack and irq_set_type callbacks.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > > > > > +     if (of_device_is_compatible(node, "renesas,r9a07g043-plic")) {
> > > > > > +             priv->of_data = RENESAS_R9A07G043_PLIC;
> > > > > > +             plic_chip.name = "Renesas RZ/Five PLIC";
> > > > >
> > > > > NAK. The irq_chip structure isn't the place for platform marketing.
> > > > > This is way too long anyway (and same for the edge version), and you
> > > > > even sent me a patch to make that structure const...
> > > > >
> > > > My bad will drop this.
> > >
> > > And why you're at it, please turn this rather random 'of_data' into
> > > something like:
> > >
> > > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > > index bb87e4c3b88e..cd1683b77caf 100644
> > > --- a/drivers/irqchip/irq-sifive-plic.c
> > > +++ b/drivers/irqchip/irq-sifive-plic.c
> > > @@ -64,6 +64,10 @@ struct plic_priv {
> > >         struct cpumask lmask;
> > >         struct irq_domain *irqdomain;
> > >         void __iomem *regs;
> > > +       enum {
> > > +               VANILLA_PLIC,
> > > +               RENESAS_R9A07G043_PLIC,
> > > +       } flavour;
> > >  };
> > >
> > >  struct plic_handler {
> > >
> > > to give some structure to the whole thing, because I'm pretty sure
> > > we'll see more braindead implementations as time goes by.
> >
> > What about using a feature flag (e.g. had_edge_irqs) instead?
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c
> b/drivers/irqchip/irq-sifive-plic.c
> index 9f16833dcb41..247c3c98b655 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -60,13 +60,13 @@
>  #define        PLIC_DISABLE_THRESHOLD          0x7
>  #define        PLIC_ENABLE_THRESHOLD           0
>
> +#define PLIC_QUIRK_EDGE_INTERRUPT      BIT(0)
>
>  struct plic_priv {
>         struct cpumask lmask;
>         struct irq_domain *irqdomain;
>         void __iomem *regs;
> +       u32 plic_quirks;
>  };
>
> What about something like above?

LGTM.

Marc suggested to make this unsigned long, but TBH, that won't make
much of a difference.  PLICs are present on RV32 SoCs, too, so you
cannot rely on having more than 32 bits anyway.

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
