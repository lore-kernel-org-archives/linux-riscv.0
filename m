Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F035EC47088
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YuJpDNQlP1J8+gkJo6o69GEzla+E63tILxWyH+dbtVE=; b=B1Fp0RyiIXWAYw
	YwWHYU6Y2CNnEji3sepotzKyR3i3EohYFm7wOsbVseSxXi9d2f6lrJCe8qethtACFT/xeri/dCQpN
	pfgAry+YsH9bw7XzN3Hnj0j/VHIRPg7Fl/lpkuSnNvSIbVqr5vej8ID4wVeGIYR/IVmpefKHzcYEd
	F2CDL+6qZjkZx3/wy8AQxZEd+R85DV806kkfpcP9crXU0jPiqN4JXntZ04zKn/xvIfbKlArtuSwLX
	zzLZjSGy7BG/LOk3l336AkHAGWswbm/yWItSHIvHZOw784XbdWDGDKdOHv3akwc0DJHJZK0ZqKLIG
	9Tn10WqTceFjL0u0mvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nuq-009QKm-Ah; Thu, 01 Dec 2022 18:04:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nrR-009NQI-Ev
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 18:00:39 +0000
Received: by mail-pl1-x629.google.com with SMTP id s7so2368379plk.5
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 10:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3l6W+4wCOmk5H2E5YROhRyJHHJ2tANXndiSfYTNLKA=;
        b=LPbxOfrTB9fyfIBLwI9GmIvloOZLwzc5XO84esfl6QNOQpq/PxRAl5rm+Ti+T4Q37d
         lCWp0inv5wIvqXwglrX83PfpZ3Q0ervr4AYgeL+m50dwe1upazuVZ3UZNSOlMqAd8B6a
         YGPZ13wOq1yWRIEtEACOhp6H5Pl/6toNQPbGKRqIBqAfyk3cIPBW9tMcAmZH+UTd24+a
         pkgAGzBKLl+cYt2y0/0DdCj8uHx4sY7xGALTKdDIHFKzVWhn61BRBGwIVZ5atvJGHQO6
         rSyUjMgbHcmt/ryyQnEmWAqXWOBallk8rs2b9fyQ/qQ34uOkW32no9fiikFXVx7nX37l
         Sy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3l6W+4wCOmk5H2E5YROhRyJHHJ2tANXndiSfYTNLKA=;
        b=q8Kj+Sc96qUtG4yOfFqTa9d2ZopTqMSlaoZakt3SdyrT/tAJR4VLGuOnQJpm1ktgWw
         vZohsKQ/xZhBEYngmNMf9oD+Xq/XydEKWXr0uBK28CfzjukoqN9FeRFAd39b0g+kzi7s
         M94VXQ2vrzAkgw33uMlcbMMv5WDIDQy+V3mHEnrjJ+qhjJ+dIUk7ijSWVxg6l5Ny8gO4
         FsyaNHO+ku6PMCRmKUjsldS8m60Y4SinQN3Qm4NLNNQbmg3XPQKZQWznyQomelT68E+6
         l6IHHzpRKW2UNcIDjBeNm9+BljVvESTH2ze/txrCe18+CBn27e3ru4ESj89PpFT7POCc
         nlvw==
X-Gm-Message-State: ANoB5pl7Xs3i3aX+W2j9jtpUCbm8U/EGr/WY9k+x7NIMt+vH7OYQnmkm
	Q9MbKXIlzaQ2hwLk0sK1Y51HGLLf/zCQmeSpC80ulA==
X-Google-Smtp-Source: AA0mqf6y+U57HPHVdgjCnjJZA/z4cEc+sR5khbPriXkILN5I/gE93IstCZWbONlRJ/Bn8v5oma0tfOOfXJtAqtxlqDU=
X-Received: by 2002:a17:90a:df0e:b0:20b:22fb:2ef with SMTP id
 gp14-20020a17090adf0e00b0020b22fb02efmr78225062pjb.158.1669917631940; Thu, 01
 Dec 2022 10:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20221201130135.1115380-1-apatel@ventanamicro.com>
 <20221201130135.1115380-4-apatel@ventanamicro.com> <87v8mvqbvq.ffs@tglx>
In-Reply-To: <87v8mvqbvq.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 1 Dec 2022 23:30:20 +0530
Message-ID: <CAK9=C2WN57hHUz=3SDruyWPdAobn+QP8uGwugjPAobeFG7dBkw@mail.gmail.com>
Subject: Re: [PATCH v14 3/8] genirq: Add mechanism to multiplex a single HW IPI
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_100037_559416_8B9A7CB3 
X-CRM114-Status: GOOD (  30.44  )
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

On Thu, Dec 1, 2022 at 10:50 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Thu, Dec 01 2022 at 18:31, Anup Patel wrote:
> > All RISC-V platforms have a single HW IPI provided by the INTC local
> > interrupt controller. The HW method to trigger INTC IPI can be through
> > external irqchip (e.g. RISC-V AIA), through platform specific device
> > (e.g. SiFive CLINT timer), or through firmware (e.g. SBI IPI call).
> >
> > To support multiple IPIs on RISC-V, we add a generic IPI multiplexing
>
> s/we//

