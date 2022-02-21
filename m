Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D83BC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSls2ubuUkAixD3wbN731SrxlsbLLTKDF4LS8P5M2TI=; b=qqrgWSjMeCWs1n
	zsLZYd+/bCAGm+Gyi/EekzD5vYLBxeqVzmE0akaUJP/l2XMYx1XMKWuNgyN1TLssi53swVwuRYQzI
	ERwb1eL9f0kRElG7gfcXGu1bfQVDDapdXYf31GEFTWdGWCukeQStzOUapaX6/Sf3QVjnX+Z/1QD5j
	RmoN8GG/WpfIcMVOQIl8gKDY52vnxgIeKBoDXoreYxS9Pqse1ilB2XxKgB0CV1pmmlR8At6FnCjEF
	Th6b03q3SzPWMQZ705N186d8EDpJPTghcNht82peNL3N8G5wyMY5JZ/Vwg1XYJUzqzqdNtueOtvjN
	RFOP5a6VJgkGvdfZtBiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM606-004yOw-1o; Mon, 21 Feb 2022 10:33:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5Pb-004hky-5v
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 09:55:20 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso10777353wmb.4
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 01:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=upbkN/V8cp2KI0ahaTu8tBZWU9b/chtGV7DC+f35CdY=;
 b=GS//m974QckaF3Of/zXAd7JQULr/ML9YdasdWH0NaXtNDJnOHKV2SXZYVG4M19tHOq
 hJmUX36bWgLhI8JvKY2PlIHM4uLDxh8yTN6amnE1lKQGvuGhlHdEyRpqjE6hsa+v3W2u
 TZakdaGd2vNZObRxQactg7oTZL+8n5Q4bbi+EzGBsBCgUBzboNsdJEP9OEojl0qsSsMB
 xcR2OnKNudh8FouXOjafeb61zW/AvHgnN6Wgs8dVb/SNBVNfj8/2daP4VqCCSQg9BzIe
 nJtVYrKxlZZY2oieZrGD2QQL8iIslsrMKHSRiBbzcveg4r/tTZK1IDrSZgu+8Hv2hmJV
 cfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=upbkN/V8cp2KI0ahaTu8tBZWU9b/chtGV7DC+f35CdY=;
 b=ifjhxx+BDyecdjMuz9NQ1lcbvBuwzYV9PGr9d+6a6LPr4elWooYu3eDpEEvxmpoEFN
 bXjtRqIVjW1PCC0D4FpTTVdfkl9kfyROJBMBwgYuoQKcTmTLSRsiNnbAPDM+EYktRy+i
 55/YPiVG5U7qzQYvqRhh1eEQYzYFVk9V2i5tLL5oktl8++DQ6aIGblA2KS+ILEYrmSAl
 LF6EQkewrm14DNxLg1ch02Ku5F8nD1EFi6k4LKJmYEg7rwgIw9BikFvxf2NJ3qbGGMXI
 5pG7QPHroK0DqXHGvHqxR/Y+48P+hcB3DP6rcxDwAECkezUZZIF95zpWXPNu8Rv4YSQl
 MZWg==
X-Gm-Message-State: AOAM530l5dOHPaIrXQ/baV+aobnVlWo5dI7G5K4Rj/7vz/q5I6mlCw5E
 3Okgz7/FrrkAlOE+WmvZ4KQHg2Avh+rQ+wfnurfRUA==
X-Google-Smtp-Source: ABdhPJyhZ16CI2TVFHhpSM7/eyLn3311gs2ig6GHEaHjYfa4Ne4UfzHF2h4fbFKVn1hsN8j+ljYfCQ9qjGGmxjJpf14=
X-Received: by 2002:a7b:cf16:0:b0:37b:c4c9:96c6 with SMTP id
 l22-20020a7bcf16000000b0037bc4c996c6mr17352485wmg.59.1645437316963; Mon, 21
 Feb 2022 01:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20220220050854.743420-1-apatel@ventanamicro.com>
 <20220220050854.743420-3-apatel@ventanamicro.com>
 <87czjg4kf4.wl-maz@kernel.org>
In-Reply-To: <87czjg4kf4.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Feb 2022 15:25:05 +0530
Message-ID: <CAAhSdy2abxjz2GAF7dTbxDa32244wEJeYBCeuY2Ag84HK_FXow@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220221_015519_300698_68E38765 
X-CRM114-Status: GOOD (  26.61  )
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

Okay, I will drop the EXPORT() from here.

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

We are registering this callback after creating the INTC domain.

>
> And you have totally ignored my previous comments about the multitude
> of irq domains for the INTC. Either you get rid of all but one and you
> can register a single fwnode, or you stay with what you have today,

Only the INTC DT nodes are per-CPU but we are creating only one
INTC domain to manage per-CPU IRQs across all CPUs.

Regards,
Anup

>
> You can't have it both ways.
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
