Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE43C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 01:47:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C7CB600EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 01:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C7CB600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hx/JA/7D+Qf4Xl6PYEAzTJGP1QzYzI3oVYUrw0+vOI=; b=XFWK/YmllkkM4N
	pEbVbsLd4tkw1ajHaAIgWW4B6txBiP5FXFawPGKIs6ELHFcTph149cEBT4cDY3Couwq5omJQNtIvg
	gHx4TXO51YbG2+RDD6sy2fU8opNY7D54lem/8UiK2R8Y2yXmNvlncJl+R0Ki0b2dinLvbf94uwL8b
	Vr71p8nCc2ln/XYm3fmUQtVTb1KEgbrSzBxCKI49How2h1abGWN9omKaadVDahnJIRv79Jrxurg5w
	QdiLGZb3+9L7dRXr0g9hVpRl4RfmyBcToAVOJakdAp4WqzRiCl8rkUvOJngj1sq66E3ppaAmGyv5v
	94gXvgAg6xz3FZ0AsKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdNAZ-006ETP-L8; Thu, 21 Oct 2021 01:46:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdNAW-006ESy-GI
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 01:46:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F241761186
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 01:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634780816;
 bh=BiQ6Ok9tsztXXaQtA4aELWgHA+y/OBYDN5rjL5WbOqc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U6rL14Tf2tIjRTJiHTEcB0GOhBW4UYuU9r5An9yoWWPKpz/RDi5UsJPKqtrkUWV8d
 r5V6nxORogQFjCGwTCqm0P5HKCNs0xoLZq0LSwkAMR2iLiVKFH2WJii0070L/05Jgf
 XvigH9cHHakzEEFCcFVrDmRMtoBTmFxGLHO4RhUtsxZ7WYMgMQi8rvzcls3WPPyXRg
 kLXzR8ssFc6xq5CVtHn6YYVH2j6z57Oq28CmxBn7cc7YQonPgQ2DxKcJp3zlRfl2qn
 4UXjS6XLGA3m32T/8B/FieMKmLz6ZR0Z+Rfie3XIzUm/9SLXNKtXLaGqU3ENouVeSP
 Pvi1ceXHsfuNg==
Received: by mail-lf1-f54.google.com with SMTP id n8so301376lfk.6
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 18:46:55 -0700 (PDT)
X-Gm-Message-State: AOAM533Pqe5cmvdJS1MS7olKsj/C+Dtvqy4yWscl73bd+ir/s2zM7teW
 ixeFhWpLw4e7PhkswU5JSfqXW/HdTcEu3BcUjgI=
X-Google-Smtp-Source: ABdhPJxBTxu95pbGNNITW1Hh2ENk1tznIA6FdU1oYEWsED2d5NUFqPI+NtWSGSK/S8R8GtdmyAUAd+iCCQ06RHB3Hyc=
X-Received: by 2002:a05:6512:3f1b:: with SMTP id
 y27mr2712392lfa.606.1634780814035; 
 Wed, 20 Oct 2021 18:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
 <f850af365f2ac77af79ec59f92e6434a@kernel.org>
 <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
 <8735oxuxlq.wl-maz@kernel.org>
 <CAJF2gTSmyu9nA5M3QLeR1LdGMkeGb7jE93Z9zjixcpb_freLMw@mail.gmail.com>
 <875ytrddma.wl-maz@kernel.org>
 <CAAhSdy0TwOjv_RDMRsKqcqTE8PSO_A_EttMGBiDbb-0PTRizZg@mail.gmail.com>
 <871r4fd996.wl-maz@kernel.org>
 <CAAhSdy24WRZP70C0HUA1y0nVf0yWdj4SYY8HhGSfxQzDdafYnQ@mail.gmail.com>
In-Reply-To: <CAAhSdy24WRZP70C0HUA1y0nVf0yWdj4SYY8HhGSfxQzDdafYnQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 21 Oct 2021 09:46:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS2sb8cqwwg1RcyMcjQkaiHTo3g+A9LabUgzm19ZENLfQ@mail.gmail.com>
Message-ID: <CAJF2gTS2sb8cqwwg1RcyMcjQkaiHTo3g+A9LabUgzm19ZENLfQ@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
To: Anup Patel <anup@brainfault.org>
Cc: Marc Zyngier <maz@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_184656_613687_871B943F 
X-CRM114-Status: GOOD (  39.28  )
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

