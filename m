Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D854C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 11:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knE7zy9NADn6eIm8dqlIZ7iwQSKRdl7vK6gsouWllCg=; b=Xzvecg/rrQDAP/
	ERHYDwnhJ+cCUN7G3dvXTiYcX6v7L3ZAbvZxGIv0MVxPPdP4HIhdwPIUpfpxw6x0LAhEzE3QqFWqa
	C3Mt/ukQwtamF0TqdsGVeB/eMM6pUSCDuA6hj1HTzrHAqmwCF+dcQe87z7pUuND+bbvRfbuGuxjd8
	cUkXzDUPMua480uyS4R605zKxTGz7Y8G9pImoSyNydlOck+HZ6HIbazfGcTD08FFaEkSkgBYcUkT8
	lAROE2Fo+jtvL32uakpAa6hwhbS53+8AJV4cYCtrpwGB7ZzHgI6EAxp/xlMfRvoaPRwHWcNXQEfo6
	QjrI9HgYv6QksAtt51Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nexfS-005Hi8-Bt; Thu, 14 Apr 2022 11:29:42 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nexfP-005Hhn-1G
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 11:29:40 +0000
Received: by mail-lf1-x12c.google.com with SMTP id w19so8504153lfu.11
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26C6jzBDYX2KyIOZi1XWpKUSUT0DJxPrIpF38ct4maw=;
 b=jx2lf6rqh2orVVm6dXJqh1Fy07Tj7XpxI5Q8zXThz/AOcwEUFDIkS2sdUN/0KOyYyx
 vZAMxVXGbnunwf2cV4FLFjo9wwfwxqceyV1dNega39scX2rgA8V4CRi9v2FqCuiScLw1
 Sa+K/XAGguCNRLCI9Q9duMIJ8zIzUW7bHjDarvo7z3vZiNyWlVUjMOo0ciEbtr/vKHRP
 UH00UXWhLgjTwx55Jdjsw+r4DwERFKAm4uIAWUKH0j1lVvgepsmDGGniYU1JLVqogBXq
 RlzgxzXN3rqM1E+rK5ouCOZJzgUb6jtIxCoMX7Jy3BYWLZXRBkNoZk+CTfHK0pumtOAy
 02EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26C6jzBDYX2KyIOZi1XWpKUSUT0DJxPrIpF38ct4maw=;
 b=YBLYTXGRKWtAjWfVJwpXaydu7IqbREQnqNmGDpGJ9uiR8QWsk1H0wS1hLbZ4hrgKnB
 /7sPMoQcyvbyfOp6CzNy4VtjgSVEgZJMuryVFRa6UBlCGf0ivq0CqMXE/wV7lgU39eSe
 LKDyuw+R4O6VxfVwRY8LaTojHe+1Y21aR79N2NeObPuEfQdDE7sWJ2/BNyJ6Tg/HVu5N
 mQclveC/OvqypNhpJVZimeyZEOcrI2LrMsp3tQkeJB92nWE0FuOZDoMT0LYMfo30coYg
 3OhKlWgCn8t+wChUVo2gn24DqaIQkm0LHELxGLSt5u59BURvFNK66IXUqSDjunbTQkPf
 kGmQ==
X-Gm-Message-State: AOAM530le2Xn9wIRdU+nW2aITaopU4ThPiiRYeUZRFdi2sBt8ANNtVZ9
 BgNurWqtPsLz7KGatJpLWlYFGkmqru6ssA8sZR2GVg==
X-Google-Smtp-Source: ABdhPJwPIlW+R3o4NoaHaJiP89d722aO4MZ+lVB8Qsnrw1e/3rPtlMAL2q06QKcncaULITYYYylhUo0zworFbdmh7GU=
X-Received: by 2002:a19:6b13:0:b0:46b:b970:5792 with SMTP id
 d19-20020a196b13000000b0046bb9705792mr1706263lfa.100.1649935775390; Thu, 14
 Apr 2022 04:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220324151258.943896-1-apatel@ventanamicro.com>
 <20220324151258.943896-4-apatel@ventanamicro.com> <87a6cshf6y.ffs@tglx>
