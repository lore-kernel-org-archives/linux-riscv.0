Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A5EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 10:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXyFtISJ+/AAfsmfsd2swXBAF46poVpOByahAuwc8U8=; b=isi3IV5NHA7zjF
	eIzBlPfOWZX+1BEdeXcarnwz95ytUtwwssmjDhKv8lc4hCNO3HPvJFGDG7GK+IKxPIPsHujQv8o7O
	gpORhzIXr1EdgqnP3gGzrY6b/4uYtK95bGimhf3FutfFw1nRbf1iFNzw8MWYdpbSodZynCnsLwrUo
	goJ/tCLpMKWQd+8HSINBMjmPeLzr8o8aLA9HeW31bj3L1qyJzSdJB0etsFGYNTRuGy8fNOvEv7Lvn
	euRVOWj7iiTldsu+LL0C2Ir9fwmdsj7kJPUhfxsUPXd0U5WIjDuealsTOxmAaxJcgBpAApq+Tlwa8
	lpYWjqcAtabW4gFwJb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM6Ak-0053XJ-65; Mon, 21 Feb 2022 10:44:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5V5-004jqx-KM
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 10:01:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id p9so26013805wra.12
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 02:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7npSal4SAMLSZn16NnNEeHrBcHYcH9kBYIO1Ec8tAsc=;
 b=DRpO3yTE0tJVGaIevyQWmDT4RQw4sj581lnPgma9i9lP1rhY61Bq1uu/GvtgnD3uV7
 gIrwWki58uWVDY2GZ+5DlmBI7oqhldUaH+45qGF1HZZ1oLWNsLSFeoh3YsYnNHySFt9Y
 fBoBdQF5sMvBRH0jZoE5mCS5Fwd1kISVZAFaYFNAtXZXvVdzne2RoiNXh1my7ulWKySy
 wzLdcSVXjb0jU4+vCsciegp3jmfXInwK/FY5HHbt7mYZcoZeg2vqRTffm5XjM9RLpsUv
 vyBrQq9XwoOsptZ7IZrTTrW0SIflvV21Y+LFjiSBJEGkakiWaLNWjaqEQ8+Q0xUqiNZ5
 ryZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7npSal4SAMLSZn16NnNEeHrBcHYcH9kBYIO1Ec8tAsc=;
 b=ozG+a7YeRmWFUEIxD8ivxZHtLZEAx/R1PAb+RYitPGbJ8T10y6QJJHOkc23GKIgARj
 5QDlRdwKXlrE10OG/qRtwiTF4dSgNZIVSFNiQVkADTFo/yPmrcfFqFPeYszngP6A2Ebe
 aoRldOrh8FJwmPJL1HXr4c2jvcKiPnQilOC10NS3PrmNujfsePL3orU7SVlENb+6Wmmr
 EMRAWkxdv8ZedCXgc7rjD40TB25A7pP8a1HUM+QzmlMoI+bYraA8M5DjbG1HN+ZV7X/9
 hTf3BEWn4OK6A8vIBj1Fg6xykw70imHVsGMzfQO84bMlPkAYukoYiVXaAB2p6c0GOvE+
 z/5A==
X-Gm-Message-State: AOAM530UQwr4RX7rKKCvWsKCwjkBmk4/U9OP3U4mrQA6Wu23pBeB1YBi
 gHWhodnzyVXn4PU7C/fjaOXZ7J6TmIhFyF+styNc1w==
X-Google-Smtp-Source: ABdhPJyirlkP3M5wFmhNEqfDBiCxvzzJb4WX23P3G7dkN1Z8LtUASSB2cPoUO5TP0OREOq8+oImfrKDuUqpRPFnu/s4=
X-Received: by 2002:a5d:6507:0:b0:1e5:eb6d:a851 with SMTP id
 x7-20020a5d6507000000b001e5eb6da851mr15148810wru.313.1645437656564; Mon, 21
 Feb 2022 02:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20220220050854.743420-1-apatel@ventanamicro.com>
 <20220220050854.743420-3-apatel@ventanamicro.com>
 <87czjg4kf4.wl-maz@kernel.org>
