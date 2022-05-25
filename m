Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF116C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 09:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrxzR/4nMshqa9sYU3fUKUXwlpQMmSYbs/dqRDJfyJI=; b=yZIVG4g7315ynX
	6Jpjmk+oWfh4NmgZ8RAbN+6/hj+muFOQpbYULQMYAxqI5sR+PRlVg/D7OkuL8oXN7109qdKiwvpMv
	i4KFMKbk7c0qW3+a/jpgn5QUSw0s25jFQyC8kUjmsYqD8QarcExPC2OM1lIK9cDiStpfVBazbGA+m
	U36iXbj85uVlwg1JPCiufxWjxAQ8DgODETdj5D5CQJE2z0jhoKB667FswhAz02YALVnQxPqNiUcTl
	O3fehDTm18ObI6MWj+ADqlZhNg2gp+XLIbpFG31H9BfN0CbbAvFEXWCPDne9dUhfQRp7QUjD73VI/
	HwOwy4aFFxBJtRE5LQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntnYV-00Acw1-1p; Wed, 25 May 2022 09:43:51 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntnYR-00Acuc-Kq
 for linux-riscv@lists.infradead.org; Wed, 25 May 2022 09:43:49 +0000
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ff53d86abbso189644617b3.8
 for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1O/cnzxLyE24n8oNtE1G8BpY+MDED/QH3SE2yJ32biA=;
 b=BMhFL5b6E5KwNcVSCHnyQBR/FgHJaQShTBBhNtA64fbaT1zKoX/5V/10/GkyjDfCj5
 eEpr1Pxj+qGzXRZS9XoI/2yjtClKvlDB0lY8OPR4oGIU4AbgR1sHw0i3exdtmHxh4lV8
 rGnkKYWdzKoMkbA9/cUHDOSYCx7s9DLpGZdgwNaYZ3qi88cUDBg7xc7Ux1zV7A3DgYNT
 xbiWWKtha4nFbmlMX9ZY2E+kzoeIoYEPU/RQcziysejpbJC4niDYU+zXWxI4taODdRtg
 /dWPPfyfEFWY8NgtZAnMFQu4hlzKu7XlJJHHT7tNHM/FWT/16BhgDTPc3RSZP5ykWhhY
 J6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1O/cnzxLyE24n8oNtE1G8BpY+MDED/QH3SE2yJ32biA=;
 b=VGqNQggZThcSvr21qTqtZHfmqQfXCaRPhn/gkqQViKAWgSMSJJ6HNocLEPGruUlIq6
 a3PlLZdOQuM65el0ehSbjYmh435WD2ywlb1g1fS17aMIBwsTPYxyohmCUnjZQ+VbNcg7
 rcDuGpTslbn4D1Qq8UsC2cEbfa26K/JbBzhZhviQKLjUQGyNTAx/Ft5FJhFeVJw8dnTI
 BFvxccDpw8ePXfEy+8WJsx80rh5+P9ksjgzXUI0YAq1VjvUbq9ZHtqTWDbwpAiq80hHT
 ESrwa+GzUzIbD29K1X8mM2q6CeTPgfngsAhF3OCvjYJoi87CVcNIF8avRBWMR82+U6Cg
 XXqg==
X-Gm-Message-State: AOAM530nioEkE4hR6OaSQUW7ROG+dtH4M/oe7pmjXFIqriTYZd/EFg3N
 R5S7zWvP+rwu54E8b08qjIkulP6iqTljf1y9+Ho=
X-Google-Smtp-Source: ABdhPJz4goephVaph29ovM6NwmrhGAKSlI3y2GQdztsG+ZmN8Hi5UDI5lr2bY+YLU8cDx55yu6SczHmnq+LS5yw1kyo=
X-Received: by 2002:a0d:c101:0:b0:2ff:5824:e8a8 with SMTP id
 c1-20020a0dc101000000b002ff5824e8a8mr32467321ywd.413.1653471825732; Wed, 25
 May 2022 02:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220524172214.5104-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX0pqr8pmbX8OfUyTeEwiFGSG5uyP4nLG1LPy7_zzLPbQ@mail.gmail.com>
 <CA+V-a8ubrkDU2B=mJopzFrjhv1nVn5EXZmaprta0oj4p3J_N5Q@mail.gmail.com>
 <CAMuHMdVncBnD25RLLqL2qDFwboPSVvo5faJvamDxPH_wq9r22Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVncBnD25RLLqL2qDFwboPSVvo5faJvamDxPH_wq9r22Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 May 2022 10:43:19 +0100