In-Reply-To: <87a6cshf6y.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 14 Apr 2022 16:59:23 +0530
Message-ID: <CAK9=C2VFZWQiiMRDZLcP3tQHM_kyhGBBvH6ej1MTGKRTK29mgw@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] genirq: Add mechanism to multiplex a single HW IPI
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Anup Patel <anup@brainfault.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_042939_127013_2B4FDDCD 
X-CRM114-Status: GOOD (  44.81  )
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

On Mon, Apr 11, 2022 at 1:41 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Anup,
>
> On Thu, Mar 24 2022 at 20:42, Anup Patel wrote:
> > All RISC-V platforms have a single HW IPI provided by the INTC local
> > interrupt controller. The HW method to trigger INTC IPI can be through
> > external irqchip (e.g. RISC-V AIA), through platform specific device
> > (e.g. SiFive CLINT timer), or through firmware (e.g. SBI IPI call).
> >
> > To support multiple IPIs on RISC-V, we need a generic mechanism to
> > create multiple per-CPU vIRQs using a single HW IPI hence this patch.
>
> git grep 'This patch' Documentation/process

Okay, I will update the commit description as-per Documentation.

>
> > The generic IPI multiplex mechanism added by this patch can also be
> > useful to other architectures.
>
> Which ones? Sane architectures have more than one IPI.

Currently, the IPI muxing is shared code for various RISC-V drivers
(such as CLINT driver, SBI IPI irqchip driver, and AIA (coming soon)).

Overall, the IPI muxing seems independent of RISC-V so maybe
it is useful to have it as common selectable API.

>
> > diff --git a/include/linux/irq.h b/include/linux/irq.h
> > index 848e1e12c5c6..cdce7eae2f37 100644
> > --- a/include/linux/irq.h
> > +++ b/include/linux/irq.h
> > @@ -1248,6 +1248,34 @@ int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
> >  int ipi_send_single(unsigned int virq, unsigned int cpu);
> >  int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
> >
> > +#define IPI_MUX_NR_IRQS              BITS_PER_LONG
> > +struct ipi_mux_ops {
>
> This is unreadable. Newlines exist for a reason.

Okay, I will add a newline above the struct.

>
> > +     void (*ipi_mux_clear)(unsigned int parent_virq);
> > +     void (*ipi_mux_send)(unsigned int parent_virq,
> > +                          const struct cpumask *mask);
> > +};
> > +
> > +/* Process multiplexed IPIs */
> > +void ipi_mux_process(void);
> > +
> > +/*
> > + * Create multiple IPIs (total IPI_MUX_NR_IRQS) multiplexed on top of a
> > + * single parent IPI.
> > + *
> > + * If the parent IPI > 0 then ipi_mux_process() will be automatically
> > + * called via chained handler.
> > + *
> > + * If the parent IPI <= 0 then it is responsiblity of irqchip drivers
> > + * to explicitly call ipi_mux_process() for processing muxed
> > + * IPIs.
> > + *
> > + * Returns first virq of the muxed IPIs upon success or <=0 upon failure
> > + */
> > +int ipi_mux_create(unsigned int parent_virq, const struct ipi_mux_ops *ops);
>
> While it is kinda sensible to have the documentation near the
> declaration, I prefer it to be near the code because thats where it
> matters and also has a higher chance to be updated when the code
> changes.

Okay, I will move documentation near the code.

>
> Please use proper kernel doc while at it.

Sure, I will update.

>
> > +static unsigned int ipi_mux_parent_virq;
> > +static struct irq_domain *ipi_mux_domain;
> > +static const struct  ipi_mux_ops *ipi_mux_ops;
> > +static DEFINE_PER_CPU(unsigned long, ipi_mux_bits);
> > +
> > +static void ipi_mux_dummy(struct irq_data *d)
> > +{
> > +}
> > +
> > +static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
> > +{
> > +     int cpu;
> > +
> > +     /* Barrier before doing atomic bit update to IPI bits */
> > +     smp_mb__before_atomic();
> > +
> > +     for_each_cpu(cpu, mask)
> > +             set_bit(d->hwirq, per_cpu_ptr(&ipi_mux_bits, cpu));
> > +
> > +     /* Barrier after doing atomic bit update to IPI bits */
> > +     smp_mb__after_atomic();
> > +
> > +     /* Trigger the parent IPI */
> > +     ipi_mux_ops->ipi_mux_send(ipi_mux_parent_virq, mask);
> > +}
> > +
> > +static struct irq_chip ipi_mux_chip = {
> > +     .name           = "RISC-V IPI Mux",
>
> RISC-V IPI Mux is a truly generic name :)

