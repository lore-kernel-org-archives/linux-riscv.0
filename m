Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5003C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 11:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LprBXpAsTVxiFmLqkJ3hVlZCR6Mwi3VYKdCmzjylA5A=; b=mz5edCJnPsKmKq
	7sHmaCgFFRQ9O+l8Yzk1lECydiJSD/aK+DWjIVDAaoMWIWsTaEyBScZrrYBr1tfcqVLGbpbq3Fltz
	k5Bb1Ic6IHYxmZjE/IrQXb32C5bcX4QNmo98rjEjlr9WcGM/CvBfnvkghBI4H7dhFaDJ9ywtRmiJV
	R6J2GSq0HWyinW3i0uQk9/3dAeZC65L+XMQ6e0mJhQA/ghWkprnYdZwcDRPKo2vE4LpkdxnZSpQGg
	TQ1JokHYg9+N6+Mjna55KudHqwWcud5LKcLiRqAYlTk0WqEvEMEi7Uegsp0mK/wBr2LYBe10XmOyb
	6/q9MwrMX9vXLupw6K3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP0P5-00GLvF-Cg; Tue, 01 Mar 2022 11:10:51 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP0On-00GLoR-FJ
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 11:10:35 +0000
Received: by mail-lf1-x130.google.com with SMTP id m14so26242752lfu.4
 for <linux-riscv@lists.infradead.org>; Tue, 01 Mar 2022 03:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FGtzsM+YsIYexEht9IDOGPEe+7a/Lc3XHl4HOIJcQ70=;
 b=F24ivVkC9IONhfuQRrDKy7tc3vZRySIEHeHSe07XnZbV0sUJsGeTFwb+OrA6x6MIZW
 l9UOPB1Nv8O4CYrFG7lIfzGf1gSLNO007kH9e8aFZZy+v3zf9IR1F+qc9nS/6LuGOKMQ
 pvVH2WfjAjEytte5CCABcbVwvEJlSo0Ticn+oeZXNtCffknZvDfa3Bg9f3X8dcils3oe
 OptZuY1ENKKjd1j6yZPTBBo4A+munvI0GvSK7wMI0jNuxZkXzW+zwz+QOzrvClYCkK7n
 iPoxs0q7PSWZgNZSXWgLmCoZbpd5IoYEMlVFbrsAUk3S1Elbx23Q215o5tk2PFNlxs5r
 nN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FGtzsM+YsIYexEht9IDOGPEe+7a/Lc3XHl4HOIJcQ70=;
 b=ukGtatBrgn0mO3NCRQVggDcA3xs3c4MIWiTiQAgP2vtCX1Z1VN5sjbexNpyhUzm6ts
 +AYd+ogy4/sQ9uDY49cfmhniUmiuazRZ03tqG+tA8w5qz/9GAU09c3jl9ysAiOjFN1SS
 5mjaCB8QzrpZoBHdD89QXHiBTMJR4qczH4Jl/zu0Cw4YIxcbGHso/fDbOQ7WzuMIYdNu
 oBsCh94nZS5JJhSVXDFIz2j7GGX7rwMcACF/kMwg7LRPpvskiV5RqXuOUr2I0EbthHHo
 zj85xa2mg3/0gSRYO2Mg35VPsXi+Yr4co9kmfl5dNdJEtKMyzknJdwVvEY/q6mp5y/FE
 D6ow==
X-Gm-Message-State: AOAM532L9rwpgcRvDEzixX/BP2rWjmFUmVXL++mhNA7CSmk/6KDARpHT
 ZKmfddzkOCZa6JAiIwaDKe6c6Wzjhywj5To6VbhXMLMdEmhjHg==
X-Google-Smtp-Source: ABdhPJyOopWU59h202O3zf1NQLrScUq5/haA4MZvxD++LFCIFOAEbia3TTPV3GNMe9BPFoPTSgxdIWMqbIN/uPutw98=
X-Received: by 2002:ac2:4146:0:b0:441:efd2:365d with SMTP id
 c6-20020ac24146000000b00441efd2365dmr15822898lfi.100.1646133031240; Tue, 01
 Mar 2022 03:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20220301005142.3038702-1-Niklas.Cassel@wdc.com>
 <20220301005142.3038702-2-Niklas.Cassel@wdc.com>
 <CAAhSdy1=EtZS9Pjn6VDaan1_aRQ-TgJ35zgH8v1VwC8uon5NEg@mail.gmail.com>
 <Yh3h4+eVcPIfPiD7@x1-carbon>
In-Reply-To: <Yh3h4+eVcPIfPiD7@x1-carbon>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 1 Mar 2022 16:40:19 +0530
Message-ID: <CAK9=C2XQjSfE3n=rRP=iW7aYP5PV-dbvQixf69TLG6N-M+o1+w@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/sifive-plic: Improve naming scheme for per
 context offsets
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Marc Zyngier <maz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_031033_571185_294DE184 
X-CRM114-Status: GOOD (  48.76  )
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

