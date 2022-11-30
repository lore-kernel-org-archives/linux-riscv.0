Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEB2C352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 17:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/jcsyYjOESzA6egPFHUstNHIBQ1vM5vEeG24XDeL7A=; b=HQcqF1NW8HI7F8
	k0ftDEgStatZprTjRP6W4z+rb9nGnf2j8YNt1A1Wm3xwSk3vV2yPP5LUbO3Pcft4ynfcI6WtKugUX
	0whhC5XcvOvjHGnr1fmIeSm/Xh/+LbV2EUkCVAqruupRV5qsAZbWsZtKTgf3NS2JPIoYZyqvPqyBb
	lcQgUKkSN2ieBL1RjQeGxgegyzAghHOZHWXPDgLoK+3wFNHK//vTRS2qOfeXV2Vdfiqp8UBsWh26W
	uedD8VGXJQqrZ1MbDUMAG4kUyjmWaYxVAI5zCGqVKCCQ+6Vo1N/8xe8ywfcNSqoz5Ya7KwE2UD3O7
	ATDWv5Y+61XfLMIZNY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0QUi-000mYl-QA; Wed, 30 Nov 2022 17:03:36 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0QUT-000mQk-Mo
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 17:03:23 +0000
Received: by mail-ej1-x631.google.com with SMTP id n21so42857104ejb.9
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 09:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYMMG0Xx78ci4rSGafg1aeshdWrMZWJAaUMKgBBaQfE=;
        b=DbnaczQgP2VrIkHihS0MpCnlYRHv+RYEnBbS+N7MSHdXWjZnojAbmCZPLQUg5ZEsI2
         ojl6YTACqG3+fMtXxKsIH8ucWc4prE0JxoqQh+VNjo14vQy/O9zUufyp9SJErPb6buBT
         m+Xa21SnYvaFbleMngbhCSMI5Osj8qdHOUcmIuWthBA/tVMJ+dcq7RThmp1PUbaz9h/j
         VP/se8gAUYFY1Fd7ApWJ6vj1TkMLajsDtKslTNUW8syVVNGg/nbrYtFxEYqa5tD841Mr
         qBRIUnTUrma7j54foglKvBQOjh403kzbKPRJdqz4xPiccM3wV/PhCVm3n9Nz9W1FXLbP
         gwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYMMG0Xx78ci4rSGafg1aeshdWrMZWJAaUMKgBBaQfE=;
        b=wvAuXO/rsSHCJD6dMQpdeXVzZPurgVEnIPQ4fR6si0ToLIA3ybzDmvfBoj6qFjne0G
         Yw9y0OEZYjY7UKovJR1f7QKW1gR5Ax1zgMwyqOsOboB3td6HqkK1HbH0VNlGFm7X9d0t
         IzfZ6PvzinUV4vMWBSd8r4TSU+qL0abBxbLdgMlJ9+rOEI5ojcc2F88Q96EqLmACTLjx
         7xrAyI9qBLmsWKNKQ1ZvuQ1xXBmdnwp48utncBhrZfg6YgRclRDSNIK81Uy4f1feW9q+
         em9qJUpsgyCvy28GDge3j2xluuY4gnT2lIp+P/DSuPj0NYfxyy0g7Ql+A+6BQTqqXpIM
         Vm3g==
X-Gm-Message-State: ANoB5pnNv1z3hlEQXYbcSX24qVYgxk0yuBjSan1H68CB+StAObk//n0b
	d+m//JnSqKh22m8xVf6s27CDYQapzaSJCltg2ThKsQ==
X-Google-Smtp-Source: AA0mqf6EyA7YtrTBcFZJK174OkTrsKWiLmYM0e6dIjaTX3tgPfsjUx3jdGQ2rw5PNYzp8U3ztlRdTrtIgLPscTc5gbU=
X-Received: by 2002:a17:906:ae99:b0:7c0:82d8:243a with SMTP id
 md25-20020a170906ae9900b007c082d8243amr8545786ejb.230.1669827796637; Wed, 30
 Nov 2022 09:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20221129142449.886518-1-apatel@ventanamicro.com>
 <20221129142449.886518-4-apatel@ventanamicro.com> <86cz94mrc4.wl-maz@kernel.org>
In-Reply-To: <86cz94mrc4.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 30 Nov 2022 22:33:05 +0530
Message-ID: <CAAhSdy150BemP2YR2gf6yNMiJiD+os8VHkvyx7Nnqrqaz1+xjA@mail.gmail.com>
Subject: Re: [PATCH v13 3/7] genirq: Add mechanism to multiplex a single HW IPI
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_090321_974345_A58C2A58 
X-CRM114-Status: GOOD (  28.66  )
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

On Wed, Nov 30, 2022 at 8:17 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 29 Nov 2022 14:24:45 +0000,
> Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > All RISC-V platforms have a single HW IPI provided by the INTC local
> > interrupt controller. The HW method to trigger INTC IPI can be through
> > external irqchip (e.g. RISC-V AIA), through platform specific device
> > (e.g. SiFive CLINT timer), or through firmware (e.g. SBI IPI call).
> >
> > To support multiple IPIs on RISC-V, we add a generic IPI multiplexing
> > mechanism which help us create multiple virtual IPIs using a single
> > HW IPI. This generic IPI multiplexing is inspired from the Apple AIC
> > irqchip driver and it is shared by various RISC-V irqchip drivers.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/linux/irq.h  |   3 +
> >  kernel/irq/Kconfig   |   5 ++
> >  kernel/irq/Makefile  |   1 +
> >  kernel/irq/ipi-mux.c | 193 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 202 insertions(+)
> >  create mode 100644 kernel/irq/ipi-mux.c
>
> [...]
>
> This is finally starting to look acceptable. My only changes are:
>
> diff --git a/kernel/irq/ipi-mux.c b/kernel/irq/ipi-mux.c
> index 626c564233e9..1a6ba19b736c 100644
> --- a/kernel/irq/ipi-mux.c
> +++ b/kernel/irq/ipi-mux.c
> @@ -69,6 +69,12 @@ static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
>                  */
>                 smp_mb__after_atomic();
>
> +               /*
> +                * The flag writes must complete before the physical IPI is
> +                * issued to another CPU. This is implied by the control
> +                * dependency on the result of atomic_read() below, which is
> +                * itself already ordered after the vIPI flag write.
> +                */
>                 if (!(pending & ibit) && (atomic_read(&icpu->enable) & ibit))
>                         ipi_mux_send(cpu);
>         }
> @@ -160,7 +166,7 @@ int ipi_mux_create(unsigned int nr_ipi, void (*mux_send)(unsigned int cpu))
>                 goto fail_free_cpu;
>         }
>
> -       domain = irq_domain_create_simple(fwnode, nr_ipi, 0,
> +       domain = irq_domain_create_linear(fwnode, nr_ipi,
>                                           &ipi_mux_domain_ops, NULL);
>         if (!domain) {
>                 pr_err("unable to add IPI Mux domain\n");
>
> The first hunk preserve an important piece of information about how
> delicate the ordering is, while the second only allocates the irqdesc
> structures as needed, not upfront.
>
> I'll shortly go over the rest of the irqchip code and can apply the
> above myself if there is nothing more to fix.
>
> I've also converted the AIC driver over to this[1], and nothing broke
> so far...
>
>         M.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/ipi-mux

Thanks Marc, I will include your changes in the next patch revision.

>
> --
> Without deviation from the norm, progress is not possible.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
