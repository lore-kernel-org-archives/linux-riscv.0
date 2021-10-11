Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8772C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 15:02:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 952AE60E78
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 15:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 952AE60E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfEnzwM9MUNvF/xtK/im5IZrTN74DSMnPp+YEE/+YBY=; b=0xp005DklvifZ5
	uCENA3D4qk2pERzPrv2eQCARX/1RyWF4NpLCbr2t592zY75++VkQCYLt0Uw+ew6gdevoS1u1HKPTs
	3Ur7DCIgkzpVk9BTRHMkafxdj77n2pTRFDGbwe+oos4eQbtIGY02Q0xKKc83yHM0+EhLyRhot8von
	CIUR131n50IlfNroXdQdnwr6e+Sn1wersghE7qYqCHis0yXJL3Lib/PLx0Feh+wqOpVxRXASN06qV
	op+LpAqfNUcIcgdbyUN32KxN3vhw6r+Z/eUgMjSKqNTgQQwD0eBgL8ItRgAWs1xK6RkQvu+F9gCsZ
	2IXEv9EIk7o5eql/qiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwoZ-009sa9-E6; Mon, 11 Oct 2021 15:02:07 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwoX-009sZB-Et
 for linux-riscv@lists.infradead.org; Mon, 11 Oct 2021 15:02:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id e3so23588887wrc.11
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gVndUYssrhT1+TAmUJh5faXD018hrwwoKVlYhzJy80Q=;
 b=FasKWF+h3LWJMaLN9s630gc2WwMKFbazr2bx1CBPqgeqwfOwdjCMhq/eJK01cwpTAJ
 gB8eBvjRtQ7DrkC1Pw7bEukO2eMxmZmV7FhMS+skZ52kcwWF5sWZje0+PMK2g6GyB8Ka
 TqkHo+8i+n7NaNRdpF3aWWvcutEamrnuFNpTujN2YpbK6Jj8d1X8jYvKECFZbeyM4Z8s
 NCefVt60WsaJtrUa3kpAlqlf6AERtFxyn8FdgkLfRhEwm59XGqk6jfzG7v25CnfrNhCI
 2Wkf5d7Dred82bLPRErYscWqFyOMb1VIdZt3tZPtF05D4GU4KSdxxbWFqDihZHcAQE9u
 tdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gVndUYssrhT1+TAmUJh5faXD018hrwwoKVlYhzJy80Q=;
 b=vcSh0TC6LMIb7VRKZuZKlA1ci4df2zQUaxP3/a1BsnZShyZumbE3kXjngEphbcEMRh
 C8D+P+SFyDgvvrHNzuONNRo/ff7G++5uJ7tzcyq3thxldDRolUDuNQkdcMfjLzGzjOT7
 gXjYjYOz9Sam07P+O5WecIzcsECT2774YiP1pKtZEUkwmnHQ+/982nwj/qc/3I9GtjZ1
 TGU85lKYvCTHV8jQ/Uzks4ON5XB7aaZx21ln7T0jp33FlpRskkll6Mbek3oFD7pXtwST
 Ifi+AaeJ9G1Yw1CaWcy9yPy0woInhz2eh27iyLLaied6mTqHVcTXRvMuJcLse+/PwFKP
 SFYQ==
X-Gm-Message-State: AOAM533NmKpi55ZgA9VQ2BxcwcXW11FqorGDBZyOimZ+Ej2KJiDil8tn
 S/g9EtWrZhnmccI+NBMbe1baBTIG6Nog40ZOia/tgg==
X-Google-Smtp-Source: ABdhPJzLl/vVPAkLeynPMkJbCDqObfBfXCwKXMgwbPIBrrMIJpi3K/CBDE3cWw6gazA8Yyn82prufGMxb89OHd2ycRg=
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr24854107wry.249.1633964523086; 
 Mon, 11 Oct 2021 08:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211011132431.2792797-1-guoren@kernel.org>
In-Reply-To: <20211011132431.2792797-1-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Oct 2021 20:31:51 +0530
Message-ID: <CAAhSdy1xjRE0TJ_Nd9fdz4RAK2J5FskQYbWDVXO7jhfcZsFm_g@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/sifive-plic: Fix duplicate mask/unmask for
 claim/complete
To: Guo Ren <guoren@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_080205_534319_C856A76B 
X-CRM114-Status: GOOD (  23.97  )
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

On Mon, Oct 11, 2021 at 6:54 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> PLIC only has enable-registers not mask/unmask registers. Mixing
> mask/unmask with irq_eoi is wrong, because readl(claim) could mask

This is an incorrect assumption about readl(claim). When SW does
read(claim) the HW updates internal state that IRQ has been claimed.
The HW can still get same (already claimed) IRQ again before
writel(claim) which will be delivered after writel(claim).

> irq by hardware. We only need mask/unmask to fixup the hardware
> which couldn't claim + mask correctly.

The handle_fasteoi_irq() only calls unmask_irq() mostly when the
underlying IRQ is threaded. Is there any other case ?

Another fact is that all irqchip drivers using handle_fasteoi_irq()
implement irq_mask/unmask().

Regards,
Anup

>
> If hardware supports claim + mask, it would cause unnecessary
> mask/umak operations.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <atish.patra@wdc.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index cf74cfa82045..0fa46912f452 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -64,6 +64,7 @@ struct plic_priv {
>         struct cpumask lmask;
>         struct irq_domain *irqdomain;
>         void __iomem *regs;
> +       bool claim_mask_support;
>  };
>
>  struct plic_handler {
> @@ -111,7 +112,7 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
>         }
>  }
>
> -static void plic_irq_unmask(struct irq_data *d)
> +static void plic_irq_enable(struct irq_data *d)
>  {
>         struct cpumask amask;
>         unsigned int cpu;
> @@ -125,7 +126,7 @@ static void plic_irq_unmask(struct irq_data *d)
>         plic_irq_toggle(cpumask_of(cpu), d, 1);
>  }
>
> -static void plic_irq_mask(struct irq_data *d)
> +static void plic_irq_disable(struct irq_data *d)
>  {
>         struct plic_priv *priv = irq_data_get_irq_chip_data(d);
>
> @@ -168,8 +169,8 @@ static void plic_irq_eoi(struct irq_data *d)
>
>  static struct irq_chip plic_chip = {
>         .name           = "SiFive PLIC",
> -       .irq_mask       = plic_irq_mask,
> -       .irq_unmask     = plic_irq_unmask,
> +       .irq_enable     = plic_irq_enable,
> +       .irq_disable    = plic_irq_disable,
>         .irq_eoi        = plic_irq_eoi,
>  #ifdef CONFIG_SMP
>         .irq_set_affinity = plic_set_affinity,
> @@ -181,6 +182,11 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>  {
>         struct plic_priv *priv = d->host_data;
>
> +       if (!priv->claim_mask_support) {
> +               plic_chip.irq_mask      = plic_irq_disable;
> +               plic_chip.irq_unmask    = plic_irq_enable;
> +       }
> +
>         irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
>                             handle_fasteoi_irq, NULL, NULL);
>         irq_set_noprobe(irq);
> @@ -298,6 +304,8 @@ static int __init plic_init(struct device_node *node,
>         if (WARN_ON(!nr_contexts))
>                 goto out_iounmap;
>
> +       priv->claim_mask_support = of_property_read_bool(node, "claim-mask-support");
> +
>         error = -ENOMEM;
>         priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
>                         &plic_irqdomain_ops, priv);
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