Okay, I will update.

>
> > mechanism which help us create multiple virtual IPIs using a single
> > HW IPI. This generic IPI multiplexing is inspired from the Apple AIC
>
> s/from/by/

Okay, I will update.

>
> > irqchip driver and it is shared by various RISC-V irqchip drivers.
>
> Sure, but now we have two copies of this. One in the Apple AIC and one
> here. The obvious thing to do is:
>
>    1) Provide generic infrastructure
>
>    2) Convert AIC to use it

Mark Z already has a converted version of AIC driver.
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/ipi-mux

>
>    3) Add RISCV users

The PATCH4 of this series converts the two existing
RISC-V users (SBI IPI and CLINT).

We also have a RISC-V AIA series (posted recently) which
uses the IPI muxing added by this series.

>
> No?
>
> > +static void ipi_mux_mask(struct irq_data *d)
> > +{
> > +     struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
> > +
> > +     atomic_andnot(BIT(irqd_to_hwirq(d)), &icpu->enable);
> > +}
> > +
> > +static void ipi_mux_unmask(struct irq_data *d)
> > +{
> > +     u32 ibit = BIT(irqd_to_hwirq(d));
> > +     struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
>
> The AIC code got the variable ordering correct ...
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

Okay, I will update.

>
> > +     atomic_or(ibit, &icpu->enable);
> > +
> > +     /*
> > +      * The atomic_or() above must complete before the atomic_read()
> > +      * below to avoid racing ipi_mux_send_mask().
> > +      */
> > +     smp_mb__after_atomic();
> > +
> > +     /* If a pending IPI was unmasked, raise a parent IPI immediately. */
> > +     if (atomic_read(&icpu->bits) & ibit)
> > +             ipi_mux_send(smp_processor_id());
> > +}
> > +
> > +static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
> > +{
> > +     u32 ibit = BIT(irqd_to_hwirq(d));
> > +     struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
> > +     unsigned long pending;
> > +     int cpu;
> > +
> > +     for_each_cpu(cpu, mask) {
> > +             icpu = per_cpu_ptr(ipi_mux_pcpu, cpu);
> > +             pending = atomic_fetch_or_release(ibit, &icpu->bits);
> > +
> > +             /*
> > +              * The atomic_fetch_or_release() above must complete
> > +              * before the atomic_read() below to avoid racing with
> > +              * ipi_mux_unmask().
> > +              */
> > +             smp_mb__after_atomic();
> > +
> > +             /*
> > +              * The flag writes must complete before the physical IPI is
> > +              * issued to another CPU. This is implied by the control
> > +              * dependency on the result of atomic_read() below, which is
> > +              * itself already ordered after the vIPI flag write.
> > +              */
> > +             if (!(pending & ibit) && (atomic_read(&icpu->enable) & ibit))
> > +                     ipi_mux_send(cpu);
> > +     }
> > +}
> > +
> > +static const struct irq_chip ipi_mux_chip = {
> > +     .name           = "IPI Mux",
> > +     .irq_mask       = ipi_mux_mask,
> > +     .irq_unmask     = ipi_mux_unmask,
> > +     .ipi_send_mask  = ipi_mux_send_mask,
> > +};
> > +
> > +static int ipi_mux_domain_alloc(struct irq_domain *d, unsigned int virq,
> > +                             unsigned int nr_irqs, void *arg)
> > +{
> > +     int i;
> > +
> > +     for (i = 0; i < nr_irqs; i++) {
> > +             irq_set_percpu_devid(virq + i);
> > +             irq_domain_set_info(d, virq + i, i, &ipi_mux_chip, NULL,
> > +                                 handle_percpu_devid_irq, NULL, NULL);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct irq_domain_ops ipi_mux_domain_ops = {
> > +     .alloc          = ipi_mux_domain_alloc,
> > +     .free           = irq_domain_free_irqs_top,
> > +};
> > +
> > +/**
> > + * ipi_mux_process - Process multiplexed virtual IPIs
> > + */
> > +void ipi_mux_process(void)
> > +{
> > +     struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
> > +     irq_hw_number_t hwirq;
> > +     unsigned long ipis;
> > +     unsigned int en;
> > +
> > +     /*
> > +      * Reading enable mask does not need to be ordered as long as
> > +      * this function called from interrupt handler because only
> > +      * the CPU itself can change it's own enable mask.
> > +      */
> > +     en = atomic_read(&icpu->enable);
> > +
> > +     /*
> > +      * Clear the IPIs we are about to handle. This pairs with the
> > +      * atomic_fetch_or_release() in ipi_mux_send_mask().
>
> The comments in the AIC code where you copied from are definitely
> better...
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
