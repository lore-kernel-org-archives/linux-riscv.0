Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4E0C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 16:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4X1uJo/70/aPFIKcqSXCfjdQTovhfYPfOYL1qIJnRU8=; b=JdKPzW4RVlFSnv
	P1Qd5kkM43Eu1hJYJQph5FIKAgUDLGvEHnYQHLkwUvhvlPj/uL08/ur+nc+HehgEG5JGNWnC0WUri
	QoW9k1kxaBIIb+QybmevvcHORpPZb6L6+LlMscmyG5gpdeXclRxN6H0JRl1RmAEP/GvJWJOGRlnDr
	OSdKTSI4trwxJeeFYlAH5WkH3LYKSpeii5Su0yjO+bymDw8RFGvGenzoRnBgRG3tdmah9cda6lpg/
	uWX4NR1Bz+GwjNViAGrXmnznXMJC0S+PI06EnX3wsHh6o0fMikphwH8jOBUGowwrV6qRRctWSju11
	djYjewqybMu8hk/oVRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYur-0019q3-08;
	Wed, 29 Mar 2023 16:44:53 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYun-0019nJ-0w
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 16:44:51 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E1E653F230
	for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1680108285;
	bh=EyeEQ1AHWnCSnuIf8XiK8lJXYQEG/nT/Q5+PoE7cTkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bByMShUNl10QA2w3GkSQ9I3BVA4joqiJ+gZEWlFed7tp7H/g3AWijcv9gL4slhpS7
	 OjH3iSRN9us1JovZWRjBfqPRfETKcDdT/Ae6wj7LsX5GBqAVmv1tPiw4S0e51n9Vln
	 bq6l6/nwB+pxpkK/gHTWdOpiA3AUpwmG1Q0dp6F/awyG6X/pZVixkzz5Eh4JXZpzjQ
	 Xc19z/Z7CknJR2QwKMJHNxS3/dNxQjmugBtyXJP1Dtuo2G3jWdTyVV+xzCCrtKC/GO
	 ADy3WYVwn3SzIDrhoELcRamJKb1qxs9qLgEbiiOWrjqYKCaju+YMk/ZRbzkxdK5T5i
	 7zq21V8DC+QOw==
Received: by mail-qk1-f199.google.com with SMTP id 72-20020a37064b000000b007467c5d3abeso7570859qkg.19
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 09:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680108285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyeEQ1AHWnCSnuIf8XiK8lJXYQEG/nT/Q5+PoE7cTkw=;
        b=wICdaqk6yt1Cr524+NH4ThnLIvdsb3a+oNuQ8ta/5kVzXAouSdGw3D6sjzgHfHr4QQ
         E9k9l8MhAWHvpUt7lyBEuqgp9hqx4zzh5IgkgY+RQRa6xGjvv/7vSRzsxbB3dxHU/SPv
         v4ZjUwnyw7+NuEa/psDD8dzqkdqTulH8fciQZZyw0hJMfQcsoQcWpmM/25AYEdTsT9FN
         J9i5DfCYtbBpUioIcQ9qgLJ//KImf5AXn60Rp/eaZjklsabcNPwtlalWsiX4wWaMHK0E
         eQ7cV6TW18hhWimwAyCx+AeCJ8wQBsTYB0EreoqNy/2GgHsieJdH0hpr/CojCgUcUvzn
         4nQQ==
X-Gm-Message-State: AO0yUKU3gH0Gj90Fqy5kdj0JVKubPKBcOX8C4a95lJff0aPhUbGFRLO7
	O23RK3GSPfEfT7fzILirS4S8W4wGFciE40lX3TBhZxAer4h2wK78VvAuHQmOdnfs73YUCC5DYgo
	FgdWFLdDG+LcVfQ10zHAapdRFUbJAZ0euR5WoK8kgDQ0uEmdE0u02IiFIsPSwYw==
X-Received: by 2002:a05:622a:1884:b0:3df:bda6:6932 with SMTP id v4-20020a05622a188400b003dfbda66932mr7869657qtc.5.1680108284782;
        Wed, 29 Mar 2023 09:44:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y1cVxGuPtBTs1wRb/jyIhkYUN/54t+rl3mcjEBrkbwCHAbaWmaIbnZhzUATvLj14fK9TXwo7iF2IFoPdOcByI=
X-Received: by 2002:a05:622a:1884:b0:3df:bda6:6932 with SMTP id
 v4-20020a05622a188400b003dfbda66932mr7869652qtc.5.1680108284532; Wed, 29 Mar
 2023 09:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230308064643.24805-1-mason.huo@starfivetech.com>
In-Reply-To: <20230308064643.24805-1-mason.huo@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 29 Mar 2023 18:44:28 +0200
Message-ID: <CAJM55Z8aOqAOfnNSJcKNuxJKRhjj7PzWia0Cu5kmyt9znbqcNQ@mail.gmail.com>
Subject: Re: [PATCH v4] irqchip/irq-sifive-plic: Add syscore callbacks for hibernation
To: Mason Huo <mason.huo@starfivetech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_094449_744113_8DD01EB3 
X-CRM114-Status: GOOD (  27.11  )
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

