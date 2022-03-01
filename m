Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD515C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8jgrX/1bwnve3+iXc1ErDRVvu8MT8ItYg9A1QOJHwo=; b=CYEt1pdmtP/jqv
	8s7VGOiUBGZMii85NXLNtS7of8OAOUnP9AExnXjM4yv3MhidpY2ar8PBtoejuMQI05iFlfGv284ia
	mKm5f2sGhUMDkxV098v8A0n40tTjkvQPTsDjnmtMATuCmj63g9fQyl/+jN4oc9YcNJfUgWhKAzxv8
	6NR4wFrmi+0FYVfuzLkdNBVnIvI8fa3VAXNWK9RbsSHIxaQ4hqFLstSa1pF4NtkuJK0BZhO80PDv7
	RIGaffs8UKf91gojOAuW43zs8bOfPBYFqVxL7qrNxUYHGCCT+ItBUSkJ5xOrSFAgw8I7QEcKyL+XQ
	8fqvUgz2Nf+ImM/AEBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP6KM-0004Ge-W4; Tue, 01 Mar 2022 17:30:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP6KF-0004Ee-NL
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 17:30:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 a5-20020a05600c224500b003832be89f25so11920wmm.2
 for <linux-riscv@lists.infradead.org>; Tue, 01 Mar 2022 09:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uf1X1taqo4UUcx6a5rPAZwVvvrFYe2YWLcHslTeiopA=;
 b=5reGqTutXtNz1hYcxF2qAiJkYIXvveXiP3/FHGHuivSzCmCO2WSHYshmz5FYEWw81X
 B/sqMLMfMSZfSsZ5UC+8Z2ELjmbipX2TeJJrtBepCC9frntIIwt7YJbiDW4/d/JyizKM
 VOflvv/P4bXZksKfWizBbEAyY7i+S5kLhzNgwLnoosTjhkx58fJbiaa1hRLQDfHpiy+t
 WKa01P901b+DvVAOBmg7H6kn/kbNtfkzDtbVaMrgbQjCr9r1IsDBJ4f6pxsOsDzXm9Ox
 18KvJPl7mmLNg4WYUXOIb1NEaa1zBJZebsXICyHztwPwkZK5A0RNmFMW7axRzZOtozXi
 j08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uf1X1taqo4UUcx6a5rPAZwVvvrFYe2YWLcHslTeiopA=;
 b=XUM+tdes01WPILZOC0iOQODz6hseCXO62E/7fH1/uiTh8dQzZebEC6+EC9jbndY3zn
 +vp9/nK8L3/F1iPjia9A0fODd9D2CwVRNT/KNoZyP2TJMJL/CcdTW5/jP1a45AEUEiRq
 R7AhQdh6FmOpMY2WsuNtEdEpf26eV5iyWdw6RmO/bc3WzzTfL3gTneB4Q2CECp57fmgy
 0byygVb/zHL4S0jAQDlofvZ3TpvI4eGTxmZ2LyHGz/9ZMRNWfZS8oXOXZ6/ProgVgMQj
 3A2GgCMERK1G6+AZhdJdoTNrP7mEogAyuOoc2zfKQg9e3kQRbQykBxG7tY/FxLLihNOM
 vwlg==
X-Gm-Message-State: AOAM530v7Wzo1BzoRSI/towjQFZ219JomJCmvDYfh4aqD3mZ3UzxOnMy
 9ZROWXP7eZTnmGJvvJ35/o4N6/R98boeD41PxvzxrQ==
X-Google-Smtp-Source: ABdhPJy1bAwFw8ns9ibhBgI3YPr68gfjPd8CNwohTq++HlnDhMEojEdZAtx1bSxt9hoBxBKea1M5wbDnZDLPMKDRI7M=
X-Received: by 2002:a05:600c:42d6:b0:380:ed47:43e8 with SMTP id
 j22-20020a05600c42d600b00380ed4743e8mr17756096wme.61.1646155813756; Tue, 01
 Mar 2022 09:30:13 -0800 (PST)
MIME-Version: 1.0
References: <20220301171317.3109161-1-Niklas.Cassel@wdc.com>
 <20220301171317.3109161-3-Niklas.Cassel@wdc.com>
In-Reply-To: <20220301171317.3109161-3-Niklas.Cassel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Mar 2022 23:00:01 +0530
Message-ID: <CAAhSdy1zFVQw7Skfk7k3keOzamAKMhHL7280Rfy6EUu+jmC8Fw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] irqchip/sifive-plic: Disable S-mode IRQs if
 running in M-mode
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_093015_794560_348E3B47 
X-CRM114-Status: GOOD (  27.22  )
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

On Tue, Mar 1, 2022 at 10:43 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
>
> From: Niklas Cassel <niklas.cassel@wdc.com>
>
> When detecting a context for a privilege mode different from the current
> running privilege mode, we simply skip to the next context register.
>
> This means that we never clear the S-mode enable bits when running in
> M-mode.
>
> On canaan k210, a bunch of S-mode interrupts are enabled by the bootrom.
> These S-mode specific interrupts should never trigger, since we never set
> the mie.SEIE bit in the parent interrupt controller (riscv-intc).
>
> However, we will be able to see the mip.SEIE bit set as pending.
>
> This isn't a good default when CONFIG_RISCV_M_MODE is set, since in that
> case we will never enter a lower privilege mode (e.g. S-mode).
>
> Let's clear the S-mode enable bits when running the kernel in M-mode, such
> that we won't have a interrupt pending bit set, which we will never clear.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/irqchip/irq-sifive-plic.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index fc9da94eb816..e6193d66c0ae 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -81,17 +81,23 @@ static int plic_parent_irq __ro_after_init;
>  static bool plic_cpuhp_setup_done __ro_after_init;
>  static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
>
> -static inline void plic_toggle(struct plic_handler *handler,
> -                               int hwirq, int enable)
> +static inline void __plic_toggle(void __iomem *enable_base,
> +                                int hwirq, int enable)
>  {
> -       u32 __iomem *reg = handler->enable_base + (hwirq / 32) * sizeof(u32);
> +       u32 __iomem *reg = enable_base + (hwirq / 32) * sizeof(u32);
>         u32 hwirq_mask = 1 << (hwirq % 32);
>
> -       raw_spin_lock(&handler->enable_lock);
>         if (enable)
>                 writel(readl(reg) | hwirq_mask, reg);
>         else
>                 writel(readl(reg) & ~hwirq_mask, reg);
> +}
> +
> +static inline void plic_toggle(struct plic_handler *handler,
> +                              int hwirq, int enable)
> +{
> +       raw_spin_lock(&handler->enable_lock);
> +       __plic_toggle(handler->enable_base, hwirq, enable);
>         raw_spin_unlock(&handler->enable_lock);
>  }
>
> @@ -324,8 +330,18 @@ static int __init plic_init(struct device_node *node,
>                  * Skip contexts other than external interrupts for our
>                  * privilege level.
>                  */
> -               if (parent.args[0] != RV_IRQ_EXT)
> +               if (parent.args[0] != RV_IRQ_EXT) {
> +                       /* Disable S-mode enable bits if running in M-mode. */
> +                       if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
> +                               void __iomem *enable_base = priv->regs +
> +                                       CONTEXT_ENABLE_BASE +
> +                                       i * CONTEXT_ENABLE_SIZE;
> +
> +                               for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> +                                       __plic_toggle(enable_base, hwirq, 0);
> +                       }
>                         continue;
> +               }
>
>                 hartid = riscv_of_parent_hartid(parent.np);
>                 if (hartid < 0) {
> --
> 2.35.1
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