Aargh, I forgot to remove "RISC-V" from the name here. I will update.

>
> > +     .irq_mask       = ipi_mux_dummy,
> > +     .irq_unmask     = ipi_mux_dummy,
> > +     .ipi_send_mask  = ipi_mux_send_mask,
> > +};
> > +
> > +static int ipi_mux_domain_map(struct irq_domain *d, unsigned int irq,
> > +                           irq_hw_number_t hwirq)
> > +{
> > +     irq_set_percpu_devid(irq);
> > +     irq_domain_set_info(d, irq, hwirq, &ipi_mux_chip, d->host_data,
> > +                         handle_percpu_devid_irq, NULL, NULL);
> > +
> > +     return 0;
> > +}
> > +
> > +static int ipi_mux_domain_alloc(struct irq_domain *d, unsigned int virq,
> > +                             unsigned int nr_irqs, void *arg)
> > +{
> > +     int i, ret;
> > +     irq_hw_number_t hwirq;
> > +     unsigned int type = IRQ_TYPE_NONE;
> > +     struct irq_fwspec *fwspec = arg;
>
>   Documentation/process/maintainer-tip.rst #coding-style-notes

Okay, I will refer and update.

>
> > +     ret = irq_domain_translate_onecell(d, fwspec, &hwirq, &type);
> > +     if (ret)
> > +             return ret;
> > +
> > +     for (i = 0; i < nr_irqs; i++) {
> > +             ret = ipi_mux_domain_map(d, virq + i, hwirq + i);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct irq_domain_ops ipi_mux_domain_ops = {
> > +     .translate      = irq_domain_translate_onecell,
> > +     .alloc          = ipi_mux_domain_alloc,
> > +     .free           = irq_domain_free_irqs_top,
> > +};
> > +
> > +void ipi_mux_process(void)
> > +{
> > +     int err;
> > +     unsigned long irqs, *bits = this_cpu_ptr(&ipi_mux_bits);
> > +     irq_hw_number_t hwirq;
> > +
> > +     while (true) {
> > +             /* Clear the parent IPI */
> > +             ipi_mux_ops->ipi_mux_clear(ipi_mux_parent_virq);
>
> This being in a loop smells fishy at least without a comment. And the
> more I read all of this the less I'm convinced that this code can be
> used by anything else than RISCV.

The original IPI muxing code in RISC-V had this loop so I did not
remove it.

Actually, the loop is redundant because if a CPU gets another IPI
while it was in ipi_mux_process() then another interrupt will be taken
and ipi_mux_process() will be called again. I test more and remove
this loop.

>
> > +             /* Order bit clearing and data access. */
> > +             mb();
>
> This mb() pairs with what? Memory barriers have a counterpart and it's
> mandatory to document that in the comment.

It pairs with barriers in ipi_mux_send_mask(). I will update the comment.

>
> > +             irqs = xchg(bits, 0);
> > +             if (!irqs)
> > +                     break;
> > +
> > +             for_each_set_bit(hwirq, &irqs, IPI_MUX_NR_IRQS) {
> > +                     err = generic_handle_domain_irq(ipi_mux_domain,
> > +                                                     hwirq);
> > +                     if (unlikely(err))
> > +                             pr_warn_ratelimited(
> > +                                     "can't find mapping for hwirq %lu\n",
> > +                                     hwirq);
> > +             }
> > +     }
> > +}
> > +
> > +
> > +void ipi_mux_destroy(void)
>
> Seriously? You provide a function to rip the IPI mechanism out in a
> running system? What's that for?
>
> > +{
> > +     if (!ipi_mux_domain)
> > +             return;
> > +
> > +     irq_domain_remove(ipi_mux_domain);
> > +     ipi_mux_domain = NULL;
> > +     ipi_mux_parent_virq = 0;
>
> If it would be useful, then this would leak the hotplug callbacks, but
> the good news is that after tearing down the IPI domain hotplug does not
> work anymore :)

The only use of this function was to clean up in-case the irqchip
driver failed after creating mux.

I will certainly remove this function in the next patch revision.

>
> Thanks,
>
>         tglx

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
