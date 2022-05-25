Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016C4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 11:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1xMZNd18oqenhyxxFbR72c1b7vxNKPVwETxcW80v2E=; b=YmrP1uvT0w6xAC
	DOFzNvC0bJVDW0WVKi10S5163ewdjla0eL/mEZC2DSvmkr8H1p2kFNjTU7gYu2EvqVzWpY5Fn2KwH
	jJfO9LY3+hSdybId3kZ3xPtfvie6kaIoYCYEeoYyuKxH3YwexRonOKGhtfaFywbem4S4L8uFaxDr7
	gFTjT3u6EO8Oj26edTd0PDVHXOMl7Ucnbw0Xqhmw1VJTXEua/iIIfOz1qA4TysGlCsRC1XyciMuev
	pfYIjNYt0hynwXFpDoP4AkOhRhmZr+gKqQG6stE2ZVGwvjvb7OTUeosT7fyXxF1JmoDr53V7wO3yO
	fVSF5RjAZl8a1q0XOgYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntpTh-00AzUk-ST; Wed, 25 May 2022 11:47:01 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntpTe-00AzUI-EQ
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 11:47:00 +0000
Received: by mail-qk1-f170.google.com with SMTP id i68so15828020qke.11
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 04:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WZEhsrnmH5bWQhJRb1s8S6ZF7bqzQ8zLRH/dG9jf2XA=;
        b=3a9rNrPQcwyqSw0UG/b3uApypwh+88X4kOo0zqlU6+vQa6AIR9HnJIL55gHaPhLCuN
         /2lViQp2U7qjbKB+JcyC9jaJgv0OiLYq7MdYcAVYvdwfE5+YRJM1XLbxgOfecFAEs7TY
         kzGpsLth8h6RWQC7At6uVTdx5jOGct0Jo9T3zOMuaxuHhlOe/hKefi3zAmWOcBjlCc5P
         FgR+Ek54FQcpN3D637H9kGRwvjycHYB9tJZBFgXobBAPDGCGb9CQxRPqIebH7SUk/aup
         XS/VCIb1Z6wxI7jbylL0fPqwf/5ELrrgpDPwTM0FRgCeKd0gLd1GPM8onlqFK/hzqwoX
         VLSg==
X-Gm-Message-State: AOAM531aNn8bEFEKVPBnXPm4gfhUN4BMJtG9jGRpCj/zktqo7+WkatTP
	f1RgwS/vhDU63KcI95bOfxtSYp+5qfikRA==
X-Google-Smtp-Source: ABdhPJz8rcDm0MGe747cW1rhMAbJtXffVYgEcplwCHjV1QjiL1B3i4ZvegzQcWJtHUsGN4pZMaUMdg==
X-Received: by 2002:a37:6685:0:b0:6a3:686f:699a with SMTP id a127-20020a376685000000b006a3686f699amr12717191qkc.390.1653479216111;
        Wed, 25 May 2022 04:46:56 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id i67-20020a375446000000b0069fc13ce217sm1148250qkb.72.2022.05.25.04.46.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 04:46:54 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2ff90e0937aso136942267b3.4
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 04:46:53 -0700 (PDT)
X-Received: by 2002:a81:234b:0:b0:2f8:4082:bbd3 with SMTP id
 j72-20020a81234b000000b002f84082bbd3mr32969304ywj.47.1653479213622; Wed, 25
 May 2022 04:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220524172214.5104-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX0pqr8pmbX8OfUyTeEwiFGSG5uyP4nLG1LPy7_zzLPbQ@mail.gmail.com>
 <CA+V-a8ubrkDU2B=mJopzFrjhv1nVn5EXZmaprta0oj4p3J_N5Q@mail.gmail.com>
 <CAMuHMdVncBnD25RLLqL2qDFwboPSVvo5faJvamDxPH_wq9r22Q@mail.gmail.com> <CA+V-a8tHfyqJx9YBFX3hJBEKuCbDpminz_4uSLK=MHV7W8-hJg@mail.gmail.com>
In-Reply-To: <CA+V-a8tHfyqJx9YBFX3hJBEKuCbDpminz_4uSLK=MHV7W8-hJg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 May 2022 13:46:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWizSaABqAnwQi-Sa3ceiZV2CnAhiio4aCx_Bd7NvN1NQ@mail.gmail.com>
Message-ID: <CAMuHMdWizSaABqAnwQi-Sa3ceiZV2CnAhiio4aCx_Bd7NvN1NQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Phil Edworthy <phil.edworthy@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_044658_525572_1B23BD08 
X-CRM114-Status: GOOD (  44.25  )
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

On Wed, May 25, 2022 at 11:43 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, May 25, 2022 at 10:35 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, May 25, 2022 at 11:01 AM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Wed, May 25, 2022 at 9:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, May 24, 2022 at 7:22 PM Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
> > > > > NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
> > > > > case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
> > > > > edge until the previous completion message has been received and
> > > > > NCEPLIC100 doesn't support pending interrupt counter, hence losing the
> > > > > interrupts if not acknowledged in time.
> > > > >
> > > > > So the workaround for edge-triggered interrupts to be handled correctly
> > > > > and without losing is that it needs to be acknowledged first and then
> > > > > handler must be run so that we don't miss on the next edge-triggered
> > > > > interrupt.
> > > > >
> > > > > This patch adds a new compatible string for Renesas RZ/Five SoC and adds
> > > > > support to change interrupt flow based on the interrupt type. It also
> > > > > implements irq_ack and irq_set_type callbacks.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/drivers/irqchip/irq-sifive-plic.c
> > > > > +++ b/drivers/irqchip/irq-sifive-plic.c
> >
> > > > > @@ -163,10 +166,31 @@ static int plic_set_affinity(struct irq_data *d,
> > > > >  }
> > > > >  #endif
> > > > >
> > > > > +static void plic_irq_ack(struct irq_data *d)
> > > > > +{
> > > > > +       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> > > > > +
> > > >
> > > > No check for RZ/Five or irq type?
> > > That is because we set the handle_fasteoi_ack_irq() only in case of
> > > RZ/Five and it is already checked in set_type() callback.
> > >
> > > > .irq_ack() seems to be called for level interrupts, too
> > > > (from handle_level_irq() through mask_ack_irq()).
> > > >
> > > Right but we are using handle_fasteoi_irq() for level interrupt which
> > > doesn't call mask_ack_irq(). And I have confirmed by adding a print in
> > > ack callback  and just enabling the serial (which has level
> > > interrupts).
> >
> > But handle_fasteoi_irq() is configured only on RZ/Five below?
> > Which handler is used on non-RZ/Five?
> >
> For non RZ/Five, handle_fasteoi_irq() [0] is used for both edge/level
> interrupts.
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/irqchip/irq-sifive-plic.c?h=next-20220525#n195

Thanks, that was the missing piece!

Due to the new "select IRQ_FASTEOI_HIERARCHY_HANDLERS", I thought
your new call to handle_fasteoi_irq() had to be the first one in this
file...  But that config symbol protects handle_fasteoi_ack_irq(),
not handle_fasteoi_irq().

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