On Thu, Oct 21, 2021 at 12:08 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Oct 20, 2021 at 8:38 PM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Wed, 20 Oct 2021 15:33:49 +0100,
> > Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Wed, Oct 20, 2021 at 7:04 PM Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > On Tue, 19 Oct 2021 14:27:02 +0100,
> > > > Guo Ren <guoren@kernel.org> wrote:
> > > > >
> > > > > On Tue, Oct 19, 2021 at 6:18 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > > >
> > > > > > On Tue, 19 Oct 2021 10:33:49 +0100,
> > > > > > Guo Ren <guoren@kernel.org> wrote:
> > > > > >
> > > > > > > > If you have an 'automask' behavior and yet the HW doesn't record this
> > > > > > > > in a separate bit, then you need to track this by yourself in the
> > > > > > > > irq_eoi() callback instead. I guess that you would skip the write to
> > > > > > > > the CLAIM register in this case, though I have no idea whether this
> > > > > > > > breaks
> > > > > > > > the HW interrupt state or not.
> > > > > > > The problem is when enable bit is 0 for that irq_number,
> > > > > > > "writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM)" wouldn't affect
> > > > > > > the hw state machine. Then this irq would enter in ack state and no
> > > > > > > continues irqs could come in.
> > > > > >
> > > > > > Really? This means that you cannot mask an interrupt while it is being
> > > > > > handled? How great...
> > > > > If the completion ID does not match an interrupt source that is
> > > > > currently enabled for the target, the completion is silently ignored.
> > > > > So, C9xx completion depends on enable-bit.
> > > >
> > > > Is that what the PLIC spec says? Or what your implementation does? I
> > > > can understand that one implementation would be broken, but if the
> > > > PLIC architecture itself is broken, that's far more concerning.
> > >
> > > Yes, we are dealing with a broken/non-compliant PLIC
> > > implementation.
> > >
> > > The RISC-V PLIC spec defines a very different behaviour for the
> > > interrupt claim (i.e. readl(claim)) and interrupt completion (i.e.
> > > writel(claim)). The T-HEAD PLIC implementation does things
> > > different from what the RISC-V PLIC spec says because it will
> > > mask an interrupt upon interrupt claim whereas PLIC spec says
> > > it should only clear the interrupt pending bit (not mask the interrupt).
> > >
> > > Quoting interrupt claim process (chapter 9) from PLIC spec:
> > > "The PLIC can perform an interrupt claim by reading the claim/complete
> > > register, which returns the ID of the highest priority pending interrupt or
> > > zero if there is no pending interrupt. A successful claim will also atomically
> > > clear the corresponding pending bit on the interrupt source."
> > >
> > > Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
> >
> > That's not the point I'm making. According to Guo, the PLIC (any
> > implementation of it) will ignore a write to claim on a masked
> > interrupt.
>
> Yes, write to claim on a masked interrupt is certainly ignored but
> read to claim does not automatically mask the interrupt.
>
> >
> > If that's indeed correct, then a sequence such as:
> >
> > (1) irq = read(claim)
>
> This will return highest priority pending interrupt and clear the
> pending bit as-per RISC-V PLIC spec.
>
> > (2) mask from the interrupt handler with the right flags so that it
> > isn't done lazily
> > (3) write(irq, claim)
> >
> > will result in an interrupt blocked in ack state (and probably no more
> > interrupt for this CPU at this priority). That would be an interesting
> > bug in the current code, but also a pretty bad architectural choice.
>
> The interrupt claim/completion is for each interrupt and not at CPU
> level so if an interrupt is masked then only that interrupt is blocked
> for all CPUs but other interrupts can still be raised.
1.
I think PLIC only could receive a new coming IRQ after completion:

claim IRQ-0
complete IRQ-0
claim IRQ-1
complete IRQ-1
claim IRQ-2
complete IRQ-2

Any recursion would break the PLIC, right? That's why we need to mask
the IRQ before entering this IRQ thread_fn.

2.
plic_handle_irq ->  readl(claim)
handle_fasteoi_irq -> if (desc->istate & IRQS_ONESHOT) mask_irq(desc);
handle_fasteoi_irq -> chip->irq_eoi(&desc->irq_data); // failied

Seems all ONESHOT IRQs would be broken, right?

>
> Regards,
> Anup
>
> >
> >         M.
> >
> > --
> > Without deviation from the norm, progress is not possible.
--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