Message-ID: <CA+V-a8tHfyqJx9YBFX3hJBEKuCbDpminz_4uSLK=MHV7W8-hJg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20220525_024347_764490_A4CD2FDD 
X-CRM114-Status: GOOD (  54.40  )
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

On Wed, May 25, 2022 at 10:35 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, May 25, 2022 at 11:01 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Wed, May 25, 2022 at 9:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, May 24, 2022 at 7:22 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
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
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/irqchip/irq-sifive-plic.c
> > > > +++ b/drivers/irqchip/irq-sifive-plic.c
>
> > > > @@ -163,10 +166,31 @@ static int plic_set_affinity(struct irq_data *d,
> > > >  }
> > > >  #endif
> > > >
> > > > +static void plic_irq_ack(struct irq_data *d)
> > > > +{
> > > > +       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> > > > +
> > >
> > > No check for RZ/Five or irq type?
> > That is because we set the handle_fasteoi_ack_irq() only in case of
> > RZ/Five and it is already checked in set_type() callback.
> >
> > > .irq_ack() seems to be called for level interrupts, too
> > > (from handle_level_irq() through mask_ack_irq()).
> > >
> > Right but we are using handle_fasteoi_irq() for level interrupt which
> > doesn't call mask_ack_irq(). And I have confirmed by adding a print in
> > ack callback  and just enabling the serial (which has level
> > interrupts).
>
> But handle_fasteoi_irq() is configured only on RZ/Five below?
> Which handler is used on non-RZ/Five?
>
For non RZ/Five, handle_fasteoi_irq() [0] is used for both edge/level
interrupts.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/irqchip/irq-sifive-plic.c?h=next-20220525#n195

> I have to admit I'm not that deep into irq handling, and
> adding a print indeed doesn't trigger on Starlight Beta.
>
> > > > @@ -176,11 +200,37 @@ static void plic_irq_eoi(struct irq_data *d)
> > > >         }
> > > >  }
> > > >
> > > > +static int plic_irq_set_type(struct irq_data *d, unsigned int type)
> > > > +{
> > > > +       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> > > > +
> > > > +       if (handler->priv->of_data != RENESAS_R9A07G043_PLIC)
> > > > +               return 0;
> > > > +
> > > > +       switch (type) {
> > > > +       case IRQ_TYPE_LEVEL_HIGH:
> > > > +               irq_set_handler_locked(d, handle_fasteoi_irq);
> > > > +               break;
> > > > +
> > > > +       case IRQ_TYPE_EDGE_RISING:
> > > > +               irq_set_handler_locked(d, handle_fasteoi_ack_irq);
> > > > +               break;
> > > > +
> > > > +       default:
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > >  static struct irq_chip plic_chip = {
> > > >         .name           = "SiFive PLIC",
> > > >         .irq_mask       = plic_irq_mask,
> > > >         .irq_unmask     = plic_irq_unmask,
> > > > +       .irq_ack        = plic_irq_ack,
> > >
> > > This causes extra processing on non-affected PLICs.
> > > Perhaps use a separate irq_chip instance?
> > >
> > I don't think so as the handle_fasteoi_ack_irq() is installed only in
> > case of RZ/Five, so irq_ack() will not be called for non-affected
> > PLIC's. Please correct me if I am wrong.
>
> Hence I'll leave this to the irq maintainer...
>
> > > > @@ -293,6 +356,9 @@ static int __init plic_init(struct device_node *node,
> > > >         if (!priv)
> > > >                 return -ENOMEM;
> > > >
> > > > +       if (of_device_is_compatible(node, "renesas-r9a07g043-plic"))
> > > > +               priv->of_data = RENESAS_R9A07G043_PLIC;
> > > > +
> > >
> > > So perhaps instead just look at #interrupt-cells, and use the onecell
> > > or twocell irq_chip/irq_domain_ops based on that?
> > >
> > But we do call plic_irq_domain_translate() in the alloc callback and
> > don't have a node pointer in there to check the interrupt cell count.
> > Or maybe we can store the interrupt cell count in priv and use it
> > accordingly above?
>
> That's a reasonable option.
>
Ok I will update this in v2.

Cheers,
Prabhakar

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
