Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5A1C3525A
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 03:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/NrGeNdwjqJu9ENggBHkvtwyyB7TLVUjWr/NSqHnnk=; b=CzJgUkagrNCHvj
	j0iRom4MbOrNGKG4ayThDlFRT9GWgkkan9Sg6zZWcQVscNioZPvN9MMMpZ6b3JEz59WR8wfyP9WmG
	uGgGtuYsC5jj4n+b5ffMazeROodjx2xcbW+lw+jjx1QZyNO2iiAy6uIp7u/NX3oiU8oocYt774ziO
	iuoiMsei7trrHkDS7nWBhAdoPHS1Sr1AAZfJC3q0wyNA+dxGXX4giOSfcIS9eAeKt0G5ilFDtPpOY
	TPoVVc5aONnzWjS2c0KhhMywwfdelQkpgANSLtPjZs809C4MicoLN0ldhJ8BndmFtqmhLUT40EQ5W
	Lr8FOofzT4FJcjwYiaNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCYp9-009zsK-Hv; Wed, 26 Jan 2022 03:18:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCYo1-009zUk-Kv
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 03:17:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id l25so23260286wrb.13
 for <linux-riscv@lists.infradead.org>; Tue, 25 Jan 2022 19:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pBMdlXBwnvmmPNUewfDMh0H5M/2d+zAT6/3Iwl0rMhQ=;
 b=2hkCjLJXNAlhQ1LUkJt6pNjDvtjs2OnmxqENbtatgOTh31p8z+9Mqv0niYVwX/l8pk
 ClUB570vDbOr8k+Hx/Wv50Q3w8GihVLYUXdu+K/erHBbDgrId+MwHePcdsI5oxQelBYk
 f3QyqP/p8SIgane+7W7yUZJB5V5R28ZWAhfXrR5CihS0gmQIaBEZguge6Rb9RNaQpxbK
 eS8k3FKGThIhtR0JXPdSDOPVmHz6h+XMI8NOQQ5bhcn4hJBRxbTQOMTN/P0aGOFl500p
 3hEq88NaviARy1N5+PY122QI+rKZ+PVwRH/cospStOzCn0Itee/z7g6P6Emn2HpJbfR+
 fkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pBMdlXBwnvmmPNUewfDMh0H5M/2d+zAT6/3Iwl0rMhQ=;
 b=Bw/EtKTHbS/hMIuEMYRQ/oikCYDMo9H5NgqHnMdLD4hQmhfGuNJXQtZl6M8hNC/KDD
 BHaAGcSCtjjd4QJAydHTfXdPOtDkwF4biG7DqBtI2vDnLjVQxr0+T9S14utVS9eSe/Kt
 RNxejhzfqJUwuj40BrkwnrCkmo0//mtt5XXcEeFqlSdZL/sAGALgFt4BeDOD1niKnDxf
 /WrsiLZUUNgSt9O8v9ge27CrVmhjKOt7Vx3LJAJNUlKJMwHf6Pg50QmN02VkR+DJc17m
 GKrW+VxOMiUTwpy0wfqS4BQ6Jqw2PAOGEDtY6wpXfcyQUpd1DTpgGTXFyzK1KnV3Tl/M
 SqmQ==
X-Gm-Message-State: AOAM530iVH7m2iWDycsgtUt5F2HOOKGBGRiZlwZZEmEGIPOrH6vKneXF
 CMCKhebnzN4lzqD2EsGGgfjoYZAVDAIurScaeHDNWUytJepn2w==
X-Google-Smtp-Source: ABdhPJxdxO1ha84zyG2XFtqED0Da/EibQF9M6ja/rcn0/bthKWmiRfAlC1qUAPC1GknjblLeVACVRH+7+qe5Q7KXvVE=
X-Received: by 2002:a5d:584e:: with SMTP id i14mr20897127wrf.690.1643167027245; 
 Tue, 25 Jan 2022 19:17:07 -0800 (PST)
