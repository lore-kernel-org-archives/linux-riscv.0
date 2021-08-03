Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D2CC4338F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 05:14:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D929260EC0
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 05:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D929260EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSySM5qt6N5gsKLgAhlBisw0hHNA799qPkw/BizPG/k=; b=rccw18VyiG0ciz
	zRZ4E3LVLR/ta/OLmpbXlif7/rXiO86qPttKgA+vr9LIqpeMwl0aK1GIbZE4aJbDw/aOl2/HguHS9
	Xb4w/AbOyEJyTH1kNN9VzNFfnz4HGcgaM+YpuKapOoYqjUAkKTJSMrrV8VdYx1n3AJnYjp+0Kk48a
	T1HeuOjdEm7ZGs7fP33MlQxF6jU7ZHBtvXlTA25/MfhFo79UuLeR/cifmz2VYdWRRiwUe356IaQxi
	2bDD0vTroFV3po+RDxCP9lyuuo3WYeil0L7Q/d3qtr1d3wmqBOOmUZw5uc9XMwtE36Mkzwcz/vRkk
	FhOt4WEA/3BBjHx+5tNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAml0-0019WN-PR; Tue, 03 Aug 2021 05:14:26 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAmkR-0019Ly-3g
 for linux-riscv@lists.infradead.org; Tue, 03 Aug 2021 05:13:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id z4so23858025wrv.11
 for <linux-riscv@lists.infradead.org>; Mon, 02 Aug 2021 22:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xgtLvuf0owNQRuqUwX+vRIu3EEpd7ijmGPvQTuH4f1U=;
 b=tYyI7iW0EczWyd8YKTmgkuDRNXjLNAlD6m4BaF6j/EylspqbgI+AGDzam5UjFol4vr
 44J6YLfJsAalzoCN61h8w2Cg4YLQ8V/kycvo+YqOT6Gs3oNNjguNUS7JMmA8/Fk9lwK1
 dKofTPHFoJFb+7L1Oh1NzAjdVFPCqnzElpNMUSqAW4lvufx/70gKe4HjW6AT/pPqSJwB
 kgiKd0QVwmGBO8wO9AVhv1P/4gUGi+prhZ9iHqVeJI9vI2RbKzDReaNDXHW4b9SZqsP2
 pGzjhAayIVpPxN6pXGvtsG7l0YahlJrwQVSg2pZVZjxNTQZ24XNS95XOJqEMRbMsqdct
 cm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xgtLvuf0owNQRuqUwX+vRIu3EEpd7ijmGPvQTuH4f1U=;
 b=oyjX3TbD6/JgRFYh275Y5TjnQMl6FeISi2gDgPYXv5e4YfEGPDfzv3NjMPi9seFPkd
 VBnVQkygl2UE2KvSOItJpOblh8y7DZrCR+G/dgI60BY6vV6Mhtm8ZcZoL1WpWWNLnmGZ
 j4ZkDg3DvyGzgtF5a2IpZIicF12ghcud7mrKyjlWcGRXhdMMGp0RStryeeOdynFs6EE6
 v+SeqyIsFO5BhfqYeJG4w4CaY/2JvMMMhb99ZTKXaB8t1+Liw+v4vlC/kvp/TTmDDJui
 XRkSIjMKRuWy529Y76WTzq1kDAJNyimmuf1SPGA1snOPImo3hkmXC1coOnwd7vRi7Xg0
 7TIA==
X-Gm-Message-State: AOAM532JStO+DKF7ALd6ysgC/LVfCveTkqoRy4ZHkYARMP7iKWzwHWoX
 zj9qTLypHCNgxIrirOq2NSTb83QGAX2dClCGgRRvWA==
X-Google-Smtp-Source: ABdhPJw91PoH825qQ811F77iCveefx3m5Hx5ungo+XqTTn+aFrtABkDDMkjMsjUo5kVRCjf1wKzOXgqmVdNG9ODY9MA=
X-Received: by 2002:adf:ef0d:: with SMTP id e13mr21519185wro.390.1627967628528; 
 Mon, 02 Aug 2021 22:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <1627953123-24248-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1627953123-24248-1-git-send-email-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 3 Aug 2021 10:43:10 +0530
Message-ID: <CAAhSdy3ExFE_bTjxiGPh157ev89GEFypMcJ0OU63TQA5CRUONw@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/sifive-plic: Fix PLIC crash on touching
 offline CPU context
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_221351_298439_8E0A6F1B 
X-CRM114-Status: GOOD (  31.08  )
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

