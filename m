Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F553C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 13:27:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFA0F61374
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 13:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFA0F61374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tk75mCapAULu9GHszhW+MiLIsc9gTzDXZQNlgJDYLpI=; b=w5SjRfIzDqV4Nq
	OevuBtmpIzmexz/nGo/TgIYm1d82DRtlodpy7NotrtHqYxX2nxz1mPc4a5PBj1BwCMmLWn6FrmfbC
	7jJGH0WZgEIcRb3X9yC1Hmm38WX50K5JqrWcfhmoBl7trvrws+CkcjJiKKgutvRxvOBIssKLWWuyQ
	ilDKcyAmvyi5yPDZs+SsicQM956WKUB52vosOqAzT0ZKSi2WSrRbYYoS7ZSjXABdAvhq5heyXzqYO
	C9KUOJ0QDfi/sCH0+T4AJXYFVWajqKV6g/aF5HEjNwDP4+HXsW04E6rT7268P4BeZFFOZO0Mqt/G9
	prc4Qu8xcy+7ZMF57LBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcp9U-001Q37-17; Tue, 19 Oct 2021 13:27:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcp98-001PyM-Gf
 for linux-riscv@lists.infradead.org; Tue, 19 Oct 2021 13:27:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11FD661374
 for <linux-riscv@lists.infradead.org>; Tue, 19 Oct 2021 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634650034;
 bh=XwT+O/puqIO9BVfJ+yLseMkazHGtskDQhP43nI3oppI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CEfX81BfCRk2mEwUgwZbVCdkLh9u7Ef0w0Pc8fcOmUzsWgiaUWT16G26XXz2JoFeS
 GY0my/BtI2nl/OeTlf/yC82pAfK5m/OvihOcjxc44jhYsyY/OoUQldMSg0ygo/1DGu
 AUViooEqtFueY88yOpVH4r/dBhQatnV45M7TagJsmzIM3H1z7Gr1XvWc+OtyTpo81O
 wRu9D4YN6yfsC6jgSkP9zu9MIVjN44UooFwYSpia0nJIr6L0ND/V85P7R/0oMmW3hk
 2DseVbsVxLL3fEq+HMoh2tiEY8L0R01aw6Xobmo8tVEU1yAY8ozP9pbNtwVpEo9O2p
 BxkSCmXVVI76w==
Received: by mail-ua1-f51.google.com with SMTP id j8so6126975uak.9
 for <linux-riscv@lists.infradead.org>; Tue, 19 Oct 2021 06:27:14 -0700 (PDT)
X-Gm-Message-State: AOAM533djFSCEAsKF0Ki4E9DzsVbeRt0g6vd0PzgCALZKeMkR+irpFFD
 JNSZHLabF53wBh7W+RHzrhsH2Wm9GhfkGrp1JkA=
X-Google-Smtp-Source: ABdhPJxZ8MT65UmaNvlpDO/eGxDHT6mlb1Hzhjau2Hlwa4n/GLInYBXxt7YnLmtajfjpmoL7vYq4xsEJzzSBRPB8hKY=
X-Received: by 2002:a05:6102:537:: with SMTP id
 m23mr34557525vsa.43.1634650033178; 
 Tue, 19 Oct 2021 06:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
 <f850af365f2ac77af79ec59f92e6434a@kernel.org>
 <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
 <8735oxuxlq.wl-maz@kernel.org>
In-Reply-To: <8735oxuxlq.wl-maz@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 19 Oct 2021 21:27:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSmyu9nA5M3QLeR1LdGMkeGb7jE93Z9zjixcpb_freLMw@mail.gmail.com>
Message-ID: <CAJF2gTSmyu9nA5M3QLeR1LdGMkeGb7jE93Z9zjixcpb_freLMw@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
To: Marc Zyngier <maz@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_062714_625252_6C78CA31 
X-CRM114-Status: GOOD (  25.81  )
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

On Tue, Oct 19, 2021 at 6:18 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 19 Oct 2021 10:33:49 +0100,
> Guo Ren <guoren@kernel.org> wrote:
>
> > > If you have an 'automask' behavior and yet the HW doesn't record this
> > > in a separate bit, then you need to track this by yourself in the
> > > irq_eoi() callback instead. I guess that you would skip the write to
> > > the CLAIM register in this case, though I have no idea whether this
> > > breaks
> > > the HW interrupt state or not.
> > The problem is when enable bit is 0 for that irq_number,
> > "writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM)" wouldn't affect
> > the hw state machine. Then this irq would enter in ack state and no
> > continues irqs could come in.
>
> Really? This means that you cannot mask an interrupt while it is being
> handled? How great...
If the completion ID does not match an interrupt source that is
currently enabled for the target, the completion is silently ignored.
So, C9xx completion depends on enable-bit.

>
> > >
> > > There is an example of this in the Apple AIC driver.
> > Thx for the tip, I think your suggestion is:
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -163,7 +163,12 @@ static void plic_irq_eoi(struct irq_data *d)
> >  {
> >         struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> >
> > -       writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > +       if (irqd_irq_masked(d)) {
> > +               plic_irq_unmask(d);
> > +               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > +               plic_irq_mask(d);
>
> This looks pretty dodgy. You are relying on interrupts being globally
> masked on the CPU, I guess. It probably works today, but man, what a
> terrible HW implementation.



>
> You'll definitely have to move this into a c900-specific callback.
Yes, it's an errata.

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