MIME-Version: 1.0
References: <20220125054217.383482-1-apatel@ventanamicro.com>
 <20220125054217.383482-3-apatel@ventanamicro.com>
 <87lez37k8h.wl-maz@kernel.org>
In-Reply-To: <87lez37k8h.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 26 Jan 2022 08:46:55 +0530
Message-ID: <CAAhSdy0NrB4Q-mYtMH_HCtbfm5OXi-cxXhiu1AxKdCkTv4cskQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] irqchip/riscv-intc: Set intc domain as the default
 host
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_191709_771146_8E3105EC 
X-CRM114-Status: GOOD (  28.03  )
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

On Tue, Jan 25, 2022 at 11:47 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 25 Jan 2022 05:42:13 +0000,
> Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > We have quite a few RISC-V drivers (such as RISC-V SBI IPI driver,
> > RISC-V timer driver, RISC-V PMU driver, etc) which do not have a
> > dedicated DT/ACPI fwnode. This patch makes intc domain as the default
> > host so that these drivers can directly create local interrupt mapping
> > using standardized local interrupt numbers
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  drivers/clocksource/timer-riscv.c | 17 +----------------
> >  drivers/irqchip/irq-riscv-intc.c  |  9 +++++++++
> >  2 files changed, 10 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 1767f8bf2013..dd6916ae6365 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -102,8 +102,6 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
> >  static int __init riscv_timer_init_dt(struct device_node *n)
> >  {
> >       int cpuid, hartid, error;
> > -     struct device_node *child;
> > -     struct irq_domain *domain;
> >
> >       hartid = riscv_of_processor_hartid(n);
> >       if (hartid < 0) {
> > @@ -121,20 +119,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> >       if (cpuid != smp_processor_id())
> >               return 0;
> >
> > -     domain = NULL;
> > -     child = of_get_compatible_child(n, "riscv,cpu-intc");
> > -     if (!child) {
> > -             pr_err("Failed to find INTC node [%pOF]\n", n);
> > -             return -ENODEV;
> > -     }
> > -     domain = irq_find_host(child);
> > -     of_node_put(child);
> > -     if (!domain) {
> > -             pr_err("Failed to find IRQ domain for node [%pOF]\n", n);
> > -             return -ENODEV;
> > -     }
> > -
> > -     riscv_clock_event_irq = irq_create_mapping(domain, RV_IRQ_TIMER);
> > +     riscv_clock_event_irq = irq_create_mapping(NULL, RV_IRQ_TIMER);
> >       if (!riscv_clock_event_irq) {
> >               pr_err("Failed to map timer interrupt for node [%pOF]\n", n);
> >               return -ENODEV;
> > diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> > index b65bd8878d4f..9f0a7a8a5c4d 100644
> > --- a/drivers/irqchip/irq-riscv-intc.c
> > +++ b/drivers/irqchip/irq-riscv-intc.c
> > @@ -125,6 +125,15 @@ static int __init riscv_intc_init(struct device_node *node,
> >               return rc;
> >       }
> >
> > +     /*
> > +      * Make INTC as the default domain which will allow drivers
> > +      * not having dedicated DT/ACPI fwnode (such as RISC-V SBI IPI
> > +      * driver, RISC-V timer driver, RISC-V PMU driver, etc) can
> > +      * directly create local interrupt mapping using standardized
> > +      * local interrupt numbers.
> > +      */
> > +     irq_set_default_host(intc_domain);
>
> No, please. This really is a bad idea. This sort of catch-all have
> constantly proven to be a nuisance, because they discard all the
> topology information. Eventually, you realise that you need to know
> where this is coming from, but it really is too late.
>
> I'd rather you *synthesise* a fwnode (like ACPI does) rather then do
> this.

In absence of INTC as the default domain, currently we have various
drivers looking up INTC irq_domain from DT (or ACPI). This is quite a
bit of duplicate code across various drivers.

How about having a irq_domain lookup routine (riscv_intc_find_irq_domain())
exported by the RISC-V INTC driver or arch/riscv ?
OR
Do you have an alternative suggestion ?

Regards,
Anup

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
