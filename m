Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ABDC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7Y1WwiOCCTpqCiYf7p1pmrUVxS8Dz5j14NmdXaOdgA=; b=RJefiLF9j54aQF
	1hdU7Mf5BnWIMta7tqHSiPVsFJjTzCDyG5bfAlkVRLlH9qq5IinoX6KktNTAe/M/6MTWQLwtEGbZx
	vpdCq6OEu5IyZP4LIQSntcfsFczR8/GAsifx4MKr6Nxl94g8ndEz9+i+iMIf30j7KX8jTHj2oAS7t
	t4JnlUEEkbI4ym81OLVqqWOsjQcIb0pyXlTmtcp4gQmw5o+cG75eLP9mb+JoAgya7Yk140eYegGdv
	UTanzcRPt8J3TIFbdnFQsRi5iDDLOKkmymmMJJt+0bF5jKEGUqAB0Doz1bnpfiPhafivt++NcKHmx
	91mi/kp5a68lpymfivrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntnQV-00Ab9T-QB; Wed, 25 May 2022 09:35:35 +0000
Received: from mail-qv1-f50.google.com ([209.85.219.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntnQR-00Ab6j-L1
 for linux-riscv@lists.infradead.org; Wed, 25 May 2022 09:35:33 +0000
Received: by mail-qv1-f50.google.com with SMTP id s5so16005337qvo.12
 for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 02:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZTaGoLkIAZLAWf0HUaCretqVIbmJhnkdDonZvTvD9v0=;
 b=4kQQ5gBBJWrWB0UbfApnh8L00ooBf27l8rxfyjBWODOBuo8BBlAC4EwMobyAPuGC25
 vY9MQj7XtkQHxVyJkzVmmjFanKVzqy+GcVbV1QGg/xnUjj/ofU19dK2FC7VDBIPF8bw2
 u1Yp8IPL1Yb8uoFK+q9loZlV4MGvyltt+wlpXYiowTKjM1Eq6sLGimtlCivCNbakHDrA
 abr1y8tga9XovlT3RyvMxDYGSHRQOOsSQX9Tm4gOBMxpzUgEKdwarHIgVZ43CB6R/RnM
 POQ4k+Cp0OuHkc3x3xKGp178JveKOsHg/wUO5kwOScsasbBg8TmGWFcSZomRJzsiJOpk
 kZDQ==
X-Gm-Message-State: AOAM533I8+foggMX/RUkNo1W98eWuhTBEkkk902QTzu2jmhyk+IGcFSM
 z7OXbeoGtm6EWXkHE8h5SkMie6WivCktZg==
X-Google-Smtp-Source: ABdhPJxcelwJim//cW5Y04Cy6WEXJ1gdqD9HoaiLrVMwYOQM3Vw09Li9fG/KhAbtlVkW6+oLxnjTvg==
X-Received: by 2002:ad4:5ce8:0:b0:461:ebad:2abf with SMTP id
 iv8-20020ad45ce8000000b00461ebad2abfmr24346356qvb.20.1653471325689; 
 Wed, 25 May 2022 02:35:25 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05620a22cb00b006a3325fd985sm920367qki.13.2022.05.25.02.35.25
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 02:35:25 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id q184so6415133ybg.11
 for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 02:35:25 -0700 (PDT)
X-Received: by 2002:a25:6851:0:b0:655:8432:e88d with SMTP id
 d78-20020a256851000000b006558432e88dmr4033965ybc.380.1653471324865; Wed, 25
 May 2022 02:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220524172214.5104-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX0pqr8pmbX8OfUyTeEwiFGSG5uyP4nLG1LPy7_zzLPbQ@mail.gmail.com>
 <CA+V-a8ubrkDU2B=mJopzFrjhv1nVn5EXZmaprta0oj4p3J_N5Q@mail.gmail.com>
In-Reply-To: <CA+V-a8ubrkDU2B=mJopzFrjhv1nVn5EXZmaprta0oj4p3J_N5Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 May 2022 11:35:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVncBnD25RLLqL2qDFwboPSVvo5faJvamDxPH_wq9r22Q@mail.gmail.com>
Message-ID: <CAMuHMdVncBnD25RLLqL2qDFwboPSVvo5faJvamDxPH_wq9r22Q@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Phil Edworthy <phil.edworthy@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_023531_728228_C4E4C899 
X-CRM114-Status: GOOD (  52.35  )
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

On Wed, May 25, 2022 at 11:01 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, May 25, 2022 at 9:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, May 24, 2022 at 7:22 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
> > > NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
> > > case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
> > > edge until the previous completion message has been received and
> > > NCEPLIC100 doesn't support pending interrupt counter, hence losing the
> > > interrupts if not acknowledged in time.
> > >
> > > So the workaround for edge-triggered interrupts to be handled correctly
> > > and without losing is that it needs to be acknowledged first and then
> > > handler must be run so that we don't miss on the next edge-triggered
> > > interrupt.
> > >
> > > This patch adds a new compatible string for Renesas RZ/Five SoC and adds
> > > support to change interrupt flow based on the interrupt type. It also
> > > implements irq_ack and irq_set_type callbacks.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/irqchip/irq-sifive-plic.c
> > > +++ b/drivers/irqchip/irq-sifive-plic.c

> > > @@ -163,10 +166,31 @@ static int plic_set_affinity(struct irq_data *d,
> > >  }
> > >  #endif
> > >
> > > +static void plic_irq_ack(struct irq_data *d)
> > > +{
> > > +       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> > > +
> >
> > No check for RZ/Five or irq type?
> That is because we set the handle_fasteoi_ack_irq() only in case of
> RZ/Five and it is already checked in set_type() callback.
>
> > .irq_ack() seems to be called for level interrupts, too
> > (from handle_level_irq() through mask_ack_irq()).
> >
> Right but we are using handle_fasteoi_irq() for level interrupt which
> doesn't call mask_ack_irq(). And I have confirmed by adding a print in
> ack callback  and just enabling the serial (which has level
> interrupts).

But handle_fasteoi_irq() is configured only on RZ/Five below?
Which handler is used on non-RZ/Five?

I have to admit I'm not that deep into irq handling, and
adding a print indeed doesn't trigger on Starlight Beta.

> > > @@ -176,11 +200,37 @@ static void plic_irq_eoi(struct irq_data *d)
> > >         }
> > >  }
> > >
> > > +static int plic_irq_set_type(struct irq_data *d, unsigned int type)
> > > +{
> > > +       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> > > +
> > > +       if (handler->priv->of_data != RENESAS_R9A07G043_PLIC)
> > > +               return 0;
> > > +
> > > +       switch (type) {
> > > +       case IRQ_TYPE_LEVEL_HIGH:
> > > +               irq_set_handler_locked(d, handle_fasteoi_irq);
> > > +               break;
> > > +
> > > +       case IRQ_TYPE_EDGE_RISING:
> > > +               irq_set_handler_locked(d, handle_fasteoi_ack_irq);
> > > +               break;
> > > +
> > > +       default:
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static struct irq_chip plic_chip = {
> > >         .name           = "SiFive PLIC",
> > >         .irq_mask       = plic_irq_mask,
> > >         .irq_unmask     = plic_irq_unmask,
> > > +       .irq_ack        = plic_irq_ack,
> >
> > This causes extra processing on non-affected PLICs.
> > Perhaps use a separate irq_chip instance?
> >
> I don't think so as the handle_fasteoi_ack_irq() is installed only in
> case of RZ/Five, so irq_ack() will not be called for non-affected
> PLIC's. Please correct me if I am wrong.

Hence I'll leave this to the irq maintainer...

> > > @@ -293,6 +356,9 @@ static int __init plic_init(struct device_node *node,
> > >         if (!priv)
> > >                 return -ENOMEM;
> > >
> > > +       if (of_device_is_compatible(node, "renesas-r9a07g043-plic"))
> > > +               priv->of_data = RENESAS_R9A07G043_PLIC;
> > > +
> >
> > So perhaps instead just look at #interrupt-cells, and use the onecell
> > or twocell irq_chip/irq_domain_ops based on that?
> >
> But we do call plic_irq_domain_translate() in the alloc callback and
> don't have a node pointer in there to check the interrupt cell count.
> Or maybe we can store the interrupt cell count in priv and use it
> accordingly above?

That's a reasonable option.

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
