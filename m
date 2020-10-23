Return-Path: <SRS0=wzy2=D6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26451C71156
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CF624248
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MQXRi/mJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="bLfzWbNT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3CF624248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8LV+V3krllbe1Hu6SkQjt5t0cAZ2lFIV3sZibXdL9Wk=; b=MQXRi/mJeKghLWRUy0668swRc
	EfRQSx7K95YgFbZrgCnNQZbXrzDy6TTH4eIW5mYFEHEiVIdvU6KXwG5NNPV/1yVbDNbHdk34Imflx
	W67IAG+oYRSxe/6TaCndg9KsqPqOI+uoRFnRCo4XzLkM0AYwzqElXufbErB13yhjD1/u2gUwU7Nnu
	7+oP6bd4orCw9xTztwuV5xuBkJUmcgTp40wXSx9ECXyHzk+M9qkVvPUCH4TWbZlNreiC6xO4zD121
	/mD4/RoMql5wRemwm3dG53HHSXetH1kEglQbIhKAszw4/wX4rSsr3eWU2z35LZpyYqob8c8ZELAJQ
	weLNyU3rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVw5p-0007ln-In; Fri, 23 Oct 2020 12:22:49 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVw5m-0007jn-MN
 for linux-riscv@lists.infradead.org; Fri, 23 Oct 2020 12:22:47 +0000
Received: by mail-wm1-x343.google.com with SMTP id v5so1235798wmh.1
 for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2020 05:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9PzWNp1gapi2QMM7K0A8RjxDrdVI4G9KGleb9XwWLYs=;
 b=bLfzWbNTGQTfmmImm9vWqjH4/GLqLxGMr30A9Y9BfMsJe6syrNASgumzYzosat8UP3
 0iK12RgRxgfYnqqISklRgM/Qz+HDv+Roe8MTal30h71Lkb0g7PcPTOHP6cA//+NZ8cCE
 jtI1KMcnEvuPpcopNXrAssk7imrF45z2krQpbHpcpaJnQkZHWt5VWE2UesfYry8APnjl
 YHH7kWTanIlrp+CaMWs3JG/HOQy70+To+rXCC6Qy3YFcDmazmSnSxnXjpgrMJk8cPGh9
 LGMl+rZqihaZMxZP2j3H4dTL0+5ubh1uMHC+rNqDSgXgUYJxYKydyFyvzWUo5A2ZLMS/
 ilNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9PzWNp1gapi2QMM7K0A8RjxDrdVI4G9KGleb9XwWLYs=;
 b=rmbq9VywmAweUQ+bZtR46R48A4M6VUiPeHg6DuFMeACWLjqYl8orMOkvKxYv75yBS4
 nw2GoS9Ax4fS/NH4moyV1o6wPID0xnCzeeWuKi5Kq+QASrZhbbr8A101kp85gEhXZ9uh
 vWDC4DMP5GC6tWbGyDI8DPfIoELLU/EvB4globMapU0CuRO18oybA+JnQir00HETK9M/
 y2qDLsWOi9R9CaRZXxFlfcPCwtkLyG5htCr6FDzyq4ynIU61RosBC8ys1muA4pGRsnVb
 yLjvRmDFnroudQBybjDYTP0/nmxqGKCNMMayOlSS3/uq3xS/dIBitmxNXCFCxKasA6N2
 WIOg==
X-Gm-Message-State: AOAM5319WG5pyvCZcE6D8UxGJnBbFwR3OHJoo8KKrKX97Q4jYSDRsTOw
 3tqqW4uj4ttp4pG2gfc+/wsefGaV5vH5okQRpu4P+A==
X-Google-Smtp-Source: ABdhPJzZmJ/UymdTn7PKAA7QJE2WqXkpVPyGxZB8LmuUohWRLn0nbQ4JIga6IOwlIPnkUyZ3qClwKuJDeYtT3QyLphw=
X-Received: by 2002:a1c:41d6:: with SMTP id o205mr2020662wma.152.1603455765620; 
 Fri, 23 Oct 2020 05:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <1603448245-79429-1-git-send-email-guoren@kernel.org>
 <1603448245-79429-3-git-send-email-guoren@kernel.org>
In-Reply-To: <1603448245-79429-3-git-send-email-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2020 17:03:26 +0530
Message-ID: <CAAhSdy3aOmUSY7x=BVVKCb5JD39H+_zOhBCuwgUxgtJLKqTrDw@mail.gmail.com>
Subject: Re: [PATCH 3/3] irqchip/irq-sifive-plic: Fixup set_affinity enable
 irq unexpected
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_082247_036892_F54A8052 
X-CRM114-Status: GOOD (  24.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Jason Cooper <jason@lakedaemon.net>,
 wesley@sifive.com, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 23, 2020 at 3:48 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> For PLIC, we only have enable registers to control per hart's irq
> affinity and irq_set_affinity would call plic_irq_toggle to enable
> the IRQ's routing. So we can't enable irq in irq_domain_map before
> request_irq, it'll let uninitialized devices' irq exception.
>
> The solution is to check the irq has been enabled, just like what
> irq-gic-v3 has done in gic_set_affinity.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 45 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 0003322..1a63859 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -130,6 +130,36 @@ static void plic_irq_mask(struct irq_data *d)
>  }
>
>  #ifdef CONFIG_SMP
> +static inline bool plic_toggle_is_enabled(struct plic_handler *handler,
> +                                               int hwirq)
> +{
> +       u32 __iomem *reg = handler->enable_base + (hwirq / 32) * sizeof(u32);
> +       u32 hwirq_mask = 1 << (hwirq % 32);
> +
> +       if (readl(reg) & hwirq_mask)
> +               return true;
> +       else
> +               return false;
> +}
> +
> +static inline bool plic_irq_is_enabled(const struct cpumask *mask,
> +                                  struct irq_data *d)
> +{
> +       int cpu;
> +
> +       for_each_cpu(cpu, mask) {
> +               struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
> +
> +               if (!handler->present)
> +                       continue;
> +
> +               if (plic_toggle_is_enabled(handler, d->hwirq))
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  static int plic_set_affinity(struct irq_data *d,
>                              const struct cpumask *mask_val, bool force)
>  {
> @@ -141,8 +171,10 @@ static int plic_set_affinity(struct irq_data *d,
>
>         irq_data_update_effective_affinity(d, &amask);
>
> -       plic_irq_toggle(&priv->lmask, d, 0);
> -       plic_irq_toggle(&amask, d, 1);
> +       if (plic_irq_is_enabled(&priv->lmask, d)) {
> +               plic_irq_toggle(&priv->lmask, d, 0);
> +               plic_irq_toggle(&amask, d, 1);
> +       }
>
>         return IRQ_SET_MASK_OK_DONE;
>  }
> @@ -168,12 +200,19 @@ static struct irq_chip plic_chip = {
>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>                               irq_hw_number_t hwirq)
>  {
> +       unsigned int cpu;
>         struct plic_priv *priv = d->host_data;
>
>         irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
>                             handle_fasteoi_irq, NULL, NULL);
>         irq_set_noprobe(irq);
> -       irq_set_affinity(irq, &priv->lmask);
> +
> +       cpu = cpumask_any_and(&priv->lmask, cpu_online_mask);
> +       if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
> +               return -EINVAL;
> +
> +       irq_set_affinity(irq, cpumask_of(cpu));
> +
>         return 0;
>  }
>
> --
> 2.7.4
>

Greentime (SiFive) has already proposed a patch to fix this.
Refer, https://lkml.org/lkml/2020/10/20/188

Only the plic_irqdomain_map() change which sets the correct
default affinity looks good to me.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
