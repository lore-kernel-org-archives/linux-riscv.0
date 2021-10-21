Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA9BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 02:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A701361186
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 02:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A701361186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqycwBFFlfzjiWEpOrbQKPGqJLWkm6TDREoFrKylG3k=; b=G7iYH3uXHBL/U1
	g64fnox5gkzr0bC6gBRrVDQgUIpABrQdhq7fFe+lkQ5isPHAF0xs1+748E8o4UehuMaKgjw9ChE+t
	0kgjQq6IYHywr98P6UQvkHOdGcaUjh99BokfagVyWq3IyiGnTV5fx66ELyTe8A6K4W7zZxXwBWQbU
	55DhaRgMuC+A8cIPFJVKKMrPYzh5+iUL3GRX1q3FNH4IozwRQ54HLF5vWW1T+9W+D+qULaALbUa3F
	NhE3wEs4XcEtbg6UedaqcidXhR6Eehm327fMsenvE+LWAw9pT1VWix5kv5KtsKS5v0wNXyosDzFes
	EwDR4KsmkXOsGacvEb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdNO7-006EzV-BA; Thu, 21 Oct 2021 02:00:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdNO4-006Eyu-QC
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 02:00:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 487B361186
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 02:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634781656;
 bh=CaHFHM1Qm0GitdpBwfDVW+bc24uJpevrPTy9GbSYzAs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oWRYmURS3Cw/BVj63vuUOrQ+2FAt3jPF5bPLbzfrSFUEtPq6hzlCe1JLrVGmsVSA+
 PTwUodWMmvglPiJLGZqhA/UC1w0mZ9uKzejYTfGDOOrwiHE2N3ChijXLxIFBEVmkTY
 +SzeGHD6PpZsXS+PV3O647h8tF2FdgKfKe7N2BYumsbASDE9y8IwSTOyQn4V4XC5W/
 F8RoWciFuPpplNvd11b81K1kZfso40ZuIJSumxU742D8NFzIyvgdYdb4XzIdyh2sqg
 FgEpXg/ofgdNaoVwSQTPSGskCt36lUoYJENEotJM8MBWJProE1trAoyB6pb+UnmWAB
 92stk3HbBvItA==
Received: by mail-lf1-f52.google.com with SMTP id i24so383240lfj.13
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 19:00:56 -0700 (PDT)
X-Gm-Message-State: AOAM531VgWkHFUDp10DbQcDNq4ZXd0sBAC+xFHte8aDDMoM34GvLOOGE
 DK9HWunWWQJDpQTCSorQq9bfDgiym+c3LmpbDrI=
X-Google-Smtp-Source: ABdhPJz+1T8AvkCO2dMtlMoL1VDONGi4JxVBo6oPWp6Zz2Uc/xtHSams6U3dfsy/UToUy5rLXUQEHksU5OkFxOlgdFs=
X-Received: by 2002:a19:48c9:: with SMTP id v192mr2599625lfa.269.1634781654407; 
 Wed, 20 Oct 2021 19:00:54 -0700 (PDT)
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
In-Reply-To: <871r4fd996.wl-maz@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 21 Oct 2021 10:00:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQEx9BJ6bmgrNOc9--CL3DRKBBN=1Fv_waWWmTTGj150A@mail.gmail.com>
Message-ID: <CAJF2gTQEx9BJ6bmgrNOc9--CL3DRKBBN=1Fv_waWWmTTGj150A@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Samuel Holland <samuel@sholland.org>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_190056_915956_F0C0C22D 
X-CRM114-Status: GOOD (  37.54  )
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

On Wed, Oct 20, 2021 at 11:08 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 20 Oct 2021 15:33:49 +0100,
> Anup Patel <anup@brainfault.org> wrote:
> >
> > On Wed, Oct 20, 2021 at 7:04 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Tue, 19 Oct 2021 14:27:02 +0100,
> > > Guo Ren <guoren@kernel.org> wrote:
> > > >
> > > > On Tue, Oct 19, 2021 at 6:18 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > >
> > > > > On Tue, 19 Oct 2021 10:33:49 +0100,
> > > > > Guo Ren <guoren@kernel.org> wrote:
> > > > >
> > > > > > > If you have an 'automask' behavior and yet the HW doesn't record this
> > > > > > > in a separate bit, then you need to track this by yourself in the
> > > > > > > irq_eoi() callback instead. I guess that you would skip the write to
> > > > > > > the CLAIM register in this case, though I have no idea whether this
> > > > > > > breaks
> > > > > > > the HW interrupt state or not.
> > > > > > The problem is when enable bit is 0 for that irq_number,
> > > > > > "writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM)" wouldn't affect
> > > > > > the hw state machine. Then this irq would enter in ack state and no
> > > > > > continues irqs could come in.
> > > > >
> > > > > Really? This means that you cannot mask an interrupt while it is being
> > > > > handled? How great...
> > > > If the completion ID does not match an interrupt source that is
> > > > currently enabled for the target, the completion is silently ignored.
> > > > So, C9xx completion depends on enable-bit.
> > >
> > > Is that what the PLIC spec says? Or what your implementation does? I
> > > can understand that one implementation would be broken, but if the
> > > PLIC architecture itself is broken, that's far more concerning.
> >
> > Yes, we are dealing with a broken/non-compliant PLIC
> > implementation.
> >
> > The RISC-V PLIC spec defines a very different behaviour for the
> > interrupt claim (i.e. readl(claim)) and interrupt completion (i.e.
> > writel(claim)). The T-HEAD PLIC implementation does things
> > different from what the RISC-V PLIC spec says because it will
> > mask an interrupt upon interrupt claim whereas PLIC spec says
> > it should only clear the interrupt pending bit (not mask the interrupt).
> >
> > Quoting interrupt claim process (chapter 9) from PLIC spec:
> > "The PLIC can perform an interrupt claim by reading the claim/complete
> > register, which returns the ID of the highest priority pending interrupt or
> > zero if there is no pending interrupt. A successful claim will also atomically
> > clear the corresponding pending bit on the interrupt source."
> >
> > Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
>
> That's not the point I'm making. According to Guo, the PLIC (any
> implementation of it) will ignore a write to claim on a masked
> interrupt.
>
> If that's indeed correct, then a sequence such as:
>
> (1) irq = read(claim)
> (2) mask from the interrupt handler with the right flags so that it
> isn't done lazily
> (3) write(irq, claim)

How about letting the IRQ chip change?

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index a98bcfc4be7b..ed6ace1058ac 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -444,10 +444,10 @@ void unmask_threaded_irq(struct irq_desc *desc)
 {
        struct irq_chip *chip = desc->irq_data.chip;

+       unmask_irq(desc);
+
        if (chip->flags & IRQCHIP_EOI_THREADED)
                chip->irq_eoi(&desc->irq_data);
-
-       unmask_irq(desc);
 }

 /*
@@ -673,8 +673,8 @@ static void cond_unmask_eoi_irq(struct irq_desc
*desc, struct irq_chip *chip)
         */
        if (!irqd_irq_disabled(&desc->irq_data) &&
            irqd_irq_masked(&desc->irq_data) && !desc->threads_oneshot) {
-               chip->irq_eoi(&desc->irq_data);
                unmask_irq(desc);
+               chip->irq_eoi(&desc->irq_data);
        } else if (!(chip->flags & IRQCHIP_EOI_THREADED)) {
                chip->irq_eoi(&desc->irq_data);
        }

>
> will result in an interrupt blocked in ack state (and probably no more
> interrupt for this CPU at this priority). That would be an interesting
> bug in the current code, but also a pretty bad architectural choice.
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