On Tue, Mar 1, 2022 at 2:36 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
>
> On Tue, Mar 01, 2022 at 09:42:46AM +0530, Anup Patel wrote:
> > On Tue, Mar 1, 2022 at 6:22 AM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> > >
> > > From: Niklas Cassel <niklas.cassel@wdc.com>
> > >
> > > A hart context is a given privilege mode on a given hart.
> > > The PLIC supports a fixed number of hart contexts (15872).
> > > Each hart context has fixed register offsets in PLIC.
> > >
> > > The number of hart contexts for each hart depends on the privilege modes
> > > supported by each hart. Therefore, this mapping between hart context to
> > > hart id is platform specific, and is currently supplied via device tree.
> > >
> > > For example, canaan,k210 has the following mapping:
> > > Context0: hart0 M-mode
> > > Context1: hart0 S-mode
> > > Context2: hart1 M-mode
> > > Context3: hart1 S-mode
> > >
> > > While sifive,fu540 has the following mapping:
> > > Context0: hart0 M-mode
> > > Context1: hart1 M-mode
> > > Context2: hart1 S-mode
> > >
> > > Because the number of hart contexts per hart is not fixed, the names
> > > ENABLE_PER_HART and CONTEXT_PER_HART for the register offsets are quite
> > > confusing and might mislead the reader to think that these are fixed
> > > register offsets per hart.
> > >
> > > Rename the offsets to more clearly highlight that they are per hart
> > > _context_ and not per hart.
> > >
> > > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > > ---
> > >  drivers/irqchip/irq-sifive-plic.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > > index 09cc98266d30..211bcb10aa93 100644
> > > --- a/drivers/irqchip/irq-sifive-plic.c
> > > +++ b/drivers/irqchip/irq-sifive-plic.c
> > > @@ -41,19 +41,21 @@
> > >  #define     PRIORITY_PER_ID            4
> > >
> > >  /*
> > > + * A hart context is a given privilege mode on a given hart.
> > >   * Each hart context has a vector of interrupt enable bits associated with it.
> > >   * There's one bit for each interrupt source.
> > >   */
> > >  #define ENABLE_BASE                    0x2000
> > > -#define     ENABLE_PER_HART            0x80
> > > +#define     ENABLE_PER_HART_CTX                0x80
> >
> > These are enable registers for each plic-context and we have multiple
> > plic-context associated with each HART.
> > (Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc)
> >
> > Correct name would be ENABLE_PER_CONTEXT instead of
> > ENABLE_PER_HART_CTX.
>
> Hello Anup,
>
> If you look at the RISC-V Privileged Spec v1.11-draft:
> https://github.com/riscv/riscv-isa-manual/releases/download/draft-20181201-5449851/riscv-privileged.pdf

Clearly, you are referring to a very old draft version of the specification.

>
> They do use the wording "hart context" all the time.
>
> See e.g. 7.3 Interrupt Targets and Hart Contexts
>
> "Interrupt targets are usually hart contexts, where a hart context is a given privilege mode on a
> given hart (though there are other possible interrupt targets, such as DMA engines). Not all hart
> contexts need be interrupt targets, in particular, if a processor core does not support delegating
> external interrupts to lower-privilege modes, then the lower-privilege hart contexts will not be
> interrupt targets."

The latest ratified RISC-V Privileged Spec v1.12 has no such section.

>
>
> Also see the DT binding, which also uses the term hart context:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml?h=v5.17-rc6

I am referring to the RISC-V PLIC spec which simply names these
registers as "interrupt enable" registers.

>
>
> And the existing comments in the driver also uses hart context:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-sifive-plic.c?h=v5.17-rc6#n44
>
>
> I'm not sure why:
> https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
> Seems to have done search/replace on "hart context" with "context"
> in all places except one. Almost looks like some kind of revisionism ;)

The PLIC context output connects to the external interrupt of a specific
privilege mode in HART. If a HART supports both M and S modes then
we will have separate PLIC contexts for HART M-mode external interrupt
and HART S-mode external interrupt.

Clearly, the term "context" is defined by PLIC spec and not the RISC-V
privilege spec.

We also have a new RISC-V AIA specification which has totally different
terminology.

>
>
> I would say that "hart context" seems to be slightly more correct,
> and it is already used in many places, dt binding, comments, etc.
>
>
> However, if you feel that I should search/replace "hart context" with
> "context" inside the PLIC driver, to better match the current github spec,
> I can do that. It is only used in two places.
> (I don't think we should touch the DT binding though. It defines "hart
> context", then uses "context".)
>
>
> If we use ENABLE_PER_CONTEXT, like you suggest, do you have a better
> suggestion for CONTEXT_PER_HART_CTX as well?
> I don't think we can keep the CONTEXT_ prefix.
> And in that case, we probably shouldn't keep the ENABLE_ prefix either.
>
> How about:
> PER_CONTEXT_ENABLE_OFFSET and PER_CONTEXT_CTRL_OFFSET?

We just need three renaming:
1) Rename ENABLE_BASE to CONTEXT_ENABLE_BASE
2) Rename ENABLE_PER_HART to CONTEXT_ENABLE_SIZE
3) Rename CONTEXT_PER_HART to CONTEXT_SIZE

Regards,
Anup

>
>
> Kind regards,
> Niklas
>
>
> >
> > Regards,
> > Anup
> >
> > >
> > >  /*
> > > + * A hart context is a given privilege mode on a given hart.
> > >   * Each hart context has a set of control registers associated with it.  Right
> > >   * now there's only two: a source priority threshold over which the hart will
> > >   * take an interrupt, and a register to claim interrupts.
> > >   */
> > >  #define CONTEXT_BASE                   0x200000
> > > -#define     CONTEXT_PER_HART           0x1000
> > > +#define     CONTEXT_PER_HART_CTX       0x1000
> > >  #define     CONTEXT_THRESHOLD          0x00
> > >  #define     CONTEXT_CLAIM              0x04
> > >
> > > @@ -362,10 +364,10 @@ static int __init plic_init(struct device_node *node,
> > >                 cpumask_set_cpu(cpu, &priv->lmask);
> > >                 handler->present = true;
> > >                 handler->hart_base =
> > > -                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> > > +                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART_CTX;
> > >                 raw_spin_lock_init(&handler->enable_lock);
> > >                 handler->enable_base =
> > > -                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
> > > +                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART_CTX;
> > >                 handler->priv = priv;
> > >  done:
> > >                 for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> > > --
> > > 2.35.1
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