In-Reply-To: <87czjg4kf4.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Feb 2022 15:30:44 +0530
Message-ID: <CAAhSdy1nKMySggjH83JBEDxiFnfFY46DdYyGH=ib1b0D6Qn7jg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] irqchip/riscv-intc: Allow drivers to directly
 discover INTC hwnode
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_020059_718482_CCFE9CF1 
X-CRM114-Status: GOOD (  27.78  )
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

On Mon, Feb 21, 2022 at 3:21 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sun, 20 Feb 2022 05:08:50 +0000,
> Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > Various RISC-V drivers (such as SBI IPI, SBI Timer, SBI PMU, and
> > KVM RISC-V) don't have associated DT node but these drivers need
> > standard per-CPU (local) interrupts defined by the RISC-V privileged
> > specification.
> >
> > We add riscv_get_intc_hwnode() in arch/riscv which allows RISC-V
> > drivers not having DT node to discover INTC hwnode which in-turn
> > helps these drivers to map per-CPU (local) interrupts provided
> > by the INTC driver.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/irq.h     |  4 ++++
> >  arch/riscv/kernel/irq.c          | 19 +++++++++++++++++++
> >  drivers/irqchip/irq-riscv-intc.c |  7 +++++++
> >  3 files changed, 30 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
> > index e4c435509983..43b9ebfbd943 100644
> > --- a/arch/riscv/include/asm/irq.h
> > +++ b/arch/riscv/include/asm/irq.h
> > @@ -12,6 +12,10 @@
> >
> >  #include <asm-generic/irq.h>
> >
> > +void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
> > +
> > +struct fwnode_handle *riscv_get_intc_hwnode(void);
> > +
> >  extern void __init init_IRQ(void);
> >
> >  #endif /* _ASM_RISCV_IRQ_H */
> > diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> > index 7207fa08d78f..ead92432df8c 100644
> > --- a/arch/riscv/kernel/irq.c
> > +++ b/arch/riscv/kernel/irq.c
> > @@ -7,9 +7,28 @@
> >
> >  #include <linux/interrupt.h>
> >  #include <linux/irqchip.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/module.h>
> >  #include <linux/seq_file.h>
> >  #include <asm/smp.h>
> >
> > +static struct fwnode_handle *(*__get_intc_node)(void);
> > +
> > +void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void))
> > +{
> > +     __get_intc_node = fn;
> > +}
> > +EXPORT_SYMBOL_GPL(riscv_set_intc_hwnode_fn);
>
> We're talking about the root interrupt controller here. How can this
> ever be implemented as a module?
>
> > +
> > +struct fwnode_handle *riscv_get_intc_hwnode(void)
> > +{
> > +     if (__get_intc_node)
> > +             return __get_intc_node();
> > +
> > +     return NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(riscv_get_intc_hwnode);
> > +
> >  int arch_show_interrupts(struct seq_file *p, int prec)
> >  {
> >       show_ipi_stats(p, prec);
> > diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> > index b65bd8878d4f..fa24ecd01d39 100644
> > --- a/drivers/irqchip/irq-riscv-intc.c
> > +++ b/drivers/irqchip/irq-riscv-intc.c
> > @@ -92,6 +92,11 @@ static const struct irq_domain_ops riscv_intc_domain_ops = {
> >       .xlate  = irq_domain_xlate_onecell,
> >  };
> >
> > +static struct fwnode_handle *riscv_intc_hwnode(void)
> > +{
> > +     return (intc_domain) ? intc_domain->fwnode : NULL;
> > +}
>
> This makes no sense. Either you have found the interrupt controller
> and allocated the domain, or you haven't. But you don't register a
> callback without having found it.

Okay, I will drop the check on intc_domain since we are registering
callback after creating a single INTC domain common for all CPUs.

>
> And you have totally ignored my previous comments about the multitude
> of irq domains for the INTC. Either you get rid of all but one and you
> can register a single fwnode, or you stay with what you have today,
>
> You can't have it both ways.
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