On Wed, 8 Mar 2023 at 07:49, Mason Huo <mason.huo@starfivetech.com> wrote:
>
> The priority and enable registers of plic will be reset
> during hibernation power cycle in poweroff mode,
> add the syscore callbacks to save/restore those registers.
>
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/r/202302140709.CdkxgtPi-lkp@intel.com/
> ---
>  drivers/irqchip/irq-sifive-plic.c | 93 ++++++++++++++++++++++++++++++-
>  1 file changed, 91 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index ff47bd0dec45..2800e7bb149a 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -17,6 +17,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
> +#include <linux/syscore_ops.h>
>  #include <asm/smp.h>
>
>  /*
> @@ -67,6 +68,8 @@ struct plic_priv {
>         struct irq_domain *irqdomain;
>         void __iomem *regs;
>         unsigned long plic_quirks;
> +       unsigned int nr_irqs;
> +       unsigned long *prio_save;
>  };
>
>  struct plic_handler {
> @@ -78,6 +81,7 @@ struct plic_handler {
>          */
>         raw_spinlock_t          enable_lock;
>         void __iomem            *enable_base;
> +       u32                     *enable_save;
>         struct plic_priv        *priv;
>  };
>  static int plic_parent_irq __ro_after_init;
> @@ -229,6 +233,71 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
>         return IRQ_SET_MASK_OK;
>  }
>
> +static int plic_irq_suspend(void)
> +{
> +       unsigned int i, cpu;
> +       u32 __iomem *reg;
> +       struct plic_priv *priv;
> +
> +       priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
> +
> +       for (i = 0; i < priv->nr_irqs; i++)
> +               if (readl(priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID))
> +                       __set_bit(i, priv->prio_save);
> +               else
> +                       __clear_bit(i, priv->prio_save);
> +
> +       for_each_cpu(cpu, cpu_present_mask) {
> +               struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
> +
> +               if (!handler->present)
> +                       continue;
> +
> +               raw_spin_lock(&handler->enable_lock);
> +               for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
> +                       reg = handler->enable_base + i * sizeof(u32);
> +                       handler->enable_save[i] = readl(reg);
> +               }
> +               raw_spin_unlock(&handler->enable_lock);
> +       }
> +
> +       return 0;
> +}
> +
> +static void plic_irq_resume(void)
> +{
> +       unsigned int i, index, cpu;
> +       u32 __iomem *reg;
> +       struct plic_priv *priv;
> +
> +       priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
> +
> +       for (i = 0; i < priv->nr_irqs; i++) {
> +               index = (i / BITS_PER_LONG);
> +               writel((priv->prio_save[index] & BIT(i % BITS_PER_LONG)) ? 1 : 0,

This looks like BIT_WORD and test_bit (or at least BIT_MASK).

> +                      priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID);
> +       }
> +
> +       for_each_cpu(cpu, cpu_present_mask) {
> +               struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
> +
> +               if (!handler->present)
> +                       continue;
> +
> +               raw_spin_lock(&handler->enable_lock);
> +               for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
> +                       reg = handler->enable_base + i * sizeof(u32);
> +                       writel(handler->enable_save[i], reg);
> +               }
> +               raw_spin_unlock(&handler->enable_lock);
> +       }
> +}
> +
> +static struct syscore_ops plic_irq_syscore_ops = {
> +       .suspend        = plic_irq_suspend,
> +       .resume         = plic_irq_resume,
> +};
> +
>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>                               irq_hw_number_t hwirq)
>  {
> @@ -345,6 +414,7 @@ static int __init __plic_init(struct device_node *node,
>         u32 nr_irqs;
>         struct plic_priv *priv;
>         struct plic_handler *handler;
> +       unsigned int cpu;
>
>         priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>         if (!priv)
> @@ -363,15 +433,21 @@ static int __init __plic_init(struct device_node *node,
>         if (WARN_ON(!nr_irqs))
>                 goto out_iounmap;
>
> +       priv->nr_irqs = nr_irqs;
> +
> +       priv->prio_save = bitmap_alloc(nr_irqs, GFP_KERNEL);
> +       if (!priv->prio_save)
> +               goto out_free_priority_reg;
> +
>         nr_contexts = of_irq_count(node);
>         if (WARN_ON(!nr_contexts))
> -               goto out_iounmap;
> +               goto out_free_priority_reg;
>
>         error = -ENOMEM;
>         priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
>                         &plic_irqdomain_ops, priv);
>         if (WARN_ON(!priv->irqdomain))
> -               goto out_iounmap;
> +               goto out_free_priority_reg;
>
>         for (i = 0; i < nr_contexts; i++) {
>                 struct of_phandle_args parent;
> @@ -441,6 +517,11 @@ static int __init __plic_init(struct device_node *node,
>                 handler->enable_base = priv->regs + CONTEXT_ENABLE_BASE +
>                         i * CONTEXT_ENABLE_SIZE;
>                 handler->priv = priv;
> +
> +               handler->enable_save =  kcalloc(DIV_ROUND_UP(nr_irqs, 32),
> +                                               sizeof(*handler->enable_save), GFP_KERNEL);
> +               if (!handler->enable_save)
> +                       goto out_free_enable_reg;
>  done:
>                 for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
>                         plic_toggle(handler, hwirq, 0);
> @@ -461,11 +542,19 @@ static int __init __plic_init(struct device_node *node,
>                                   plic_starting_cpu, plic_dying_cpu);
>                 plic_cpuhp_setup_done = true;
>         }
> +       register_syscore_ops(&plic_irq_syscore_ops);
>
>         pr_info("%pOFP: mapped %d interrupts with %d handlers for"
>                 " %d contexts.\n", node, nr_irqs, nr_handlers, nr_contexts);
>         return 0;
>
> +out_free_enable_reg:
> +       for_each_cpu(cpu, cpu_present_mask) {
> +               handler = per_cpu_ptr(&plic_handlers, cpu);
> +               kfree(handler->enable_save);
> +       }
> +out_free_priority_reg:
> +       kfree(priv->prio_save);
>  out_iounmap:
>         iounmap(priv->regs);
>  out_free_priv:
> --
> 2.39.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