On Tue, Aug 3, 2021 at 6:42 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The current plic driver would touch offline CPU context and cause
> bus error in some chip when in CPU hotplug scenario.
>
> This patch fixes up the problem and prevents plic access offline
> CPU context in plic_init() & plic_set_affinity().
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Greentime Hu <greentime.hu@sifive.com>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index cf74cfa..9c9bb20 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -64,6 +64,7 @@ struct plic_priv {
>         struct cpumask lmask;
>         struct irq_domain *irqdomain;
>         void __iomem *regs;
> +       unsigned int nr_irqs;
>  };
>
>  struct plic_handler {
> @@ -150,7 +151,7 @@ static int plic_set_affinity(struct irq_data *d,
>         if (cpu >= nr_cpu_ids)
>                 return -EINVAL;
>
> -       plic_irq_toggle(&priv->lmask, d, 0);
> +       plic_irq_toggle(cpu_online_mask, d, 0);

This breaks RISC-V multi-socket platforms with multiple PLIC instances.

When we have multiple PLIC instances in a RISC-V platform, each PLIC
instance will target a different set of HARTs. The "priv->lmask" represents
the CPUs/HARTs targeted by a given PLIC instance.

I am not sure how you are testing your patches but you certainly need to
test more on QEMU. The QEMU virt machine support multi-socket so make
sure any patch which can potentially affect multi-socket support is at least
tested on QEMU virt machine multi-socket configuration.

>         plic_irq_toggle(cpumask_of(cpu), d, !irqd_irq_masked(d));
>
>         irq_data_update_effective_affinity(d, cpumask_of(cpu));
> @@ -251,15 +252,25 @@ static void plic_set_threshold(struct plic_handler *handler, u32 threshold)
>
>  static int plic_dying_cpu(unsigned int cpu)
>  {
> +       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> +
>         if (plic_parent_irq)
>                 disable_percpu_irq(plic_parent_irq);
>
> +       handler->present = false;
> +

Drop these changes in plic_dying_cpu(), see comments below.

>         return 0;
>  }
>
>  static int plic_starting_cpu(unsigned int cpu)
>  {
>         struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> +       irq_hw_number_t hwirq;
> +
> +       handler->present = true;

The "handler->present" flag indicates that we have PLIC context
associated with the given handler. It has nothing to do with CPU
hot-plug.

> +
> +       for (hwirq = 1; hwirq <= handler->priv->nr_irqs; hwirq++)
> +               plic_toggle(handler, hwirq, 0);
>
>         if (plic_parent_irq)
>                 enable_percpu_irq(plic_parent_irq,
> @@ -275,7 +286,6 @@ static int __init plic_init(struct device_node *node,
>                 struct device_node *parent)
>  {
>         int error = 0, nr_contexts, nr_handlers = 0, i;
> -       u32 nr_irqs;
>         struct plic_priv *priv;
>         struct plic_handler *handler;
>
> @@ -290,8 +300,8 @@ static int __init plic_init(struct device_node *node,
>         }
>
>         error = -EINVAL;
> -       of_property_read_u32(node, "riscv,ndev", &nr_irqs);
> -       if (WARN_ON(!nr_irqs))
> +       of_property_read_u32(node, "riscv,ndev", &priv->nr_irqs);
> +       if (WARN_ON(!priv->nr_irqs))
>                 goto out_iounmap;
>
>         nr_contexts = of_irq_count(node);
> @@ -299,14 +309,13 @@ static int __init plic_init(struct device_node *node,
>                 goto out_iounmap;
>
>         error = -ENOMEM;
> -       priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
> +       priv->irqdomain = irq_domain_add_linear(node, priv->nr_irqs + 1,
>                         &plic_irqdomain_ops, priv);
>         if (WARN_ON(!priv->irqdomain))
>                 goto out_iounmap;
>
>         for (i = 0; i < nr_contexts; i++) {
>                 struct of_phandle_args parent;
> -               irq_hw_number_t hwirq;
>                 int cpu, hartid;
>
>                 if (of_irq_parse_one(node, i, &parent)) {
> @@ -354,7 +363,8 @@ static int __init plic_init(struct device_node *node,
>                 }
>
>                 cpumask_set_cpu(cpu, &priv->lmask);
> -               handler->present = true;
> +               if (cpu == smp_processor_id())
> +                       handler->present = true;

Drop this change.

>                 handler->hart_base =
>                         priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
>                 raw_spin_lock_init(&handler->enable_lock);
> @@ -362,8 +372,6 @@ static int __init plic_init(struct device_node *node,
>                         priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
>                 handler->priv = priv;
>  done:
> -               for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> -                       plic_toggle(handler, hwirq, 0);

In plic_init(), we are bringing all interrupts of PLIC context to a known
state which is being disabled by default. We don't need to do this every
time a HART/CPU is brought-up but I am okay to move this to
plic_starting_cpu() if it helps fix issues on any RISC-V platform.

>                 nr_handlers++;
>         }
>
> --
> 2.7.4
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
